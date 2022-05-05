-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2022 at 03:00 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bottom_left_shelf`
--

CREATE TABLE `bottom_left_shelf` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT 'carrots',
  `using_time` date NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL,
  `type` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT 'vegetables',
  `image` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `shelf` varchar(20) COLLATE utf8_bin DEFAULT 'bottom_left_shelf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `bottom_left_shelf`
--

INSERT INTO `bottom_left_shelf` (`id`, `name`, `using_time`, `quantity`, `type`, `image`, `shelf`) VALUES
(65, 'carrots', '2022-04-21', 60, 'vegetables', NULL, 'bottom_left_shelf'),
(66, 'carrots', '2022-04-21', 800, 'vegetables', NULL, 'bottom_left_shelf'),
(67, 'carrots', '2022-04-21', 700, 'vegetables', NULL, 'bottom_left_shelf'),
(68, 'carrots', '2022-04-21', 600, 'vegetables', NULL, 'bottom_left_shelf'),
(69, 'carrots', '2022-04-21', 600, 'vegetables', NULL, 'bottom_left_shelf'),
(70, 'carrots', '2022-04-21', 600, 'vegetables', NULL, 'bottom_left_shelf');

--
-- Triggers `bottom_left_shelf`
--
DELIMITER $$
CREATE TRIGGER `get_data` AFTER INSERT ON `bottom_left_shelf` FOR EACH ROW BEGIN 
DELETE FROM `last_reading_for_data` WHERE shelf=NEW.shelf;
INSERT INTO
`last_reading_for_data`(`name`, `using_time`,  `quantity`, `type`, image,shelf)
SELECT `name`, `using_time`,  `quantity`, `type`, image,shelf FROM `bottom_left_shelf`  ORDER BY id DESC LIMIT 1;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bottom_right_shelf`
--

CREATE TABLE `bottom_right_shelf` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT 'fruits',
  `using_time` date NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL,
  `type` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT 'fruits',
  `image` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `shelf` varchar(20) COLLATE utf8_bin DEFAULT 'bottom_right_shelf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `bottom_right_shelf`
--

INSERT INTO `bottom_right_shelf` (`id`, `name`, `using_time`, `quantity`, `type`, `image`, `shelf`) VALUES
(28, 'some fruits', '2022-04-21', 70, 'fruits', NULL, 'bottom_right_shelf'),
(29, 'some fruits', '2022-04-21', 900, 'fruits', NULL, 'bottom_right_shelf'),
(30, 'some fruits', '2022-04-21', 800, 'fruits', NULL, 'bottom_right_shelf'),
(31, 'some fruits', '2022-04-21', 700, 'fruits', NULL, 'bottom_right_shelf'),
(32, 'some fruits', '2022-04-21', 700, 'fruits', NULL, 'bottom_right_shelf'),
(33, 'some fruits', '2022-04-21', 700, 'fruits', NULL, 'bottom_right_shelf'),
(34, 'fruits', '0000-00-00', 222, 'fruits', NULL, 'bottom_right_shelf');

--
-- Triggers `bottom_right_shelf`
--
DELIMITER $$
CREATE TRIGGER `get_data6` AFTER INSERT ON `bottom_right_shelf` FOR EACH ROW BEGIN
 
 DELETE FROM `last_reading_for_data` WHERE shelf=NEW.shelf;
INSERT INTO
`last_reading_for_data`(`name`, `using_time`,  `quantity`, `type`, image,shelf)
SELECT `name`, `using_time`,  `quantity`, `type`, image,shelf FROM `bottom_right_shelf` ORDER BY id DESC LIMIT 1;
 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `last_reading_for_data`
--

CREATE TABLE `last_reading_for_data` (
  `name` varchar(15) COLLATE utf8_bin NOT NULL,
  `using_time` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(15) COLLATE utf8_bin NOT NULL,
  `image` varchar(50) COLLATE utf8_bin NOT NULL,
  `shelf` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `last_reading_for_data`
--

INSERT INTO `last_reading_for_data` (`name`, `using_time`, `quantity`, `type`, `image`, `shelf`) VALUES
('meat', '2022-04-21', 350, 'meats', '', 'top_left_shelf'),
('tomato', '2022-04-21', 1000, 'fruits', '', 'middle_right_shelf'),
('carrots', '2022-04-21', 600, 'vegetables', '', 'bottom_left_shelf'),
('chicken', '0000-00-00', 2, 'chicken', '', 'top_right_shelf'),
('fruits', '0000-00-00', 222, 'fruits', '', 'bottom_right_shelf'),
('red pepper', '2022-04-28', 222, 'vegetables', '', 'middle_left_shelf');

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `title` varchar(50) NOT NULL,
  `description` varchar(80) NOT NULL,
  `image` varchar(300) NOT NULL,
  `calories` float NOT NULL,
  `carbo` float NOT NULL,
  `protein` float NOT NULL,
  `ingredients` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `directions` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `details` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`title`, `description`, `image`, `calories`, `carbo`, `protein`, `ingredients`, `directions`, `details`) VALUES
(' Cocktail Meatballs', 'These cocktail meatballs are perfect for a Christm', 'https://www.seekpng.com/png/detail/104-1047945_meatball-png-photo-meatball.png', 168, 19.2, 9.4, '2 pounds ground meat\n1 cup bread crumbs\n1/4 cup chopped fresh parsley\n2 eggs\n2 tablespoons grated onion\n2 tablespoons soy sauce\n1/4 teaspoon garlic powder\n1 (16 ounce) can jellied cranberry sauce (such as Ocean Spray®)\n1 1/2 cups ketchup\n2 1/2 tablespoons packed brown sugar\n1 tablespoon lemon juice', 'STEP1:\r\nPreheat oven to 375 degrees F (190 degrees C).\r\nSTEP2:\r\nMix ground meat, bread crumbs, parsley, eggs, grated onion, soy sauce, and garlic powder in a bowl until thoroughly combined, Pinch off about 2 teaspoons of meat mixture per meatball and roll into small meatballs.\r\nArrange meatballs in a large, deep baking dish.\r\nSTEP3:\r\nBake in the preheated oven until meatballs are browned, about 25 minutes. Drain excess grease.\r\nSTEP4:\r\nCombine jellied cranberry sauce, ketchup, brown sugar, and lemon juice in a saucepan and place over medium heat. Stir the sauce until cranberry sauce has melted and brown sugar has dissolved.\r\nSTEP5:\r\nPour the sauce over meatballs and bake until sauce forms a glaze and meatballs are no longer pink inside, 25 to 30 more minutes.', 'http://allrecipes.com/recipe/230537/cape-cod-cocktail-meatballs/'),
(' Fruits Salad', 'good taste and healthy', 'https://kitchen.sayidaty.net/uploads/small/ac/aca9076053dec8b4d5aa24677d73aaa8_w750_h500.jpg', 731, 93.8, 8.4, '1 (15.25 ounce) can fruit cocktail, juice reserved\n2 (11 ounce) cans mandarin oranges, drained\n3 apples, cored and diced with peel\n2 Bartlett pears, cored and diced\n2 bananas\n1 cup chopped pecans\n1 (8 ounce) package cream cheese\n2 teaspoons lemon juice', 'STEP1:\r\nIn a large bowl combine fruit cocktail, mandarin oranges, apples, pears, and pecans.\r\nSTEP2:\r\nIn a small mixing bowl, mix cream cheese and lemon juice.  Add enough fruit cocktail juice to achieve a smooth and creamy consistency.\r\nSTEP3:\r\nFold the cream cheese mixture into the fruit mixture and toss.  Cover and chill for 1 hour before serving.  Prior to serving slice bananas, add to fruit salad and toss again.', 'http://allrecipes.com/recipe/13678/nanas-fruit-salad/'),
('A Southern Fried Chicken', 'easy to make and healthy', 'https://png.pngitem.com/pimgs/s/119-1192434_fried-chicken-wings-png-transparent-png.png', 806, 79.3, 50.9, '3 cups all-purpose flour,1 tablespoon seasoned salt, 1 tablespoon garlic powder, 1 tablespoon onion powder, 1 tablespoon coarse ground black pepper,2 eggs, 4 cups buttermilk, 1 cup barbeque sauce, 2 tablespoons Worcestershire sauce, 1 tablespoon steak sauce,1 (3 pound) whole chicken,cut into pieces,2 cups oil for frying', 'STEP1:\r\nIn a large shallow dish, mix together flour, seasoned salt, garlic powder, onion powder, and black pepper.\r\nSTEP2:\r\nIn a separate bowl,beat eggs, then whisk in buttermilk, barbeque sauce, Worcestershire sauce, and steak sauce,Dredge chicken in milk mixture, then in seasoned flour, alternating in each at least twice.\r\nSTEP3:\r\nHeat oil in a large, deep-sided skillet to 375 degrees F (190 degrees C) Cook chicken in hot oil until golden brown on both sides, about 10 minutes each side', 'http://allrecipes.com/recipe/57676/a-southern-fried-chicken/'),
('Absolute Best Liver and Onions', 'This recipe will turn liver haters into converts. ', 'https://www.restaurant-tariko.com/103-medium_default/menu-higado-frito.jpg', 687, 74.2, 48.9, '2 pounds sliced beef live\n1 1/2 cups milk, or as needed\n1/4 cup butter, divided\n2 large Vidalia onions, sliced into rings\n2 cups all-purpose flour, or as needed\nsalt and pepper to taste', 'STEP1:\r\nGently rinse liver slices under cold water, and place in a medium bowl. Pour in enough milk to cover. Let stand while preparing onions. (I like to soak up to an hour or two - whatever you have time for.)  This step is SO important in taking the bitter taste of the liver out.\r\nSTEP2:\r\nMelt 2 tablespoons of butter in a large skillet over medium heat. Separate onion rings, and saute them in butter until soft. Remove onions, and melt remaining butter in the skillet. Season the flour with salt and pepper, and put it in a shallow dish or on a plate. Drain milk from liver, and coat slices in the flour mixture.\r\nSTEP3:\r\nWhen the butter has melted, turn the heat up to medium-high, and place the coated liver slices in the pan. Cook until nice and brown on the bottom. Turn, and cook on the other side until browned. Add onions, and reduce heat to medium. Cook a bit longer to taste.  Our family prefers the liver to just barely retain a pinkness on the inside when you cut to check. Enjoy!', 'http://allrecipes.com/recipe/58942/absolute-best-liver-and-onions/'),
('Acapulco Chicken', 'Easy, fast, healthy and delicious!', 'https://nestinglane.com/wp-content/uploads/2021/02/acapulco-chicken_5945.jpg', 333, 23.8, 30.1, '2 skinless, boneless chicken breast halves - cut into bite-size pieces\n1 tablespoon chili powder, divided\nsalt and pepper to taste\n1 tablespoon olive oil\n1 cup chopped green bell pepper\n1/2 cup chopped onion\n2 jalapeno peppers, seeded and minced\n1 large tomato, cut into chunks\n10 drops hot pepper sauce', 'STEP1:\r\nSeason chicken with 1/2 tablespoon chili powder, salt and pepper. Heat oil in a large skillet over medium high heat and saute seasoned chicken for 3 to 4 minutes, or until no longer pink. Remove from skillet with a slotted spoon and keep warm.\r\nSTEP2:\r\nIn same skillet, stir fry bell pepper and onion until soft. Add jalapeno peppers, tomatoes, remaining 1/2 tablespoon chili powder and hot pepper sauce. Cook, stirring, for an additional 3 to 5 minutes; add chicken and stir fry for 2 minutes more.', 'http://allrecipes.com/recipe/19123/acapulco-chicken/'),
('Accidental Fish', 'Steamed vegetables go great with this dish', 'https://arabfish.net/wp-content/uploads/2021/04/%D9%87%D8%A7%D9%85%D9%88%D8%B1-%D9%85%D9%82%D9%84%D9%8A.jpg', 556, 3, 21.7, '2 (4 ounce) fillets mahi mahi\n2 teaspoons olive oil\n1/2 cup salted butter\n1 clove garlic, minced\n1 tablespoon lemon juice\n2 drops Louisiana-style hot sauce, or to taste\n1 roma tomato, seeded and chopped (optional)\n1 green onion, chopped', 'STEP1:\r\nPreheat an oven to 450 degrees F (230 degrees C).\r\nSTEP2:\r\nRub the mahi mahi fillets with the olive oil and lay into a baking dish.\r\nSTEP3:\r\nBake in the preheated oven until the fish flakes easily with a fork, about 20 minutes.\r\nSTEP4:\r\nWhile the mahi mahi bakes, melt the butter in a saucepan over medium heat.\r\nSTEP5:\r\nStir the garlic, lemon juice, and hot sauce into the melted butter; simmer together for 1 minute. Add the tomato and green onion to the butter mixture; cook and stir until hot. Spoon over the baked fish to serve.', 'https://www.allrecipes.com/recipe/220121/accidental-fish/'),
('Bolognese Meat Sauce', 'This sauce is very different for meat', 'https://www.kindpng.com/picc/m/114-1147162_transparent-spaghetti-png-bolognese-sauce-png-download.png', 469, 12.8, 28, '1 1/2 pounds ground meat\n7 carrots, coarsely chopped\n1 small white onion, chopped\n4 slices ham\n1/2 cup butter\n1 (14 ounce) can beef broth\n1 (6 ounce) can tomato paste\n1 lemon, zested\n2 bay leaves\n1 pinch dried basil\n1 1/2 teaspoons ground nutmeg\n1 tablespoon heavy cream', 'STEP1:\r\nPlace ground meat in a large, deep skillet. Cook over medium high heat until evenly brown. Drain, crumble very finely and set aside.\r\nSTEP2:\r\nIn a food processor, chop the carrots, onion and ham.\r\nSTEP3:\r\nMelt butter in a large saucepan over low heat.  Stir in carrot mixture and simmer for 3 to 5 minutes.  Stir in cooked beef, beef broth, tomato paste, lemon zest, bay leaves, basil and nutmeg.  Simmer over lowest heat, partially covered, for at least 2 hours, stirring occasionally.\r\nImmediately before serving, stir in cream and mix well.', 'http://allrecipes.com/recipe/26266/dads-bolognese-meat-sauce/'),
('Delicious Sweet Potato Fries', 'These delicious oven-roasted sweet potatoes ', 'https://www.pngitem.com/pimgs/m/119-1193279_sweet-potato-fries-png-french-fries-transparent-png.png', 313, 58.5, 4.9, '2 sweet potatoes, peeled and cut into 1/2-inch slices\n1 tablespoon coconut oil, melted\n1 teaspoon ground cumin\n1/2 teaspoon garlic powder\nsalt and ground black pepper to taste\n1/2 teaspoon paprika\n2 tablespoons chopped fresh cilantro (optional)', 'STEP1:\r\nPreheat oven to 450 degrees F (230 degrees C).\r\nSTEP2:\r\nArrange sweet potatoes onto a baking sheet. Drizzle coconut oil over the sweet potatoes; season with cumin, garlic powder, salt and pepper.\r\nSTEP3:\r\nBake in the preheated oven, turning occasionally, until soft in the center, 20 to 25 minutes. Garnish with paprika and cilantro.', 'http://allrecipes.com/recipe/239167/delicious-sweet-potato-fries/'),
('Deviled Tomatoes', 'Like deviled eggs, deviled tomatoes are carved.', 'https://www.ralphs.com/content/v2/binary/image/recipe/images/deviled_crab_stuffed_tomatoes--2_deviled-crab-stuffed-tomatoes_p1_february-evergreen_p_21-tkc-0331_a.png', 69, 5.8, 1.3, '4 beefsteak tomatoes\n1/2 cup distilled white vinegar\n4 teaspoons olive oil\nsalt and pepper to taste', 'STEP1:\r\nSlice the top off of each tomato. Hollow out each tomato with a spoon, leaving a 1/2 to 1/4 inch shell. Place tomato pulp in a large bowl.\r\nSTEP2:\r\nStir the vinegar and olive oil into the pulp, mixing to break up any large pieces. Season with salt and pepper. Evenly spoon the filling into the tomato shells. Refrigerate for at least 10 minutes before serving.', 'http://allrecipes.com/recipe/201771/deviled-tomatoes/'),
('Easy Chicken Curry', 'Simplest chicken curry you\'ll ever make!', 'https://www.kindpng.com/picc/m/152-1523202_transparent-plate-of-food-with-chicken-clipart-transparent.png', 246, 7.9, 28.5, '6 skinless, boneless chicken breast halves - cut into strips\n1/4 cup olive oil\n2 large onions, diced\n1/3 cup curry powder, or to taste', 'STEP1:\r\nHeat oil in a large skillet over medium heat. Add onion and saute until soft and golden brown. Slowly stir in curry powder. Once ingredients are blended together, add chicken breasts. Cover skillet and simmer over medium low heat for about 45 minutes or until chicken is cooked through and no longer pink inside.\r\nSTEP2:\r\nRemove cover from skillet and cook for an additional 15 minutes, until sauce reduces. (Note: Make sure that you stir and that dish does not burn, as curry powder burns very easily!)', 'http://allrecipes.com/recipe/15156/easy-chicken-curry/'),
('Easy Egg Tarts', 'so healthy!', 'https://media.istockphoto.com/photos/egg-tart-picture-id94472628?k=20&m=94472628&s=612x612&w=0&h=hC2DUxyqcImQ6JRVeGimurzWy7X8Wu_suIXvvqunk70=', 355, 48.8, 9.4, '25 (2 inch) unbaked tart shells\n5 eggs\n1 cup white sugar\n1 1/4 cups water', 'STEP1:\r\nPreheat oven to 400 degrees F (200 degrees C).\r\nSTEP2:\r\nDissolve sugar in water. Beat in eggs.\r\nSTEP3:\r\nDivide into tartlet shells and bake at 400 degrees F (200 degrees C) for 20 minutes.', 'http://allrecipes.com/recipe/12603/easy-egg-tarts/'),
('Easy Egg White Omelet', 'This is my go-to breakfast every morning.', 'https://www.pngitem.com/pimgs/m/188-1888105_omelette-download-transparent-png-image-omelette-png-png.png', 128, 0.8, 24.9, 'cooking spray\n2 tablespoons chopped onion\n2 tablespoons chopped green bell pepper\n2 tablespoons chopped mushrooms\nsalt and ground black pepper to taste\n1 (32 ounce) container refrigerated pasteurized egg white substitute (such as Egg Beaters Whites®)', 'STEP1:\r\nSpray a 9x5-inch glass or microwave-safe loaf pan with cooking spray,sprinkle the onion, green bell pepper, and mushrooms into the pan, and toss lightly with a fork just to mix. Season with salt and black pepper, and pour in the egg whites.\r\nSTEP2:\r\nCook in a microwave oven on High setting for 3 minutes. Remove and stir the cooked egg white from the side of the pan into the rest of the ingredients; cook for 3 more minutes on High. If the omelet is still a little runny on top, slice it into chunks and turn them over in the loaf pan; microwave for 30 more seconds on High. Adjust salt and pepper, and serve.', 'http://allrecipes.com/recipe/218928/easy-egg-white-omelet/'),
('Easy Hawaiian Chicken Packets', 'This yummy recipe is easy to prepare and to cook! ', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5683077.jpg&w=595&h=595&c=sc&poi=face&q=60', 304, 38.9, 33, '4  skinless, boneless chicken breast halves\n1 cup bottled teriyaki sauce or marinade\n1  green bell pepper, seeded and sliced into strips\n1  red bell pepper, seeded and sliced into strips\n1  onion, chopped\n1 (20 ounce) can pineapple chunks, drained', 'STEP1:\r\nPreheat a grill for medium-high heat.\r\nSTEP2:\r\nLay out four squares of aluminum foil. Place one piece of chicken in the center of each square. Pour the teriyaki sauce over them, turning to coat. Distribute equal amounts of the green and red peppers, onion and pineapple chunks amongst the chicken pieces. Fold the foil up and seal tightly into packets.\r\nSTEP3:\r\nPlace the packets on the grill, and cook for about 20 minutes, or until chicken is no longer pink and juices run clear. I like to take one packet off the grill and check it before removing them all.', 'http://allrecipes.com/recipe/88807/easy-hawaiian-chicken-packets/'),
('Fabulous Fruits Salad II', 'Quick and delicious!', 'https://img.freepik.com/free-photo/mixed-fruit-white-plate_74190-2570.jpg?w=2000', 230, 24.9, 5.8, '2 cups diced apples\n1 cup sliced banana\n1 cup sliced fresh strawberries\n1 cup chopped walnuts\n1 cup vanilla yogurt\n3/4 teaspoon ground cinnamon', 'In a bowl, mix the apples, banana, strawberries, and walnuts. Fold in the yogurt. Sprinkle with cinnamon. Gently stir just before serving.', 'http://allrecipes.com/recipe/72716/fabulous-fruit-salad-ii/'),
('Fruit Cake', 'This one is more candy than cake and oh so delicio', 'https://www.pngitem.com/pimgs/m/479-4791690_fruit-cake-png-pic-christmas-fruit-cake-price.png', 451, 64, 4.8, '1 pound candied cherries\n1 pound candied pineapple\n1 pound pitted dates\n1 pound chopped pecans\n4 (8 ounce) packages flaked coconut\n3 tablespoons all-purpose flour\n2 (14 ounce) cans sweetened condensed milk', 'STEP1:\r\nPreheat oven to 300 degrees F (150 degrees C). Lightly grease a 10 inch tube pan. Line bottom of pan with greased parchment paper. Set aside.\r\nSTEP2:\r\nChop fruit and nuts in a large mixing bowl. Add coconut and mix well with hands. Stir in flour, then  sweetened condensed milk. Blend well.\r\nSTEP3:\r\nPack firmly in prepared  tube pan.  Bake for 1 1/2 hours.  Remove from oven.  Run knife around edge of cake and remove rim of pan.  When barely warm, remove tube bottom and paper from cake.', 'http://allrecipes.com/recipe/9475/never-fail-fruit-cake/'),
('Healthier Easy Meatloaf', 'so healthy', 'https://janeshealthykitchen.com/wp-content/uploads/2013/03/Turkey-Meatloaf-smaller-666x550.jpg', 270, 18.2, 21.2, '1 1/2 pounds lean ground meat\n1 egg\n1 onion, chopped\n1 cup low-fat (1%) milk\n1 cup whole wheat bread crumbs\n1/2 cup chopped fresh parsley\n1 large carrot, grated\nsalt and ground black pepper to taste\n1 tablespoon brown sugar\n2 tablespoons prepared mustard\n1/3 cup ketchup', 'STEP1:\r\nPreheat oven to 350 degrees F (175 degrees C). Lightly grease a 9x5-inch loaf pan.\r\nCombine meat, egg, onion, milk, bread crumbs, parsley, and carrot in a large bowl. Season with salt and black pepper. Place beef mixture in loaf pan.\r\nSTEP2:\r\nStir together brown sugar, mustard, and ketchup in a small bowl. Pour over meatloaf.\r\nSTEP3:\r\nBake in preheated oven until no longer pink in the center, about 1 hour. An instant-read thermometer inserted into the center should read at least 160 degrees F (70 degrees C).', 'http://allrecipes.com/recipe/222102/healthier-easy-meatloaf/'),
('Lemon and Tomato Fish Stew', 'This stew is light enough for summer,This recipe is extremely versatile', 'https://thumbs.dreamstime.com/b/plate-baked-fish-white-background-top-view-plate-baked-fish-isolated-white-background-top-view-128814732.jpg', 445, 48.1, 8.8, '1 cup brown rice\n2 tablespoons olive oil\n1/2 onion, chopped\n1 stalk celery, finely chopped\n4 cloves garlic, chopped\n1 Hatch chile pepper, seeded and chopped\n1 Roma tomato, chopped\n1 1/2 tablespoons tomato paste\n1 cup chicken broth\n1/2 cup white wine\n2 bay leaves\n1 tablespoon butter\n2 Fish\nsalt and ground black pepper to taste\n1/4 cup sour cream\n1 tablespoon lemon juice, or to taste\n1 bunch green onions, chopped', 'STEP1:\r\nBring water and brown rice to a boil in a saucepan. Reduce heat to medium-low, cover, and simmer until rice is tender and liquid has been absorbed, 45 to 50 minutes.\r\nSTEP2:\r\nHeat oil in a deep skillet over high heat. Add onion, celery, and garlic; cook and stir until edges of the onion are browned, about 5 minutes. Mix in chile pepper, tomato, and tomato paste; cook, stirring constantly, until softened, about 1 minute.\r\nSTEP3:\r\nStir chicken broth, white wine, and bay leaves into the skillet; simmer until stew is evenly warmed, about 5 minutes.\r\nSTEP4:\r\nMelt butter in a pot over medium heat. Add salmon; season with salt and pepper. Cook, flipping once, until salmon flakes easily with a fork, 3 to 5 minutes per side. Separate into small pieces.\r\nSTEP5:\r\nStir sour cream and lemon juice into the stew; pour stew over salmon. Remove bay leaves. Add green onions.\r\nDivide brown rice evenly between 4 bowls; ladle stew over rice.', 'http://allrecipes.com/recipe/255485/lemon-and-tomato-fish-stew/'),
('Mac and Cheese I', ' less fatty and good tasting too', 'https://www.seekpng.com/png/detail/35-358827_mac-and-cheese-png-food.png', 291, 49, 15, '2 cups macaroni\n1/2 cup nonfat cottage cheese\n1 egg white\n1/2 packet artificial sweetener\n1/4 cup reduced fat processed cheese food, cubed\n1/4 cup lowfat buttermilk\n1/4 teaspoon liquid smoke flavoring\n1/2 cup crushed saltine crackers', 'STEP1:\r\nCook pasta in a large pot of boiling salted water until al dente.  Grease a 2 quart casserole dish.\r\nSTEP2:\r\nIn a food processor, blend cottage cheese until smooth.\r\nSTEP3:\r\nIn large bowl, combine cottage cheese, egg white, sweetener, cheese food, buttermilk and liquid smoke until well mixed.  Stir in pasta. Pour into prepared dish. Top with crushed crackers.\r\nSTEP4:\r\nBake at 400 degrees F (205 degrees C) for 30 minutes.', 'http://allrecipes.com/recipe/11750/mac-and-cheese-i/'),
('Macaroni and Cheese', 'Easy Pasta Recipes', 'https://familymath.stanford.edu/wp-content/uploads/2020/02/macaroni-cheese-1024x683.jpg', 280, 49.5, 15, '4 cups dried macaroni\n1 whole egg\n1/2 stick (4 tablespoons) butter\n1/4 cup all-purpose flour\n2 1/2 cups whole milk\n2 heaping teaspoons dry mustard (more if desired)\n1 pound sharp Cheddar, grated (not pre-grated cheese), plus more for baking\nSalt\nSeasoned salt\n1/2 teaspoon ground black pepper\nOptional spices: cayenne pepper, paprika, thyme\n1 pound thick-cut peppered bacon\n3 yellow onions, halved and sliced\n3 tablespoons butter\n8 ounces gorgonzola\nCooked sliders and/or macaroni and cheese, for serving', 'STEP1:\r\nPreheat the oven to 350 degrees F.\r\nSTEP2:\r\nCook the macaroni until still slightly firm. Drain and set aside.\r\nSTEP3:\r\nIn a small bowl, beat the egg. In a large pot, melt the butter and sprinkle in the flour. Whisk together over medium-low heat. Cook for a couple of minutes, whisking constantly. Don\'t let it burn. Pour in the milk, add the mustard and whisk until smooth. Cook until very thick, about 5 minutes. Reduce the heat to low.\r\nSTEP4:\r\nTake 1/4 cup of the sauce and slowly pour it into the beaten egg, whisking constantly to avoid cooking the eggs. Whisk together until smooth. Pour the egg into the sauce, whisking constantly. Stir until smooth. Add in the cheese and stir to melt. Add 1/2 teaspoon salt, 1/2 teaspoon seasoned salt and the pepper. Add any additional spices if desired. Taste the sauce and add more salt and seasoned salt as needed! DO NOT UNDERSALT.\r\nSTEP5:\r\nPour in the drained, cooked macaroni and stir to combine. Serve immediately (while it\'s still very creamy) or pour into a buttered baking dish, top with extra cheese and bake until bubbly and golden on top, 20 to 25 minutes.\r\nSTEP6:\r\nFry the bacon in a skillet over medium-high heat until slightly crisp,', 'http://www.foodnetwork.com/recipes/ree-drummond/macaroni-and-cheese-re'),
('Macaroni and Peppers in White Sauce', 'Spaghetti with three colors of peppers, onion, fet', 'https://media.istockphoto.com/photos/pasta-with-cream-sauce-picture-id184132130?k=20&m=184132130&s=612x612&w=0&h=ClIkbF5YIwx2IsS839YNbP3Y4-TW1VSEKrTlShBtDhA=', 1350, 113, 46, '1 pound spaghetti\n2 onions, minced\n2 red bell peppers, diced\n2 green bell peppers, diced\n2 yellow bell peppers, diced\n1 cube chicken bouillon, crumbled\n1 cup white wine\n1/2 teaspoon dried oregano\n1/2 teaspoon paprika\n1/2 teaspoon salt\n1/4 teaspoon ground black pepper\n1/4 teaspoon ground nutmeg\n12 ounces crumbled feta cheese\n7 ounces Gouda cheese, shredded\n2 (8 ounce) containers creme fraiche', 'STEP1:\r\nBring a large pot of lightly salted water to a boil. Add pasta and cook for 8 to 10 minutes or until al dente; drain.\r\nSTEP2:\r\nMeanwhile, in a large skillet over medium heat, cook onions until translucent.  Stir in peppers and cook until just tender.  Stir in bouillon cube, wine, oregano, paprika, salt, pepper and nutmeg.  Simmer 20 minutes, until thickened.\r\nSTEP3:\r\nReduce heat to low and stir in feta, Gouda and creme fraiche.  When cheese is melted, toss sauce with pasta and serve.', 'http://allrecipes.com/recipe/22169/macaroni-and-peppers-in-white-sauce'),
('Mango Chicken', 'This is a refreshing, different way to serve chick', 'https://silkroadrecipes.com/wp-content/uploads/2021/06/Indian-Mango-Chicken-Curry-square.jpg', 322, 34.2, 29.2, '4 skinless, boneless chicken breasts\n3/4 cup chopped red onion\n1 mango - peeled, seeded, and sliced\n1 tablespoon vegetable oil\n3 cups orange juice\n3 tablespoons cornstarch\n1/4 cup hot water', 'STEP1:\r\nIn a large skillet, brown the chicken breasts in oil  till crispy and juices run clear.\r\nSTEP2:\r\nAdd the red onion to the chicken.  Saute for 2 to 3 minutes, stirring often.  Add the orange juice, and bring to a boil.  When the juice boils, add the mango slices.  Turn down heat, and simmer for 2 minutes.  Dissolve the cornstarch in hot water; stir into sauce.  Stir till sauce thickens slightly.', 'http://allrecipes.com/recipe/8588/mango-chicken/'),
('Mango- Coconut Smoothie', 'make a quick and refreshing smoothie.', 'https://img.freepik.com/free-photo/mango-juice-mango-isolated-white-background_62856-1385.jpg', 170, 22.5, 1.6, '3/4 cup unsweetened coconut milk,\n2 cups cubed ripe mango,\n1 cup green grapes,\n2 cups ice cubes,\nDiced mango and shredded coconut for garnish (optional)', 'STEP1:\r\nPlace the first four ingredients in Oster(R) Versa(R) Performance Blender in order listed\r\nAdd 1 cup water.\r\nSelect programmed SMOOTHIE setting.\r\nServe immediately. Top with diced mango and coconut, if desired.', 'http://allrecipes.com/recipe/238415/mango--coconut-smoothie/'),
('Maple Dill Carrots', 'Melted butter, brown sugar, and dill complement th', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F606040.jpg', 117, 16, 1, '3 cups peeled and sliced carrots\n2 tablespoons butter\n2 tablespoons brown sugar\n1 ½ tablespoons chopped fresh dill\n½ teaspoon salt\n½ teaspoon black pepper', 'STEP1:\r\nlace carrots in a skillet and pour in just enough water to cover. Bring to a boil over medium heat; simmer until water has evaporated and the carrots are tender. Stir in butter, brown sugar, dill, salt, and pepper.', 'http://allrecipes.com/recipe/87694/maple-dill-carrots/'),
('Orange Juice', 'It takes a little work, but it tastes much better ', 'https://www.kindpng.com/picc/m/5-52713_transparent-orange-juice-png-orange-juice-png-png.png', 50, 11.5, 0.8, '4 oranges', 'STEP1:\r\nLightly smack each orange on the counter. Cut each one in half. Squeeze into a glass. You may also use a citrus reamer to do this. If you want less pulp, use a hand juicer with a strainer.', 'https://www.allrecipes.com/recipe/89229/fresh-orange-juice/'),
('Really Simple Rice', 'This is a very simple but tasty rice recipe', 'https://www.pngitem.com/pimgs/m/333-3336229_plain-rice-platters-png-transparent-png.png', 149, 11.5, 0.8, '1 tablespoon olive oil\n1 cup long-grain white rice\n1/2 small onion, finely diced\n2 cups low-sodium chicken broth\n1 pinch garlic salt, or to taste', 'STEP1:\r\nHeat olive oil in a non-stick saucepan over medium-high heat nearly to smoking. Cook and stir rice in the hot oil quickly to toast the rice, 2 to 3 minutes. Stir the onion into the rice; cook and stir 1 minute more. Pour chicken broth over the rice mixture, season with garlic salt, and bring to a boil; reduce heat to low, place a cover on the saucepan, and cook until the broth is absorbed and the rice is tender, about 20 minutes. Remove from heat and allow to rest 5 minutes before lifting the lid.', 'http://allrecipes.com/recipe/221984/really-simple-rice/'),
('Red and Sweet Potato Salad', 'sweet potato gives the salad a nice flavor', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1240942.jpg&w=595&h=595&c=sc&poi=face&q=60', 150, 40, 2, '6 red potatoes, diced\n3 large sweet potatoes, diced\n3/4 cup mayonnaise\n1/2 red onion, diced\n1 tablespoon prepared horseradish\n1 tablespoon spicy brown mustard\n1 tablespoon roasted garlic-flavored olive oil\n1/4 pound crumbled cooked bacon\n1 pinch garlic powder\n1 pinch sea salt\n1 pinch ground white pepper\n1 pinch paprika', 'Place red potatoes and sweet potatoes into a large pot and cover with salted water; bring to a boil. Reduce heat to medium-low and simmer until tender, 15 to 20 minutes; drain.\nTransfer potato mixture to a large bowl and refrigerate until cooled, about 30 minutes.\nMix mayonnaise, red onion, horseradish, mustard, olive oil, bacon, garlic powder, sea salt, and white pepper, respectively, into potato mixture; garnish with paprika.', 'http://allrecipes.com/recipe/238265/red-and-sweet-potato-salad/'),
('Red Potato Chicken', 'saucy chicken breasts baked with red potatoes', 'https://www.pngkit.com/png/detail/303-3036737_bbq-chicken-red-mashed-potatoes-yakitori.png', 1067, 151.1, 43.8, '\"4 skinless, boneless chicken breast halves\".\r\n\"15 potatoes\".\r\n\"1 (16 ounce) bottle Italian-style salad dressing\".', 'STEP1:\r\n\"Preheat oven to 375  degrees F (190 degrees C).\"\r\nSTEP2:\r\n\"Place chicken in a 9x13 inch baking dish. Arrange potato halves around chicken, then cover all with salad dressing.\"\r\nSTEP3:\r\n\"Bake at 375 degrees F (190 degrees C) for 1 hour or until chicken is cooked through and juices run clear.\"', 'http://allrecipes.com/recipe/16704/red-potato-chicken/');

-- --------------------------------------------------------

--
-- Table structure for table `middle_left_shelf`
--

CREATE TABLE `middle_left_shelf` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'peppers',
  `using_time` date NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL,
  `type` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT 'vegetables',
  `image` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `shelf` varchar(20) COLLATE utf8_bin DEFAULT 'middle_left_shelf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `middle_left_shelf`
--

INSERT INTO `middle_left_shelf` (`id`, `name`, `using_time`, `quantity`, `type`, `image`, `shelf`) VALUES
(25, 'vegetables', '2022-04-21', 410, 'vegetables', NULL, 'middle_left_shelf'),
(26, 'vegetables', '2022-04-21', 1000, 'vegetables', NULL, 'middle_left_shelf'),
(27, 'vegetables', '2022-04-21', 900, 'vegetables', NULL, 'middle_left_shelf'),
(28, 'vegetables', '2022-04-21', 800, 'vegetables', NULL, 'middle_left_shelf'),
(29, 'vegetables', '2022-04-21', 800, 'vegetables', NULL, 'middle_left_shelf'),
(30, 'vegetables', '2022-04-21', 800, 'vegetables', NULL, 'middle_left_shelf'),
(31, 'vegetables', '0000-00-00', 0, 'vegetables', NULL, 'middle_left_shelf'),
(32, 'vegetables', '0000-00-00', 222, 'vegetables', NULL, 'middle_left_shelf'),
(33, 'vegetables', '0000-00-00', 5, 'vegetables', NULL, 'middle_left_shelf'),
(34, 'vegetables', '0000-00-00', 0, 'vegetables', NULL, 'middle_left_shelf'),
(35, 'red pepper', '2022-04-28', 222, 'vegetables', NULL, 'middle_left_shelf');

--
-- Triggers `middle_left_shelf`
--
DELIMITER $$
CREATE TRIGGER `get_data3` AFTER INSERT ON `middle_left_shelf` FOR EACH ROW BEGIN
 
 DELETE FROM `last_reading_for_data` WHERE shelf=NEW.shelf;
 
INSERT INTO
`last_reading_for_data`(`name`, `using_time`,  `quantity`, `type`, image,shelf)
SELECT `name`, `using_time`,  `quantity`, `type`, image,shelf FROM `middle_left_shelf` ORDER BY id DESC LIMIT 1;

 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `middle_right_shelf`
--

CREATE TABLE `middle_right_shelf` (
  `id` int(11) NOT NULL,
  `name` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'tomato',
  `using_time` date NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'fruits',
  `image` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `shelf` varchar(20) COLLATE utf8_bin DEFAULT 'middle_right_shelf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `middle_right_shelf`
--

INSERT INTO `middle_right_shelf` (`id`, `name`, `using_time`, `quantity`, `type`, `image`, `shelf`) VALUES
(19, 'tomato', '2022-04-21', 510, 'fruits', NULL, 'middle_right_shelf'),
(20, 'tomato', '2022-04-21', 1500, 'fruits', NULL, 'middle_right_shelf'),
(21, 'tomato', '2022-04-21', 1300, 'fruits', NULL, 'middle_right_shelf'),
(22, 'tomato', '2022-04-21', 1000, 'fruits', NULL, 'middle_right_shelf'),
(23, 'tomato', '2022-04-21', 1000, 'fruits', NULL, 'middle_right_shelf'),
(24, 'tomato', '2022-04-21', 1000, 'fruits', NULL, 'middle_right_shelf');

--
-- Triggers `middle_right_shelf`
--
DELIMITER $$
CREATE TRIGGER `get_data4` AFTER INSERT ON `middle_right_shelf` FOR EACH ROW BEGIN
 DELETE FROM `last_reading_for_data` WHERE shelf=NEW.shelf;
 
INSERT INTO
`last_reading_for_data`(`name`, `using_time`,  `quantity`, `type`, image,shelf)
SELECT `name`, `using_time`, `quantity`, `type`, image,shelf FROM `middle_right_shelf` ORDER BY id DESC LIMIT 1;
 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `top_left_shelf`
--

CREATE TABLE `top_left_shelf` (
  `id` int(11) NOT NULL,
  `name` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'meat',
  `using_time` date NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT 'meats',
  `image` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `shelf` varchar(20) COLLATE utf8_bin DEFAULT 'top_left_shelf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `top_left_shelf`
--

INSERT INTO `top_left_shelf` (`id`, `name`, `using_time`, `quantity`, `type`, `image`, `shelf`) VALUES
(9, 'apple', '2022-01-15', 200, 'fruit', '1646561704243.png', 'top_left_shelf'),
(40, 'meat', '2022-04-21', 26, 'meats', NULL, 'top_left_shelf'),
(41, 'meat', '2022-04-21', 500, 'meats', NULL, 'top_left_shelf'),
(42, 'meat', '2022-04-21', 400, 'meats', NULL, 'top_left_shelf'),
(43, 'meat', '2022-04-21', 350, 'meats', NULL, 'top_left_shelf'),
(44, 'meat', '2022-04-21', 0, 'meats', NULL, 'top_left_shelf'),
(45, 'meat', '2022-04-21', 350, 'meats', NULL, 'top_left_shelf');

--
-- Triggers `top_left_shelf`
--
DELIMITER $$
CREATE TRIGGER `get_data1` AFTER INSERT ON `top_left_shelf` FOR EACH ROW BEGIN
 DELETE FROM `last_reading_for_data` WHERE shelf=NEW.shelf;
INSERT INTO
`last_reading_for_data`(`name`, `using_time`, `quantity`, `type`, image,shelf)
SELECT `name`, `using_time`, `quantity`, `type`, image,shelf  FROM `top_left_shelf` ORDER BY id DESC LIMIT 1;
 
 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `top_right_shelf`
--

CREATE TABLE `top_right_shelf` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_bin DEFAULT 'chicken',
  `using_time` date NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL,
  `type` varchar(15) COLLATE utf8_bin DEFAULT 'chicken',
  `image` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `shelf` varchar(20) COLLATE utf8_bin DEFAULT 'top_right_shelf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `top_right_shelf`
--

INSERT INTO `top_right_shelf` (`id`, `name`, `using_time`, `quantity`, `type`, `image`, `shelf`) VALUES
(26, NULL, '2022-04-21', 310, NULL, NULL, 'top_right_shelf'),
(27, NULL, '2022-04-21', 720, NULL, NULL, 'top_right_shelf'),
(28, NULL, '2022-04-21', 700, NULL, NULL, 'top_right_shelf'),
(29, NULL, '2022-04-21', 600, NULL, NULL, 'top_right_shelf'),
(30, NULL, '2022-04-21', 600, NULL, NULL, 'top_right_shelf'),
(31, NULL, '2022-04-21', 600, NULL, NULL, 'top_right_shelf'),
(32, 'chicken', '0000-00-00', 2, 'chicken', NULL, 'top_right_shelf');

--
-- Triggers `top_right_shelf`
--
DELIMITER $$
CREATE TRIGGER `get_data5` AFTER INSERT ON `top_right_shelf` FOR EACH ROW BEGIN
 DELETE FROM `last_reading_for_data` WHERE shelf=NEW.shelf;
 
 
INSERT INTO
`last_reading_for_data`(`name`, `using_time`,  `quantity`, `type`, image,shelf)
SELECT `name`, `using_time`, `quantity`, `type`, image,shelf FROM `top_right_shelf` ORDER BY id DESC LIMIT 1;
 
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bottom_left_shelf`
--
ALTER TABLE `bottom_left_shelf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bottom_right_shelf`
--
ALTER TABLE `bottom_right_shelf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `middle_left_shelf`
--
ALTER TABLE `middle_left_shelf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `middle_right_shelf`
--
ALTER TABLE `middle_right_shelf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_left_shelf`
--
ALTER TABLE `top_left_shelf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_right_shelf`
--
ALTER TABLE `top_right_shelf`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bottom_left_shelf`
--
ALTER TABLE `bottom_left_shelf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `bottom_right_shelf`
--
ALTER TABLE `bottom_right_shelf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `middle_left_shelf`
--
ALTER TABLE `middle_left_shelf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `middle_right_shelf`
--
ALTER TABLE `middle_right_shelf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `top_left_shelf`
--
ALTER TABLE `top_left_shelf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `top_right_shelf`
--
ALTER TABLE `top_right_shelf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
