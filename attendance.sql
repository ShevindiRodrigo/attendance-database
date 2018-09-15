-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2018 at 06:29 AM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseID` varchar(20) NOT NULL,
  `General` tinyint(1) NOT NULL,
  `Direct` tinyint(1) NOT NULL,
  `Special` tinyint(1) NOT NULL,
  `courseTitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `course`:
--

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `General`, `Direct`, `Special`, `courseTitle`) VALUES
('CSC311GC2', 1, 0, 0, 'RAD'),
('CSC311SC2', 0, 1, 0, 'RAD'),
('CSC312GC2', 1, 0, 0, 'Programming in Logic'),
('CSC312SC2', 0, 1, 0, 'Programming in Logic'),
('CSC313MC3', 0, 0, 1, 'DIP'),
('CSC313SC3', 0, 1, 0, 'DIP');

-- --------------------------------------------------------

--
-- Table structure for table `lecpassword`
--

CREATE TABLE `lecpassword` (
  `LectureId` varchar(20) NOT NULL,
  `Lec_Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lecpassword`:
--   `LectureId`
--       `lecturer` -> `LectureId`
--

--
-- Dumping data for table `lecpassword`
--

INSERT INTO `lecpassword` (`LectureId`, `Lec_Password`) VALUES
('001', 'xxxxx'),
('002', 'yyyyy'),
('003', 'rrrrrr');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `LectureId` varchar(20) NOT NULL,
  `Lecturer_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lecturer`:
--

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`LectureId`, `Lecturer_name`) VALUES
('001', 'Dr.Mahesan'),
('002', 'Dr.Ramanan'),
('003', 'Dr.Barathy');

-- --------------------------------------------------------

--
-- Table structure for table `lec_course`
--

CREATE TABLE `lec_course` (
  `LectureId` varchar(10) NOT NULL,
  `CourseTitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `lec_course`:
--   `LectureId`
--       `lecturer` -> `LectureId`
--

--
-- Dumping data for table `lec_course`
--

INSERT INTO `lec_course` (`LectureId`, `CourseTitle`) VALUES
('001', 'RAD'),
('002', 'Programming in Logic'),
('003', 'DIP');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentRegNo` varchar(20) NOT NULL,
  `Student_name` varchar(50) NOT NULL,
  `Level_of_study` enum('G','M','S') NOT NULL,
  `Gender` enum('Female','Male') NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `student`:
--

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentRegNo`, `Student_name`, `Level_of_study`, `Gender`, `Date_of_birth`, `Address`) VALUES
('2015CSC015', 'Isuri Kalugalla', 'S', 'Female', '1994-10-02', 'Kegalla'),
('2015SP006', 'Madhusanka Kumara', 'G', 'Male', '1994-05-27', 'Rathnapura'),
('2015SP030', 'Robin Roy', 'S', 'Male', '1993-04-16', 'Jaffna'),
('2015SP054', 'Malki Sandamini ', 'M', 'Female', '1995-11-25', 'Anuradhapura'),
('2015SP128', 'Shevindi Rodrigo', 'M', 'Female', '1995-11-27', 'Wennappuwa');

-- --------------------------------------------------------

--
-- Table structure for table `stud_attendance`
--

CREATE TABLE `stud_attendance` (
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `LectureID` varchar(10) NOT NULL,
  `CourseID` varchar(20) NOT NULL,
  `stud_regNo` varchar(20) NOT NULL,
  `Attendance` enum('Present','Absent') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `stud_attendance`:
--   `LectureID`
--       `lecturer` -> `LectureId`
--   `CourseID`
--       `course` -> `CourseID`
--   `stud_regNo`
--       `student` -> `StudentRegNo`
--

--
-- Dumping data for table `stud_attendance`
--

INSERT INTO `stud_attendance` (`Date`, `Time`, `LectureID`, `CourseID`, `stud_regNo`, `Attendance`) VALUES
('2018-03-01', '08:00:00', '001', 'CSC311GC2', '2015SP128', 'Present'),
('2018-03-02', '08:00:00', '002', 'CSC312GC2', '2015SP128', 'Present'),
('2018-03-02', '09:00:00', '002', 'CSC311SC2', '2015CSC015', 'Present'),
('2018-03-03', '10:00:00', '003', 'CSC313MC3', '2015SP054', 'Absent'),
('2018-03-03', '10:00:00', '003', 'CSC313SC3', '2015CSC015', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `stud_fingerprint`
--

CREATE TABLE `stud_fingerprint` (
  `StudentRegNo` varchar(20) NOT NULL,
  `Fingerprint` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `stud_fingerprint`:
--   `StudentRegNo`
--       `student` -> `StudentRegNo`
--

--
-- Dumping data for table `stud_fingerprint`
--

INSERT INTO `stud_fingerprint` (`StudentRegNo`, `Fingerprint`) VALUES
('2015CSC015', 'abc@123'),
('2015SP006', '123dfg'),
('2015SP030', 'xxc456'),
('2015SP054', '896we'),
('2015SP128', '123asd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`,`courseTitle`);

--
-- Indexes for table `lecpassword`
--
ALTER TABLE `lecpassword`
  ADD UNIQUE KEY `LectureId` (`LectureId`) USING BTREE;

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`LectureId`);

--
-- Indexes for table `lec_course`
--
ALTER TABLE `lec_course`
  ADD UNIQUE KEY `LectureId_2` (`LectureId`,`CourseTitle`) USING BTREE;

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentRegNo`);

--
-- Indexes for table `stud_attendance`
--
ALTER TABLE `stud_attendance`
  ADD UNIQUE KEY `Date` (`Date`,`Time`,`LectureID`,`CourseID`,`stud_regNo`),
  ADD KEY `LectureID` (`LectureID`),
  ADD KEY `CourseID` (`CourseID`),
  ADD KEY `stud_regNo` (`stud_regNo`);

--
-- Indexes for table `stud_fingerprint`
--
ALTER TABLE `stud_fingerprint`
  ADD UNIQUE KEY `StudentRegNo` (`StudentRegNo`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lecpassword`
--
ALTER TABLE `lecpassword`
  ADD CONSTRAINT `lecpassword_ibfk_1` FOREIGN KEY (`LectureId`) REFERENCES `lecturer` (`LectureId`);

--
-- Constraints for table `lec_course`
--
ALTER TABLE `lec_course`
  ADD CONSTRAINT `lec_course_ibfk_2` FOREIGN KEY (`LectureId`) REFERENCES `lecturer` (`LectureId`);

--
-- Constraints for table `stud_attendance`
--
ALTER TABLE `stud_attendance`
  ADD CONSTRAINT `stud_attendance_ibfk_1` FOREIGN KEY (`LectureID`) REFERENCES `lecturer` (`LectureId`),
  ADD CONSTRAINT `stud_attendance_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`),
  ADD CONSTRAINT `stud_attendance_ibfk_3` FOREIGN KEY (`stud_regNo`) REFERENCES `student` (`StudentRegNo`);

--
-- Constraints for table `stud_fingerprint`
--
ALTER TABLE `stud_fingerprint`
  ADD CONSTRAINT `stud_fingerprint_ibfk_1` FOREIGN KEY (`StudentRegNo`) REFERENCES `student` (`StudentRegNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
