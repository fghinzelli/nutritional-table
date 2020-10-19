CREATE TABLE `food_category` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `active` boolean NOT NULL DEFAULT true
);

CREATE TABLE `food` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `kcal` float,
  `carbohydrates` float,
  `proteins` float,
  `total_fats` float,
  `saturated_fats` float,
  `trans_fats` float,
  `dietary_fiber` float,
  `sodium` float,
  `food_category_id` int NOT NULL,
  `active` boolean NOT NULL DEFAULT true
);

CREATE TABLE `client` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `active` boolean NOT NULL DEFAULT true,
  `professional_id` int NOT NULL
);

CREATE TABLE `recipe` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `client_id` int NOT NULL,
  `active` boolean NOT NULL DEFAULT true
);

CREATE TABLE `recipe_food` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `food_id` int NOT NULL,
  `quantity` float NOT NULL,
  `active` boolean NOT NULL DEFAULT true
);

CREATE TABLE `professional` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `register` varchar(255) NOT NULL,
  `active` boolean NOT NULL DEFAULT true
);

CREATE TABLE `comments` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `professional_id` int NOT NULL,
  `active` boolean NOT NULL DEFAULT true
);

ALTER TABLE `food_category` ADD FOREIGN KEY (`id`) REFERENCES `food` (`food_category_id`);

ALTER TABLE `food` ADD FOREIGN KEY (`id`) REFERENCES `recipe_food` (`food_id`);

ALTER TABLE `recipe` ADD FOREIGN KEY (`id`) REFERENCES `recipe_food` (`recipe_id`);

ALTER TABLE `professional` ADD FOREIGN KEY (`id`) REFERENCES `client` (`professional_id`);

ALTER TABLE `professional` ADD FOREIGN KEY (`id`) REFERENCES `comments` (`professional_id`);

ALTER TABLE `client` ADD FOREIGN KEY (`id`) REFERENCES `recipe` (`client_id`);
