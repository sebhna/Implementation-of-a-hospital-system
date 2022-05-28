-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: localhost
-- Χρόνος δημιουργίας: 02 Μάη 2020 στις 14:13:59
-- Έκδοση διακομιστή: 10.4.11-MariaDB
-- Έκδοση PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `HOSP_DATABASE`
--
CREATE DATABASE IF NOT EXISTS `HOSP_DATABASE` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `HOSP_DATABASE`;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `ADMISSION`
--

CREATE TABLE `ADMISSION` (
  `ADMISSION_CODE` int(11) NOT NULL,
  `CAUSE` varchar(30) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `ID_MNT` varchar(30) NOT NULL,
  `TRT_C` varchar(30) NOT NULL,
  `RESULT` varchar(30) NOT NULL DEFAULT 'NOT NULL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `ADMISSION`
--

INSERT INTO `ADMISSION` (`ADMISSION_CODE`, `CAUSE`, `START_DATE`, `END_DATE`, `ID_MNT`, `TRT_C`, `RESULT`) VALUES
(1, 'TOOTHACHE', '2020-04-15', '2020-04-15', 'AT000004', '2', 'NONE'),
(2, 'BROKEN ARM', '2020-04-09', '2020-04-10', 'AT000004', '3', 'CAST NEEDED'),
(3, 'PSYCOLOGICAL CRISIS', '2020-04-01', '2020-04-16', 'AT000004', '1', 'THERAPY NEEDED'),
(4, 'STOMACH ACHE', '2020-04-01', '2020-04-01', 'AT000004', '4', 'VIRUS ELIMINATED'),
(5, 'ROUTINE TEST', '2020-04-09', '2020-04-09', 'AT000004', '4', 'PERFECT HEALTH'),
(6, 'FALL', '2020-05-05', '2020-05-05', 'AT000008', '9', 'CAST NEEDED');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `CLINICS`
--

CREATE TABLE `CLINICS` (
  `ID_CL` int(11) NOT NULL,
  `ID_MNG2` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `CLINICS`
--

INSERT INTO `CLINICS` (`ID_CL`, `ID_MNG2`) VALUES
(2, 'AT000001'),
(4, 'AT000002'),
(3, 'AT000003'),
(9, 'AT000007'),
(8, 'AT000009'),
(7, 'AT000010');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `DOCTOR`
--

CREATE TABLE `DOCTOR` (
  `ID_D` varchar(30) NOT NULL,
  `SPECIALITY` varchar(30) NOT NULL,
  `ID_F_WRK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `DOCTOR`
--

INSERT INTO `DOCTOR` (`ID_D`, `SPECIALITY`, `ID_F_WRK`) VALUES
('AT000001', 'DENTIST', 1),
('AT000002', 'PSYCOLOGIST', 5),
('AT000003', 'SURGENT', 3),
('AT000006', 'PEDIATRICIAN', 2),
('AT000007', 'EYE DOCTOR', 9),
('AT000009', 'PATHOLOGIST', 4),
('AT000010', 'GYNECOLOGIST', 7);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `D_HELPS_WITH_ADM`
--

CREATE TABLE `D_HELPS_WITH_ADM` (
  `ID_ADM` int(11) NOT NULL,
  `ID_S_D` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `D_HELPS_WITH_ADM`
--

INSERT INTO `D_HELPS_WITH_ADM` (`ID_ADM`, `ID_S_D`) VALUES
(3, 'AT000002');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `FACILITIES`
--

CREATE TABLE `FACILITIES` (
  `ID_FAC` int(11) NOT NULL,
  `TYPE` varchar(30) NOT NULL,
  `PHONE` varchar(30) NOT NULL,
  `LOCATION` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `FACILITIES`
--

INSERT INTO `FACILITIES` (`ID_FAC`, `TYPE`, `PHONE`, `LOCATION`) VALUES
(1, 'DENTAL CLINIC', '1234567890', 'ATHENS'),
(2, 'KIDS CLINIC', '2345678901', 'KOZANI'),
(3, 'SURGERY CLINIC', '3456789012', 'PATRA'),
(4, 'PATHOLOGICAL CLINIC', '4567890123', 'THESSALONIKI'),
(5, 'PSYSIOLOGICAL CLINIC', '5678901234', 'LARISSA'),
(6, 'CHEMICAL LAB', '6789012345', 'THESSALONIKI'),
(7, 'BIRTH CENTER', '8901234567', 'ATHENS'),
(8, 'PHYSIOTHERAPY CENTER', '9012345678', 'THESSALONIKI'),
(9, 'OPHTHALMOLOGICAL CLINIC', '1123456789', 'THESSALONIKI');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `LAB`
--

CREATE TABLE `LAB` (
  `ID_LB` int(11) NOT NULL,
  `ID_MNG` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `LAB`
--

INSERT INTO `LAB` (`ID_LB`, `ID_MNG`) VALUES
(6, 'AT000001');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `NS_WORKS_IN_CL`
--

CREATE TABLE `NS_WORKS_IN_CL` (
  `ID1` int(11) NOT NULL,
  `ID_N` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `NS_WORKS_IN_CL`
--

INSERT INTO `NS_WORKS_IN_CL` (`ID1`, `ID_N`) VALUES
(2, 'AT000004'),
(3, 'AT000012'),
(4, 'AT000008'),
(9, 'AT000012');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `NURSING_STAFF`
--

CREATE TABLE `NURSING_STAFF` (
  `ID_NS` varchar(30) NOT NULL,
  `RANK` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `NURSING_STAFF`
--

INSERT INTO `NURSING_STAFF` (`ID_NS`, `RANK`) VALUES
('AT000004', 'NURSE A'),
('AT000008', 'NURSE B'),
('AT000012', 'NURSE B');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `PARAMEDICS`
--

CREATE TABLE `PARAMEDICS` (
  `ID_P` varchar(30) NOT NULL,
  `SPECIALITY` varchar(30) NOT NULL,
  `ID_F_WRK2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `PARAMEDICS`
--

INSERT INTO `PARAMEDICS` (`ID_P`, `SPECIALITY`, `ID_F_WRK2`) VALUES
('AT000005', 'CHEMIST', 6),
('AT000011', 'AMBULANCE DRIVER', 6);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `PATIENT`
--

CREATE TABLE `PATIENT` (
  `ID` varchar(30) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `SURNAME` varchar(30) NOT NULL,
  `AGE` int(11) NOT NULL,
  `INSURANCE` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `PATIENT`
--

INSERT INTO `PATIENT` (`ID`, `NAME`, `SURNAME`, `AGE`, `INSURANCE`) VALUES
('AM0000001', 'DIMITRIS', 'THEODOROU', 21, 'IKA'),
('AM000002', 'GEORGE', 'MARAGKOS', 22, 'OGA'),
('AM000003', 'MARILENA ', 'KADREVI', 21, 'IKA'),
('AM000004', 'JOHN', 'RAMSY', 30, 'PUBLIC INS.'),
('AM000005', 'KLEOPATRA ', 'LOYKA', 50, 'PUBLIC INS.'),
('AM000006', 'KAREN', 'JONES', 50, 'IKA');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `PRM_HELPS_WITH_ADM`
--

CREATE TABLE `PRM_HELPS_WITH_ADM` (
  `ID_ADM2` int(11) NOT NULL,
  `ID_S_P` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `PRM_HELPS_WITH_ADM`
--

INSERT INTO `PRM_HELPS_WITH_ADM` (`ID_ADM2`, `ID_S_P`) VALUES
(4, 'AT000005'),
(5, 'AT000005');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `PT_DO_ADM`
--

CREATE TABLE `PT_DO_ADM` (
  `ID3` varchar(30) NOT NULL,
  `ID_F_C` int(11) NOT NULL,
  `ID_D_ADM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `PT_DO_ADM`
--

INSERT INTO `PT_DO_ADM` (`ID3`, `ID_F_C`, `ID_D_ADM`) VALUES
('AM000003', 3, 6),
('AM0000001', 4, 5);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `REPORTS_T0`
--

CREATE TABLE `REPORTS_T0` (
  `ID_SUB_OD` varchar(30) NOT NULL,
  `ID_SUP` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `REPORTS_T0`
--

INSERT INTO `REPORTS_T0` (`ID_SUB_OD`, `ID_SUP`) VALUES
('AT000010', 'AT000001'),
('AT000001', 'AT000002'),
('AT000003', 'AT000002'),
('AT000002', 'AT000006');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `STAFF`
--

CREATE TABLE `STAFF` (
  `ID` varchar(30) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `SURNAME` varchar(30) NOT NULL,
  `AGE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `STAFF`
--

INSERT INTO `STAFF` (`ID`, `NAME`, `SURNAME`, `AGE`) VALUES
('AT000001', 'JIM', 'PAPAS', 25),
('AT000002', 'GEORGE', 'PAPADOPOULOS', 30),
('AT000003', 'JEAN', 'GREY', 40),
('AT000004', 'JAMES', 'NIKOLOPOULOS', 34),
('AT000005', 'JIM', 'PAPADAKIS', 56),
('AT000006', 'PENELOPY', 'SMITH', 30),
('AT000007', 'SPENCER', 'RID', 34),
('AT000008', 'NIKOLAOS', 'PAPAGEORGIOU', 40),
('AT000009', 'ANTONIS', 'NIKOLAOU', 40),
('AT000010', 'MICHALIS', 'SGOURIS', 30),
('AT000011', 'MARIA', 'GEORGOULI', 27),
('AT000012', 'REA', 'GEORGIOU', 30);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `TREATMENT`
--

CREATE TABLE `TREATMENT` (
  `TREATMENT_CODE` varchar(30) NOT NULL,
  `EXAMS` varchar(30) NOT NULL,
  `MEDICINE` varchar(30) NOT NULL,
  `DOSE` varchar(30) NOT NULL,
  `COST` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `TREATMENT`
--

INSERT INTO `TREATMENT` (`TREATMENT_CODE`, `EXAMS`, `MEDICINE`, `DOSE`, `COST`) VALUES
('1', 'PSYCOLOGICAL EVALUATION', 'ZANAX 300 mgr', '1 PILL /DAY', 30),
('2', 'EXCTRACTION', 'SALTWATER', '1 GLASS/DAY', 50),
('3', 'X-RAY', 'PANADOL 1000 mgr', '3 PILLS/DAY', 40),
('4', 'BLOODTEST', 'IRON VITAMINS 300 mgr PILLS', '1 PILL/DAY', 30),
('5', 'ULTRASOUND', 'NONE', 'NONE', 60),
('6', 'EYE TEST', 'EYEDROPS', '5 DROPS/EYE', 20),
('7', 'YROLOGICAL TEST', 'VITAMINES', '1 PILL/DAY', 40),
('8', 'STRESS TEST', 'NONE', 'NONE', 50),
('9', 'CAT SCAN', 'NONE', 'NONE', 40);

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `ADMISSION`
--
ALTER TABLE `ADMISSION`
  ADD PRIMARY KEY (`ADMISSION_CODE`),
  ADD KEY `ID_MNT` (`ID_MNT`),
  ADD KEY `TRT_C` (`TRT_C`);

--
-- Ευρετήρια για πίνακα `CLINICS`
--
ALTER TABLE `CLINICS`
  ADD PRIMARY KEY (`ID_CL`),
  ADD KEY `ID_MNG2` (`ID_MNG2`);

--
-- Ευρετήρια για πίνακα `DOCTOR`
--
ALTER TABLE `DOCTOR`
  ADD PRIMARY KEY (`ID_D`),
  ADD KEY `ID_F_WRK` (`ID_F_WRK`);

--
-- Ευρετήρια για πίνακα `D_HELPS_WITH_ADM`
--
ALTER TABLE `D_HELPS_WITH_ADM`
  ADD PRIMARY KEY (`ID_ADM`,`ID_S_D`),
  ADD KEY `ID_S_D` (`ID_S_D`);

--
-- Ευρετήρια για πίνακα `FACILITIES`
--
ALTER TABLE `FACILITIES`
  ADD PRIMARY KEY (`ID_FAC`);

--
-- Ευρετήρια για πίνακα `LAB`
--
ALTER TABLE `LAB`
  ADD PRIMARY KEY (`ID_LB`),
  ADD KEY `ID_MNG` (`ID_MNG`);

--
-- Ευρετήρια για πίνακα `NS_WORKS_IN_CL`
--
ALTER TABLE `NS_WORKS_IN_CL`
  ADD PRIMARY KEY (`ID1`,`ID_N`),
  ADD KEY `ID_N` (`ID_N`);

--
-- Ευρετήρια για πίνακα `NURSING_STAFF`
--
ALTER TABLE `NURSING_STAFF`
  ADD PRIMARY KEY (`ID_NS`);

--
-- Ευρετήρια για πίνακα `PARAMEDICS`
--
ALTER TABLE `PARAMEDICS`
  ADD PRIMARY KEY (`ID_P`),
  ADD KEY `ID_F_WRK2` (`ID_F_WRK2`);

--
-- Ευρετήρια για πίνακα `PATIENT`
--
ALTER TABLE `PATIENT`
  ADD PRIMARY KEY (`ID`);

--
-- Ευρετήρια για πίνακα `PRM_HELPS_WITH_ADM`
--
ALTER TABLE `PRM_HELPS_WITH_ADM`
  ADD PRIMARY KEY (`ID_ADM2`,`ID_S_P`),
  ADD KEY `ID_S_P` (`ID_S_P`);

--
-- Ευρετήρια για πίνακα `PT_DO_ADM`
--
ALTER TABLE `PT_DO_ADM`
  ADD PRIMARY KEY (`ID_F_C`,`ID3`,`ID_D_ADM`),
  ADD KEY `ID3` (`ID3`),
  ADD KEY `ID_D_ADM` (`ID_D_ADM`);

--
-- Ευρετήρια για πίνακα `REPORTS_T0`
--
ALTER TABLE `REPORTS_T0`
  ADD PRIMARY KEY (`ID_SUB_OD`),
  ADD KEY `ID_SUP` (`ID_SUP`);

--
-- Ευρετήρια για πίνακα `STAFF`
--
ALTER TABLE `STAFF`
  ADD PRIMARY KEY (`ID`);

--
-- Ευρετήρια για πίνακα `TREATMENT`
--
ALTER TABLE `TREATMENT`
  ADD PRIMARY KEY (`TREATMENT_CODE`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `ADMISSION`
--
ALTER TABLE `ADMISSION`
  MODIFY `ADMISSION_CODE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT για πίνακα `FACILITIES`
--
ALTER TABLE `FACILITIES`
  MODIFY `ID_FAC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `ADMISSION`
--
ALTER TABLE `ADMISSION`
  ADD CONSTRAINT `admission_ibfk_1` FOREIGN KEY (`ID_MNT`) REFERENCES `NURSING_STAFF` (`ID_NS`),
  ADD CONSTRAINT `admission_ibfk_2` FOREIGN KEY (`TRT_C`) REFERENCES `TREATMENT` (`TREATMENT_CODE`);

--
-- Περιορισμοί για πίνακα `CLINICS`
--
ALTER TABLE `CLINICS`
  ADD CONSTRAINT `clinics_ibfk_1` FOREIGN KEY (`ID_CL`) REFERENCES `FACILITIES` (`ID_FAC`),
  ADD CONSTRAINT `clinics_ibfk_2` FOREIGN KEY (`ID_MNG2`) REFERENCES `DOCTOR` (`ID_D`);

--
-- Περιορισμοί για πίνακα `DOCTOR`
--
ALTER TABLE `DOCTOR`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`ID_D`) REFERENCES `STAFF` (`ID`),
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`ID_F_WRK`) REFERENCES `FACILITIES` (`ID_FAC`);

--
-- Περιορισμοί για πίνακα `D_HELPS_WITH_ADM`
--
ALTER TABLE `D_HELPS_WITH_ADM`
  ADD CONSTRAINT `d_helps_with_adm_ibfk_1` FOREIGN KEY (`ID_ADM`) REFERENCES `ADMISSION` (`ADMISSION_CODE`),
  ADD CONSTRAINT `d_helps_with_adm_ibfk_2` FOREIGN KEY (`ID_S_D`) REFERENCES `DOCTOR` (`ID_D`);

--
-- Περιορισμοί για πίνακα `LAB`
--
ALTER TABLE `LAB`
  ADD CONSTRAINT `lab_ibfk_1` FOREIGN KEY (`ID_LB`) REFERENCES `FACILITIES` (`ID_FAC`),
  ADD CONSTRAINT `lab_ibfk_2` FOREIGN KEY (`ID_MNG`) REFERENCES `DOCTOR` (`ID_D`);

--
-- Περιορισμοί για πίνακα `NS_WORKS_IN_CL`
--
ALTER TABLE `NS_WORKS_IN_CL`
  ADD CONSTRAINT `ns_works_in_cl_ibfk_1` FOREIGN KEY (`ID1`) REFERENCES `CLINICS` (`ID_CL`),
  ADD CONSTRAINT `ns_works_in_cl_ibfk_2` FOREIGN KEY (`ID_N`) REFERENCES `NURSING_STAFF` (`ID_NS`);

--
-- Περιορισμοί για πίνακα `NURSING_STAFF`
--
ALTER TABLE `NURSING_STAFF`
  ADD CONSTRAINT `nursing_staff_ibfk_1` FOREIGN KEY (`ID_NS`) REFERENCES `STAFF` (`ID`);

--
-- Περιορισμοί για πίνακα `PARAMEDICS`
--
ALTER TABLE `PARAMEDICS`
  ADD CONSTRAINT `paramedics_ibfk_1` FOREIGN KEY (`ID_P`) REFERENCES `STAFF` (`ID`),
  ADD CONSTRAINT `paramedics_ibfk_2` FOREIGN KEY (`ID_F_WRK2`) REFERENCES `LAB` (`ID_LB`);

--
-- Περιορισμοί για πίνακα `PRM_HELPS_WITH_ADM`
--
ALTER TABLE `PRM_HELPS_WITH_ADM`
  ADD CONSTRAINT `prm_helps_with_adm_ibfk_1` FOREIGN KEY (`ID_ADM2`) REFERENCES `ADMISSION` (`ADMISSION_CODE`),
  ADD CONSTRAINT `prm_helps_with_adm_ibfk_2` FOREIGN KEY (`ID_S_P`) REFERENCES `PARAMEDICS` (`ID_P`);

--
-- Περιορισμοί για πίνακα `PT_DO_ADM`
--
ALTER TABLE `PT_DO_ADM`
  ADD CONSTRAINT `pt_do_adm_ibfk_1` FOREIGN KEY (`ID3`) REFERENCES `PATIENT` (`ID`),
  ADD CONSTRAINT `pt_do_adm_ibfk_2` FOREIGN KEY (`ID_F_C`) REFERENCES `CLINICS` (`ID_CL`),
  ADD CONSTRAINT `pt_do_adm_ibfk_3` FOREIGN KEY (`ID_D_ADM`) REFERENCES `ADMISSION` (`ADMISSION_CODE`);

--
-- Περιορισμοί για πίνακα `REPORTS_T0`
--
ALTER TABLE `REPORTS_T0`
  ADD CONSTRAINT `reports_t0_ibfk_1` FOREIGN KEY (`ID_SUB_OD`) REFERENCES `DOCTOR` (`ID_D`),
  ADD CONSTRAINT `reports_t0_ibfk_2` FOREIGN KEY (`ID_SUP`) REFERENCES `DOCTOR` (`ID_D`);
--
-- Βάση δεδομένων: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Άδειασμα δεδομένων του πίνακα `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"HOSP_DATABASE\",\"table\":\"STAFF\"},{\"db\":\"HOSP_DATABASE\",\"table\":\"NS_WORKS_IN_CL\"},{\"db\":\"HOSP_DATABASE\",\"table\":\"NURSING_STAFF\"},{\"db\":\"HOSP_DATABASE\",\"table\":\"PARAMEDICS\"},{\"db\":\"HOSP_DATABASE\",\"table\":\"PATIENT\"},{\"db\":\"HOSP_DATABASE\",\"table\":\"PRM_HELPS_WITH_ADM\"},{\"db\":\"HOSP_DATABASE\",\"table\":\"PT_DO_ADM\"},{\"db\":\"HOSP_DATABASE\",\"table\":\"REPORTS_T0\"},{\"db\":\"HOSP_DATABASE\",\"table\":\"TREATMENT\"},{\"db\":\"HOSP_DATABASE\",\"table\":\"ADMISSION\"}]');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Άδειασμα δεδομένων του πίνακα `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-05-02 12:04:28', '{\"lang\":\"el\",\"Console\\/Mode\":\"collapse\",\"DefaultConnectionCollation\":\"utf8_general_ci\"}');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Ευρετήρια για πίνακα `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Ευρετήρια για πίνακα `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Ευρετήρια για πίνακα `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Ευρετήρια για πίνακα `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Ευρετήρια για πίνακα `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Ευρετήρια για πίνακα `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Ευρετήρια για πίνακα `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Ευρετήρια για πίνακα `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Ευρετήρια για πίνακα `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Ευρετήρια για πίνακα `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Ευρετήρια για πίνακα `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Ευρετήρια για πίνακα `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Ευρετήρια για πίνακα `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Ευρετήρια για πίνακα `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Ευρετήρια για πίνακα `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Ευρετήρια για πίνακα `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Ευρετήρια για πίνακα `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Βάση δεδομένων: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `EMPL`
--

CREATE TABLE `EMPL` (
  `ID` int(11) NOT NULL,
  `NAM` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `EMPL`
--

INSERT INTO `EMPL` (`ID`, `NAM`) VALUES
(1, 'JOHN');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `EMPL`
--
ALTER TABLE `EMPL`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `EMPL`
--
ALTER TABLE `EMPL`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
