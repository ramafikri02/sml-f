-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2022 at 12:16 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `systics`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `region_code` varchar(255) DEFAULT NULL,
  `province_code` varchar(255) DEFAULT NULL,
  `iata_code` varchar(255) DEFAULT NULL,
  `branch_type` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_code`, `name`, `region_code`, `province_code`, `iata_code`, `branch_type`, `createdAt`, `updatedAt`) VALUES
('BGR', 'Bogor', 'Example 1', 'Jawa Barat', 'Example 1', 'INDEPENDENT', '2021-12-14 15:32:48', '2022-01-20 18:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `branch_office`
--

CREATE TABLE `branch_office` (
  `office_code` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `province` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `office_type` varchar(255) DEFAULT NULL,
  `ppn` varchar(255) DEFAULT NULL,
  `last_office_code` varchar(255) DEFAULT NULL,
  `office_name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `npwp` varchar(255) DEFAULT NULL,
  `commission` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `branch_head_name` varchar(255) DEFAULT NULL,
  `branch_head_phone` varchar(255) DEFAULT NULL,
  `branch_head_email` varchar(255) DEFAULT NULL,
  `operational_pic_name` varchar(255) DEFAULT NULL,
  `operational_pic_phone` varchar(255) DEFAULT NULL,
  `operational_pic_email` varchar(255) DEFAULT NULL,
  `cs_pic_name` varchar(255) DEFAULT NULL,
  `cs_pic_phone` varchar(255) DEFAULT NULL,
  `cs_pic_email` varchar(255) DEFAULT NULL,
  `billing_pic_name` varchar(255) DEFAULT NULL,
  `billing_pic_phone` varchar(255) DEFAULT NULL,
  `billing_pic_email` varchar(255) DEFAULT NULL,
  `akunting_pic_name` varchar(255) DEFAULT NULL,
  `akunting_pic_phone` varchar(255) DEFAULT NULL,
  `akunting_pic_email` varchar(255) DEFAULT NULL,
  `company_type` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch_office`
--

INSERT INTO `branch_office` (`office_code`, `region`, `province`, `branch`, `office_type`, `ppn`, `last_office_code`, `office_name`, `company_name`, `address`, `latitude`, `longitude`, `npwp`, `commission`, `postal_code`, `phone`, `fax`, `email`, `branch_head_name`, `branch_head_phone`, `branch_head_email`, `operational_pic_name`, `operational_pic_phone`, `operational_pic_email`, `cs_pic_name`, `cs_pic_phone`, `cs_pic_email`, `billing_pic_name`, `billing_pic_phone`, `billing_pic_email`, `akunting_pic_name`, `akunting_pic_phone`, `akunting_pic_email`, `company_type`, `createdAt`, `updatedAt`) VALUES
('BSI0001', 'Jawa', 'Jawa Barat', 'Bekasi', 'Cabang Utama', 'Ya', '', 'CABANG BEKASI', 'SARANA MULYA LOGISTIK', 'RUKO PASAR MODERN HARAPAN INDAH BLOK R-72\nBOULEVARD HARAPAN INDAH 2 RT 010/008\nTAUMAJAYA, BEKASI', '-6.16870292304537', '106.97305770320588', '833362130447000', '0', '17214', '62', '62', '', 'Viper', '23556456546', '', '-', '0', '', 'Camber', '32523666', '', '-', '0', '', '-', '-', '-', '-', '2021-12-14 16:19:18', '2021-12-14 16:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `courier_code` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `branch` varchar(50) NOT NULL,
  `office` varchar(50) DEFAULT NULL,
  `area` varchar(50) NOT NULL,
  `duty` enum('Pengantaran','Pengambilan','Pengantaran & Pengambilan') NOT NULL,
  `vehicle` enum('Motorcycle','L300','Blindvand','L300 Jumbo','Mobil Penumpang','Engkel','Double Engkel','Ertiga','Pickup','Semua Jenis Kendaraan') NOT NULL,
  `status` enum('Permanen','Kontrak','Outsource','Agen') NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courier`
--

INSERT INTO `courier` (`courier_code`, `password`, `name`, `phone_number`, `branch`, `office`, `area`, `duty`, `vehicle`, `status`, `company_id`, `createdAt`, `updatedAt`) VALUES
('70319991', '$2b$10$cMwjfKxT07c65Z2lQb6yq.dYVLFfJhZSVTYl9YEE5aV.mNVFmeT46', 'TEST KURIR VENDOR', '123', 'Jakarta', 'SML Cibubur', 'Jakarta', 'Pengambilan', 'Motorcycle', 'Agen', '-', '2022-02-02 11:12:54', '2022-02-02 11:12:54');

-- --------------------------------------------------------

--
-- Table structure for table `coverage_area`
--

CREATE TABLE `coverage_area` (
  `city_code` varchar(50) NOT NULL,
  `destination` text NOT NULL,
  `branch_code` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `distance` varchar(50) DEFAULT NULL,
  `traveling_time` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coverage_area`
--

INSERT INTO `coverage_area` (`city_code`, `destination`, `branch_code`, `branch`, `distance`, `traveling_time`, `createdAt`, `updatedAt`) VALUES
('SBPMK005', '2 X 11 ENAM LINGKUNG, PADANG PARIAMAN KABUPATEN (25584-25584)', 'PDG', 'PADANG', '', '', '2022-01-24 15:31:57', '2022-01-24 15:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_code` varchar(50) NOT NULL,
  `account_type` varchar(50) NOT NULL,
  `branch_origin` varchar(50) NOT NULL,
  `office_origin` varchar(50) DEFAULT NULL,
  `receipt_code` varchar(50) DEFAULT NULL,
  `industy_type` varchar(50) DEFAULT NULL,
  `vendor_integration` varchar(50) DEFAULT NULL,
  `transaction_options` varchar(50) NOT NULL,
  `kilo_rounding` varchar(50) NOT NULL,
  `customer_discount` varchar(50) DEFAULT NULL,
  `customer_logo` enum('Operasional','Tidak','Ya') DEFAULT NULL,
  `single_akun` enum('Operasional','Tidak','Ya') NOT NULL,
  `national_customer` enum('Operasional','Tidak','Ya') NOT NULL,
  `group_code` varchar(50) DEFAULT NULL,
  `awb_stock_distribution` enum('Operasional','Tidak','Ya') DEFAULT NULL,
  `effective_period` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `division` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `address` text NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax_no` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `npwp` varchar(50) DEFAULT NULL,
  `nppkp` varchar(50) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_job` varchar(50) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `contact_email` varchar(50) DEFAULT NULL,
  `billing_period` enum('COD Price','Bulanan','Dua Mingguan','Mingguan') DEFAULT NULL,
  `top` varchar(50) DEFAULT NULL,
  `billing_with_reverse_pod` enum('Operasional','Tidak','Ya') DEFAULT NULL,
  `billing_with_email` enum('Operasional','Tidak','Ya') DEFAULT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `virtual_account_no` varchar(50) NOT NULL,
  `working_days` varchar(50) DEFAULT NULL,
  `working_hours` time DEFAULT NULL,
  `pick_up` enum('Operasional','Tidak','Ya') DEFAULT NULL,
  `pick_up_schedule` varchar(50) DEFAULT NULL,
  `pick_up_time` time DEFAULT NULL,
  `sales` varchar(255) DEFAULT NULL,
  `early_period` date DEFAULT NULL,
  `end_period` date DEFAULT NULL,
  `target_value` varchar(50) DEFAULT NULL,
  `sakes_phone` varchar(20) DEFAULT NULL,
  `sales_email` varchar(50) DEFAULT NULL,
  `made_by` varchar(50) DEFAULT NULL,
  `submitted_by` varchar(50) DEFAULT NULL,
  `tanggal_dibuat` date DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_code`, `account_type`, `branch_origin`, `office_origin`, `receipt_code`, `industy_type`, `vendor_integration`, `transaction_options`, `kilo_rounding`, `customer_discount`, `customer_logo`, `single_akun`, `national_customer`, `group_code`, `awb_stock_distribution`, `effective_period`, `end_time`, `customer_name`, `division`, `department`, `address`, `city`, `postal_code`, `phone`, `fax_no`, `email`, `website`, `npwp`, `nppkp`, `contact_name`, `contact_job`, `contact_phone`, `contact_email`, `billing_period`, `top`, `billing_with_reverse_pod`, `billing_with_email`, `payment_type`, `virtual_account_no`, `working_days`, `working_hours`, `pick_up`, `pick_up_schedule`, `pick_up_time`, `sales`, `early_period`, `end_period`, `target_value`, `sakes_phone`, `sales_email`, `made_by`, `submitted_by`, `tanggal_dibuat`, `createdAt`, `updatedAt`) VALUES
('123', 'Pelanggan Kredit', 'JAKARTA', 'SML CIBUBUR', 'BK', 'Technology', '-', 'Cash', 'Ya', '10', '', 'Ya', 'Ya', '-', '', '0000-00-00', '0000-00-00', 'Kakaknya Zeus', '-', '-', 'asasdasd', 'asdsadas', '12312', '124315135135', '214312312331', 'aad@gmail.com', '-', '-', '-', 'tsdsa', 'wefre', '124155', 'asfsaf', 'COD Price', '-', 'Operasional', 'Operasional', 'Tunai', '06345345', 'Senin - Juma\'t', '00:00:09', 'Operasional', 'Setiap Hari', '00:00:15', '-', '0000-00-00', '0000-00-00', '-', '0', 'asd', 'Sova', '-', '0000-00-00', '2021-12-16 15:20:34', '2021-12-16 15:20:34'),
('1234', 'Pelanggan Kredit', 'JAKARTA', 'SML CIBUBUR', 'BK', 'Technology', '-', 'Cash', 'Ya', '10', '', 'Ya', 'Ya', '-', '', '0000-00-00', '0000-00-00', 'Kakaknya Medusa', '-', '-', 'asasdasd', 'asdsadas', '12312', '124315135135', '214312312331', 'aad@gmail.com', '-', '-', '-', 'tsdsa', 'wefre', '124155', 'asfsaf', 'COD Price', '-', 'Operasional', 'Operasional', 'Tunai', '06345345', 'Senin - Juma\'t', '00:00:09', 'Operasional', 'Setiap Hari', '00:00:15', '-', '0000-00-00', '0000-00-00', '-', '0', 'asd', 'Sova', '-', '0000-00-00', '2021-12-16 17:05:11', '2021-12-16 17:06:32');

-- --------------------------------------------------------

--
-- Table structure for table `customer_contract`
--

CREATE TABLE `customer_contract` (
  `contract_number` varchar(20) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `customer` varchar(255) NOT NULL,
  `period_of` date NOT NULL,
  `period_until` date NOT NULL,
  `description` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_contract`
--

INSERT INTO `customer_contract` (`contract_number`, `branch`, `customer`, `period_of`, `period_until`, `description`, `createdAt`, `updatedAt`) VALUES
('AGI0001', 'JAKARTA', 'PT. Olympus Sejahtera', '2020-03-03', '2021-03-03', '-', '2022-01-19 10:47:22', '2022-01-19 10:51:35'),
('AGI0002', 'asd', '1234', '2022-01-05', '2022-01-10', 'ads', '2022-01-27 15:26:04', '2022-01-27 15:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `email_customer`
--

CREATE TABLE `email_customer` (
  `no` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `nama_pt` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_customer`
--

INSERT INTO `email_customer` (`no`, `id`, `nama_pt`, `email`, `keterangan`) VALUES
(5, 5, 'PT. INNA PHARMACEUTICAL INDUSTRY', 'purchasing@innapharma.co.id', ''),
(15, 15, 'PT. ALERE HEALTH INDONESIA', 'kenny.kencono@abbott.com', ''),
(22, 22, 'PT. API RINTIS MAS', 'ratno@dominoindonesia.id', ''),
(23, 23, 'PT. GENERAL ELECTRIC INDONESIA', 'fitriana.lestari@ge.com', ''),
(24, 24, 'CV. TRIMURTI MULTI USAHA', 'trimurtimultiusaha@gmail.com', ''),
(26, 26, 'PT. BAHANA ANDALAN PASTI', 'lina@ptbap.id', ''),
(28, 28, 'PT. ANEKA MEDIKA INDONESIA', 'Contact_center@anekamedika.com', ''),
(29, 29, 'PT. AFINA SINAR CEMERLANG', 'afinasc@afinasc.com', ''),
(30, 30, 'PT. PROMED GLOBAL INTERNATIONAL', 'hello@promedglobalintl.com', ''),
(32, 32, 'PT. MAGNUS INDO MEDIKA', 'pt.magnusindomedika@gmail.com', ''),
(34, 34, 'PT. INMED TEKNOTAMA CEMERLANG', 'admin@inmedtekno.com', ''),
(35, 35, 'PT. DWI GRAHA MEDIKA', 'info@dwigrahamedical.com', ''),
(36, 36, 'PT PRIMA MINECHEM', 'info@primaminechem.com', ''),
(48, 48, 'PT. BIOGEN SCIENTIFIC', 'harti@biogenscientific.co.id', ''),
(49, 49, 'PT. INDOSOPHA SAKTI', 'enquiries@indosopha.com', ''),
(51, 51, 'PT. RECHARGE (JALAN TERUS SAJA)', 'putut.wibowo@recharge.id', ''),
(52, 52, 'PT. ZOOMLION HEAVY INDONESIA', 'roshinta.a.r@zoomlion.com', ''),
(57, 57, 'PT Gaia Science Indonesia', 'astrid@gaiascience.co.id', ''),
(60, 60, 'PT Yunex Global Indonesia', 'reni.yunex@gmail.com', ''),
(78, 78, 'PT. INTI MEDIKA PUSPA INDAH', 'intimedikasales@gmail.com', ''),
(90, 90, 'PT. INDEC DIAGNOSTIC', 'johan@indec-diagnostics.co.id', ''),
(91, 91, 'PT. ABHIMATA MANUNGGAL', 'albertustommy78@gmail.com', ''),
(93, 93, 'PT. ALPHA SCIENCE INNOLAB', 'info@alphainnolab.com', ''),
(95, 95, 'PT. ANARA TRISAKTI MEDIKA', 'sholihin@anara.co.id', ''),
(96, 96, 'PT. ASIA TRAN SINERGI FARMA', 'akhmad.sofyan@ats-farma.com', ''),
(98, 98, 'PT. BATUBARA GLOBAL ENERGY', 'secretariat@apbi-icma.org', ''),
(99, 99, 'PT. BERKAH MEDIKA INDONESIA', 'cs.bmindonesia@gmail.com', ''),
(100, 100, 'PT. BETA MEDICAL', 'cutr.betamedical@gmail.com', ''),
(101, 101, 'PT. BINA SAN PRIMA', 'regi.indrarama1310@gmail.com', ''),
(102, 102, 'PT. BINTANG ANAM MEDICA', 'bintanganammedika@gmail.com', ''),
(103, 103, 'PT. BINTANG ANUGERAH CAHAYA ABADI', 'info.ptbaca@gmail.com', ''),
(104, 104, 'PT. BINTANG LUCAS JAYA', 'info.ptbaca@gmail.com', ''),
(105, 105, 'PT. BINTANG SARANA MEDIKA', 'info@bisamed.co.id', ''),
(107, 107, 'PT. BIOSAINS MEDIKA INDONESIA', 'info@biosm-indonesia.com', ''),
(108, 108, 'PT. COBRA DENTAL INDONESIA', 'ismoyo.aji@cobradental.co.id', ''),
(109, 109, 'PT. DANPAC PHARMA', 'Rifka@danpacpharma.com', ''),
(110, 110, 'PT. DIAN TRIKARSA', 'info@diantrikarsa.co.id', ''),
(111, 111, 'PT. DIASTIKA BIOTEKINDO', 'cs_diastika@diastika.co.id', ''),
(113, 113, 'PT. ECOSAINS HAYATI', 'logistics@ecosains.com', ''),
(114, 114, 'PT. EMIINDO JAYA BERSAMA', 'emiindolkpp@gmail.com', ''),
(115, 115, 'PT. EMY CHEMLAB PERDANA', 'emychemlabperdana@gmail.com', ''),
(117, 117, 'PT. ERA MITRA PERDANA', 'sales@eramitra.co.id', ''),
(119, 119, 'PT. FAJAR MAS MURNI', 'marketing@fajarmasmurni.com', ''),
(120, 120, 'PT. FOKUS DIAGNOSTIC INDONESIA', 'info@fokusdiagnostic.com', ''),
(121, 121, 'PT. FOKUS KELUARGA SEHAT', 'andydarius88@gmail.com', ''),
(123, 123, 'PT. GLOBAL SYSTECH MEDIKA', 'operasional@gsmedika.com', ''),
(124, 124, 'PT. GREEN MEDICA', 'info@greenmedica.co.id', ''),
(126, 126, 'PT. INDALI KARYA MEDIKA', 'inkamedika@yahoo.com', ''),
(127, 127, 'PT. INDOFARMA GLOBAL MEDIKA', 'info@igm.co.id', ''),
(128, 128, 'PT. INDOGEN INTER TAMA', 'sales@indogen.id', ''),
(129, 129, 'PT. INDOLAB', 'support@indolabutama.com', ''),
(130, 130, 'PT. INODIA', 'support@inodia.co.id', ''),
(131, 131, 'PT. INTERGASTRA', 'info@intergastra.co.id', ''),
(132, 132, 'PT. INTI KIRANA MEDITAMA', 'medical.ikm@gmail.com', ''),
(133, 133, 'PT. ITS SCIENCE INDONESIA', 'christy.agatha@its-indonesia.com', ''),
(134, 134, 'PT. KALMED SEJAHTERA INDONESIA', 'adminsales@kalmed.co.id', ''),
(135, 135, 'PT. KHASANAH ALKESINDO', 'khasanah.alkesindo@khasanah-ai.com', ''),
(137, 137, 'PT. KRISTALAB SURYA MEDIKA', 'linda.kristalab@ymail.com', ''),
(138, 138, 'PT. LUMBA KARYA ASIA', 'info@lumbatech.com', ''),
(139, 139, 'PT. MECOSUPRIN', 'sales@mecosuprin.com', ''),
(141, 141, 'PT. MEDTRACOS ESANA PRIMA', 'cs@medtracos.com', ''),
(142, 142, 'PT. MENSA BINSASUKSES', 'ptakurat@cbn.net.id', ''),
(143, 143, 'PT. MERAPI UTAMA PHARMA', 'a.idaman@merapi.net/yohanes.nugroho@merapi.net', ''),
(146, 146, 'PT. MRK DIAGNOSTICS', 'edi@mrk-diagnostics.co.id', ''),
(147, 147, 'PT. MUKTI REJO ABADI', 'pt.mra_jakarta@yahoo.co.id', ''),
(148, 148, 'PT. MURTI INDAH SENTOSA', 'mist.jkt@murtiindahsentosa.com', ''),
(150, 150, 'PT. NELTA MULTI GRACIA', 'customer.service@nelta.co.id', ''),
(151, 151, 'PT. NEO ASIA', 'noveen@neoasiamedical.com', ''),
(153, 153, 'PT. NUSA MANDIRI PRATAMA', 'Sales@nusamandiriinstruments.com', ''),
(154, 154, 'PT. PANAMED ANUGRAH ABADI', 'petandayamedica@gmail.com', ''),
(156, 156, 'PT. PERMANA PUTRA MANDIRI', 'adm5.alatmedik@gmail.com', ''),
(157, 157, 'PT. PETAN DAYA MEDIKA', 'petandayamedica@gmail.com', ''),
(158, 158, 'PT. PRIMA HEALTH CARE', 'primahealth408@gmail.com', ''),
(159, 159, 'PT. RAJAERBA INDOCHEM', 'jakarta@rajaerba.id', ''),
(160, 160, 'PT. SALIPOLAPA BERSAMA', 'info@salipo.com', ''),
(161, 161, 'PT. SATYA WIRA MANDIRI', 'satyawira@swmmedical.id', ''),
(162, 162, 'PT. SEHAT CERAH INDONESIA', 'logistik_ho@sehatcerahindonesia.com', ''),
(163, 163, 'PT. SETIA ANUGRAH MEDIKA', 'Indra@setia-medika.co.id', ''),
(165, 165, 'PT. SINERGI INTERIOR PROJECT', 'sinproactive@gmail.com', ''),
(166, 166, 'PT. SOMETECH INDONESIA', 'sometechindonesia@yahoo.com', ''),
(169, 169, 'PT. SURYA TAMA MEDIKA', 'suryatamamedika@yahoo.co.id', ''),
(170, 170, 'PT. SYSMEX INDONESIA', 'oktavia.anita@sysmex.co.id', ''),
(172, 172, 'PT. TEMPO SCAN PACIFIC', 'corporate.secretary@thetempogroup.com', ''),
(173, 173, 'PT. TIARA KENCANA', 'umum@tiarakencana.com', ''),
(174, 174, 'PT. TIRTA PASIFIK MEDIKATAMA', 'info@tirta-pasifik.co.id', 'Host or domain name not found'),
(176, 176, 'PT. TOPSINDO MEGAH UTAMA', 'sales@topsindo.com', ''),
(177, 177, 'PT. TOTAL MEDIKA PERSADA', 'lysni81@gmail.com', ''),
(178, 178, 'PT. TRANSMEDIC INDONESIA', 'ahmad.indra@transmedicgroup.com', ''),
(179, 179, 'PT. TRIADI LINTAS PERSADA', 'syekhu91hermawan@gmail.com', ''),
(181, 181, 'PT. UNOLAB MITRA PERSADA', 'unolabmitrapersada@gmail.com', ''),
(183, 183, 'PT. VERSACON MEDICAL', 'helvrizky.kaniza@versacon.co.id', ''),
(184, 184, 'PT. VISI SEJAHTERA MEDIKA', 'info@visisejahteramedika.com', ''),
(186, 186, 'PT. INTI (Persero)', 'pajak@inti.co.id', ''),
(187, 187, 'PT. Holi Pharma', 'haloholi@holipharma.co.id', ''),
(188, 188, 'PT. Raharja Sinergi Komunikasi', 'admrhj@raharja-net.co.id', ''),
(190, 190, 'PT. Riits Trading Indonesia', 'riits.indonesia@gmail.com', ''),
(193, 193, 'CV. Togamas', 'cs.online@togamas.co.id', ''),
(195, 195, 'Genbody Indonesia', 'endang@genbody.co.id', ''),
(196, 196, 'PT. Mitra Rajawali Banjaran', 'mitrabanjaran@gmail.com', ''),
(197, 197, 'PT. Hariff Enginering Tunggal', 'reza.ganabar@hariff.co.id', ''),
(199, 199, 'PT Telehouse Engineering', 'telehouse@telehouse-eng.com', ''),
(200, 200, 'PT. ABN (Abadimusa)', 'abntoday@abadinusa.co.id', ''),
(202, 202, 'PT. Kimia Farma', 'webmaster@kimiafarma.co.id', ''),
(203, 203, 'PT MIZAN', 'info@mizan.com', ''),
(204, 204, 'PT Surya Energi Indotama', 'agung@suryaenergi.com', ''),
(205, 205, 'Toko Buku SPKN', 'office@spkn.co.id', ''),
(207, 207, 'Gramedia', 'customercare@gramedia.com', ''),
(209, 209, 'Ganesha Operation', 'marketing@ganeshaoperation.com', ''),
(210, 210, 'PT Hasil Karya Sejahtera', 'hks_bdg39@yahoo.co.id', ''),
(211, 211, 'PT Kembang', 'kembangchrista@gmail.com', ''),
(213, 213, 'CV Prima Medicha', 'prima_medicha@yahoo.com', ''),
(214, 214, 'PT. Buatan Guna Indonesia', 'gitobgi@gmail.com', ''),
(215, 215, 'CV. Intech Manufaktur', 'dede@intechmanufaktur.com', ''),
(216, 216, 'PT Pronesia Indonesia', 'marketing@pronesia.co.id', ''),
(219, 219, 'PT. Karya Bakti Nusindo', 'Karyabaktinusindo@gmail.com', ''),
(220, 220, 'PT. Errita Pharma', 'Samudi@errita.co.id', ''),
(221, 221, 'PT. Fuji Seiki Indonesia', 'sales01@fid.fujiseiki.com', ''),
(223, 223, 'PT Trimed', 'info@trimed.co.id', ''),
(224, 224, 'PT Afiat', 'management.afiat@gmail.com', ''),
(225, 225, 'CV Newtronic Solution', 'info@newtronic-solution.com', ''),
(227, 227, 'PT BLESSINDO MULIA ABADI', 'sales@blessindo.co.id', ''),
(228, 228, 'PT Sumanta Mitra Mulya', 'smm@sumantagroup.com', ''),
(231, 231, 'PT Gerlink Medika', 'recruitment@gerlink.id', ''),
(232, 232, 'PT Hospi', 'info@hospiniaga.com', ''),
(233, 233, 'PT Pindad Persero', 'info@pindad.com', ''),
(234, 234, 'PT Wata Sunrise', 'admin@watasunrise.co.id', ''),
(235, 235, 'PT Chroma International', 'support@chromaintegrated.com', ''),
(236, 236, 'PT Taka Preccision', 'jelantik@taka.co.id', ''),
(237, 237, 'PT Karya Sekawan', 'pt.karyasekawanbayanudin@gmail.com', ''),
(238, 238, 'PT Vadco Prosper Mega', 'marketing.vet@vadco.co.id', ''),
(239, 239, 'PT Kriya Nusantara', 'info@kriyanusantara.com', ''),
(240, 240, 'PT Widya Makmur', 'Widyamakmur@ymail.com', ''),
(243, 243, 'PT TRIPMA AGRA MEDIKA', 'tripmamedika@gmail.com', ''),
(244, 244, 'CV FATINDO KARYA GEMILANG', 'fatindoalkes@gmail.com', ''),
(246, 246, 'CV MITRA CIPTA MULIA', 'mcmbdg@yahoo.com', ''),
(248, 248, 'PT RAJAWALI MEDIKA', 'admin_division@rajawalimedika.com', ''),
(251, 251, 'Amanah Garment Indonesia', 'amanahgarmentbandung@gmail.com', ''),
(254, 254, 'PT Medion', 'cs@medion.co.id', ''),
(255, 255, 'PT Aransa Metal Tooling', 'office@aransa.co.id', ''),
(257, 257, 'PT Rajawali Nusindo', 'humas@nusindo.co.id', ''),
(260, 260, 'PT Hasil Karya Sejahtera', 'hks_bdg39@yahoo.co.id', ''),
(263, 263, 'PT Sinar Sosro', 'contactus@sosro.com', ''),
(265, 265, 'PT Prima Spring Manufacturing', 'primasprings@yahoo.co.id', ''),
(268, 268, 'PT Eksonindo Multi Produk', 'empi@exsport.co.id', ''),
(269, 269, 'PT Bevera Makmur Cemerlang', 'bintangsobo@yahoo.com', ''),
(270, 270, 'PT Ateja', 'ateja@ateja.co.id', ''),
(272, 272, 'PT MBT', 'mbtoriginal@yahoo.com', ''),
(273, 273, 'PT Casper Pharmaceutical', 'cs@casperpharma.com', ''),
(274, 274, 'PT Kriya Nusantara', 'info@kriyanusantara.com', ''),
(275, 275, 'PT Widya Makmur', 'wmsmkt@gmail.com', ''),
(276, 276, 'PT Dwitama', 'sales@dwitama.co.id', ''),
(277, 277, 'PT Arena', 'inquiry@arenacorp.com', ''),
(280, 280, 'PT Trifa Raya Laboratories', 'trifalaboratories@yahoo.co.id', ''),
(283, 283, 'PT Eigerindo', 'cs@eigeradventure.com', ''),
(284, 284, 'PT Duta Basis Datapratama', 'dutabasis@dutabasis.com', ''),
(285, 285, 'PT Kenkad Hydraulic', 'kenkad@ymail.com', ''),
(293, 293, 'PT. Labolytic Perfieral Indonesia', 'admin@labolyticperiferal.com', ''),
(294, 294, 'PT. Kosmetika Global Indonesia', 'jessica.novita@kosme.co.id', ''),
(296, 0, '', 'oki.wijaya@cp.co.id', ''),
(301, 300, 'PT. Desain Terminal indonesia', 'tanti.sopanti@dtermprocess.com', ''),
(331, 330, 'PT. Tirta Medical Center', 'ga@tirta.co.id', ''),
(338, 337, 'PT. Esco Utama', 'eucs3@escolifesciences.com', ''),
(354, 353, 'PT. Interskala Medika Indonesia', 'sales@imimedika.com', ''),
(355, 354, 'PT. Saba Indomedika', 'winahyu.widi@sabaindomedika.com', ''),
(373, 371, 'PT. Surya Jaya Lestari', 'logistik@suryajayalestari.com', ''),
(375, 373, 'PT. Galeri Medika', 'sales@galerimedika.com', ''),
(377, 376, 'PT. Medikon Prima Laboratories', 'admin@medikongroup.com', ''),
(403, 402, 'PT. Arinda Pharma', 'Arindapharma@yahoo.co.id', ''),
(417, 416, 'PT. Deltomed Laboratories', 'purchasing@deltomed.com', ''),
(457, 456, 'PT. Wellbore Technology', 'dwi.widiarti@nov.com', ''),
(502, 501, 'PT. Multitama Karyatronindo', 'purchasing@multitama.co.id', ''),
(510, 509, 'PT. Indotekno Plus', 'yudha@indotekhnoplus.com', ''),
(540, 539, 'PT. NR Electric', 'aldo@nrec.com', ''),
(554, 553, 'PT. Trit Indonesia', 'mkt.adm3@trit.co.id', ''),
(566, 565, 'PT. Sunergi Internusa Pratama', 'sales@helixindo.com', ''),
(572, 571, 'PT. AVK Fusiion Indonesia', 'andpur@avkfusion.co.id', ''),
(580, 579, 'PT. Nisson Indonesia', 'info@nissonindonesia.com', ''),
(585, 584, 'PT. Sealan Pratama Indonesia', 'linda@sealan-indonesia.com', ''),
(586, 585, 'PT. Camar Indah Jaya Perkasa', 'chessa@camarjaya.co.id', ''),
(607, 606, 'PT. Itu Airconco', 'Andri@ituaircon.co.id', ''),
(611, 610, 'PT. Tata Megah Mesindo', 'sonanugraha.tmm@gmail.com', ''),
(619, 618, 'PT. Sanitaria Utama', 'logistic@sanitaria-uttama.com', ''),
(627, 626, 'PT. Primacom Interbuana', 'smatthew@primacom.co.id', ''),
(638, 637, 'PT. Satya Samitra Niagatama', 'wisnu.budi@ssnchemical.com', ''),
(651, 650, 'PT. Bangun Anugerah Handjaya (Enduro)', 'purchasing.enduro@gmail.com', ''),
(679, 678, 'PT. Eka Jaya International', 'spvwarehouse.ekajaya@gmail.com', ''),
(702, 701, 'PT. JAS Aero', 'procurement@jas-aero.com', ''),
(703, 702, 'PT. Globalindo Miantenance Management', 'adehanifa303@gmail.com', ''),
(705, 704, 'PT. Komindo', 'logistic@komindo.biz', ''),
(733, 732, 'PT. Monica Hijau Lestari', 'surya-bangun@thebodyshop.co.id', ''),
(739, 738, 'PT VENINDO JAYA ABADI', 'Siprianus.jemianto@venindo.co.id', ''),
(740, 739, 'PT Indonesia Comnets Plus (ICON+)', 'inventorypusat@iconpln.co.id', ''),
(741, 740, 'PT PADMA KUMARA MEDIKA', 'info@padma-medical.co.id / account@padma-medical.c', ''),
(742, 741, 'PT Weng Fatt Indonesia (WFI)', 'wfi_airbag@yahoo.co.id', ''),
(743, 742, 'PT Prima Tunggal Javaland', 'info@primatunggal.com / wulan@primatunggal.com', ''),
(747, 746, 'PT Arminareka Pharmasia Pratama', 'info@arminadaily.id', ''),
(748, 747, 'PT Dexa Medica', 'info@dexagroup.com', ''),
(749, 748, 'PT Nellco Indopharma', 'lenko.purchasing@gmail.com', ''),
(750, 749, 'PT Prima Tunggal Perkasa', 'info@ptpfire.com', ''),
(751, 750, 'PT Inalix', 'alam@inalix.com', ''),
(753, 0, '', 'anggilestari0510@gmail.com', ''),
(754, 752, 'PT KALIMUTU MITRA PERKASA', 'sales@kalimutu.com / warehouse@kalimutu.com', ''),
(755, 753, 'PT Arminareka Perdana', 'adm@arminarekaperdana.com', ''),
(756, 754, 'PT Surya Teknik Dinamika', 'suryateknikdinamika@gmail.com', ''),
(757, 755, 'PT Rajawali Nusindo Tangerang', 'humas@nusindo.co.id', ''),
(763, 761, 'PT Sciencewerke', 'delivery@sciencewerke.com', ''),
(764, 762, 'PT Ragasindo Aman Internasional', 'info@ragasindo.com', ''),
(768, 766, 'PT Interskala Medika Indonesia', 'sales@imimedika.com', ''),
(769, 767, 'PT Adiwarna Anugerah Abadi', 'info@adiwarna.co.id', ''),
(770, 768, 'PT Surya Teknik Dinamika', 'admin@suryateknikdinamika.com', ''),
(772, 770, 'PT Gridtech Indonesia', 'info@gridtech.co.id', ''),
(776, 774, 'PT Indonesia Global Medika', 'requirement@indonesiaglobalmedika.com', ''),
(779, 777, 'PT Karya Pratama', 'info@karyapratama.co.id', ''),
(780, 778, 'PT Rajawali Nusindo Tangerang', 'humas@nusindo.co.id', ''),
(781, 779, 'PT Agarindo Biological Company', 'ab.laboratory@gmail.com', ''),
(782, 780, 'PT Devindo Farma Indonesia', 'sales@devindosuryaamora.com', ''),
(783, 781, 'PT Karindo Alkestron', 'mail@karindo.com', ''),
(784, 782, 'PT Medis Raya', 'eva@emedis.id', ''),
(785, 783, 'PT Polaris Alkes Sindo', 'pt.polarisalkesstarindo@gmail.com', ''),
(786, 784, 'PT Taishan Alkes Indonesia', 'contact@taishan-alkes.com', ''),
(788, 786, 'PT. INDOLAB UTAMA', 'support@indolabutama.com / cs@indolabutama.com', ''),
(789, 787, 'PT.Innikor Golden Mix', 'cjongwon72@yahoo.co.kr', ''),
(790, 788, 'PT. Lokania Handal Perdana', 'info@lokania-hp.com', ''),
(791, 789, 'PT INTERSKALA MANDIRI INDONESIA', 'sales@interskala.com', ''),
(793, 791, 'Beranda', 'marketingoceanmedika@gmail.com', ''),
(794, 792, 'PT. Sinar Roda Utama', 'customerservice@sinarrodautama.co.id', ''),
(795, 793, 'PT. Tamara Overseas Corporindo', 'info@toc.co.id', ''),
(796, 794, 'PT. Iniko Karya Persada', 'marketing@inikokaryapersada.com', ''),
(797, 795, 'PT. Primaco Group', 'sales@primaco.co.id', ''),
(798, 796, 'PT. Rohto Laboratories Indonesia', 'customercare@rohtolab.com', ''),
(800, 798, 'PT. Graha Imex Perdana', 'sales@gip-indo.com', ''),
(801, 799, 'PT. Karya Pratama', 'info@karyapratama.co.id', ''),
(803, 801, 'PT. Pradana Estiara Medical', 'lkpp2pradana@gmail.com', ''),
(804, 802, 'PT. Setia Manggala Abadi', 'info@setiamanggalaabadi.com', ''),
(805, 803, 'PT. STC Sarana Estetika', 'marketing@stcsaranaestetika.co.id', ''),
(806, 804, 'PT. GEMSS Medical Indonesia', 'support@gemss-indonesia.co.id', ''),
(807, 805, 'PT. Bintang Kupu Kupu', 'cs@bkk-group.com', ''),
(809, 807, 'PT. BANYOE ATIKA MANDIRI', 'info@banyoe.co.id', ''),
(810, 808, 'Glomeda', 'info@glomeda.co.id / cs@glomeda.co.id', ''),
(811, 809, 'Alkes Pramuka', 'alkespramuka93@yahoo.com / alkespramuka93@gmail.co', ''),
(812, 810, 'PT. DEBALI KOSMETIK INDONESIA', 'export@savondebali.com', ''),
(813, 811, 'Berkat Alkes Mandiri. PT', 'berkat.alkesmandiri@gmail.com', ''),
(814, 812, 'PT BIOSBASE INDONESIA', 'contact@binabakti.co.id', ''),
(815, 813, 'PT. Mega Pratama Medicalindo', 'contact@geamedical.com', ''),
(816, 814, 'PT. Mediva Berkah Permana', 'contact@medivaberkah.com', ''),
(817, 815, 'Chandra Medika', 'cs.chandramedika@gmail.com', ''),
(818, 816, 'Damar Multi Sindo, PT.', 'cs@damarmultisindo.com', ''),
(820, 818, 'PT. Global Jaya Medika', 'gjmcare@gjm.co.id', ''),
(826, 824, 'PT. Poly Usaha Sejati', 'ptpoly@hotmail.com', ''),
(827, 825, 'PT. Era Medika Jaya', 'info@eramedikajaya.com', ''),
(828, 826, 'PT. Kurnia Sarana Abadi', 'info@kurnia-alkes.com / ptkurnia.sa@gmail.com', ''),
(829, 827, 'PT. Macrocitra Ardanasejati (Rightsign)', 'info@macrocitra.com', ''),
(831, 829, 'PT. Paradise Perkasa', 'info@paradiseperkasa.com', ''),
(832, 830, 'PT Rekamileniumindo Selaras', 'info@ptreka.co.id', ''),
(833, 831, 'PT Chemosiense Indonesia', 'enquiry@chemoscience.co.id', ''),
(835, 833, 'PT Mitraprima Lestari', 'jeremy@januar.mpl-indonesia.com', ''),
(836, 834, 'PT Anugerah Ika Pratama', 'irwan.ptaip@hose-coupling.co.id', ''),
(838, 836, 'PT Anugerah Mentari Distrindo', 'anugerahmd@gmail.com', ''),
(839, 837, 'PT Signa Promedic Supplies', 'marketing@sigpro.co.id', ''),
(840, 838, 'PT Indoleb Utama', 'indolab@dnet.net.id', ''),
(841, 839, 'PT ADVANCED TECHNOLOGY SOLUTION', 'info@atsindo.com', ''),
(842, 840, 'PT PKG Lautan Indonesia', 'info@lautan-luas.com', ''),
(843, 841, 'PT. Bison Industri Farmasi', 'bisonfarmasi@yahoo.com', ''),
(844, 842, 'PT. Gratia Jaya Mulya', 'office@gratiajm.co.id', ''),
(845, 843, 'PT. INDOLAB ARTHA MEDIKA', 'indolab@cbn.net.id', ''),
(847, 845, 'PT. Semesta Inti Usaha', 'sales@semestaintiusaha.com', ''),
(848, 846, 'PT. Visco Prima Indonesia', 'Chanherry@gmail.com', ''),
(849, 847, 'PT. Serenity Indonesia', 'info@serenityindonesia.com', ''),
(850, 848, 'PT. BERKEMBANG SELARAS DAYA', 'information@bselarasdaya.com', ''),
(851, 849, 'PT. Sekarguna Medika', 'mail@sekarguna.co.id', ''),
(852, 850, 'PT. Iniko Karya Persada', 'marketing@inikokaryapersada.com', ''),
(853, 851, 'Jantra Reka Saksana Mas', 'marketing@jantraindonesia.com', ''),
(854, 852, 'PT. Ocean Medika Indonesia', 'marketingoceanmedika@gmail.com', ''),
(855, 853, 'PT. Mitra Solusi Elektromedik', 'msolusielektromedik@gmail.com', ''),
(856, 854, 'PT. Indonesia Global Medika', 'retno.w@indonesiaglobalmedika.com', ''),
(858, 856, 'PT Vonix Latexindo', 'simplex@simplex.co.id', ''),
(860, 858, 'PT Biovalmed', 'admin@biovalmed.com', ''),
(861, 859, 'PT Adelpha Persada Kosmetindo', 'purchasing@adelpha.co.id', ''),
(862, 860, 'PT Saraka Mandiri Semesta', 'cs1@sarakamandiri.com', ''),
(864, 862, 'PT Catur Dakwah Crane Farmasi', 'cdcfarmasi@yahoo.co.id', ''),
(865, 863, 'PT Antar Mitra Sembada', 'hendrik.yanto@ams.co.id', ''),
(866, 864, 'PT Saraswanti Indo Genetech', 'marketing-sig@saraswanti.com', ''),
(872, 870, 'PT Sepatu Mas Idaman', 'export@semasi.com', ''),
(876, 874, 'PT Anugrah Pharmindo Lestari', 'biyar.purnomo@aplcare.com', ''),
(879, 877, 'Genta Buana Astadeca', 'astadeca@cbn.net.id', ''),
(880, 878, 'Trio Mitra Nusantara', 'info@trimina.co.id', ''),
(883, 881, 'Karya Muda Mandiri', 'pt.kmalkesindo@gmail.com', ''),
(888, 886, 'PT Honoris Industry', 'tanti@honorisindustry.co.id', ''),
(899, 897, 'PT Aloe Vera Indonesia', 'account@aloe-best.com', ''),
(906, 904, 'PT Guna Sentosa Makmurindo', 'gsm.sekretariat@gmail.com', ''),
(911, 909, 'PT Kumala Sarana Utama', 'po1@ksutama.co.id', ''),
(912, 910, 'PT Antar Mitra Sembada', 'ksl@bgr.ams.co.id', ''),
(913, 911, 'PT Delijaya Global Perkasa', 'purchasing@deligloves.com', ''),
(914, 912, 'PT Adev Natural', 'haerul@adev.co.id', ''),
(916, 914, 'PT Intralab Ekatama', 'codetpunya@gmail.com', ''),
(918, 916, 'Maleo Rachma Indo Abadi', 'scmria@gmail.com', ''),
(919, 917, 'Global Quality Analitical', 'gqa@gqanalitical.com', ''),
(920, 918, 'Cobra Dental', 'adminbogor@cobradental.co.id', ''),
(921, 919, 'Taisho Pharmaceutical', 'procurement@taisho-support.co.id', ''),
(922, 920, 'PT. Bayer Indonesia', 'procurement.id@bayer.com', ''),
(923, 921, 'Poly Jaya Medikal', 'product.support@polymedikal.com', ''),
(925, 923, 'Bunda Global Pharma', 'care@bgpbunda.co.id', ''),
(926, 924, 'Medifarma Laboratories / Darya Varia', 'jimmy.prasetya@darya-varia.com', ''),
(927, 925, 'Arista Latindo', 'contact@aristagloves.com', ''),
(928, 926, 'Ekamas International Hospital', 'yusuf_t_anugrah@ekahospital.com', ''),
(930, 928, 'UERAKA, PT', 'viky.eureka@gmail.com', ''),
(932, 930, 'LESTARI DINI TUNGGUL', 'admin@lestarilinen.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `email_customer_invalid`
--

CREATE TABLE `email_customer_invalid` (
  `no` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `nama_pt` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_customer_invalid`
--

INSERT INTO `email_customer_invalid` (`no`, `id`, `nama_pt`, `email`, `keterangan`) VALUES
(1, 1, 'PT. SENTRA SAUYUNAN LESTARI', '', 'Tidak ada email'),
(2, 2, 'PT. LYNAS MEDICAL', '', 'Tidak ada email'),
(3, 3, 'PT. GLOBAL NIAGA INDOTAMA', '', 'Tidak ada email'),
(4, 4, 'PT. ELANGPERDANA PRIMA NIAGA INDUSTRI', '', 'Tidak ada email'),
(6, 6, 'PT. DRASSCO FORSETI INT', '', 'Tidak ada email'),
(7, 7, 'PT. KASIH KARUNIA KEKAL', '', 'Tidak ada email'),
(8, 8, 'PT. SARANA MAJU SEJAHTERA', '', 'Tidak ada email'),
(9, 9, 'PT. INDOTECH SCIENTIFIC', '', 'Tidak ada email'),
(10, 10, 'PT. KIMIA FARMA SUNGWUN', '', 'Tidak ada email'),
(11, 11, 'PT. RAJAWALI NUSINDO', '', 'Tidak ada email'),
(12, 12, 'PT. DIPA PUSPA LABSAINS', '', 'Tidak ada email'),
(13, 13, 'JTCC', '', 'Tidak ada email'),
(14, 14, 'PT. CLEAN N WEAL PACK', '', 'Tidak ada email'),
(16, 16, 'PT. CITRA MEDIKA', '', 'Tidak ada email'),
(17, 17, 'PT. IDS MED', '', 'Tidak ada email'),
(18, 18, 'PT. CURIE MEDIKA', '', 'Tidak ada email'),
(19, 19, 'PT. AGRAPANA NUGRAHA KATAR', '', 'Tidak ada email'),
(20, 20, 'PT. ADMIRAL BLESENSA', '', 'Tidak ada email'),
(21, 21, 'PT. ARDIA PERDANA INDONESIA', 'andhi@adiaperdana.com', 'Host or domain name not found'),
(25, 25, 'PT. ASA MITRA ENGINERING', '', 'Tidak ada email'),
(27, 27, 'PT. ONINDO SKURITA', '', 'Tidak ada email'),
(31, 31, 'PT. DELTA MANDIRI ABADI', 'dma.medical@gmail.com', 'The email account that you tried to reach is over quota and\r\n    inactive'),
(33, 33, 'KAMALIKA ART PRINTS', '', 'Tidak ada email'),
(37, 37, 'PT FOKUS INTEGRITAS TEKNOLOGI', 'contact@fokus-integrasi.com', 'Host or domain name not found'),
(38, 38, 'PT CAHYA MEDIKA NUSANTARA', '', 'Tidak ada email'),
(39, 39, 'PT FORTENA PRIMA TEKNIK', '', 'Tidak ada email'),
(40, 40, 'PT BATCH AUTOMATION INDONESIA', 'account.bai@batchtech.com.sg', 'Host or domain name not found'),
(41, 41, 'PT. UNITED MULTILIFT PERKASA', '', 'Tidak ada email'),
(42, 42, 'PT. MULTI TEKNOLOGI DINAMIKA', '', 'Tidak ada email'),
(43, 43, 'PT. ITAMA RANORAYA', '', 'Tidak ada email'),
(44, 44, 'PT. B BROUN', '', 'Tidak ada email'),
(45, 45, 'PT. DOSNIROHA', '', 'Tidak ada email'),
(46, 46, 'PT. MUGI', '', 'Tidak ada email'),
(47, 47, 'PT ANDRA PRIMA JAYA', '', 'Tidak ada email'),
(50, 50, 'PT. WIRA ANGGINI SEJAHTERA', '', 'Tidak ada email'),
(53, 53, 'PT. TRANSINDOTAMA SINAR PERKASA', '', 'Tidak ada email'),
(54, 54, 'CAKRA MANUNGGAL SEMESTA', '', 'Tidak ada email'),
(55, 55, 'PT Synergy Scientific', '', 'Tidak ada email'),
(56, 56, 'PT Bina San Prima Cab. Bekasi', '', 'Tidak ada email'),
(58, 58, 'PT Yasa Berkah Mandiri', '', 'Tidak ada email'),
(59, 59, 'PT Pratama Bersama Farmasi', '', 'Tidak ada email'),
(61, 61, 'PT Hospi Medik Indonesia', '', 'Tidak ada email'),
(62, 62, 'PT. INDOMEDIK NIAGA PERKASA', '', 'Tidak ada email'),
(63, 63, 'PT. MADESA SEJAHTERA UTAMA', '', 'Tidak ada email'),
(64, 64, 'PUSAT KRISIS KESEHATAN SEKRETARIAT JENDRAL KEMENTR', '', 'Tidak ada email'),
(65, 65, 'PT. GLOBAL PROMEDIKA SERVICES', '', 'Tidak ada email'),
(66, 66, 'PT. REZKY RAMADHAN MEDICA', '', 'Tidak ada email'),
(67, 67, 'PT. KASIH KARUNIA KEKAL', '', 'Tidak ada email'),
(68, 68, 'PT. RAJAWALI MITRA PAKANINDO', '', 'Tidak ada email'),
(69, 69, 'PT. RAFA TOPAZ UTAMA', '', 'Tidak ada email'),
(70, 70, 'PRIMASTAR MANDIRI', '', 'Tidak ada email'),
(71, 71, 'PT HARVESTIA MULYA', '', 'Tidak ada email'),
(72, 72, 'PT. TRIPUTRA TECHNO MED', '', 'Tidak ada email'),
(73, 73, 'PT. DJAMO INDONESIA', '', 'Tidak ada email'),
(74, 74, 'PT. WIRA PITOE USAHA BERSAMA', '', 'Tidak ada email'),
(75, 75, 'PT. SENTRA ASIA GEMILANG', 'sentramed@cbn.med.id', 'Host or domain name not found'),
(76, 76, 'PT. SARANA MEDIKA SENTOSA', '', 'Tidak ada email'),
(77, 77, 'PT. MEDICON UTAMA PHARMALAB', 'mas.muhsin@medikonutama.com', 'Host or domain name not found'),
(79, 79, 'PT. ATRA WIDYA AGUNG', '', 'Tidak ada email'),
(80, 80, 'PT. Sekarguna Medika', '', 'Tidak ada email'),
(81, 81, 'PT. Delta Mandiri Abadi', '', 'Tidak ada email'),
(82, 82, 'PT Biosains Medika Indonesia (Biosm Indonesia)', '', 'Tidak ada email'),
(83, 83, 'PT. Global Promedika Service (GPS)', '', 'Tidak ada email'),
(84, 84, 'PT. Sinocare Healthcare Indonesia - Distributor', '', 'Tidak ada email'),
(85, 85, 'PT. Medtek', '', 'Tidak ada email'),
(86, 86, 'PT. Global Jaya Medika', '', 'Tidak ada email'),
(87, 87, 'PT. Mulya Husada Jaya', '', 'Tidak ada email'),
(88, 88, 'PT. Alfa Medika Nusantara', '', 'Tidak ada email'),
(89, 89, 'PT SABA INDOMEDIKA', '', 'Tidak ada email'),
(92, 92, 'PT. AIRINDO', 'airindo@rad.net.id', 'Recipient address rejected: User unknown in virtual     mailbox table'),
(94, 94, 'PT. AMPM HEALTHCARE INDONESIA', 'ampm.healthcare@gmail.com.', 'domain missing or malformed'),
(97, 97, 'PT. BABAD PRIMASENTOSA', 'bamas@dnet.net.id', 'Recipient address rejected: User unknown in virtual     mailbox table'),
(106, 106, 'PT. BINTANG TANGGUH PRATAMA', '-', 'Tidak ada email'),
(112, 112, 'PT. DYNATECH INTERNATIONAL', 'sales@dynatech_int.com', 'malformed address: _int.com> may not follow <sales@dynatech'),
(116, 116, 'PT. ENSEVAL PUTERA jkt4', 'WWW.ENSEVAL.COM', 'No recipients defined'),
(118, 118, 'PT. ESTU INDONESIA', '-', 'Tidak ada email'),
(122, 122, 'PT. GENECRAFT LABS', 'admin@genecraftlabs.com', 'This email account\'s owner has suspended delivery for the account.'),
(125, 125, 'PT. GREET MED INDONESIA', 'enquiry@greet-med.com', 'Host or domain name not found.'),
(136, 136, 'PT. KOLOSAL MITRA TERPERCAYA', 'Admin1@komite.co.id', '550 No Such User     Here'),
(140, 140, 'PT. MEDITECH INDONESIA', 'info@ptmeditech.com', '552 1 Requested mail action aborted, mailbox not found'),
(144, 144, 'PT. MILLENIUM PHARMACON INTERNATIONAL', 'ernie@mail.sdpc.co.id', 'Host or domain name not found'),
(145, 145, 'PT. MITRA INTI MEDIKA', 'marketing@sekarangadamitra.com', '550 Mailbox is full / Blocks limit exceeded / Inode limit exceeded'),
(149, 149, 'PT. NALAGENETIK RISET INDONESIA', '-', 'Tidak ada email'),
(152, 152, 'PT. NUSA EMBATA MITRA', '-', 'Tidak ada email'),
(155, 155, 'PT. PELITA MANDIRI SENTOSA', 'corporate@pelitamandiri.com', '550     Mailbox is full / Blocks limit exceeded / Inode limit exceeded'),
(164, 164, 'PT. SINAR PANCA MEDIKA', '-', 'Tidak ada email'),
(167, 167, 'PT. SRI INTAN PERKASA', 'www.sriintanperkasa.com', 'No recipients defined'),
(168, 168, 'PT. SRI JAYA SAMUDERA', '-', 'Tidak ada email'),
(171, 171, 'PT. TAWADA HEALTHCARE', 'www.tawadahealthcare.com', 'No recipients defined'),
(175, 175, 'PT. TOP POINT MEDICAL', 'toppoin-kim@toppointkim.com', 'The email account that you tried to reach does not exist'),
(180, 180, 'PT. TRINITY SUKSES', '', 'Tidak ada email'),
(182, 182, 'PT. USAHA TIGA BERSAUDARA', 'ptusaha3bersaudara@gmail.com', 'The email account that you tried to reach does not exist'),
(185, 185, 'PT. YRB RESTU (UPG)', '-', 'Tidak ada email'),
(189, 189, 'PT. Cobra Dental', 'cobradental.co.id', 'No recipients defined'),
(191, 191, 'PT. Intan Tunggal Cemerlang', '-', 'Tidak ada email'),
(192, 192, 'PT. Pulau Rempah Indonesia', '-', 'Tidak ada email'),
(194, 194, 'Terrace Fashion', '-', 'Tidak ada email'),
(198, 198, 'PT. PLN (Persero) UPWIII', 'pengadaanvwplv@gmail.com', 'The email account that you tried to reach does not exist'),
(201, 201, 'PT. Multireka', 'multireka@multireka.com', 'Mailbox is full / Blocks limit exceeded / Inode limit exceeded'),
(206, 206, 'Gudang Carvil Regional Jabar', '-', 'Tidak ada email'),
(208, 208, 'PT Duta', '-', 'Tidak ada email'),
(212, 212, 'Sigma Poly Internusa', '-', 'Tidak ada email'),
(217, 217, 'Griyakami Homecare', '-', 'Tidak ada email'),
(218, 218, 'PT. Dwimetal', 'sales@dwimetalteknik.co.id', 'Host or domain name not found'),
(222, 222, 'PT Surya Multi Laksana', '-', 'Tidak ada email'),
(226, 226, 'PT Gracia Persada Abadi', '-', 'Tidak ada email'),
(229, 229, 'PT Darya Padma Enoes', '-', 'Tidak ada email'),
(230, 230, 'Pakar Biomedika', 'info@pakarbiomedika.co.id', '550 Mailbox is full / Blocks limit exceeded / Inode limit exceeded'),
(241, 241, 'PT FENGTAI INDONESIA', '-', 'Tidak ada email'),
(242, 242, 'PT AFLAH MEDIKA INDONESIA', '-', 'Tidak ada email'),
(245, 245, 'PT AKA MUNGGARAN LABORINDO', '-', 'Tidak ada email'),
(247, 247, 'MDP MEDIA', '-', 'Tidak ada email'),
(249, 249, 'PT Pakar Medika', '-', 'Tidak ada email'),
(250, 250, 'PT Frisanha', '-', 'Tidak ada email'),
(252, 252, 'PT Sanwa Parts', 'personnel@sanwascreen.co.id', 'Host or domain name not found'),
(253, 253, 'PT Vitabiotics', 'Contact@vitabiotics.co.id', 'The e-mail address you entered couldn\'t be found.'),
(256, 256, 'PT Tanabe Indonesia', '-', 'Tidak ada email'),
(258, 258, 'PT Forta Mitra Sejati', '-', 'Tidak ada email'),
(259, 259, 'PT Banceuy Tunggal Jaya', '-', 'Tidak ada email'),
(261, 261, 'PT Nurosadi Farma', '-', 'Tidak ada email'),
(262, 262, 'PT Lajusakti Jaya', '-', 'Tidak ada email'),
(264, 264, 'PT Blosom Mandiri Sejati', '-', 'Tidak ada email'),
(266, 266, 'PT GE Nusantara Turbine', '-', 'Tidak ada email'),
(267, 267, 'PT Yongsin World Zipper', '-', 'Tidak ada email'),
(271, 271, 'PT Ghani Arta Dwitunggal', 'ganiarta@bdg.centrin.net.id', 'User unknown'),
(278, 278, 'PT Takeshu', '-', 'Tidak ada email'),
(279, 279, 'PT Link Flow', '-', 'Tidak ada email'),
(281, 281, 'PT Biba Garment', '-', 'Tidak ada email'),
(282, 282, 'PT Venamon', '-', 'Tidak ada email'),
(286, 286, 'Cv Lwj Printing', '-', 'Tidak ada email'),
(287, 287, 'PT. GlobalNine Indonesia', '', 'Tidak ada email'),
(288, 288, 'PT. Cakra Mitra Sentosa (Cakra Medika)', '', 'Tidak ada email'),
(289, 289, 'PT. Sahara Medika Prima', '', 'Tidak ada email'),
(290, 290, 'PT. Duta Bangun Sentosa', '', 'Tidak ada email'),
(291, 291, 'PT. Hajar Prima Alkesindo', '', 'Tidak ada email'),
(292, 292, 'PT. Lestari Bintang Mandiri', '', 'Tidak ada email'),
(295, 295, 'PT. Nugen Bioscience Indonesia', '', 'Tidak ada email'),
(297, 296, 'PT. Juniar Mitra Utama', '', 'Tidak ada email'),
(298, 297, 'PT. Nobbel Riggindo Samudra', '', 'Tidak ada email'),
(299, 298, 'PT. Deltasindo Global Scientific', '', 'Tidak ada email'),
(300, 299, 'PT. Milia Megah Medika', '', 'Tidak ada email'),
(302, 301, 'PT Medixe Sekawan Utama', '', 'Tidak ada email'),
(303, 302, 'PT Sankeindo', '', 'Tidak ada email'),
(304, 303, 'CV Triona Multi Industri', '', 'Tidak ada email'),
(305, 304, 'PT Metro Inter Gading', '', 'Tidak ada email'),
(306, 305, 'PT MH Medika', '', 'Tidak ada email'),
(307, 306, 'Cahaya Inti Medika', '', 'Tidak ada email'),
(308, 307, 'PT. Fa Antares medika', '', 'Tidak ada email'),
(309, 308, 'PT. ANUGRAH ARGON MEDICA', '', 'Tidak ada email'),
(310, 309, 'PT. BSN MEDICAL INDONESIA', '', 'Tidak ada email'),
(311, 310, 'PT. GLOBAL MEDIK PERSADA', '', 'Tidak ada email'),
(312, 311, 'PT.PERMATA BUNDA ARTANO', '', 'Tidak ada email'),
(313, 312, 'PT. SATYA ABADI VISIMED', '', 'Tidak ada email'),
(314, 313, 'PT. FABINDO SEJAHTERA', '', 'Tidak ada email'),
(315, 314, 'PT. FRISMED HOSLAB INDONESIA', '', 'Tidak ada email'),
(316, 315, 'PT. PERMATA MEDIKA PRIMA', '', 'Tidak ada email'),
(317, 316, 'PT SUMIFIN CITRA ABADI', '', 'Tidak ada email'),
(318, 317, 'PT. BODITECH CAKRA INDONESIA', '', 'Tidak ada email'),
(319, 318, 'PT. PZ CUSSONS INDONESIA', '', 'Tidak ada email'),
(320, 319, 'PT. INDO NON WOVEN', '', 'Tidak ada email'),
(321, 320, 'PT. NUSANTARA BINA DIAGNOSTIKA', '', 'Tidak ada email'),
(322, 321, 'PT. EAGLE INDO PHARMA', '', 'Tidak ada email'),
(323, 322, 'PT. INDO CLARO SEJAHTERA', '', 'Tidak ada email'),
(324, 323, 'PT. BU KWANG MEDICAL', '', 'Tidak ada email'),
(325, 324, 'PT. DOA ANAK YATIM', '', 'Tidak ada email'),
(326, 325, 'PT. Setiawan Medika', '', 'Tidak ada email'),
(327, 326, 'PT. YANG ESA RESTU', '', 'Tidak ada email'),
(328, 327, 'PT. Gratia Jaya Mulya', '', 'Tidak ada email'),
(329, 328, 'PT. Smart Care Indonesia', '', 'Tidak ada email'),
(330, 329, 'PT. Surya Medicanda Lestari', '', 'Tidak ada email'),
(332, 331, 'PT. Anugrah Pharmindo Lestari', '', 'Tidak ada email'),
(333, 332, 'PT. Metro Inter Gading', '', 'Tidak ada email'),
(334, 333, 'PT. Makmur Bersama Citra Mulia', '', 'Tidak ada email'),
(335, 334, 'PT. Drager Medical Indo', '', 'Tidak ada email'),
(336, 335, 'PT. Ferring', '', 'Tidak ada email'),
(337, 336, 'PT. Amanah Meddis Indonesia', '', 'Tidak ada email'),
(339, 338, 'PT. Haloni Jane', '', 'Tidak ada email'),
(340, 339, 'PT. Rajawali Nusindo', '', 'Tidak ada email'),
(341, 340, 'PT. Diamesco Indonesia', '', 'Tidak ada email'),
(342, 341, 'PT. Adikarya Medika', '', 'Tidak ada email'),
(343, 342, 'PT. Bina Sukses Medika', '', 'Tidak ada email'),
(344, 343, 'PT. Abadi Perkasa Bersama Alkesindo', '', 'Tidak ada email'),
(345, 344, 'PT. Martech Global Indonesia', '', 'Tidak ada email'),
(346, 345, 'PT. Labquip Indoparma', '', 'Tidak ada email'),
(347, 346, 'PT. Cahaya Inti Medika', '', 'Tidak ada email'),
(348, 347, 'PT. Interlab Sentra Solutions Indonesia', 'Sales.isi-@interlab.com', 'Recipient address rejected: Access denied'),
(349, 348, 'PT. Medtek', 'info@ptmedtek.com', 'Mailbox is full / Blocks limit exceeded / Inode limit exceeded'),
(350, 349, 'PT. Tesena Inovindo', '', 'Tidak ada email'),
(351, 350, 'PT. Kleenviro Dinamika Utama', '', 'Tidak ada email'),
(352, 351, 'PT. Indonesia Global Medika', '', 'Tidak ada email'),
(353, 352, 'PT. Meditrans Global', '', 'Tidak ada email'),
(356, 355, 'PT. Mora Anugrah Berkat', '', 'Tidak ada email'),
(357, 356, 'PT. Steril Medical Indonesia', '', 'Tidak ada email'),
(358, 0, '', '', 'Tidak ada email'),
(359, 357, 'PT. Sekarguna Medika', '', 'Tidak ada email'),
(360, 358, 'PT. Buana Intiprima Medika', '', 'Tidak ada email'),
(361, 359, 'PT. Buana Intiprima Usaha', '', 'Tidak ada email'),
(362, 360, 'PT. Sumber Makmur Berdikari', '', 'Tidak ada email'),
(363, 361, 'PT. Sahabat Promosi Anda', '', 'Tidak ada email'),
(364, 362, 'PT. Sahabat Tunas Muda', '', 'Tidak ada email'),
(365, 363, 'PT. Signa Promedic', '', 'Tidak ada email'),
(366, 364, 'PT. Akema Healthcare', '', 'Tidak ada email'),
(367, 365, 'PT. Union Healthcare', '', 'Tidak ada email'),
(368, 366, 'PT. KingLab Indonesia', '', 'Tidak ada email'),
(369, 367, 'PT. BioAxion', '', 'Tidak ada email'),
(370, 368, 'PT. Tirta Teknosys', '', 'Tidak ada email'),
(371, 369, 'PT. Woori Bio Corpora', '', 'Tidak ada email'),
(372, 370, 'PT. Sarana Karya Medika', '', 'Tidak ada email'),
(374, 372, 'PT. Rema Global Sarana', '', 'Tidak ada email'),
(376, 374, 'PT. Enigma Sainitia Solindo', 'gita.profiana@enigma-saintia.com', 'Email address could not be     found, or was misspelled'),
(378, 377, 'PT. Medika Indo Bavaria', 'pt.mib_2012@yahoo.com', 'Requested mail action aborted, mailbox not found'),
(379, 378, 'PT Bima Mitra Farma', '', 'Tidak ada email'),
(380, 379, 'PT. Eagle Indo Pharma', '', 'Tidak ada email'),
(381, 380, 'PT. Arto Pharma Indonesia', '', 'Tidak ada email'),
(382, 381, 'PT Samco Farma', '', 'Tidak ada email'),
(383, 382, 'PT. Medikon Prima Laboratories', '', 'Tidak ada email'),
(384, 383, 'PT. Pratapa Nirmala Fahrenheit', '', 'Tidak ada email'),
(385, 384, 'PT Bima Mitra Farma', '', 'Tidak ada email'),
(386, 385, 'PT. Guardian Pharmatama / Nulab', '', 'Tidak ada email'),
(387, 386, 'PT Apex Pharma Indonesia', '', 'Tidak ada email'),
(388, 387, 'PT. Bromo Pharmaceutical Industries', '', 'Tidak ada email'),
(389, 388, 'PT Sunthi Sepuri', '', 'Tidak ada email'),
(390, 389, 'PT. Yahi Utama', '', 'Tidak ada email'),
(391, 390, 'PT. Mudita Karuna', '', 'Tidak ada email'),
(392, 391, 'PT. Corsa Industries Ltd', '', 'Tidak ada email'),
(393, 392, 'PT. Molex Ayus Pharmaceutical', '', 'Tidak ada email'),
(394, 393, 'PT Hermed', '', 'Tidak ada email'),
(395, 394, 'PT. Imedco Djaya', '', 'Tidak ada email'),
(396, 395, 'PT. Dexa Medica', '', 'Tidak ada email'),
(397, 396, 'PT. Parit Padang Global Soho', '', 'Tidak ada email'),
(398, 397, 'PT. Novindo Agritech Hutama', '', 'Tidak ada email'),
(399, 398, 'PT. Borwita', '', 'Tidak ada email'),
(400, 399, 'PT. Indocare', '', 'Tidak ada email'),
(401, 400, 'CV. Purelizer Indonesia', '', 'Tidak ada email'),
(402, 401, 'PT. Berkat Mahkota Putra', '', 'Tidak ada email'),
(404, 403, 'PT. DNR Tangerang (Dosniroha)', '', 'Tidak ada email'),
(405, 404, 'PT. Anugrah Argon Medica (Dexa Group)', '', 'Tidak ada email'),
(406, 405, 'PT. Asia Sentra Medika', '', 'Tidak ada email'),
(407, 406, 'PT. Pharos Indonesia', '', 'Tidak ada email'),
(408, 407, 'PT. Antar Mitra Sembada (AMS)', '', 'Tidak ada email'),
(409, 408, 'PT. Mensabina Sukses', '', 'Tidak ada email'),
(410, 409, 'PT. Sunthi Sepuri', '', 'Tidak ada email'),
(411, 410, 'PT. Adventis Mega Indo', '', 'Tidak ada email'),
(412, 411, 'PT. Deltomed Laboratories', '', 'Tidak ada email'),
(413, 412, 'PT. Satya Abadi Pharma', '', 'Tidak ada email'),
(414, 413, 'PT. Tirta Medical Center', '', 'Tidak ada email'),
(415, 414, 'PT. Natrindo Surya Prima', '', 'Tidak ada email'),
(416, 415, 'PT. Dami Sariwana', '', 'Tidak ada email'),
(418, 417, 'PT. Sharprindo Dinamika Prima', '', 'Tidak ada email'),
(419, 418, 'PT. LONCIN', '', 'Tidak ada email'),
(420, 419, 'PT. KDN Sparepart Manufacture', '', 'Tidak ada email'),
(421, 420, 'PT. Tiara Sakti Industrial', '', 'Tidak ada email'),
(422, 421, 'Compressor Shark', '', 'Tidak ada email'),
(423, 422, 'PT. BIMA ROYAL TEKNINDO', '', 'Tidak ada email'),
(424, 423, 'PT. DASA WINDU SEJAHTERA', '', 'Tidak ada email'),
(425, 424, 'PT. Mulia Mandiri Marine', '', 'Tidak ada email'),
(426, 425, 'PT. Indira Dwi Mitra', '', 'Tidak ada email'),
(427, 426, 'Polarin Xinindo', '', 'Tidak ada email'),
(428, 427, 'Shark Hardware and Tools', '', 'Tidak ada email'),
(429, 428, 'Air Pasific Utama, PT', '', 'Tidak ada email'),
(430, 429, 'Sarigema Dinamika, PT.', '', 'Tidak ada email'),
(431, 430, 'PT. Bio Cycle Indonesia', '', 'Tidak ada email'),
(432, 431, 'PT. Csmart Iot Indonesia', '', 'Tidak ada email'),
(433, 432, 'PT. Senyum Pesona Timur', '', 'Tidak ada email'),
(434, 433, 'PT. Pentens Indonesia', '', 'Tidak ada email'),
(435, 434, 'PT. Ekatama Putra Group', '', 'Tidak ada email'),
(436, 435, 'PT. Kurniamitra Duta Sentosa', '', 'Tidak ada email'),
(437, 436, 'PT. Bottcher Indonesia', '', 'Tidak ada email'),
(438, 437, 'PT. Etnicraft Indo', '', 'Tidak ada email'),
(439, 438, 'PT. Mulia Furniture Distributor', '', 'Tidak ada email'),
(440, 439, 'PT. Hansa Engeenering', '', 'Tidak ada email'),
(441, 440, 'PT. Dynamic Wahana International', '', 'Tidak ada email'),
(442, 441, 'PT. Wedsolar Indonesia', '', 'Tidak ada email'),
(443, 442, 'PT. Toko Mesin Maksindo', '', 'Tidak ada email'),
(444, 443, 'PT. Tri Chemindo Ampuh', '', 'Tidak ada email'),
(445, 444, 'PT. Triglode Lite Indonesia', '', 'Tidak ada email'),
(446, 445, 'PT. Rayas Triputra Sejati', '', 'Tidak ada email'),
(447, 446, 'PT. Prima Komponen Indonesia', '', 'Tidak ada email'),
(448, 447, 'PT. Bruegman Asia', '', 'Tidak ada email'),
(449, 448, 'PT. Kleenviro', '', 'Tidak ada email'),
(450, 449, 'PT. Sarku Engeenering Utama', '', 'Tidak ada email'),
(451, 450, 'PT. Biotek Sarana Industri', '', 'Tidak ada email'),
(452, 451, 'PT. Berkat Sahabat Sejati', '', 'Tidak ada email'),
(453, 452, 'PT. Beone Technology', '', 'Tidak ada email'),
(454, 453, 'PT. Bukit Oase Yakin Lestari', '', 'Tidak ada email'),
(455, 454, 'PT. Antarnusa Lintasartha', '', 'Tidak ada email'),
(456, 455, 'PT. Titus Teknoform', '', 'Tidak ada email'),
(458, 457, 'PT. Atlas Copco Indonesia', '', 'Tidak ada email'),
(459, 458, 'PT. Berkat Mas Mulia Guna', '', 'Tidak ada email'),
(460, 459, 'PT. Eastech Nusantara', '', 'Tidak ada email'),
(461, 460, 'PT. Dupalindo Perkasa', '', 'Tidak ada email'),
(462, 461, 'PT. Tridaya Artaguna Santra', '', 'Tidak ada email'),
(463, 462, 'PT. Petrotec Guna Perkasa', '', 'Tidak ada email'),
(464, 463, 'PT. Price Trandos Engeenering', '', 'Tidak ada email'),
(465, 464, 'PT. Hidea Inti Daya', '', 'Tidak ada email'),
(466, 465, 'PT. Hidayah Insan Mulia', '', 'Tidak ada email'),
(467, 466, 'PT. Indoprima Mandiri Utama', '', 'Tidak ada email'),
(468, 467, 'PT. Aroma Prima Livindo', '', 'Tidak ada email'),
(469, 468, 'PT. Global Success Chain', '', 'Tidak ada email'),
(470, 469, 'PT. Exxab Energy Indonesia', '', 'Tidak ada email'),
(471, 470, 'CV. Saka Pratama', '', 'Tidak ada email'),
(472, 471, 'PT. Eigerindo', '', 'Tidak ada email'),
(473, 472, 'PT. Kasih Karunia Sejati', '', 'Tidak ada email'),
(474, 473, 'PT. Citra Niaga Cemerlang', '', 'Tidak ada email'),
(475, 474, 'PT. Polymindo Permata', '', 'Tidak ada email'),
(476, 475, 'PT. Jico Agung', '', 'Tidak ada email'),
(477, 476, 'PT. Volans', '', 'Tidak ada email'),
(478, 477, 'PT. Lancar Rejeki Lintrindo', '', 'Tidak ada email'),
(479, 478, 'PT. F.lab Atelier Indonesia', '', 'Tidak ada email'),
(480, 479, 'PT. Iron Hill Mitra Sejati', '', 'Tidak ada email'),
(481, 480, 'PT. Formosa Bag Indo', '', 'Tidak ada email'),
(482, 481, 'PT. Bital Asia', '', 'Tidak ada email'),
(483, 482, 'PT. Foam Tech Indonesia', '', 'Tidak ada email'),
(484, 483, 'PT. Hino motors sales', '', 'Tidak ada email'),
(485, 484, 'PT. Avian brand', '', 'Tidak ada email'),
(486, 485, 'PT. Torabika Eka Semesta', '', 'Tidak ada email'),
(487, 486, 'PT. Teral Indonesia', '', 'Tidak ada email'),
(488, 487, 'PT. Enagic Indonesia', '', 'Tidak ada email'),
(489, 488, 'PT. Axalta Coating Sistem', '', 'Tidak ada email'),
(490, 489, 'PT. Induktorindo Utama', '', 'Tidak ada email'),
(491, 490, 'PT. Asia Schruk Indonesia', '', 'Tidak ada email'),
(492, 491, 'PT. Hamon Indonesia', '', 'Tidak ada email'),
(493, 492, 'PT. Festo', '', 'Tidak ada email'),
(494, 493, 'PT. Hansulindo & Jo', '', 'Tidak ada email'),
(495, 494, 'PT. Aquasolve Sarania', '', 'Tidak ada email'),
(496, 495, 'PT. Hettich', '', 'Tidak ada email'),
(497, 496, 'PT. Prima Graha Bangun Tunggal', '', 'Tidak ada email'),
(498, 497, 'PT. Vischem International', '', 'Tidak ada email'),
(499, 498, 'PT. Artupic', '', 'Tidak ada email'),
(500, 499, 'PT. Sinar Mentari Jaya', '', 'Tidak ada email'),
(501, 500, 'PT. Polcon Terang Cemerlang', '', 'Tidak ada email'),
(503, 502, 'PT. Inti Surya Sejati', '', 'Tidak ada email'),
(504, 503, 'PT. Javareef Indonesia', '', 'Tidak ada email'),
(505, 504, 'PT. Nippon Pillar Manufactur', '', 'Tidak ada email'),
(506, 505, 'PT. Tehnik Nusantara', '', 'Tidak ada email'),
(507, 506, 'PT. Fluida Indonesia', '', 'Tidak ada email'),
(508, 507, 'PT. Sarana Veterinaria Jaya Abadi', '', 'Tidak ada email'),
(509, 508, 'PT. Young Industri Indonesia', '', 'Tidak ada email'),
(511, 510, 'PT. Dycwa Internasional', '', 'Tidak ada email'),
(512, 511, 'PT. Bino Mitra Sejati (Bantex)', '', 'Tidak ada email'),
(513, 512, 'PT. Advindo Hikaku', '', 'Tidak ada email'),
(514, 513, 'PT. Hanson & Jo', '', 'Tidak ada email'),
(515, 514, 'PT. Dynaplast', '', 'Tidak ada email'),
(516, 515, 'PT. Bahtera Adi Jaya', '', 'Tidak ada email'),
(517, 516, 'PT. Yuasa Battery', '', 'Tidak ada email'),
(518, 517, 'PT. Enesers Mitra Berkah', '', 'Tidak ada email'),
(519, 518, 'PT. Multi Mitra Sakti', '', 'Tidak ada email'),
(520, 519, 'PT. Hafele Indotama', '', 'Tidak ada email'),
(521, 520, 'PT. Safiril', '', 'Tidak ada email'),
(522, 521, 'PT. Elmo', '', 'Tidak ada email'),
(523, 522, 'PT. Pheksa', '', 'Tidak ada email'),
(524, 523, 'PT. Tirta Anugrah Abadi', '', 'Tidak ada email'),
(525, 524, 'PT. Pamduta', '', 'Tidak ada email'),
(526, 525, 'PT. Taiko', '', 'Tidak ada email'),
(527, 526, 'PT. Nutricell Pasific', '', 'Tidak ada email'),
(528, 527, 'PT. Surrya Bintang Abadi', '', 'Tidak ada email'),
(529, 528, 'PT. Bhumi Phala Perkasa', '', 'Tidak ada email'),
(530, 529, 'PT. Delta Raya Sejahtera', '', 'Tidak ada email'),
(531, 530, 'PT. Delta Raya Sentosa', '', 'Tidak ada email'),
(532, 531, 'PT. DKT Indonesia', '', 'Tidak ada email'),
(533, 532, 'PT. Rems', '', 'Tidak ada email'),
(534, 533, 'PT. Alpine Cool Utama', '', 'Tidak ada email'),
(535, 534, 'PT. Gedong Paria Technik', '', 'Tidak ada email'),
(536, 535, 'PT. Vietindo Jaya', '', 'Tidak ada email'),
(537, 536, 'PT. Altrak 1978', '', 'Tidak ada email'),
(538, 537, 'PT. Karunia Jaya Andalan Prima', '', 'Tidak ada email'),
(539, 538, 'PT. Karcher Central Indonesia', '', 'Tidak ada email'),
(541, 540, 'PT. Centra Quality', '', 'Tidak ada email'),
(542, 541, 'PT. Surya Sukses Mandiri', '', 'Tidak ada email'),
(543, 542, 'PT. Caya Manunggal', '', 'Tidak ada email'),
(544, 543, 'PT. Sista', '', 'Tidak ada email'),
(545, 544, 'PT. Ananta Swasta Dana', '', 'Tidak ada email'),
(546, 545, 'PT. Minelog Service Indo', '', 'Tidak ada email'),
(547, 546, 'PT. Heryana Pasifik Indonusa', '', 'Tidak ada email'),
(548, 547, 'PT. Bintang Mono Indonesia', '', 'Tidak ada email'),
(549, 548, 'PT. Mitravet', '', 'Tidak ada email'),
(550, 549, 'PT. Smart Kimia Indo', '', 'Tidak ada email'),
(551, 550, 'PT. Erigo Fulfillment Centre', '', 'Tidak ada email'),
(552, 551, 'PT. Comforta Aire Aneka Teknik', '', 'Tidak ada email'),
(553, 552, 'PT. Buhler Indonesia', '', 'Tidak ada email'),
(555, 554, 'PT. Totalfire', '', 'Tidak ada email'),
(556, 555, 'PT. General teknologi indonesia', '', 'Tidak ada email'),
(557, 556, 'PT. Netciti Persada', '', 'Tidak ada email'),
(558, 557, 'PT. Tridecca Indonesia', '', 'Tidak ada email'),
(559, 558, 'PT. International Tekhnik solusindo', '', 'Tidak ada email'),
(560, 559, 'PT. Fobuma', '', 'Tidak ada email'),
(561, 560, 'PT. Platinum Indo Solusi', '', 'Tidak ada email'),
(562, 561, 'PT. Softex Indonesia', '', 'Tidak ada email'),
(563, 562, 'PT. Snappin Shower', '', 'Tidak ada email'),
(564, 563, 'PT. Putra Mega Purnama', '', 'Tidak ada email'),
(565, 564, 'PT. Intitek presisi integrasi', '', 'Tidak ada email'),
(567, 566, 'PT. Duta Surya Permata', '', 'Tidak ada email'),
(568, 567, 'PT. Dextone Lemindo', '', 'Tidak ada email'),
(569, 568, 'PT. Putra Andalan Perkasa', '', 'Tidak ada email'),
(570, 569, 'PT. MBV Group', '', 'Tidak ada email'),
(571, 570, 'PT. Agung Food Industrindo', '', 'Tidak ada email'),
(573, 572, 'PT. Pola Proserve Eigeneering', '', 'Tidak ada email'),
(574, 573, 'PT. Klik Daily', '', 'Tidak ada email'),
(575, 574, 'PT. Mulia Artha Anugrah', '', 'Tidak ada email'),
(576, 575, 'PT. Fuchs Indonesia/Arrow Asia Group', '', 'Tidak ada email'),
(577, 576, 'PT. Protekindo Sanita', 'dislock@protekindo.com', 'No Such     User Here'),
(578, 577, 'PT. Yokomindo Makmur Perkasa', '', 'Tidak ada email'),
(579, 578, 'PT. Repayo Mandiri', '', 'Tidak ada email'),
(581, 580, 'PT. Global Utama Teknindo', '', 'Tidak ada email'),
(582, 581, 'PT. Maju Selaras Instrumindo', '', 'Tidak ada email'),
(583, 582, 'PT. Heksa Power', '', 'Tidak ada email'),
(584, 583, 'PT. Karya Nadiso Utama', '', 'Tidak ada email'),
(587, 586, 'PT. Importdeft', '', 'Tidak ada email'),
(588, 587, 'PT. Gericke', '', 'Tidak ada email'),
(589, 588, 'PT. Saveta', '', 'Tidak ada email'),
(590, 589, 'PT. Triton Kencana Tirta', '', 'Tidak ada email'),
(591, 590, 'PT. Triasa Jaya Kencana', '', 'Tidak ada email'),
(592, 591, 'PT. Surya Bintang Abadi', '', 'Tidak ada email'),
(593, 592, 'PT. Bumi Rasa Pangan Utama', '', 'Tidak ada email'),
(594, 593, 'PT. Trrit Indonesia', '', 'Tidak ada email'),
(595, 594, 'PT. Gridtech Indonesia', '', 'Tidak ada email'),
(596, 595, 'PT. Airwave Aji Perkasa', '', 'Tidak ada email'),
(597, 596, 'PT. Tonata Indonesia', '', 'Tidak ada email'),
(598, 597, 'PT. Anugerah Berkat Teknik', '', 'Tidak ada email'),
(599, 598, 'PT. Karo Graha Abadi', '', 'Tidak ada email'),
(600, 599, 'PT. Sondang Artha Prima', '', 'Tidak ada email'),
(601, 600, 'PT. Gelora Mitra Sejahtera', '', 'Tidak ada email'),
(602, 601, 'PT. Indorama Ventures Indonesia', '', 'Tidak ada email'),
(603, 602, 'PT. Hutama Visi Sejahtera', '', 'Tidak ada email'),
(604, 603, 'PT. Geum Cheon Engineering', '', 'Tidak ada email'),
(605, 604, 'PT. Dutz Hidraulik Indonesia', '', 'Tidak ada email'),
(606, 605, 'PT. Ducotti Dieselindo Persada', '', 'Tidak ada email'),
(608, 607, 'PT. Daya Muda Agung', '', 'Tidak ada email'),
(609, 608, 'PT. Gas Teknik Interbuana', '', 'Tidak ada email'),
(610, 609, 'PT. Vulkan Industries Far East', '', 'Tidak ada email'),
(612, 611, 'PT. Harmoni Nasional Tek (HNT)', '', 'Tidak ada email'),
(613, 612, 'PT. Multi Print', '', 'Tidak ada email'),
(614, 613, 'PT. Triasajaya Kencana', '', 'Tidak ada email'),
(615, 614, 'PT. Penta Power', '', 'Tidak ada email'),
(616, 615, 'PT. Sentra Elektrikal Prima', '', 'Tidak ada email'),
(617, 616, 'PT. Daria Prima Indonesia', '', 'Tidak ada email'),
(618, 617, 'PT. Sandmaster Asia', '', 'Tidak ada email'),
(620, 619, 'PT. Prakasa Tunggal Usaha Mandiri', '', 'Tidak ada email'),
(621, 620, 'PT. Berkat Multi Persada', '', 'Tidak ada email'),
(622, 621, 'PT. Cipta Multi Proteksindo', '', 'Tidak ada email'),
(623, 622, 'PT. Adhya Graha Kencana', '', 'Tidak ada email'),
(624, 623, 'PT. Bullberg', '', 'Tidak ada email'),
(625, 624, 'PT. Baskara Prima Sarana', '', 'Tidak ada email'),
(626, 625, 'PT. Kreasi Sukses Indoprima', '', 'Tidak ada email'),
(628, 627, 'PT. Ecosolusindo Makmur Anugrah Sejahtera', '', 'Tidak ada email'),
(629, 628, 'PT. Sentra Quality', '', 'Tidak ada email'),
(630, 629, 'PT. Indonesia Horeca Sejahtera', '', 'Tidak ada email'),
(631, 630, 'PT. Servvo Fire Indonesia', '', 'Tidak ada email'),
(632, 631, 'PT. Putramega Purnama', '', 'Tidak ada email'),
(633, 632, 'PT. Deli Group Indonesia', '', 'Tidak ada email'),
(634, 633, 'PT. Miligolas', '', 'Tidak ada email'),
(635, 634, 'PT. JM Mutu Utama', '', 'Tidak ada email'),
(636, 635, 'PT. Berkat Solusi Persada', '', 'Tidak ada email'),
(637, 636, 'PT. Archer', '', 'Tidak ada email'),
(639, 638, 'PT. Sumber Daya Trading Indonesia', '', 'Tidak ada email'),
(640, 639, 'PT. Golden Archy Sakti', '', 'Tidak ada email'),
(641, 640, 'PT. Indo Prima', '', 'Tidak ada email'),
(642, 641, 'PT. Agrophoria Hidroponik', '', 'Tidak ada email'),
(643, 642, 'PT. Biesse Indonesia', '', 'Tidak ada email'),
(644, 643, 'PT. Jepari Mitra Mandiri', '', 'Tidak ada email'),
(645, 644, 'PT. Instrumindo Prima Sentosa', '', 'Tidak ada email'),
(646, 645, 'PT. Panca Wira Dharma', '', 'Tidak ada email'),
(647, 646, 'PT. Enerba Technology', '', 'Tidak ada email'),
(648, 647, 'PT. Jaya Teknik Supply', '', 'Tidak ada email'),
(649, 648, 'PT. Citra Semesta Asri', '', 'Tidak ada email'),
(650, 649, 'PT. Aritek Karya Mandiri', '', 'Tidak ada email'),
(652, 651, 'PT. Tritama Niaga Berjaya', '', 'Tidak ada email'),
(653, 652, 'PT. Galleon Cahaya Investama', '', 'Tidak ada email'),
(654, 653, 'PT. Surya Uni Prakarsa', '', 'Tidak ada email'),
(655, 654, 'PT. Keshun konstruksi Indonesia', '', 'Tidak ada email'),
(656, 655, 'PT. Wedosolar Indonesia', '', 'Tidak ada email'),
(657, 656, 'PT. Hermed', '', 'Tidak ada email'),
(658, 657, 'PT. Komindo', '', 'Tidak ada email'),
(659, 658, 'PT. Prima Komponen Indonesia', '', 'Tidak ada email'),
(660, 659, 'PT. Termo Tech Solutions', '', 'Tidak ada email'),
(661, 660, 'PT. Panata Jaya Mandiri (ADR Group)', '', 'Tidak ada email'),
(662, 661, 'PT. Indonesia Solar Global', '', 'Tidak ada email'),
(663, 662, 'PT. Prapat Tunggal Cipta (ADR Group)', '', 'Tidak ada email'),
(664, 663, 'PT. Selamat Sempurna (ADR Group)', '', 'Tidak ada email'),
(665, 664, 'PT. Inovasi Pangan Indonesia (Barefood)', '', 'Tidak ada email'),
(666, 665, 'PT. Karya Mandiri Sepakat', '', 'Tidak ada email'),
(667, 666, 'PT. Eumed Cakra Medical', '', 'Tidak ada email'),
(668, 667, 'PT. Staris Chemical', '', 'Tidak ada email'),
(669, 668, 'PT. Bkleen Indonesia', '', 'Tidak ada email'),
(670, 669, 'PT. Abadi Perkasa bersama alkesindo', '', 'Tidak ada email'),
(671, 670, 'PT. Kusuma Persada Engineering', '', 'Tidak ada email'),
(672, 671, 'PT. Cipati Yuda Persada', '', 'Tidak ada email'),
(673, 672, 'PT. PRP', '', 'Tidak ada email'),
(674, 673, 'PT. Wahana Indah Selaras Eltraeska', '', 'Tidak ada email'),
(675, 674, 'PT. Behn Meyer Chemicals', '', 'Tidak ada email'),
(676, 675, 'PT. Ran Pump Indonesia', '', 'Tidak ada email'),
(677, 676, 'PT. Inti Maritim Internusa', '', 'Tidak ada email'),
(678, 677, 'CV. Amfoang Jaya', '', 'Tidak ada email'),
(680, 679, 'PT. Maju Bersama Multitekindo', '', 'Tidak ada email'),
(681, 680, 'PT. Multi Reksa Sinergitas (AMS Digital)', '', 'Tidak ada email'),
(682, 681, 'PT. Neo galentika global', '', 'Tidak ada email'),
(683, 682, 'PT. Ijep Inti Cemerlang', '', 'Tidak ada email'),
(684, 683, 'PT. Varia Indotama Prakasa', '', 'Tidak ada email'),
(685, 684, 'CV. Karunia Megah', '', 'Tidak ada email'),
(686, 685, 'PT. Thano Technology', '', 'Tidak ada email'),
(687, 686, 'PT. Jantan Setia Sakti', '', 'Tidak ada email'),
(688, 687, 'CV. Maju Bersama', '', 'Tidak ada email'),
(689, 688, 'PT. Perdana Niaga Perkasa', '', 'Tidak ada email'),
(690, 689, 'PT. Budhijaya Makmur Sentosa', '', 'Tidak ada email'),
(691, 690, 'PT. Wahana Indah Selaras Eltraeska', '', 'Tidak ada email'),
(692, 691, 'PT. Wealthy Indah Perkasa', '', 'Tidak ada email'),
(693, 692, 'PT. Cistech Alpha Indonesia', '', 'Tidak ada email'),
(694, 693, 'PT. Buana Selaras Globalindo', '', 'Tidak ada email'),
(695, 694, 'PT. Sumber Sinar Lestari', '', 'Tidak ada email'),
(696, 695, 'PT. Bentala Selaras Globalindo', '', 'Tidak ada email'),
(697, 696, 'PT. Sumber Makmur Berdikari', '', 'Tidak ada email'),
(698, 697, 'PT. Esecodharma Permai', '', 'Tidak ada email'),
(699, 698, 'PT. Amaron Raja Battery', '', 'Tidak ada email'),
(700, 699, 'PT. Frismed Hoslab Indonesia', '', 'Tidak ada email'),
(701, 700, 'PT. Dwimitra Agritech Hutama', '', 'Tidak ada email'),
(704, 703, 'PT. Indonesia Solar Global', 'admin@isg-solar.com', 'The email account that you tried to reach does not exist'),
(706, 705, 'PT. Sunstream Indonesia', 'Windy@sunstream-indutries.com', 'Host or domain name not found'),
(707, 706, 'CV. Makmur Sentosa', '', 'Tidak ada email'),
(708, 707, 'Varia Store', '', 'Tidak ada email'),
(709, 708, 'PT. Anugrah Familindo Utama', '', 'Tidak ada email'),
(710, 709, 'PT. Ascos Sukses Makmur', '', 'Tidak ada email'),
(711, 710, 'PT. Beauty Link', '', 'Tidak ada email'),
(712, 711, 'PT. Cakra Daya Makmur', '', 'Tidak ada email'),
(713, 712, 'PT. Citra Semesta Asri Sejati', '', 'Tidak ada email'),
(714, 713, 'PT. Dahlia Cosmetic Indonesia', '', 'Tidak ada email'),
(715, 714, 'PT. Fabindo Sejahtera', '', 'Tidak ada email'),
(716, 715, 'PT. Fabindo Sejahtera', '', 'Tidak ada email'),
(717, 716, 'PT. Gloria Origita Cosmetics', '', 'Tidak ada email'),
(718, 717, 'PT. Kosmetikatama Super Indah', '', 'Tidak ada email'),
(719, 718, 'PT. Kosmindah Wangi', '', 'Tidak ada email'),
(720, 719, 'PT. DAHLIA COSMETICS INDONESIA', '', 'Tidak ada email'),
(721, 720, 'CV. HAY YEN COSMETIC', '', 'Tidak ada email'),
(722, 721, 'PT. MULTI ELOK MODERN COSMETICS', '', 'Tidak ada email'),
(723, 722, 'PT. PRADASARI KOSMETIK/PRADASARIKIMINDO', '', 'Tidak ada email'),
(724, 723, 'essential', '', 'Tidak ada email'),
(725, 724, 'PT. Kirana Anindita Cosmetics', '', 'Tidak ada email'),
(726, 725, 'PT. Citra Semesta Asri Sejati', '', 'Tidak ada email'),
(727, 726, 'Pesona 2000', '', 'Tidak ada email'),
(728, 727, 'PT. Bio Kusuma', '', 'Tidak ada email'),
(729, 728, 'PT. Splash Cahaya Indo', '', 'Tidak ada email'),
(730, 729, 'PT. Cosmar', '', 'Tidak ada email'),
(731, 730, 'PT. Cakra Daya Cosmetics', '', 'Tidak ada email'),
(732, 731, 'PT. Global Beauty Science', '', 'Tidak ada email'),
(734, 733, 'PT. B Earl Cosmetics', '', 'Tidak ada email'),
(735, 734, 'PT. Eka Jaya International Cosmetics', '', 'Tidak ada email'),
(736, 735, 'PT. Ganesindo Jaya Perkasa', '', 'Tidak ada email'),
(737, 736, 'PT. Followme Indonesia', '', 'Tidak ada email'),
(738, 737, 'PT. Duta Inti Daya (Watsons Bitung)', '', 'Tidak ada email'),
(744, 743, 'PT Rabana Agro Resources', 'contact@rabanagroup.com', 'Host or domain name not found'),
(745, 744, 'PT Kotaminyak Internusa', 'evi.amalia@kotaminyak.co.id', '550 This address no longer accepts mail'),
(746, 745, 'PT MAXpower Indonesia', '', 'Tidak ada email'),
(752, 751, 'PT Duta Indah Perkasa', '', 'Tidak ada email'),
(758, 756, 'PT Bintang Anugerah Cahaya Abadi', 'info@ptbaca.com / info.ptbaca@gmail.com', '50 Mailbox is full /     Blocks limit exceeded / Inode limit exceeded'),
(759, 757, 'PT Berkembang Serlaras Daya', '', 'Tidak ada email'),
(760, 758, 'PT Sejahtera Bersama telaga', '', 'Tidak ada email'),
(761, 759, 'PT Mitra Medical Mandiri', '', 'Tidak ada email'),
(762, 760, 'PT Kristalindo Karunia Internasional', '', 'Tidak ada email'),
(765, 763, 'PT Danpac Pharma', '', 'Tidak ada email'),
(766, 764, 'PT Panda Mas Cemerlang', '', 'Tidak ada email'),
(767, 765, 'PT Padma Kumara Medika', '', 'Tidak ada email'),
(771, 769, 'PT Babad Primasentosa', '', 'Tidak ada email'),
(773, 771, 'PT Suplindo Prima Solusi', '', 'Tidak ada email'),
(774, 772, 'PT Bis Data Indonesia', 'dewi@kabanhts.com', 'Host or domain name not found'),
(775, 773, 'PT Weng Fatt Indonesia', '', 'Tidak ada email'),
(777, 775, 'PT Buana Inti Prima', '', 'Tidak ada email'),
(778, 776, 'PT Escodharma Permai', 'm.arif@eseco.co.id / wayan@eseco.co.id', 'The address may be misspelled or may not exist'),
(787, 785, 'PT. Aerocom Global Sejahtera', 'info@aerocom-global.co.id', 'Disabled recipient address'),
(792, 790, 'PT. prima jaya indonusa', '', 'Tidak ada email'),
(799, 797, 'PT.Adhitya asha medika', '', 'Tidak ada email'),
(802, 800, 'PT. Medtek', 'info@ptmedtek.com', 'Mailbox is full / Blocks limit exceeded / Inode limit exceeded'),
(808, 806, 'PT. Corsa Industries', 'http://www.corsa.co.id/', 'No recipients defined'),
(819, 817, 'PT. Setia Kawan Abadi', 'service@skanutraceutical.com', '550 Mailbox is full / Blocks limit exceeded / Inode limit exceeded'),
(821, 819, 'PT. Golden Globe Medica', 'goldenglobemedica@yahoo.com / info@goldenglobe.co.', 'This mailbox is disabled'),
(822, 820, 'PT. Gemilang Meditra Solusindo (Jakarta)', 'https://gemasindo.co.id/', 'Tidak ada email'),
(823, 821, 'PT Bintang Mono Indonesia', 'https://www.bintangmonoindonesia.com/', 'No recipients defined'),
(824, 822, 'IDS Medical Systems Indonesia', 'https://www.idsmed.com/', 'No recipients defined'),
(825, 823, 'PT Mensa Binasukses Cabang Tangerang', 'https://www.mbs.co.id/', 'No recipients defined'),
(830, 828, 'PT. Medicare Internasional Indonesia', 'info@medicare.co.id', 'This email account\'s owner has suspended delivery for the account.'),
(834, 832, 'PT Fortuna Sambada Makmur Medika', 'https://www.fortunasembada.com/', 'No recipients defined'),
(837, 835, 'PT Triasa Jaya Kencana', 'csr@tjk.co.id', 'Mailbox is full / Blocks limit exceeded / Inode limit exceeded'),
(846, 844, 'PT. Meiji Indonesian Pharmaceutical Industries', 'https://meiji.co.id/en/contact', 'Tidak ada email'),
(857, 855, 'Sentra Asia Gemilang. PT', 'sentramed@cbn.net.id / sentra@cbn.net.id', 'Email address could not be found, or was misspelled'),
(859, 857, 'PT Galenium', '', 'Tidak ada email'),
(863, 861, 'PT Bina San Prima (bogor)', '', 'Tidak ada email'),
(867, 865, 'PT Novell Pharmaceutical', '', 'Tidak ada email'),
(868, 866, 'PT Mitra Klutiva Utama', '', 'Tidak ada email'),
(869, 867, 'PT Anugrah Yaden Utama', '', 'Tidak ada email'),
(870, 868, 'PT Karya Daya Syafarmasi', '', 'Tidak ada email'),
(871, 869, 'PT Multione Plus', '', 'Tidak ada email'),
(873, 871, 'Sentra Medika', 'purchasing.farmasi@rssentramedicacibinong.co.id', 'Host or domain name not     found'),
(874, 872, 'Kimia Farma Trading and distribution', '', 'Tidak ada email'),
(875, 873, 'Novartis Biochemie', '', 'Tidak ada email'),
(877, 875, 'PT Sarandi Karya Nugraha', '', 'Tidak ada email'),
(878, 876, 'PT Organo Science Laboratory', '', 'Tidak ada email'),
(881, 879, 'Trisna Mandiri Meditalindo', 'trisnamandirimeditalindo@yahoo.co.id', ' Requested mail     action aborted, mailbox not found'),
(882, 880, 'Wafa Berdikari Medika', '', 'Tidak ada email'),
(884, 882, 'Andi Alkes', '', 'Tidak ada email'),
(885, 883, 'Inkordan international', '', 'Tidak ada email'),
(886, 884, 'Berkah Alkes', '', 'Tidak ada email'),
(887, 885, 'Essea Medical & Alkes', '', 'Tidak ada email'),
(889, 887, 'PT Andalan Fluid Sistem', '', 'Tidak ada email'),
(890, 888, 'PT Plastindo Pratama', '', 'Tidak ada email'),
(891, 889, 'Yanmar', 'dodi_supriyadi@gmail.com', 'The email account that you tried to reach does not exist'),
(892, 890, 'PT Anugrah Persada Alam', '', 'Tidak ada email'),
(893, 891, 'PT JavaindonMaju Sejahtera', '', 'Tidak ada email'),
(894, 892, 'PT Jinyoung', '', 'Tidak ada email'),
(895, 893, 'JNT Bogor', '', 'Tidak ada email'),
(896, 894, 'PT Canopus', '', 'Tidak ada email'),
(897, 895, 'Frastata Buana', '', 'Tidak ada email'),
(898, 896, 'PT Acefood', '', 'Tidak ada email'),
(900, 898, 'PT Sentral Multirasa Utama', '', 'Tidak ada email'),
(901, 899, 'PT Joyfull Snack Indonesia', '', 'Tidak ada email'),
(902, 900, 'PT Malindo Imaging Tehnology', '', 'Tidak ada email'),
(903, 901, 'PT Wacoal Indonesia', '', 'Tidak ada email'),
(904, 902, 'PT Viana Unggul Garmindo', '', 'Tidak ada email'),
(905, 903, 'PT Doori Lestari Garment', 'pt_doori@yahoo.com', 'Requested mail action aborted, mailbox not found'),
(907, 905, 'PT Rajawali Nusindo', '', 'Tidak ada email'),
(908, 906, 'PT Vaksindo Satwa Nusantara', '', 'Tidak ada email'),
(909, 907, 'PT Pilar Cakra Mas', '', 'Tidak ada email'),
(910, 908, 'PT Balitbang Bogor', '', 'Tidak ada email'),
(915, 913, 'PT Kemilau Abadi Sejahtera', '', 'Tidak ada email'),
(917, 915, 'PT Novel Pharmaceutical', '', 'Tidak ada email'),
(924, 922, 'Tekno Medika Jaya, PT', 'contact-produck@teknomedikajaya.com', 'Host or domain name not found'),
(929, 927, 'Pelita Reliance International Hospital', '', 'Tidak ada email'),
(931, 929, 'Eka Gemilang Medika', 'adm@ekagemilang.com', 'Host or domain name not found');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_code` varchar(50) NOT NULL,
  `job_code` varchar(50) NOT NULL,
  `department_code` varchar(50) NOT NULL,
  `manager` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `branch` varchar(255) NOT NULL,
  `office` varchar(50) NOT NULL,
  `area_code` varchar(50) DEFAULT NULL,
  `tlc_code` varchar(50) DEFAULT NULL,
  `place_of_birth` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `work_start_date` date NOT NULL,
  `gender` enum('Laki - Laki','Perempuan') NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `marital_status` enum('Menikah','Belum Menikah') NOT NULL,
  `dependents` varchar(20) DEFAULT NULL,
  `last_education` varchar(50) NOT NULL,
  `employee_status` enum('Kontrak','Tetap','Percobaan','Permanen') NOT NULL,
  `description` text DEFAULT NULL,
  `wife_name` varchar(255) DEFAULT NULL,
  `child_name` text DEFAULT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_code`, `job_code`, `department_code`, `manager`, `first_name`, `middle_name`, `last_name`, `address`, `branch`, `office`, `area_code`, `tlc_code`, `place_of_birth`, `date_of_birth`, `work_start_date`, `gender`, `postal_code`, `marital_status`, `dependents`, `last_education`, `employee_status`, `description`, `wife_name`, `child_name`, `phone_number`, `email`, `status`, `photo`, `createdAt`, `updatedAt`) VALUES
('JKT.OPS.0001', 'OP SML', 'OPERASIONAL', 'Jawa Barat', 'Viper', 'D', 'Snake', 'HEAD OFFICE CIBUBUR', 'JKT', 'SML CIbubur', '0', '', 'Olympus', '1899-11-29', '2019-12-31', 'Laki - Laki', '12', 'Belum Menikah', '0', 'SMA', 'Tetap', '-', '-', '0', '85123212308', 'viper@gmail.com', 'Aktif', 'SMLasasd', '2021-12-14 18:01:25', '2022-01-06 09:32:04'),
('JKT.OPS.0002', 'OP SML', 'OPERASIONAL', 'Jawa Barat', 'Viper', 'D', 'Snake', 'HEAD OFFICE CIBUBUR', 'JKT', 'SML CIbubur', '0', '', 'Olympus', '1999-06-04', '2021-09-03', 'Laki - Laki', '0', 'Belum Menikah', '0', 'SMA', 'Tetap', '-', '-', '0', '6267567', 'viper@gmail.com', 'Aktif', 'SMLasasd', '2022-01-10 15:13:50', '2022-01-10 15:13:50'),
('JKT.OPS.0003', 'OP SML', 'OPERASIONAL', 'Example 1', 'A', 'A', 'A', 'A', 'AMQ', 'BSI0001', 'A', 'A', 'A', '2022-01-04', '2022-01-19', 'Laki - Laki', '123213', 'Belum Menikah', '0', 'SMA', 'Kontrak', 'AS', 'ASAS', 'ASD', '082323232323', 'ASDASD@gmail.com', 'Aktif', 'S', '2022-01-19 13:23:18', '2022-01-19 13:24:22'),
('JKT.OPS.0004', 'OP SML', 'OPERASIONAL', 'Jawa Barat', 'Viper', 'D', 'Snake', 'HEAD OFFICE CIBUBUR', 'JKT', 'SML CIbubur', '0', '', 'Olympus', '1999-07-20', '2021-04-20', 'Laki - Laki', '1231', 'Belum Menikah', '0', 'SMA', 'Tetap', '-', '-', '0', '84212312311', 'viper@gmail.com', 'Aktif', 'SMLasasd', '2022-01-19 13:28:37', '2022-01-20 09:12:52'),
('JKT.OPS.0005', 'OPS', 'OPERASIONAL', 'Example 1', 'BBBB', 'BBBB', 'BBBB', 'ADSASD', 'AMQ', 'BSI0001', '123', '132', 'ASD', '1998-01-11', '2022-01-11', 'Laki - Laki', '123123', 'Belum Menikah', '1', 'TK', 'Tetap', 'ASD', 'ASD', 'ASD', '0821231231212', 'dsf@gmail.com', 'Tidak Aktif', 'asd', '2022-01-20 09:14:54', '2022-01-20 09:14:54'),
('JKT.OPS.0006', 'asd', 'asd', 'Example 1', 'asd', 'asd', 'asd', 'asd', 'BGR', 'BSI0001', '1', '1', '1', '2022-01-10', '2022-01-20', 'Laki - Laki', '111111', 'Belum Menikah', '0', 'sma', 'Kontrak', 'as', 'as', 'as', '089121212121', 'aaaaa@gmail.com', 'Aktif', '', '2022-01-27 15:28:11', '2022-01-27 15:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `faktur`
--

CREATE TABLE `faktur` (
  `id_faktur` int(11) NOT NULL,
  `document_type` enum('Faktur/Invoice','Faktur Pajak') NOT NULL,
  `person_in_charge` varchar(255) NOT NULL,
  `position` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `office` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faktur`
--

INSERT INTO `faktur` (`id_faktur`, `document_type`, `person_in_charge`, `position`, `branch`, `office`, `createdAt`, `updatedAt`) VALUES
(1, 'Faktur/Invoice', 'Phoenix', 'KEPALA CABANG', 'BANDUNG', 'CABANG BANDUNG', '2021-12-15 15:53:55', '2021-12-15 15:53:55'),
(3, 'Faktur/Invoice', 'Camber', 'KEPALA CABANG', 'BANDUNG', 'CABANG BANDUNG', '2021-12-15 15:58:03', '2021-12-15 15:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `helper`
--

CREATE TABLE `helper` (
  `courier_code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `duty` enum('Pengantaran','Pengambilan','Pengantaran & Pengambilan','') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `helper`
--

INSERT INTO `helper` (`courier_code`, `name`, `branch`, `duty`, `createdAt`, `updatedAt`) VALUES
('7031999AA', 'Sovas', 'Jakarta', 'Pengantaran', '2021-12-15 15:09:33', '2021-12-15 15:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `roles_mapping`
--

CREATE TABLE `roles_mapping` (
  `role_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles_mapping`
--

INSERT INTO `roles_mapping` (`role_code`, `name`, `description`, `status`, `createdAt`, `updatedAt`) VALUES
('123', 'SUPER ADMIN', 'SUPER ADMIN', 'Aktif', '2021-12-21 13:39:47', '2021-12-21 13:39:47'),
('spradm', 'SUPER ADMIN', 'SUPER ADMIN', 'Aktif', '2021-12-14 15:03:17', '2021-12-14 15:16:37');

-- --------------------------------------------------------

--
-- Table structure for table `test_auth`
--

CREATE TABLE `test_auth` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `ability` text NOT NULL,
  `extras` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_auth`
--

INSERT INTO `test_auth` (`id`, `fullName`, `username`, `password`, `avatar`, `email`, `role`, `ability`, `extras`) VALUES
(1, 'Lucas Beethoven', 'lucas', '$2b$10$0G1KVIv91h0NgnXvU6QVJeD8dPjiwf.eI9luaQ9Px63hbo3eS946e', 'require(\'@/assets/images/avatars/13-small.png\')', 'admin@demo.com', 'admin', '[\r\n        {\r\n          action: \'manage\',\r\n          subject: \'all\',\r\n        },\r\n      ]', '{\r\n\r\n        eCommerceCartItemsCount: 5,\r\n\r\n      }');

-- --------------------------------------------------------

--
-- Table structure for table `test_import`
--

CREATE TABLE `test_import` (
  `nomor_kontrak` varchar(20) NOT NULL,
  `cabang` varchar(50) NOT NULL,
  `pelanggan` varchar(50) NOT NULL,
  `periode_dari` date NOT NULL,
  `periode_sampai` date NOT NULL,
  `deskripsi` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_code` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `office_code` varchar(255) DEFAULT NULL,
  `user_group` varchar(255) DEFAULT NULL,
  `id_account` varchar(10) NOT NULL,
  `id_employee` varchar(10) DEFAULT NULL,
  `multiple_login` enum('Ya','Tidak') DEFAULT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_code`, `full_name`, `password`, `branch_code`, `office_code`, `user_group`, `id_account`, `id_employee`, `multiple_login`, `company_id`, `status`, `createdAt`, `updatedAt`) VALUES
('MRDCK', 'Murdock', '$2b$10$TMAcIhnzTSWIrPGUtu1aJuv25D8f4DJSXsVzIDD7fkrPKnGQoWdwm', 'JKT', 'JKT001', 'Super Admin', '3', '3', 'Tidak', '1', 'Aktif', '2021-12-23 12:59:14', '2021-12-23 12:59:14');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_body_no` varchar(50) NOT NULL,
  `vehicle_code_no` varchar(30) DEFAULT NULL,
  `no_body` varchar(30) NOT NULL,
  `vehicle_brand` varchar(30) NOT NULL,
  `vehicle_model` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `type_code` varchar(20) DEFAULT NULL,
  `ownership_status` varchar(50) DEFAULT NULL,
  `ownership_status_code` varchar(20) DEFAULT NULL,
  `year` varchar(15) DEFAULT NULL,
  `police_no` varchar(20) NOT NULL,
  `function` text DEFAULT NULL,
  `branch` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `UpdatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`vehicle_body_no`, `vehicle_code_no`, `no_body`, `vehicle_brand`, `vehicle_model`, `type`, `type_code`, `ownership_status`, `ownership_status_code`, `year`, `police_no`, `function`, `branch`, `createdAt`, `UpdatedAt`) VALUES
('11111', '11', '111', 'e', 'r', 'd', 'f', 's', 'd', '1999', '12', 's', 'AMQ', '2022-02-03 09:47:48', '2022-02-03 09:47:48'),
('CBB01', '-', 'CBB 002', 'DAIHATSU', 'BLIND VAN', 'VAN', '-', '-', '-', '-', 'B 9862 KCE', '', 'Jakarta', '2021-12-15 15:30:06', '2021-12-15 15:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_code` varchar(20) NOT NULL,
  `vendor_account_type` enum('Port to Door','Port to Port','Vendor Udara','Vendor Darat','Vendor Laut') NOT NULL,
  `vendor_moda` enum('Udara','Darat','Laut') DEFAULT NULL,
  `vendor_name` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax_no` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `npwp` varchar(30) DEFAULT NULL,
  `contract_name` varchar(50) DEFAULT NULL,
  `contact_job` varchar(30) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `contact_email` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_code`, `vendor_account_type`, `vendor_moda`, `vendor_name`, `branch`, `address`, `city`, `postal_code`, `phone`, `fax_no`, `email`, `website`, `npwp`, `contract_name`, `contact_job`, `contact_phone`, `contact_email`, `createdAt`, `updatedAt`) VALUES
('13222', 'Vendor Darat', 'Darat', 'aaa', 'Ambon', 'aaa', 'Example 1', '15312', '081231231212', '1212', 'asdasddsa@student.id', 'www.a.com', '123', 'asd', 'asd', '08123123123', 'asd@gmail.com', '2022-02-03 16:56:54', '2022-02-03 16:56:54'),
('BDJV00050', 'Port to Door', 'Udara', 'BORNEO ARTA MANDIRI- BANJARMASIN', 'Bogor', 'JL Olympus', 'Example 1', '12323', '082132123123', '1', 'olym@gmail.com', 'www.sdsd.com', '15454234', 'Zeus', 'A', '081231231231', 'zeus@gmail.com', '2022-01-19 11:55:45', '2022-02-03 16:11:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_code`);

--
-- Indexes for table `branch_office`
--
ALTER TABLE `branch_office`
  ADD PRIMARY KEY (`office_code`);

--
-- Indexes for table `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`courier_code`);

--
-- Indexes for table `coverage_area`
--
ALTER TABLE `coverage_area`
  ADD PRIMARY KEY (`city_code`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_code`);

--
-- Indexes for table `customer_contract`
--
ALTER TABLE `customer_contract`
  ADD PRIMARY KEY (`contract_number`);

--
-- Indexes for table `email_customer`
--
ALTER TABLE `email_customer`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `email_customer_invalid`
--
ALTER TABLE `email_customer_invalid`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_code`);

--
-- Indexes for table `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`id_faktur`);

--
-- Indexes for table `helper`
--
ALTER TABLE `helper`
  ADD PRIMARY KEY (`courier_code`);

--
-- Indexes for table `roles_mapping`
--
ALTER TABLE `roles_mapping`
  ADD PRIMARY KEY (`role_code`);

--
-- Indexes for table `test_auth`
--
ALTER TABLE `test_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_import`
--
ALTER TABLE `test_import`
  ADD PRIMARY KEY (`nomor_kontrak`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_code`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicle_body_no`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `email_customer`
--
ALTER TABLE `email_customer`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=933;

--
-- AUTO_INCREMENT for table `email_customer_invalid`
--
ALTER TABLE `email_customer_invalid`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=932;

--
-- AUTO_INCREMENT for table `faktur`
--
ALTER TABLE `faktur`
  MODIFY `id_faktur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
