#!/usr/bin/env bash

function isNewFile()
{
	curDir=`pwd`"/oldFile"
	if [ ! -e "$curDir" ]; then
		touch oldFile
		WriteLog "makefile `pwd`/oldFile"
		FILES=(`ls $1 | tr ' ' "\n"`)
		for i in ${FILES[*]}
		do
			Dir="$1/$i"
			Time=`stat -c %Y $Dir`
			echo $i":"$Time >> oldFile
			WriteLog "Add $i to `pwd`/oldFile"
		done
	else

		FILES=(`ls $1 | awk -F: '{ print $1 }' | tr ' ' "\n"`)
		for i in ${FILES[*]}
		do
			isEmpty=`cat oldFile | grep $i`
			if [ -z "$isEmpty" ];
			then
				Dir="$1/$i"
				Time=`stat -c %Y $Dir`
				echo $i":"$Time >> oldFile
				echo "Add new file "$i
				WriteLog "Add $i to `pwd`/oldFile"
				File=`pwd`"/"$i
				if [ -f "$File" ]; then
					echo `cat $i | head -n 10`
				fi
			fi
		done
	fi
}

function isDeleted()
{
	curDir=`pwd`"/oldFile"
	if [ -e "$curDir" ]; then
		FILES=(`cat $curDir | awk -F: '{ print $1 }' | tr ' ' "\n"`)
		for i in ${FILES[*]}
		do
			isEmpty=`ls $1 | grep $i`
			if [ -z "$isEmpty" ];then
				echo "Deleted file "$i
				WriteLog "Remove $i from `pwd`/oldFile"
				Del=`cat oldFile | grep $i`
				result=`cat oldFile | sed "s/$Del//g"`
				result=(`echo $result | tr ' ' "\n"`)
				rm oldFile
				touch oldFile
				for s in ${result[*]}
				do
					echo $s >> oldFile
				done
			fi
		done
	else
		return 1
	fi
}

function isEdited()
{
	curDir=`pwd`"/oldFile"
	if [ -e "$curDir" ]; then
		Names=(`cat $curDir | awk -F: '{ print $1 }' | tr ' ' "\n"`)
		Times=(`cat $curDir | awk -F: '{ print $2 }' | tr ' ' "\n"`)
		for i in ${!Names[*]}; do
			Dir="$1/${Names[$i]}"
			newTime=`stat -c %Y $Dir`
			if [ "$newTime" -gt "${Times[$i]}" ];then
				echo ${Names[$i]}" New modifed"
				Time[$i]="$newTime"
				WriteLog "Change time modified of $i from `pwd`/oldFile"
			fi
			Time[$i]="$newTime"
		done
		rm oldFile
		touch oldFile
		for i in ${!Names[*]}; do
			echo ${Names[$i]}":"${Time[$i]} >> oldFile
		done
	else
		return 0
	fi
}

function WriteLog()
{
	user=`uname -n`
	Date=`date`
	echo "$user--[ $Date ]-[ PID: $$ ]: $1" >> /var/log/checketc.log
}

function sendMail()
{
	MailBody="Fuck yeah!!!\nthis is mail body!! you can add something to this!! :V"
	echo $MailBody | mail -s "Fuck you!!" root@localhost
	WriteLog "Send email with Body=$MailBody to root@localhost"
}

function Main()
{
	sendMail
	while [[ 1 ]]; do
		isNewFile $1
		isDeleted $1
		isEdited $1
		sleep 5
	done
}

Main /etc
