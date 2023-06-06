-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2021 at 06:41 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ctt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super@admin.com', '$2y$04$xjUrUueX1ZrTGffLOvR4RuepA3JbmdmDItQXgx2BbDx5GJF4YkNHO', 1, 'FUbLHTCbRJ3I4OgF7P2NByWZbsiWL1ImGeMKDzHjYjwxJJaU9BLiAasas73C', '2019-06-14 10:07:17', '2019-06-14 10:07:17'),
(2, 'admin', 'bgnbgn.com@gmail.com', '$2y$10$ngo2d7SVSLP0bpZ/eaE7nuQ5w36sLBMQHAI/S/sQRkh7LF2EngJ06', 1, 'FoDcyEMnspwA3SssZfhYK7Jyb5cgffg5tcOTPS97ykF5pZ6tADl0MHBnfTd2', '2019-06-14 10:10:55', '2019-06-14 10:22:41'),
(3, 'bgn', 'bgnbgncom@gmail.com', '$2y$10$1D1H2Ze32EqSV.lsPQNftO6FEh7.KtKtpSV9SiySAcnHQ9cOjvp9a', 1, 'egjrbtFsIHxGBzmNTaCZUFwAoMAYMazw5CBilfPYgTZQjYfbKJtJkKzf9g1Z', '2019-06-14 10:26:31', '2019-06-14 10:29:45'),
(4, 'Dharshan', 'receptionist@admin.com', '$2y$10$DhgeIZbstJmDmmCt/IT85ONWzzYphC/pdt5XgYyqONeiLuvCR6Prm', 1, NULL, '2020-02-01 06:09:30', '2020-02-01 06:10:30'),
(5, 'Shalini', 'receptionist1@admin.com', '$2y$10$MBfhtpdRyrA/fzzPBf6G6.kw5egs5MuDllYAtoAyJURMJMYgS9TPG', 1, NULL, '2020-02-01 06:12:42', '2020-02-01 06:12:49');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`id`, `role_id`, `admin_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 3),
(4, 2, 3),
(5, 2, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(10) NOT NULL,
  `package_id` int(10) NOT NULL,
  `date` varchar(20) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `no_of_peoples` varchar(100) DEFAULT NULL,
  `total` int(10) DEFAULT NULL,
  `booking_status` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `package_id`, `date`, `username`, `no_of_peoples`, `total`, `booking_status`, `created_at`, `updated_at`) VALUES
(1, 2, '30/01/2020', 'raujan765@gmail.com', '4', 20000, 'pending', '2020-01-30 15:36:37', '2020-01-30 15:36:37'),
(2, 2, '31/01/2020', 'nethra89@gmail.com', '5', 25000, 'paid', '2020-01-30 22:14:45', '2020-02-01 14:52:32'),
(3, 2, '06/01/2020', 'ayeshaperera@yahoo.com', '1', 5000, 'paid', '2020-01-31 02:02:08', '2020-01-31 02:02:08'),
(4, 2, '17/06/2020', 'bgnbgn.com@gmail.com', '7', 35000, 'pending_payments', '2020-01-31 17:29:28', '2020-11-19 19:37:02'),
(5, 1, '27/02/2020', 'sujee1812@gmail.com', '5', 1500, 'canceled', '2020-02-01 23:13:27', '2020-11-19 19:37:28'),
(6, 2, '12/08/2020', 'sujee1812@gmail.com', '4', 20000, 'canceled', '2020-02-02 00:34:16', '2020-02-02 00:38:51'),
(7, 1, '03/02/2020', 'sujee1812@gmail.com', '5', 1500, 'pending_payments', '2020-02-02 09:33:42', '2020-11-19 19:36:53');

-- --------------------------------------------------------

--
-- Table structure for table `country_list`
--

CREATE TABLE `country_list` (
  `id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `country_code` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_list`
--

INSERT INTO `country_list` (`id`, `country`, `country_code`) VALUES
(1, 'Afghanistan', 'af'),
(2, 'Aland Islands', 'ax'),
(3, 'Albania', 'al'),
(4, 'Algeria', 'dz'),
(5, 'American Samoa', 'as'),
(6, 'Andorra', 'ad'),
(7, 'Angola', 'ao'),
(8, 'Anguilla', 'ai'),
(9, 'Antarctica', 'aq'),
(10, 'Antigua and Barbuda', 'ag'),
(11, 'Argentina', 'ar'),
(12, 'Armenia', 'am'),
(13, 'Aruba', 'aw'),
(14, 'Australia', 'au'),
(15, 'Austria', 'at'),
(16, 'Azerbaijan', 'az'),
(17, 'Bahamas', 'bs'),
(18, 'Bahrain', 'bh'),
(19, 'Bangladesh', 'bd'),
(20, 'Barbados', 'bb'),
(21, 'Belarus', 'by'),
(22, 'Belgium', 'be'),
(23, 'Belize', 'bz'),
(24, 'Benin', 'bj'),
(25, 'Bermuda', 'bm'),
(26, 'Bhutan', 'bt'),
(27, 'Bolivia (Plurinational State of)', 'bo'),
(28, 'Bonaire, Sint Eustatius and Saba', 'bq'),
(29, 'Bosnia and Herzegovina', 'ba'),
(30, 'Botswana', 'bw'),
(31, 'Bouvet Island', 'bv'),
(32, 'Brazil', 'br'),
(33, 'British Indian Ocean Territory', 'io'),
(34, 'Brunei Darussalam', 'bn'),
(35, 'Bulgaria', 'bg'),
(36, 'Burkina Faso', 'bf'),
(37, 'Burundi', 'bi'),
(38, 'Cabo Verde', 'cv'),
(39, 'Cambodia', 'kh'),
(40, 'Cameroon', 'cm'),
(41, 'Canada', 'ca'),
(42, 'Cayman Islands', 'ky'),
(43, 'Central African Republic', 'cf'),
(44, 'Chad', 'td'),
(45, 'Chile', 'cl'),
(46, 'China', 'cn'),
(47, 'Christmas Island', 'cx'),
(48, 'Cocos (Keeling) Islands', 'cc'),
(49, 'Colombia', 'co'),
(50, 'Comoros', 'km'),
(51, 'Congo', 'cg'),
(52, 'Congo, Democratic Republic of the', 'cd'),
(53, 'Cook Islands', 'ck'),
(54, 'Costa Rica', 'cr'),
(55, 'Côte d\'Ivoire', 'ci'),
(56, 'Croatia', 'hr'),
(57, 'Cuba', 'cu'),
(58, 'Curaçao', 'cw'),
(59, 'Cyprus', 'cy'),
(60, 'Czechia', 'cz'),
(61, 'Denmark', 'dk'),
(62, 'Djibouti', 'dj'),
(63, 'Dominica', 'dm'),
(64, 'Dominican Republic', 'do'),
(65, 'Ecuador', 'ec'),
(66, 'Egypt', 'eg'),
(67, 'El Salvador', 'sv'),
(68, 'Equatorial Guinea', 'gq'),
(69, 'Eritrea', 'er'),
(70, 'Estonia', 'ee'),
(71, 'Eswatini', 'sz'),
(72, 'Ethiopia', 'et'),
(73, 'Falkland Islands (Malvinas)', 'fk'),
(74, 'Faroe Islands', 'fo'),
(75, 'Fiji', 'fj'),
(76, 'Finland', 'fi'),
(77, 'France', 'fr'),
(78, 'French Guiana', 'gf'),
(79, 'French Polynesia', 'pf'),
(80, 'French Southern Territories', 'tf'),
(81, 'Gabon', 'ga'),
(82, 'Gambia', 'gm'),
(83, 'Georgia', 'ge'),
(84, 'Germany', 'de'),
(85, 'Ghana', 'gh'),
(86, 'Gibraltar', 'gi'),
(87, 'Greece', 'gr'),
(88, 'Greenland', 'gl'),
(89, 'Grenada', 'gd'),
(90, 'Guadeloupe', 'gp'),
(91, 'Guam', 'gu'),
(92, 'Guatemala', 'gt'),
(93, 'Guernsey', 'gg'),
(94, 'Guinea', 'gn'),
(95, 'Guinea-Bissau', 'gw'),
(96, 'Guyana', 'gy'),
(97, 'Haiti', 'ht'),
(98, 'Heard Island and McDonald Islands', 'hm'),
(99, 'Holy See', 'va'),
(100, 'Honduras', 'hn'),
(101, 'Hong Kong', 'hk'),
(102, 'Hungary', 'hu'),
(103, 'Iceland', 'is'),
(104, 'India', 'in'),
(105, 'Indonesia', 'id'),
(106, 'Iran (Islamic Republic of)', 'ir'),
(107, 'Iraq', 'iq'),
(108, 'Ireland', 'ie'),
(109, 'Isle of Man', 'im'),
(110, 'Israel', 'il'),
(111, 'Italy', 'it'),
(112, 'Jamaica', 'jm'),
(113, 'Japan', 'jp'),
(114, 'Jersey', 'je'),
(115, 'Jordan', 'jo'),
(116, 'Kazakhstan', 'kz'),
(117, 'Kenya', 'ke'),
(118, 'Kiribati', 'ki'),
(119, 'Korea (Democratic People\'s Republic of)', 'kp'),
(120, 'Korea, Republic of', 'kr'),
(121, 'Kuwait', 'kw'),
(122, 'Kyrgyzstan', 'kg'),
(123, 'Lao People\'s Democratic Republic', 'la'),
(124, 'Latvia', 'lv'),
(125, 'Lebanon', 'lb'),
(126, 'Lesotho', 'ls'),
(127, 'Liberia', 'lr'),
(128, 'Libya', 'ly'),
(129, 'Liechtenstein', 'li'),
(130, 'Lithuania', 'lt'),
(131, 'Luxembourg', 'lu'),
(132, 'Macao', 'mo'),
(133, 'Madagascar', 'mg'),
(134, 'Malawi', 'mw'),
(135, 'Malaysia', 'my'),
(136, 'Maldives', 'mv'),
(137, 'Mali', 'ml'),
(138, 'Malta', 'mt'),
(139, 'Marshall Islands', 'mh'),
(140, 'Martinique', 'mq'),
(141, 'Mauritania', 'mr'),
(142, 'Mauritius', 'mu'),
(143, 'Mayotte', 'yt'),
(144, 'Mexico', 'mx'),
(145, 'Micronesia (Federated States of)', 'fm'),
(146, 'Moldova, Republic of', 'md'),
(147, 'Monaco', 'mc'),
(148, 'Mongolia', 'mn'),
(149, 'Montenegro', 'me'),
(150, 'Montserrat', 'ms'),
(151, 'Morocco', 'ma'),
(152, 'Mozambique', 'mz'),
(153, 'Myanmar', 'mm'),
(154, 'Namibia', 'na'),
(155, 'Nauru', 'nr'),
(156, 'Nepal', 'np'),
(157, 'Netherlands', 'nl'),
(158, 'New Caledonia', 'nc'),
(159, 'New Zealand', 'nz'),
(160, 'Nicaragua', 'ni'),
(161, 'Niger', 'ne'),
(162, 'Nigeria', 'ng'),
(163, 'Niue', 'nu'),
(164, 'Norfolk Island', 'nf'),
(165, 'North Macedonia', 'mk'),
(166, 'Northern Mariana Islands', 'mp'),
(167, 'Norway', 'no'),
(168, 'Oman', 'om'),
(169, 'Pakistan', 'pk'),
(170, 'Palau', 'pw'),
(171, 'Palestine, State of', 'ps'),
(172, 'Panama', 'pa'),
(173, 'Papua New Guinea', 'pg'),
(174, 'Paraguay', 'py'),
(175, 'Peru', 'pe'),
(176, 'Philippines', 'ph'),
(177, 'Pitcairn', 'pn'),
(178, 'Poland', 'pl'),
(179, 'Portugal', 'pt'),
(180, 'Puerto Rico', 'pr'),
(181, 'Qatar', 'qa'),
(182, 'Réunion', 're'),
(183, 'Romania', 'ro'),
(184, 'Russian Federation', 'ru'),
(185, 'Rwanda', 'rw'),
(186, 'Saint Barthélemy', 'bl'),
(187, 'Saint Helena, Ascension and Tristan da Cunha', 'sh'),
(188, 'Saint Kitts and Nevis', 'kn'),
(189, 'Saint Lucia', 'lc'),
(190, 'Saint Martin (French part)', 'mf'),
(191, 'Saint Pierre and Miquelon', 'pm'),
(192, 'Saint Vincent and the Grenadines', 'vc'),
(193, 'Samoa', 'ws'),
(194, 'San Marino', 'sm'),
(195, 'Sao Tome and Principe', 'st'),
(196, 'Saudi Arabia', 'sa'),
(197, 'Senegal', 'sn'),
(198, 'Serbia', 'rs'),
(199, 'Seychelles', 'sc'),
(200, 'Sierra Leone', 'sl'),
(201, 'Singapore', 'sg'),
(202, 'Sint Maarten (Dutch part)', 'sx'),
(203, 'Slovakia', 'sk'),
(204, 'Slovenia', 'si'),
(205, 'Solomon Islands', 'sb'),
(206, 'Somalia', 'so'),
(207, 'South Africa', 'za'),
(208, 'South Georgia and the South Sandwich Islands', 'gs'),
(209, 'South Sudan', 'ss'),
(210, 'Spain', 'es'),
(211, 'Sri Lanka', 'lk'),
(212, 'Sudan', 'sd'),
(213, 'Suriname', 'sr'),
(214, 'Svalbard and Jan Mayen', 'sj'),
(215, 'Sweden', 'se'),
(216, 'Switzerland', 'ch'),
(217, 'Syrian Arab Republic', 'sy'),
(218, 'Taiwan, Province of China', 'tw'),
(219, 'Tajikistan', 'tj'),
(220, 'Tanzania, United Republic of', 'tz'),
(221, 'Thailand', 'th'),
(222, 'Timor-Leste', 'tl'),
(223, 'Togo', 'tg'),
(224, 'Tokelau', 'tk'),
(225, 'Tonga', 'to'),
(226, 'Trinidad and Tobago', 'tt'),
(227, 'Tunisia', 'tn'),
(228, 'Turkey', 'tr'),
(229, 'Turkmenistan', 'tm'),
(230, 'Turks and Caicos Islands', 'tc'),
(231, 'Tuvalu', 'tv'),
(232, 'Uganda', 'ug'),
(233, 'Ukraine', 'ua'),
(234, 'United Arab Emirates', 'ae'),
(235, 'United Kingdom', 'gb'),
(236, 'United States Minor Outlying Islands', 'um'),
(237, 'United States of America', 'us'),
(238, 'Uruguay', 'uy'),
(239, 'Uzbekistan', 'uz'),
(240, 'Vanuatu', 'vu'),
(241, 'Venezuela (Bolivarian Republic of)', 've'),
(242, 'Viet Nam', 'vn'),
(243, 'Virgin Islands (British)', 'vg'),
(244, 'Virgin Islands (U.S.)', 'vi'),
(245, 'Wallis and Futuna', 'wf'),
(246, 'Western Sahara', 'eh'),
(247, 'Yemen', 'ye'),
(248, 'Zambia', 'zm'),
(249, 'Zimbabwe', 'zw');

-- --------------------------------------------------------

--
-- Table structure for table `home_slider`
--

CREATE TABLE `home_slider` (
  `id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `home_slider`
--

INSERT INTO `home_slider` (`id`, `image`, `sort`, `caption`, `created_at`, `updated_at`) VALUES
(6, 'slider_6.jpg', NULL, NULL, '2019-06-28 21:38:02', '2019-06-28 21:38:02'),
(5, 'slider_5.jpg', NULL, NULL, '2019-06-28 21:37:51', '2019-06-28 21:37:51'),
(3, 'slider_3.jpg', NULL, NULL, '2019-06-28 20:28:03', '2019-06-28 20:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `members_details`
--

CREATE TABLE `members_details` (
  `id` int(20) NOT NULL,
  `email` varchar(191) NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `middle_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postcode` int(10) DEFAULT 0,
  `country` varchar(100) DEFAULT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `phone_no` varchar(60) DEFAULT NULL,
  `whatsapp_no` varchar(20) DEFAULT NULL,
  `dob` varchar(15) DEFAULT NULL,
  `nic` varchar(100) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `organization` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members_details`
--

INSERT INTO `members_details` (`id`, `email`, `first_name`, `middle_name`, `last_name`, `address`, `address2`, `city`, `state`, `postcode`, `country`, `country_code`, `phone_no`, `whatsapp_no`, `dob`, `nic`, `profession`, `organization`, `created_at`, `updated_at`) VALUES
(1, 'bgnbgncom@gmail.com', 'bgn', '', 'b', '\"Vasantham\" 220, Dunbar Road,', '', 'Hatton', 'Central', 0, 'Sri Lanka', 'lk', '', '', '', '480415051V', '', '', '2019-06-16 09:29:57', '2019-06-16 09:29:57'),
(2, 'bgnbgn.com@gmail.com', 'Shanthakuamar', '', 'Arumugam', '448, Main Street,', '', 'Dickoya', 'Central', 0, 'Sri Lanka', 'lk', '', '', '', '703210350V', '', '', '2019-06-16 09:29:57', '2019-06-16 09:29:57'),
(3, 'bgn.bgncom@gmail.com', 'Nadarajah', '', 'K', '29, Kandiah Building, Fruithill,', '', 'Hatton', 'Central', 0, 'Sri Lanka', 'lk', '', '', '', '570633163X', '', '', '2019-06-16 09:29:57', '2019-06-16 09:29:57'),
(4, 'bgn.bgn.com@gmail.com', 'Durairaj', '', 'Suppan', '6, New Rothas Fruithill,', '', 'Hatton', 'Central', 0, 'Sri Lanka', 'lk', '', '', '', '580970885V', '', '', '2019-06-16 09:29:57', '2019-06-16 09:29:57'),
(401, 'bgnbgn.com123@gmail.com', 'Gunenthiran.B', '', NULL, 'Dunbar Division,Dickoya', NULL, 'Dickoya', NULL, 22050, 'Sri Lanka', 'lk', '0756279621', NULL, '123', NULL, NULL, NULL, '2020-02-01 14:46:10', '2020-02-01 14:46:10'),
(402, 'sujee1812@gmail.com', 'sujee', '', 'balan', '929 wattala', NULL, NULL, NULL, NULL, 'United States of America', 'us', '0094755843308', NULL, '1980-12-18', NULL, NULL, NULL, '2020-02-01 17:35:12', '2020-02-01 17:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_06_13_194617_create_admin_table', 2),
(4, '2017_03_06_023521_create_admins_table', 3),
(5, '2017_03_06_053834_create_admin_role_table', 3),
(6, '2018_03_06_023523_create_roles_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `sub_title` varchar(200) DEFAULT NULL,
  `homepage_description` varchar(200) DEFAULT NULL,
  `show_in_home` tinyint(1) DEFAULT 0,
  `description` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `days` varchar(200) DEFAULT NULL,
  `per_amount` int(10) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `sub_title`, `homepage_description`, `show_in_home`, `description`, `image`, `days`, `per_amount`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'Discover Sri Lanka', '-', '30 Days', 1, '<p>Discover Sri Lanka</p>', 'package_1.png', '30Days', 300, NULL, NULL, '2020-02-02 09:40:02'),
(2, 'Sri Lanka Classic Tour', '2', '5 Days', NULL, '<div class=\"mb-5\" data-automation=\"pdp-overview\">\r\n<div class=\"row no-gutters align-items-baseline mb-3\">\r\n<div class=\"col\">\r\n<h2 class=\"font-weight-medium mb-0\">Overview</h2>\r\n</div>\r\n</div>\r\n\r\n<div>\r\n<div class=\"mb-3\">Sri Lanka&rsquo;s Udawalawe National Park&nbsp;is situated near to Ella, but getting there&nbsp;by yourself means using cabs or limited public bus services. This private tour makes it easy, and includes a 4x4 game drive to look for Udawalawe&rsquo;s elephants, crocodiles, and other wildlife. A choice of safari times provides flexibility, and there&rsquo;s an optional elephant orphanage visit (own expense) en route&mdash;difficult to add if traveling independently.</div>\r\n</div>\r\n\r\n<ul class=\"vcs-highlights\">\r\n	<li>Watch for wildlife on a 4x4 safari in Udawalawe National Park from Ella</li>\r\n	<li>Skip cabs and public buses for smooth travel by private air-conditioned car</li>\r\n	<li>Guided game drive to look for elephants, crocs, deer, and other animals</li>\r\n	<li>Choice of departures, plus optional elephant orphanage stop (own cost)</li>\r\n</ul>\r\n</div>\r\n\r\n<hr class=\"mt-2\" />\r\n<h2 class=\"font-weight-medium mb-0\">Additional Info</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div class=\"collapse show\" id=\"collapseAdditionalInfo\" style=\"\">\r\n<div class=\"expandable-content mb-4\">\r\n<ul class=\"vcs-additional-info\">\r\n	<li>Confirmation will be received within 48 hours of booking, subject to availability</li>\r\n	<li>Not wheelchair accessible</li>\r\n	<li>A minimum of 2 people per booking is required</li>\r\n	<li>A maximum of 10 people per booking</li>\r\n	<li>Minimum age is 6 years</li>\r\n	<li>Please Note that, if you are looking forward to dropping off at another location instead original picked up location after the safari, might be additionally changed according to the Distance from Udawalawa National Park.</li>\r\n	<li>Infants must sit on laps</li>\r\n	<li>Most travelers can participate</li>\r\n	<li>This is a private tour/activity. Only your group will participate</li>\r\n</ul>\r\n</div>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr class=\"mt-2\" />\r\n<h2 class=\"font-weight-medium mb-0\">Cancellation Policy</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div class=\"expandable-content mb-4\">\r\n<p>For a full refund, cancel at least 24 hours in advance of the start date of the experience.&nbsp;<a class=\"learn_more_cancellations\" href=\"/help/articles/cancellation-policy\" target=\"_blank\">Learn more</a> about cancellations.</p>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr class=\"mt-2\" />', 'background2.jpg', '5 Days', 5000, NULL, NULL, '2020-01-30 00:15:50'),
(3, 'Sri Lanka Classic Tour', NULL, '15 Days', 0, NULL, 'background3.jpg', '15 Days', NULL, NULL, NULL, NULL),
(4, 'Up Country', NULL, '10 Days', 0, NULL, 'background5.jpg', '10 Days', NULL, NULL, NULL, NULL),
(5, 'Sri Lanka Classic Tour', NULL, '7 Days', 0, NULL, 'background3.jpg', '7 Days', NULL, NULL, NULL, NULL),
(6, 'Up Country', NULL, '5 Days', 0, NULL, 'background5.jpg', '5 Days', NULL, NULL, NULL, NULL),
(7, 'Sri Lanka Classic Tour', NULL, '25 Days', 0, NULL, 'background2.jpg', '	\r\n25 Days', NULL, NULL, NULL, NULL),
(8, 'Discover Sri Lanka', NULL, '12 Days', 0, 'Discover Sri Lanka', 'background1.jpg', '12 Days', 200, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_photos`
--

CREATE TABLE `package_photos` (
  `photo_id` int(100) NOT NULL,
  `package_id` int(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package_photos`
--

INSERT INTO `package_photos` (`photo_id`, `package_id`, `image`, `size`, `sort`, `created_at`, `updated_at`) VALUES
(71, 2, 'img_71.jpg', '569x373', NULL, '2020-01-30 01:13:03', '2020-01-30 01:13:03'),
(67, 2, 'img_67.jpg', '569x373', NULL, '2020-01-30 01:12:11', '2020-01-30 01:12:12'),
(68, 2, 'img_68.jpg', '576x384', NULL, '2020-01-30 01:12:17', '2020-01-30 01:12:17'),
(69, 2, 'img_69.jpg', '576x384', NULL, '2020-01-30 01:12:23', '2020-01-30 01:12:23'),
(63, 1, 'img_63.jpg', '576x384', NULL, '2020-01-30 01:10:35', '2020-01-30 01:10:35'),
(64, 1, 'img_64.jpg', '576x384', NULL, '2020-01-30 01:10:45', '2020-01-30 01:10:45'),
(65, 1, 'img_65.jpg', '1500x647', NULL, '2020-01-30 01:10:52', '2020-01-30 01:10:53'),
(66, 1, 'img_66.jpg', '569x373', NULL, '2020-01-30 01:10:59', '2020-01-30 01:10:59'),
(50, 3, 'img_50.JPG', '960x540', NULL, '2019-06-29 03:42:22', '2019-06-29 03:42:22'),
(51, 3, 'img_51.JPG', '960x718', NULL, '2019-06-29 03:42:28', '2019-06-29 03:42:28'),
(52, 3, 'img_52.JPG', '912x670', NULL, '2019-06-29 03:42:36', '2019-06-29 03:42:36'),
(53, 3, 'img_53.JPG', '960x541', NULL, '2019-06-29 03:42:42', '2019-06-29 03:42:42'),
(54, 3, 'img_54.JPG', '591x960', NULL, '2019-06-29 03:42:49', '2019-06-29 03:42:49'),
(55, 3, 'img_55.JPG', '605x960', NULL, '2019-06-29 03:42:55', '2019-06-29 03:42:55'),
(56, 3, 'img_56.JPG', '960x686', NULL, '2019-06-29 03:43:02', '2019-06-29 03:43:02'),
(57, 3, 'img_57.JPG', '589x960', NULL, '2019-06-29 03:43:08', '2019-06-29 03:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `page_name` varchar(100) NOT NULL,
  `pdf_file` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_name`, `pdf_file`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ppa_history', NULL, '<p>The PPA Consists of many generations of old &amp; young Highlanders from all over the island and also from many overseas countries. The Association is run by an Executive Committee, which is elected biennially at the Annual General Meeting (AGM). It provides an opportunity for Highlanders to remember their old days with school and friends and support many development activities of the college.<br />\r\n<br />\r\nHighlands College produced countries many top ranked officials, politicians and professionals and now it is high time to increase the numbers of the intellectual to a higher side. As past Highlanders we have gathered under one common umbrella that is the &ldquo;Past Pupils Association&rdquo; to enhance the productivity and performances of the present students. The Executive committee of the body contains a mix of experienced and youth collaboration with good education background and personal relationship skills. As a Highlander it is our utmost duty &ldquo;to serve the school we love so well&rdquo;. The prime mission of the present Exco of the PPA is to support the school in many different ways and enhance the education standards of the students and to provide superior infrastructure facilities to the school which match with other high quality schools in this country. Further we will work hard to implement and introduce new technology developments to the school.<br />\r\n<br />\r\nThe PPA is the ideal pathway for those who wish to give something back to the College. With all of your helping hands we can do better.</p>', NULL, '2019-06-24 23:44:09'),
(2, 'ppa_constitution', 'ppa_constitution_1561577964.pdf', NULL, NULL, '2019-06-27 01:09:24'),
(3, 'ppa_minutes', 'ppa_minutes_1561647133.pdf', NULL, NULL, '2019-06-27 20:22:13'),
(4, 'school_history', NULL, '<p>In the 16th century, when Sri Lanka fell under Portuguese control, Portuguese missionary groups set up a number of schools in Sri Lanka to promote Roman Catholicism. In the following century, when the Dutch captured the island, they introduced a Christian primary school system, which flourished for about a hundred years. The British took over the country in the late 18th century, and they proceeded to change the medium of instruction in Christian missionary schools to English language.<br />\r\n<br />\r\nIn Sri Lanka, many institutes were started due to religious purpose. Methodist Church, Roman Catholic Church, St Joseph&rsquo;s Church and Anglican Church played an important role. These institutes started many schools in Sri Lanka. Highlands College is one such an institutes which is famous in Sri Lanka<br />\r\n<br />\r\nIn such manner Highlands College was started in Hatton, which is an ancient city in the upcountry. It was started by the Hatton Methodist Mission.<br />\r\n<br />\r\nIn Sri Lanka, railway service was commenced in 1858 and in Hatton in 1884 June 04th. During this Period Mr. Bait (W.M.O) was in charge of the Hatton Railway service and in a part of the railway building Hatton Methodist Church services were carried out. In1889, a separate land was bought by Hatton Methodist Mission and a building was constructed.<br />\r\n<br />\r\nIn 1892, Mrs. Bait started an evening / night school for small children and taught English for a few students. When time passed, the number of students increased, so she started a school in a nearby church. We understand that school work was carried out in the week days and church work was done during the weekends.<br />\r\n<br />\r\nIn the meantime, number of Tamil students increased, so it was inevitable to leave the church premises and build a separate Tamil school. Later it grew and became Highlands College.<br />\r\n<br />\r\n<a href=\"/articles/articles\">Read more &gt;&gt;</a></p>', NULL, '2019-06-27 21:15:45'),
(5, 'academic', NULL, '<div class=\"row\">\r\n        \r\n        <div class=\"col-md-12\">\r\n                <h5 class=\"mb-1\">School Teachers - 2019</h5>\r\n            <div class=\"card bg-dark text-white\">\r\n                <img class=\"card-img\" src=\"/images/acadamics/img01.jpeg\" alt=\"Card image\">\r\n                <div class=\"card-img-overlay\">\r\n                    <h5 class=\"card-title\"></h5>\r\n                    \r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <br>\r\n    <br>\r\n    <div class=\"row\">\r\n            \r\n            <div class=\"col-md-12\">\r\n                <h5 class=\"mb-1\">Students - 2019</h5>\r\n                <div class=\"card bg-dark text-white\">\r\n                    <img class=\"card-img\" src=\"/images/acadamics/img02.jpeg\" alt=\"Card image\">\r\n                    <div class=\"card-img-overlay\">\r\n                        <h5 class=\"card-title\"></h5>\r\n                        \r\n                    </div>\r\n                </div>\r\n            </div>\r\n    </div>\r\n\r\n    <br>\r\n    <br>\r\n    <div class=\"row\">\r\n            <div class=\"col-md-12\">\r\n                <h5 class=\"mb-1\">Grade - 5 Achievements</h5>\r\n                <div class=\"card bg-dark text-white\">\r\n                    <img class=\"card-img\" src=\"/images/acadamics/img03.jpeg\" alt=\"Card image\">\r\n                    <div class=\"card-img-overlay\">\r\n                        <h5 class=\"card-title\"></h5>\r\n                        \r\n                    </div>\r\n                </div>\r\n            </div>\r\n    </div>\r\n\r\n    <br>\r\n    <br>\r\n    <div class=\"row\">\r\n            <div class=\"col-md-12\">\r\n                <h5 class=\"mb-1\">G.C.E O/L - Results</h5>\r\n                <div class=\"card bg-dark text-white\">\r\n                    <img class=\"card-img\" src=\"/images/acadamics/img04.jpeg\" alt=\"Card image\">\r\n                    <div class=\"card-img-overlay\">\r\n                        <h5 class=\"card-title\"></h5>\r\n                        \r\n                    </div>\r\n                </div>\r\n            </div>\r\n    </div>\r\n\r\n\r\n    <br>\r\n    <br>\r\n    <div class=\"row\">\r\n            <div class=\"col-md-12\">\r\n                <h5 class=\"mb-1\">G.C.E A/L - Results</h5>\r\n                <div class=\"card bg-dark text-white\">\r\n                    <img class=\"card-img\" src=\"/images/acadamics/img05.jpeg\" alt=\"Card image\">\r\n                    <div class=\"card-img-overlay\">\r\n                        <h5 class=\"card-title\"></h5>\r\n                        \r\n                    </div>\r\n                </div>\r\n            </div>\r\n    </div>', NULL, '2019-06-27 21:14:06'),
(6, 'articles', 'articles_1561651425.pdf', NULL, NULL, '2019-06-27 21:33:45'),
(7, 'magazine', 'magazine_1561652071.pdf', NULL, NULL, '2019-06-27 21:44:31'),
(8, 'vacancies', NULL, '<div class=\"card bg-dark text-white\">\r\n        <img class=\"card-img\" src=\"/images/vacancy/Vacancy_PPA.jpg\" alt=\"Card image\">\r\n        <div class=\"card-img-overlay\">\r\n          <h5 class=\"card-title\">Vacancy</h5>\r\n          \r\n        </div>\r\n      </div>', NULL, '2019-06-27 22:18:51');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(191) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(8, 'bgnbgn.com@gmail.com', '$2y$10$Bs4xX2ANGxDwIkym29j./O.WC4aBMr9qKp.JMhVkIwnn0GKyWbkfu', '2020-01-30 09:24:16');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(10) NOT NULL,
  `booking_id` int(10) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `booking_id`, `date`, `amount`, `created_at`, `updated_at`) VALUES
(1, 2, '2019-12-08', '2200', '2020-02-01 14:51:11', '2020-02-01 14:51:11'),
(2, 3, '2020-01-15', '1800', '2020-02-01 14:52:32', '2020-02-01 14:52:32'),
(3, 1, '2020-02-01', '500', '2020-02-01 14:52:32', '2020-02-01 14:52:32'),
(4, 4, '2020-02-01', '1500', '2020-02-01 14:52:32', '2020-02-01 14:52:32'),
(5, 1, '2019-12-24', '1250', '2020-02-01 14:52:32', '2020-02-01 14:52:32'),
(6, 4, '2019-11-06', '950', '2020-02-01 14:52:32', '2020-02-01 14:52:32'),
(7, 4, '2020-02-01', '2', '2020-02-01 17:44:01', '2020-02-01 17:44:01'),
(8, 4, '2020-02-01', '2', '2020-02-01 18:06:31', '2020-02-01 18:06:31'),
(9, 4, '2020-02-01', '2', '2020-02-01 18:07:43', '2020-02-01 18:07:43'),
(10, 6, '2020-02-02', '2', '2020-02-02 00:36:59', '2020-02-02 00:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `registration_request`
--

CREATE TABLE `registration_request` (
  `id` int(20) NOT NULL,
  `request_id` varchar(100) DEFAULT NULL,
  `membership_id` varchar(191) DEFAULT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postcode` int(10) DEFAULT 0,
  `country` varchar(100) DEFAULT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `whatsapp_no` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` varchar(15) DEFAULT NULL,
  `nic` varchar(100) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `organization` varchar(191) DEFAULT NULL,
  `admission_year` int(10) DEFAULT 0,
  `admission_grade` varchar(10) DEFAULT NULL,
  `leaving_year` int(4) DEFAULT 0,
  `last_grade_study` varchar(10) DEFAULT NULL,
  `student_admission_no` varchar(10) DEFAULT NULL,
  `extra_activity` text DEFAULT NULL,
  `profile_photo` varchar(100) DEFAULT NULL,
  `payment_photo` varchar(100) DEFAULT NULL,
  `leaving_cert_photo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_method` varchar(10) DEFAULT NULL,
  `login_id` varchar(100) DEFAULT NULL,
  `login_token` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration_request`
--

INSERT INTO `registration_request` (`id`, `request_id`, `membership_id`, `first_name`, `last_name`, `address`, `address2`, `city`, `state`, `postcode`, `country`, `country_code`, `phone_no`, `whatsapp_no`, `email`, `dob`, `nic`, `profession`, `organization`, `admission_year`, `admission_grade`, `leaving_year`, `last_grade_study`, `student_admission_no`, `extra_activity`, `profile_photo`, `payment_photo`, `leaving_cert_photo`, `created_at`, `approved`, `updated_at`, `login_method`, `login_id`, `login_token`) VALUES
(10, '1560680996', 'PPALM501', 'Kandiah', 'Gangaiveniyan', 'No. 63,', 'Wattegedara Road,', 'Maharagama.', 'Western', 10280, 'Sri Lanka', 'lk', '+94777675847', '+94777675847', 'gangaiveniyan@yahoo.com', '1984-12-26', '843610226V', 'Manager', 'W.U.Seneviratne & Company (Pvt) Ltd', 1990, '1', 2003, '13', '11894', 'College Prefect', 'profile_1560680996.jpeg', 'payment_1560680996.jpeg', 'leavingCert_1560680996.jpeg', '2019-06-16 14:59:57', 1, '2019-06-26 06:20:33', NULL, NULL, NULL),
(12, '1560876749', NULL, 'Derickson', 'Rohan', '170/17, New lane, Norwood', NULL, 'Norwood', 'Central', 22000, 'Sri Lanka', 'lk', '+94769606289', '+94769606289', 'derickrohan@gmail.com', '1999/08/18', '199923107221', 'Sales and marketing Assistant', 'St.anthonys', 2010, '06', 2016, 'O/L', NULL, 'Scouts, sports, English day competition, Carol', 'profile_1560876749.jpeg', '', '', '2019-06-18 21:22:30', 0, '2019-06-18 21:22:30', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'super', '2019-06-14 10:07:17', '2019-06-14 10:07:17'),
(2, 'admin', '2019-06-14 10:10:07', '2019-06-14 10:10:07'),
(3, 'receptionist', '2020-02-01 06:13:01', '2020-02-01 06:13:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'bgn.bgncom@gmail.com.', 1, NULL, '$2y$04$xjUrUueX1ZrTGffLOvR4RuepA3JbmdmDItQXgx2BbDx5GJF4YkNHO', 'C9myNMLbhDOXpVFITcvL8z3hZs56fTO4gkfbImcBblZuKdEcGPiKwfYdwaIJ', NULL, '2019-06-27 08:28:58'),
(4, 'bgnbgn.com@gmail.com', 1, NULL, '$2y$04$xjUrUueX1ZrTGffLOvR4RuepA3JbmdmDItQXgx2BbDx5GJF4YkNHO', NULL, NULL, NULL),
(1, 'bgnbgncom@gmail.com', 1, NULL, '$2y$04$xjUrUueX1ZrTGffLOvR4RuepA3JbmdmDItQXgx2BbDx5GJF4YkNHO', NULL, '2019-05-18 05:07:46', '2019-06-26 14:45:15'),
(25, 'bgnbgn.com123@gmail.com', 1, NULL, '$2y$10$aCAkXU.ukaH9grwT1sfOuuodjGA94/.O35sXaF2YPlXeyAnAr8pgy', NULL, '2020-02-01 14:46:10', '2020-02-01 14:46:10'),
(26, 'sujee1812@gmail.com', 1, NULL, '$2y$04$xjUrUueX1ZrTGffLOvR4RuepA3JbmdmDItQXgx2BbDx5GJF4YkNHO', NULL, '2020-02-01 17:35:13', '2020-02-01 17:35:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_role_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `country_list`
--
ALTER TABLE `country_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_slider`
--
ALTER TABLE `home_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members_details`
--
ALTER TABLE `members_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `membership_id` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_photos`
--
ALTER TABLE `package_photos`
  ADD PRIMARY KEY (`photo_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_name` (`page_name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `registration_request`
--
ALTER TABLE `registration_request`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `membership_id` (`membership_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `country_list`
--
ALTER TABLE `country_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `home_slider`
--
ALTER TABLE `home_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `members_details`
--
ALTER TABLE `members_details`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `package_photos`
--
ALTER TABLE `package_photos`
  MODIFY `photo_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `registration_request`
--
ALTER TABLE `registration_request`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
