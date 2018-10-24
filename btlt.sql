SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `dknv` (
  `mahs` char(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `matruong` char(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nguyenvong` int(2) NOT NULL,
  `nganh` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_vietnamese_ci;


INSERT INTO `dknv` (`mahs`, `matruong`, `nguyenvong`, `nganh`) VALUES
('HS000001', 'DH123456', 3, 'Công nghệ thông tin'),
('HS000001', 'DH123457', 1, 'Kinh doanh quốc tế'),
('HS000001', 'DH123457', 2, 'Luật kinh tế'),
('HS000002', 'DH123456', 1, 'An toàn thông tin'),
('HS000002', 'DH123456', 2, ' Kỹ thuật điện tử');

-- --------------------------------------------------------


CREATE TABLE `logged` (
  `ma` char(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sessions` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_vietnamese_ci;

INSERT INTO `logged` (`ma`, `sessions`) VALUES
('admin', '74696fabc03037122bab7045c86275d8'),
('HS000001', '4bcff4810fcc9e2551747913256340c4'),
('HS000002', '62589687799aa4f48d53891ca9186270'),
('HS123456', '8f8d1d93f6311af94ab3f90ed2b79e82');

-- --------------------------------------------------------

CREATE TABLE `nganh` (
  `ma` char(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nganh` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_vietnamese_ci;


INSERT INTO `nganh` (`ma`, `nganh`) VALUES
('DH123456', ' Kỹ thuật điện tử'),
('DH123456', 'An toàn thông tin'),
('DH123456', 'Công nghệ thông tin'),
('DH123456', 'Kế toán'),
('DH123456', 'Kinh doanh quốc tế'),
('DH123456', 'Luật'),
('DH123456', 'Tài chính ngân hàng'),
('DH123457', 'Kinh doanh quốc tế'),
('DH123457', 'Luật kinh tế'),
('DH123457', 'Ngôn ngữ anh'),
('DH123457', 'Quản trị kinh doanh'),
('DH123457', 'Quản trị nhân lực'),
('DH123457', 'Tài chính công'),
('DH123457', 'Thương mại quốc tế');

-- --------------------------------------------------------


CREATE TABLE `truong` (
  `ma` char(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ten` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chitieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_vietnamese_ci;


INSERT INTO `truong` (`ma`, `ten`, `chitieu`) VALUES
('DH123456', 'Đại Học Công Nghệ', 3230),
('DH123457', 'Đại học tổng hợp', 2200);

-- --------------------------------------------------------


CREATE TABLE `user` (
  `ma` char(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_vietnamese_ci;


INSERT INTO `user` (`ma`, `password`, `type`) VALUES
('admin', 'adcd7048512e64b48da55b027577886ee5a36350', 0),
('HS000001', 'adcd7048512e64b48da55b027577886ee5a36350', 1),
('HS000002', 'adcd7048512e64b48da55b027577886ee5a36350', 1),
('HS123456', 'adcd7048512e64b48da55b027577886ee5a36350', 1);

-- --------------------------------------------------------

CREATE TABLE `user_info` (
  `ma` char(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ten` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `diachi` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdt` char(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_vietnamese_ci;


INSERT INTO `user_info` (`ma`, `ten`, `sex`, `diachi`, `sdt`) VALUES
('admin', 'Nguyễn Thị Vân', 0, 'Ninh Bình', '09611587420'),
('HS000001', 'Nguyễn Văn Trung', 1, 'Hà Nội', '09645701582'),
('HS000002', 'Bùi Thị Vân', 0, 'Nam Định', '01698452031'),
('HS123456', 'Nguyễn Văn Nam', 1, 'Hà Nội', '01236987569');

--
ALTER TABLE `dknv`
  ADD PRIMARY KEY (`mahs`,`matruong`,`nguyenvong`);
  
ALTER TABLE `logged`
  ADD PRIMARY KEY (`ma`);

ALTER TABLE `nganh`
  ADD PRIMARY KEY (`ma`,`nganh`);

ALTER TABLE `truong`
  ADD PRIMARY KEY (`ma`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`ma`);

ALTER TABLE `user_info`
  ADD PRIMARY KEY (`ma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
