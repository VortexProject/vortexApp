-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2017 at 07:11 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vortex`
--
CREATE DATABASE IF NOT EXISTS `vortex` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `vortex`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `user_id`, `email`, `phone_number`, `password`) VALUES
(1, 1, 'smekaltomas@email.cz', NULL, '123456'),
(2, 2, 'dmitry@gmail.com', NULL, '12345');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_item`
--

CREATE TABLE `payment_item` (
  `id` int(11) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `serial_number` varchar(255) NOT NULL,
  `payment_method_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_item`
--

INSERT INTO `payment_item` (`id`, `register_date`, `serial_number`, `payment_method_id`) VALUES
(3, '2017-03-25 05:55:45', '04522E0ADE4980', 1),
(4, '2017-03-25 05:55:45', '045D2F0ADE4980', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `name`) VALUES
(1, 'CARD');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `points_price` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `benefit_point` int(11) DEFAULT NULL,
  `min_players` int(11) NOT NULL DEFAULT '1',
  `max_players` int(11) DEFAULT NULL,
  `staff_count` int(11) NOT NULL DEFAULT '1',
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime DEFAULT NULL,
  `payment_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `valid_from`, `valid_to`, `payment_item_id`) VALUES
(1, '2017-03-24 00:00:00', NULL, 3),
(2, '2017-03-24 00:00:00', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_log`
--

CREATE TABLE `staff_log` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `points`, `session_id`, `create_date`) VALUES
(1, 150, 1, '2017-03-25 05:57:24'),
(2, 300, 2, '2017-03-25 05:57:24'),
(3, 50, 1, '2017-03-26 06:52:07'),
(4, 567, 1, '2017-03-26 06:55:36');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `username`, `create_date`) VALUES
(1, 'Tomas', 'Smekal', 'zooner', '2017-03-25 05:51:26'),
(2, 'Dmitry', 'Pratashchyk', 'snipersu28', '2017-03-25 05:51:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_payment_item`
--

CREATE TABLE `user_payment_item` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_payment_item`
--

INSERT INTO `user_payment_item` (`id`, `user_id`, `payment_item_id`) VALUES
(1, 1, 3),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_getuserinfo`
-- (See below for the actual view)
--
CREATE TABLE `v_getuserinfo` (
`serial_number` varchar(255)
,`id` int(11)
,`firstname` varchar(255)
,`lastname` varchar(255)
,`username` varchar(50)
,`create_date` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_getusertransactions`
-- (See below for the actual view)
--
CREATE TABLE `v_getusertransactions` (
`points` int(11)
,`create_date` timestamp
);

-- --------------------------------------------------------

--
-- Structure for view `v_getuserinfo`
--
DROP TABLE IF EXISTS `v_getuserinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getuserinfo`  AS  select `pi`.`serial_number` AS `serial_number`,`u`.`id` AS `id`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`username` AS `username`,`u`.`create_date` AS `create_date` from ((`payment_item` `pi` join `user_payment_item` `upi` on((`pi`.`id` = `upi`.`payment_item_id`))) join `user` `u` on((`u`.`id` = `upi`.`user_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_getusertransactions`
--
DROP TABLE IF EXISTS `v_getusertransactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_getusertransactions`  AS  select `t`.`points` AS `points`,`t`.`create_date` AS `create_date` from ((`payment_item` `pi` join `session` `s` on((`pi`.`id` = `s`.`payment_item_id`))) join `transaction` `t` on((`t`.`session_id` = `s`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_user` (`user_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_item`
--
ALTER TABLE `payment_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payment_item_payment_method` (`payment_method_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_service_location` (`location_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_session_payment_item` (`payment_item_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_staff_user` (`user_id`);

--
-- Indexes for table `staff_log`
--
ALTER TABLE `staff_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_staff_log_transaction` (`transaction_id`),
  ADD KEY `fk_staff_log_staff` (`staff_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transaction_session` (`session_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_payment_item`
--
ALTER TABLE `user_payment_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer2payment_item_customer` (`user_id`),
  ADD KEY `fk_customer2payment_item_payment_item` (`payment_item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_item`
--
ALTER TABLE `payment_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_log`
--
ALTER TABLE `staff_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_payment_item`
--
ALTER TABLE `user_payment_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_item`
--
ALTER TABLE `payment_item`
  ADD CONSTRAINT `fk_payment_item_payment_method` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `fk_service_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `fk_session_payment_item` FOREIGN KEY (`payment_item_id`) REFERENCES `payment_item` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_staff_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_log`
--
ALTER TABLE `staff_log`
  ADD CONSTRAINT `fk_staff_log_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  ADD CONSTRAINT `fk_staff_log_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_transaction_session` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`);

--
-- Constraints for table `user_payment_item`
--
ALTER TABLE `user_payment_item`
  ADD CONSTRAINT `fk_customer2payment_item_customer` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_customer2payment_item_payment_item` FOREIGN KEY (`payment_item_id`) REFERENCES `payment_item` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
