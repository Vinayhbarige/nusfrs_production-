-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2022 at 08:15 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nus`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientcompanydata`
--

CREATE TABLE `clientcompanydata` (
  `id` int(11) NOT NULL,
  `parentcompany` varchar(255) NOT NULL,
  `clientcompany` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `serialno` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `enter_trade`
--

CREATE TABLE `enter_trade` (
  `tradeId` int(11) NOT NULL,
  `parentId` varchar(50) NOT NULL,
  `clientId` int(11) NOT NULL,
  `supplycontractid` varchar(128) NOT NULL,
  `mwh` varchar(30) NOT NULL,
  `percentage` varchar(30) NOT NULL,
  `tradevolume` varchar(50) NOT NULL,
  `baseload` float(10,2) NOT NULL,
  `effectiveprice` float(10,2) NOT NULL,
  `trade` varchar(30) NOT NULL,
  `tradevalue` varchar(20) NOT NULL,
  `tradingId` int(11) NOT NULL,
  `nustradeId` int(11) NOT NULL,
  `tradeDate` varchar(30) NOT NULL,
  `quartval` varchar(30) NOT NULL,
  `tradequarvol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nususerdata`
--

CREATE TABLE `nususerdata` (
  `id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `emailId` varchar(100) NOT NULL,
  `accountstatus` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `parentcompany` varchar(100) NOT NULL,
  `bussinessunit` varchar(255) NOT NULL,
  `active` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nususerdata`
--

INSERT INTO `nususerdata` (`id`, `role`, `username`, `emailId`, `accountstatus`, `password`, `parentcompany`, `bussinessunit`, `active`) VALUES
(1, 'Admin', 'Admin', 'admin@nusconsulting.com', 'Confirmed', '$argon2i$v=19$m=65536,t=4,p=1$a085aUQyc3hKdHFSMllyQQ$bKQT8rWb/gTK6IOlavJ1BWa0mpMzrcQ9pQjfXAMBVP0', '', '', 'Active'),
(2, 'Admin', 'Richard', 'rsoultanian@nusconsulting.co.uk', 'Confirmed', '$argon2i$v=19$m=65536,t=4,p=1$M1BLcWdFUTV6Qm1MOW5iVA$WWMMFfr/o8dniZ6rkEHPvm6Vr94fgdTri2pa5R6E5MY', '', '', 'Active'),
(3, 'Admin', 'Miguel', 'mjimenez@nusconsulting.es', 'Confirmed', '$argon2i$v=19$m=65536,t=4,p=1$OGJnOWhMYmlnMUtoWHNkWA$RwMpkFnRWcQNdJTe7UcdL5MTzF4/NnaxAzp387RMlow', '', '', 'Active'),
(4, 'Parent company', 'test', 'test@gmail.com', 'Confirmed', '$argon2i$v=19$m=65536,t=4,p=1$QzhXT0hpMUJLbnQuNU5LVA$gQzVi8RIElOaMn0lq6bT1MNHt353/aySBXqlP6oQlAs', '', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `nus_calendermonth`
--

CREATE TABLE `nus_calendermonth` (
  `monthId` int(11) NOT NULL,
  `month` varchar(20) NOT NULL,
  `clicks` int(11) NOT NULL,
  `TradeId` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nus_calenderquarter`
--

CREATE TABLE `nus_calenderquarter` (
  `querterid` int(11) NOT NULL,
  `quarters` varchar(50) NOT NULL,
  `clicks` int(11) NOT NULL,
  `tradeid` int(11) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `yearoftrade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nus_calenderyear`
--

CREATE TABLE `nus_calenderyear` (
  `calenderId` int(11) NOT NULL,
  `calenderyear` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `tradeId` int(11) NOT NULL,
  `supplierid` int(11) NOT NULL,
  `timeperiod` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nus_countries`
--

CREATE TABLE `nus_countries` (
  `countryId` int(11) NOT NULL,
  `countryName` varchar(255) NOT NULL,
  `addedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nus_countries`
--

INSERT INTO `nus_countries` (`countryId`, `countryName`, `addedOn`) VALUES
(1, 'India', '2022-05-19 13:20:42'),
(2, 'Sri Lanka', '2022-05-19 13:20:42'),
(3, 'United Kingdom', '2022-07-20 15:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `nus_currencies`
--

CREATE TABLE `nus_currencies` (
  `id` tinyint(4) NOT NULL,
  `currencies` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nus_currencies`
--

INSERT INTO `nus_currencies` (`id`, `currencies`) VALUES
(1, 'USD'),
(2, 'EUR'),
(3, 'AUD'),
(4, 'CAD'),
(5, 'CHF'),
(6, 'CZK'),
(7, 'GBP'),
(8, 'HUF'),
(9, 'PLN'),
(10, 'SEK'),
(11, 'SGD');

-- --------------------------------------------------------

--
-- Table structure for table `nus_electricity_index`
--

CREATE TABLE `nus_electricity_index` (
  `id` tinyint(4) NOT NULL,
  `country` varchar(30) NOT NULL,
  `indexlist` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nus_electricity_index`
--

INSERT INTO `nus_electricity_index` (`id`, `country`, `indexlist`) VALUES
(1, 'Australia', 'ASX'),
(2, 'Austria', 'EEX/Austria'),
(3, 'Czech', 'EEX-PXE/Czechia'),
(4, 'Denmark', 'Nasdaq OMX/Denmark'),
(5, 'Finland', 'Nasdaq OMX/Finland'),
(6, 'France', 'EEX/France'),
(7, 'Germany', 'EEX/Deutschland'),
(8, 'Hungary', 'EEX-PXE/Hungary'),
(9, 'Hungary', 'PXE'),
(10, 'Italy', 'EEX/Italy'),
(11, 'Netherlands - Belgium\n', 'Ice Endex'),
(12, 'Norway', 'Nasdaq OMX/Norway'),
(13, 'Romania', 'OPCOM'),
(14, 'Slovakia', 'EEX-PXE/Slovakia'),
(15, 'Slovenia', 'EEX-PXE/Slovenia'),
(16, 'Spain - Portugal\n', 'OMIP'),
(17, 'Sweden ', 'Nasdaq OMX/Sweden'),
(18, 'Switzerland', 'EEX/Switzerland'),
(19, 'USA', 'CAISO NP-15 or SP-15'),
(20, 'USA', 'ERCOT North or Houston'),
(21, 'USA', 'Illinois Hub (MISO)'),
(22, 'USA', 'NEPOOL Internal Hub'),
(23, 'USA', 'NYISO Zone J (NYC area)'),
(24, 'USA', 'PJM Western Hub');

-- --------------------------------------------------------

--
-- Table structure for table `nus_naturalgas_index`
--

CREATE TABLE `nus_naturalgas_index` (
  `id` tinyint(11) NOT NULL,
  `countries` varchar(30) NOT NULL,
  `indexlist` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nus_naturalgas_index`
--

INSERT INTO `nus_naturalgas_index` (`id`, `countries`, `indexlist`) VALUES
(1, 'Austria', 'CEGH VTP'),
(2, 'Austria', 'PEGAS/CEGH VTP'),
(3, 'Czech', 'CZ VTP'),
(4, 'Denmark', 'ETF/Denmark'),
(5, 'France', 'PEG'),
(6, 'Germany - Switzerland', 'THE/PEGAS'),
(7, 'Hungary', 'CEEGEX'),
(8, 'Italy', 'PSV'),
(9, 'Netherlands', 'TTF'),
(10, 'Norway', 'ETF/Norway'),
(11, 'Romania', 'OPCOM'),
(12, 'Spain - Portugal', 'MIBGAS'),
(13, 'Sweden ', 'ETF/Sweden'),
(14, 'USA', 'NYMEX'),
(15, 'USA - Mexico', 'HSC [Houston Ship Channel]');

-- --------------------------------------------------------

--
-- Table structure for table `nus_pricing_mechanisam`
--

CREATE TABLE `nus_pricing_mechanisam` (
  `priMechId` int(11) NOT NULL,
  `pricingMechName` varchar(128) NOT NULL,
  `priceMechDesc` varchar(255) NOT NULL,
  `addedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nus_pricing_mechanisam`
--

INSERT INTO `nus_pricing_mechanisam` (`priMechId`, `pricingMechName`, `priceMechDesc`, `addedOn`) VALUES
(1, 'Day Ahead', 'Spot Daily Market', '2022-05-23 13:07:28'),
(2, 'Day Ahead', 'Spot Average for month', '2022-05-23 13:08:14'),
(3, 'Month Ahead', 'Last Value', '2022-05-23 13:08:14'),
(4, 'Month Ahead', 'Average Value', '2022-05-23 13:09:07'),
(5, 'Quarter Ahead', 'Last Value', '2022-05-23 13:09:07'),
(6, 'Quarter Ahead', 'Average Value', '2022-05-23 13:09:46'),
(7, 'Calendar Ahead', 'Last Value', '2022-05-23 13:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `nus_season`
--

CREATE TABLE `nus_season` (
  `seasonId` int(11) NOT NULL,
  `tradeId` int(11) NOT NULL,
  `yeartrade` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `season` varchar(30) NOT NULL,
  `clicks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nus_supply_contract`
--

CREATE TABLE `nus_supply_contract` (
  `supplierId` int(11) NOT NULL,
  `parentId` varchar(100) NOT NULL,
  `clientId` int(11) NOT NULL,
  `contract_id` varchar(128) NOT NULL,
  `countryName` varchar(64) NOT NULL,
  `commodityName` varchar(64) NOT NULL,
  `commodityUnits` varchar(32) NOT NULL,
  `supplyName` varchar(255) NOT NULL,
  `contractType` varchar(32) NOT NULL,
  `contractIndexId` varchar(64) NOT NULL,
  `contractTermfromDate` date NOT NULL,
  `contractTermtoDate` date NOT NULL,
  `commodityPrice` float(10,2) NOT NULL,
  `totalAnualConsumption` varchar(30) NOT NULL,
  `totlconsumption` varchar(50) NOT NULL,
  `allmonts` text NOT NULL,
  `contractpricetype` varchar(30) NOT NULL,
  `indexStructureType` varchar(64) NOT NULL,
  `consumMinsize` varchar(64) NOT NULL,
  `clickTrancheminsize` int(11) NOT NULL,
  `openPrizemechanism` varchar(255) NOT NULL,
  `contractstatus` varchar(16) NOT NULL DEFAULT 'A',
  `consumptionmonth` text NOT NULL,
  `hedgeconsumption` text NOT NULL,
  `openconsumption` text NOT NULL,
  `basegenconsumption` text NOT NULL,
  `effectcon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nus_tradeperiods`
--

CREATE TABLE `nus_tradeperiods` (
  `tradePerId` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `periodsId` varchar(128) NOT NULL,
  `clicktracnches` int(11) NOT NULL,
  `clicktranches` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nus_trade_periods_list`
--

CREATE TABLE `nus_trade_periods_list` (
  `tPeriodsId` int(11) NOT NULL,
  `periodsName` varchar(128) NOT NULL,
  `addedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `parentcompanydata`
--

CREATE TABLE `parentcompanydata` (
  `id` int(11) NOT NULL,
  `parentcompany` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientcompanydata`
--
ALTER TABLE `clientcompanydata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enter_trade`
--
ALTER TABLE `enter_trade`
  ADD PRIMARY KEY (`tradeId`);

--
-- Indexes for table `nususerdata`
--
ALTER TABLE `nususerdata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`emailId`),
  ADD UNIQUE KEY `username_2` (`username`,`emailId`),
  ADD UNIQUE KEY `username_3` (`username`),
  ADD UNIQUE KEY `emailId` (`emailId`);

--
-- Indexes for table `nus_calendermonth`
--
ALTER TABLE `nus_calendermonth`
  ADD PRIMARY KEY (`monthId`);

--
-- Indexes for table `nus_calenderquarter`
--
ALTER TABLE `nus_calenderquarter`
  ADD PRIMARY KEY (`querterid`);

--
-- Indexes for table `nus_calenderyear`
--
ALTER TABLE `nus_calenderyear`
  ADD PRIMARY KEY (`calenderId`);

--
-- Indexes for table `nus_countries`
--
ALTER TABLE `nus_countries`
  ADD PRIMARY KEY (`countryId`);

--
-- Indexes for table `nus_currencies`
--
ALTER TABLE `nus_currencies`
  ADD PRIMARY KEY (`id`,`currencies`),
  ADD UNIQUE KEY `currencies` (`currencies`),
  ADD UNIQUE KEY `currencies_2` (`currencies`);

--
-- Indexes for table `nus_electricity_index`
--
ALTER TABLE `nus_electricity_index`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nus_naturalgas_index`
--
ALTER TABLE `nus_naturalgas_index`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `nus_pricing_mechanisam`
--
ALTER TABLE `nus_pricing_mechanisam`
  ADD PRIMARY KEY (`priMechId`);

--
-- Indexes for table `nus_season`
--
ALTER TABLE `nus_season`
  ADD PRIMARY KEY (`seasonId`);

--
-- Indexes for table `nus_supply_contract`
--
ALTER TABLE `nus_supply_contract`
  ADD PRIMARY KEY (`supplierId`);

--
-- Indexes for table `nus_tradeperiods`
--
ALTER TABLE `nus_tradeperiods`
  ADD PRIMARY KEY (`tradePerId`);

--
-- Indexes for table `nus_trade_periods_list`
--
ALTER TABLE `nus_trade_periods_list`
  ADD PRIMARY KEY (`tPeriodsId`);

--
-- Indexes for table `parentcompanydata`
--
ALTER TABLE `parentcompanydata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientcompanydata`
--
ALTER TABLE `clientcompanydata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enter_trade`
--
ALTER TABLE `enter_trade`
  MODIFY `tradeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nususerdata`
--
ALTER TABLE `nususerdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nus_calendermonth`
--
ALTER TABLE `nus_calendermonth`
  MODIFY `monthId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nus_calenderquarter`
--
ALTER TABLE `nus_calenderquarter`
  MODIFY `querterid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nus_calenderyear`
--
ALTER TABLE `nus_calenderyear`
  MODIFY `calenderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nus_season`
--
ALTER TABLE `nus_season`
  MODIFY `seasonId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nus_supply_contract`
--
ALTER TABLE `nus_supply_contract`
  MODIFY `supplierId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nus_tradeperiods`
--
ALTER TABLE `nus_tradeperiods`
  MODIFY `tradePerId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nus_trade_periods_list`
--
ALTER TABLE `nus_trade_periods_list`
  MODIFY `tPeriodsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parentcompanydata`
--
ALTER TABLE `parentcompanydata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
