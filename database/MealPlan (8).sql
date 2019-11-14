-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 13, 2019 at 06:08 PM
-- Server version: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MealPlan`
--

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `meal_time` enum('breakfast','lunch','dinner') COLLATE utf8_unicode_ci NOT NULL,
  `recipe_id` mediumint(9) UNSIGNED DEFAULT NULL,
  `recipe_label` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `recipe_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `directions_url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `serving_size` tinyint(4) NOT NULL,
  `label` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `cooking_time` mediumint(9) NOT NULL,
  `categories` enum('favorites','gluten-free','vegan','keto','paleo','dairy-free') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `recipe_id` mediumint(9) UNSIGNED NOT NULL,
  `ingredients_desc` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopping_list`
--

CREATE TABLE `shopping_list` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ingredients_id` mediumint(9) UNSIGNED DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `ingredient_text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipeId` (`recipe_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipeId` (`recipe_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label` (`label`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipeId` (`recipe_id`);

--
-- Indexes for table `shopping_list`
--
ALTER TABLE `shopping_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredientsId` (`ingredients_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=532;
--
-- AUTO_INCREMENT for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3430;
--
-- AUTO_INCREMENT for table `shopping_list`
--
ALTER TABLE `shopping_list`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `calendar_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `shopping_list`
--
ALTER TABLE `shopping_list`
  ADD CONSTRAINT `shopping_list_ibfk_1` FOREIGN KEY (`ingredients_id`) REFERENCES `recipe_ingredients` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
