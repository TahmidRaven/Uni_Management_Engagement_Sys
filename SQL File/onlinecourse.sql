-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2023 at 08:30 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinecourse`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2022-01-31 16:21:18', '2023-12-13 22:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `arrival_booking`
--

CREATE TABLE `arrival_booking` (
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bus_no` int(11) NOT NULL,
  `route` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arrival_booking_pending`
--

CREATE TABLE `arrival_booking_pending` (
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `route` text NOT NULL,
  `bus_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `post_id`, `username`, `content`, `comment_date`) VALUES
(1, 1, 'dipu99', 'As you wish.', '2023-12-13 13:56:28'),
(2, 0, 'anonymous', 'dfghsf', '2023-12-14 00:59:20'),
(3, 0, 'anonymous', 'hjk\r\n', '2023-12-14 01:08:08'),
(4, 3, 'anonymous', 'khjgjkbh', '2023-12-14 01:17:24');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `courseCode` varchar(255) DEFAULT NULL,
  `courseName` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `noofSeats` int(11) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `youtube_link` varchar(255) DEFAULT NULL,
  `slide_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `courseCode`, `courseName`, `department`, `noofSeats`, `creationDate`, `youtube_link`, `slide_link`) VALUES
(3, 'CSE110', 'Basic Python', 'CSE', 38, '2023-12-12 21:14:56', 'https://youtube.com/playlist?list=PLtQXTSdoymQfo173BJeLyMZ9KlI7tORwW', 'https://github.com/ShababAhmedd/CSE110'),
(4, 'CSE111', 'OOP', 'CSE', 38, '2023-12-14 00:42:39', 'https://youtube.com/playlist?list=PLvr0Ht-XkB_3NAwjutgaG0-62d2yjG6qz', 'https://drive.google.com/drive/folders/1NBva7PteodHUKXxGYOeeMzVAkdrmfnFU?usp=share_link'),
(5, 'CSE221', 'Algorithm', 'CSE', 38, '2023-12-14 01:51:48', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courseenrolls`
--

CREATE TABLE `courseenrolls` (
  `id` int(11) NOT NULL,
  `studentRegno` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `course` int(11) DEFAULT NULL,
  `enrollDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courseenrolls`
--

INSERT INTO `courseenrolls` (`id`, `studentRegno`, `pincode`, `session`, `department`, `level`, `semester`, `course`, `enrollDate`) VALUES
(1, '10806121', '822894', 1, 1, 2, 3, 1, '2022-02-11 00:59:33'),
(2, '10806121', '822894', 1, 1, 1, 2, 2, '2022-02-11 01:01:07'),
(3, '21201342', '160594', 3, 4, 0, 8, 3, '2023-12-13 14:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department`, `creationDate`) VALUES
(4, 'CSE', '2023-12-10 14:54:38'),
(5, 'CS', '2023-12-10 14:54:43'),
(6, 'EEE', '2023-12-10 14:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `departure_booking`
--

CREATE TABLE `departure_booking` (
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bus_no` int(11) NOT NULL,
  `route` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departure_booking_pending`
--

CREATE TABLE `departure_booking_pending` (
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `route` text NOT NULL,
  `bus_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donor_details`
--

CREATE TABLE `donor_details` (
  `donor_id` int(11) NOT NULL,
  `donor_name` varchar(50) NOT NULL,
  `donor_number` varchar(10) NOT NULL,
  `donor_mail` varchar(50) DEFAULT NULL,
  `donor_age` int(60) NOT NULL,
  `donor_gender` varchar(10) NOT NULL,
  `donor_blood` varchar(10) NOT NULL,
  `donor_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor_details`
--

INSERT INTO `donor_details` (`donor_id`, `donor_name`, `donor_number`, `donor_mail`, `donor_age`, `donor_gender`, `donor_blood`, `donor_address`) VALUES
(1, 'uihfzjkg', 'fdlhb', 'ahteshamibnemostafa@gmail.com', 0, 'Male', 'O+', 'asdasda'),
(2, 'ahtesham', '0199844030', 'ahteshamibnemostofa@gmail.com', 23, 'Male', 'O+', 'gazipur'),
(3, 'ahtes', '0199844034', 'ahteshamibnemafa@gmail.com', 29, 'Female', 'A+', 'rtyrurt'),
(4, 'Sazidur Rahman', '0156565486', 'fsndjkxhgkhjsdfns@miaw.com', 21, 'Female', 'O-', 'fshdzhd');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `level`, `creationDate`) VALUES
(1, '1', '2022-02-11 00:59:02'),
(2, '2', '2022-02-11 00:59:02'),
(3, '3', '2022-02-11 00:59:09');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `newstitle` varchar(255) DEFAULT NULL,
  `newsDescription` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `newstitle`, `newsDescription`, `postingDate`) VALUES
(4, 'Admission for Spring 2024 is going on', 'Get yourself admitted.', '2023-12-12 22:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `personal_email` varchar(255) DEFAULT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneno` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `approval_status` varchar(50) DEFAULT 'approved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `user_type`, `username`, `name`, `personal_email`, `nid`, `blood_group`, `date_of_birth`, `gender`, `address`, `phoneno`, `password`, `approval_status`) VALUES
(1, 'student', 'bloodraven', 'Tahmid Raven', 'tahmidrockz00@gmail.com', '1112222333', 'A+', '2000-08-17', 'male', 'Aftabnagar, Block F, sector 02, Avenue Road 09, House 06', '+8801773714424', '$2y$10$s6GmnlcMaxkcqeM0ZwDzUuJz9J7hspV1isttT5k5yoKhkldger5Qm', 'approved'),
(5, 'faculty', 'dipu99', 'Soaib Dipu', 'dipu@gmail.com', '1112222335', 'A+', '1995-11-22', 'male', 'Baridhara, Dhaka', '+8801773714423', '$2y$10$F6rCNCwHDPt9SarbyEw0M.s/0IfIF1VcDHyt/lovcVB.pT8ZQd436', 'pending'),
(9, 'faculty', 'ravenxdeath', 'Raven', 'raven.of.the.endless@gmail.com', '5555555555', 'A+', '2002-08-17', 'male', 'Aftabnagar, Block F, sector 02, Avenue Road 09, House 06', '+8801773714424', '$2y$10$s4OxkI4HbQDueneLQtRjlOcxPBGM8rMuCu7MfofgF4auTPKy7/TGu', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `username`, `title`, `content`, `post_date`) VALUES
(1, NULL, 'will i die today?', 'i need to know', '2023-12-13 23:55:51'),
(2, NULL, 'dhdgh', 'dghdghd', '2023-12-14 01:15:18'),
(3, NULL, 'how ', 'are you', '2023-12-14 01:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `id` int(11) NOT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id`, `semester`, `creationDate`, `updationDate`) VALUES
(6, 'Fall 2023', '2023-12-10 14:53:38', NULL),
(7, 'Spring 2024', '2023-12-10 14:53:57', NULL),
(8, 'Summer 2024', '2023-12-10 14:54:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `session` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `session`, `creationDate`) VALUES
(3, '2023', '2023-12-10 14:52:53');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `studentRegno` varchar(255) NOT NULL,
  `studentPhoto` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `studentName` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `cgpa` decimal(10,2) DEFAULT NULL,
  `creationdate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentRegno`, `studentPhoto`, `password`, `studentName`, `pincode`, `session`, `department`, `semester`, `cgpa`, `creationdate`, `updationDate`) VALUES
('20254564', NULL, '68053af2923e00204c3ca7c6a3150cf7', 'Tahmid', '964806', NULL, NULL, NULL, NULL, '2023-12-13 23:12:49', NULL),
('21201128', 'Cosmic Cliffs  .jpg', '4a7d1ed414474e4033ac29ccb8653d9b', 'Tazree', '896695', NULL, NULL, NULL, -500.00, '2023-12-14 07:28:00', NULL),
('21201342', 'jr-korpa-9MvO-tKoXNU-unsplash.jpg', '81dc9bdb52d04dc20036dbd8313ed055', 'ahtesham', '160594', NULL, NULL, NULL, 9.00, '2023-12-12 21:19:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transportation_arrival`
--

CREATE TABLE `transportation_arrival` (
  `bus_no` int(11) NOT NULL,
  `bus_route` text NOT NULL,
  `timing` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transportation_arrival`
--

INSERT INTO `transportation_arrival` (`bus_no`, `bus_route`, `timing`) VALUES
(1, 'Abdullahpur- Airport- Khilkhet- BRAC University ', '06:40:00'),
(2, 'Kallyanpur Bus Stand-Mirpur College Gate (Mirpur 2)-ECB Chattar (Matikata)-BRAC University ', '06:30:00'),
(3, 'Jigatola-Mohammadpur Bus Stand-BRAC University', '06:20:00'),
(4, 'Azimpur Etimkhana Mour-Sobhanbag (Near foot over-bridge)-BRAC University ', '06:00:00'),
(5, 'Jatrabari(Popular Diagnostic Centre)-Malibag Rail Gate-Rampura TV Center (Mollah Tower)-BRAC University', '06:20:00'),
(6, 'Baldha Garden-Motijheel-Shantinagar Mour-Mogbazar TNT Office-BRAC University ', '06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transportation_departure`
--

CREATE TABLE `transportation_departure` (
  `bus_no` int(11) NOT NULL,
  `bus_route` text NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transportation_departure`
--

INSERT INTO `transportation_departure` (`bus_no`, `bus_route`, `time`) VALUES
(1, 'BRAC University-Abdullahpur', '17:00:00'),
(2, 'BRAC University-Mirpur', '17:00:00'),
(3, 'BRAC University-Jigatola', '17:00:00'),
(4, 'BRAC University-Azimpur', '17:00:00'),
(5, 'BRAC University-Jatrabari', '17:00:00'),
(6, 'BRAC University-Baldha Garden', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `studentRegno` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `studentRegno`, `userip`, `loginTime`, `logout`, `status`) VALUES
(4, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-12 21:21:00', '13-12-2023 02:53:33 AM', 1),
(5, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-12 21:23:46', NULL, 1),
(6, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-12 21:24:15', NULL, 1),
(7, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-12 21:25:39', '13-12-2023 03:50:58 AM', 1),
(8, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-12 22:21:46', NULL, 1),
(9, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-12 23:37:56', '13-12-2023 05:50:51 AM', 1),
(10, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 00:21:03', '13-12-2023 05:53:50 AM', 1),
(11, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 00:24:01', '13-12-2023 02:55:55 PM', 1),
(12, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 09:34:29', NULL, 1),
(13, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 10:18:17', '13-12-2023 03:48:33 PM', 1),
(14, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 10:25:06', '13-12-2023 03:57:32 PM', 1),
(15, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 14:37:15', '13-12-2023 08:07:34 PM', 1),
(16, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 14:38:23', '13-12-2023 08:23:27 PM', 1),
(17, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 15:07:19', '13-12-2023 08:38:03 PM', 1),
(18, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 15:21:02', NULL, 1),
(19, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 15:25:09', '13-12-2023 08:55:15 PM', 1),
(20, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 15:30:46', '13-12-2023 09:00:57 PM', 1),
(21, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 15:38:17', '13-12-2023 09:42:28 PM', 1),
(22, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 16:12:41', '13-12-2023 09:42:43 PM', 1),
(23, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 16:17:09', '13-12-2023 09:47:21 PM', 1),
(24, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 16:34:34', NULL, 1),
(25, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 16:36:47', NULL, 1),
(26, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 17:03:11', '13-12-2023 10:57:36 PM', 1),
(27, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 17:27:37', NULL, 1),
(28, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 17:51:20', '13-12-2023 11:23:35 PM', 1),
(29, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 17:53:55', '13-12-2023 11:24:50 PM', 1),
(30, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 18:02:49', '14-12-2023 01:48:35 AM', 1),
(31, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 20:18:39', '14-12-2023 01:49:15 AM', 1),
(32, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 20:19:18', '14-12-2023 01:49:24 AM', 1),
(33, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 20:46:18', NULL, 1),
(34, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 20:46:18', '14-12-2023 02:36:42 AM', 1),
(35, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 21:18:43', NULL, 1),
(36, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 21:19:16', NULL, 1),
(37, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 21:23:43', NULL, 1),
(38, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 21:27:30', '14-12-2023 03:02:06 AM', 1),
(39, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 21:32:10', '14-12-2023 03:02:36 AM', 1),
(40, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 21:53:44', '14-12-2023 03:57:47 AM', 1),
(41, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 23:11:23', '14-12-2023 04:41:37 AM', 1),
(42, '20254564', 0x3a3a3100000000000000000000000000, '2023-12-13 23:21:40', '14-12-2023 04:52:19 AM', 1),
(43, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 23:35:13', NULL, 1),
(44, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-13 23:44:11', NULL, 1),
(45, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:01:06', NULL, 1),
(46, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:01:06', '14-12-2023 05:32:19 AM', 1),
(47, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:02:26', '14-12-2023 05:58:43 AM', 1),
(48, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:29:56', '14-12-2023 06:00:34 AM', 1),
(49, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:30:52', '14-12-2023 06:01:33 AM', 1),
(50, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:33:01', NULL, 1),
(51, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:33:01', '14-12-2023 06:03:29 AM', 1),
(52, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:33:47', '14-12-2023 06:03:50 AM', 1),
(53, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:35:50', '14-12-2023 06:05:54 AM', 1),
(54, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:44:15', '14-12-2023 06:14:19 AM', 1),
(55, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:50:56', NULL, 1),
(56, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:50:56', '14-12-2023 06:22:48 AM', 1),
(57, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 00:59:15', '14-12-2023 06:33:29 AM', 1),
(58, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 01:03:33', NULL, 1),
(59, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 01:03:36', '14-12-2023 06:35:29 AM', 1),
(60, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 01:05:30', '14-12-2023 06:37:55 AM', 1),
(61, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 01:10:57', '14-12-2023 06:45:30 AM', 1),
(62, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 01:31:51', NULL, 1),
(63, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 01:31:51', NULL, 1),
(64, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 01:34:34', NULL, 1),
(65, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 01:36:40', '14-12-2023 07:08:24 AM', 1),
(66, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 01:51:57', '14-12-2023 07:24:14 AM', 1),
(67, '21201342', 0x3a3a3100000000000000000000000000, '2023-12-14 01:54:43', '14-12-2023 07:27:23 AM', 1),
(68, '21201128', 0x3a3a3100000000000000000000000000, '2023-12-14 07:29:09', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `arrival_booking`
--
ALTER TABLE `arrival_booking`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `arrival_booking_pending`
--
ALTER TABLE `arrival_booking_pending`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courseenrolls`
--
ALTER TABLE `courseenrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departure_booking`
--
ALTER TABLE `departure_booking`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `departure_booking_pending`
--
ALTER TABLE `departure_booking_pending`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `donor_details`
--
ALTER TABLE `donor_details`
  ADD PRIMARY KEY (`donor_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentRegno`);

--
-- Indexes for table `transportation_departure`
--
ALTER TABLE `transportation_departure`
  ADD PRIMARY KEY (`bus_no`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courseenrolls`
--
ALTER TABLE `courseenrolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `donor_details`
--
ALTER TABLE `donor_details`
  MODIFY `donor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_person` FOREIGN KEY (`id`) REFERENCES `person` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
