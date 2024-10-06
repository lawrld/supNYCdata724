/**
	Name: SupremeNYC Database 
    	Author: lawrld
*/


CREATE DATABASE supremeNYC;
USE supremeNYC;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS product_variants;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sizes;
DROP TABLE IF EXISTS colors;



CREATE TABLE colors (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE sizes (
    size_id INT PRIMARY KEY AUTO_INCREMENT,
    size_name VARCHAR(20) NOT NULL UNIQUE
);


CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    base_price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE product_variants (
    variant_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color_id INT,
    size_id INT,
    sku VARCHAR(50) UNIQUE,
    price DECIMAL(10, 2),
    stock_quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (color_id) REFERENCES colors(color_id),
    FOREIGN KEY (size_id) REFERENCES sizes(size_id)
);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    variant_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


INSERT INTO products (product_name, description, category, base_price) VALUES
('Supreme/Jordan Puffer Jacket', 'Water resistant poly with filled quilted baffles and taffeta lining. Made exclusively for Supreme.', 'Jackets', 368.00),
('Polartec Shearling Reversible Pullover', 'Polartec 300 shearling fleece with half snap enclosure. Woven logo label at lower front.', 'Jackets', 199.00),
('Washed Flight Satin N-3B Parka', 'Water resisant nylon flight satin twill with fill. Made by Alpha Industries exclusively for Supreme.', 'Jackets', 498.00),
('Loose Fit Stripe Shirt', 'All cotton with oversized fit and button down collar.', 'Shirts', 148.00),
('Small Box Shirt', 'All cotton denim with button down collar. Embroidered logo patch on chest.', 'Shirts', 138.00),
('Plaid Flannel Shirt', 'All cotton flannel with button down collar and single chest pocket. Embroidered logo on pocket.', 'Shirts', 138.00),
('Cashmere Sweater', 'Cashmere with embroidered logo on chest.', 'Tops', 268.00),
('Supreme/Jordan Warm Up Jersey', 'Poly dazzle. Dazzle applique and embroidered logos on chest and back. Made exclusively for Supreme.', 'Tops', 148.00),
('Embroidered Collar L/S Top', 'All cotton jersey crewneck with embroidered logo on collar.', 'Tops', 88.00),
('Supreme/Jordan Hooded Sweatshirt', 'Brushed-back fleece with pouch pocket. Embroidered logo on chest and printed logo on back. Made exclusively for Supreme.', 'Sweatshirts', 168.00),
('S Logo Zip Up Hooded Sweatshirt', 'Heavyweight crossgrain brushed-back fleece with full zip closure and pouch pocket. Embroidered logos on chest and hood.', 'Sweatshirts', 168.00),
('Collegiate Sleeve Hooded Sweatshirt', 'Brushed-back fleece with rib gussets and pouch pockets. Printed logos on sleeves and back hem.', 'Sweatshirts', 158.00),
('Supreme/Jordan Tricot Track Pant', 'Poly tricot with brushed backing Welt hand pockets and welt snap back pocket. Made exclusively for Supreme.', 'Pants', 178.00),
('Washed Flight Satin Cargo Pant', 'Water resistant flight satin twill with GORE WINDSTOPPER drop liner and nylon lining.', 'Pants', 298.00),
('S Logo Sweatpant', 'Heavyweight crossgrain brushed-back fleece with on seam hand pockets and single back patch pocket. Embroidered logos on thigh and back pocket.', 'Pants', 158.00),
('Cargo Pant', 'All cotton with enzyme wash. Zip fly enclosure, snap closure, twill tape size adjusters at waist and drawstring at cuffs.', 'Pants', 168.00),
('Baggy Jean', 'All cotton 13 oz. denim with baggy fit. Classic S-pocket style with zip fly, single coin pocket, copper rivets and embroidered logo on back pocket.', 'Pants', 168.00),
('Supreme/Jordan Warm Up Short', 'Poly dazzle with mesh lining. Embroidered logos at front and back pocket. Made exclusively for Supreme.', 'Shorts', 138.00),
('Screw Ball S Logo New Era', 'Poly New Era 59FIFTY baseball hat with embroideries on front, sides and back.', 'Hats', 54.00),
('Washed Chino Twill Camp Cap', 'All cotton denim Supreme camp cap with custom debossed leather strap closure.', 'Hats', 48.00),
('Underline Mesh Back 5-Panel', 'Poly 5-Panel hat with mesh back and snap enclosure. Embroidered logo on front.', 'Hats', 48.00),
('Classic Logo Crusher', 'All cotton denim crusher with embroidered logo on front.', 'Hats', 58.00),
('Backpack', 'Water resistant Cordura nylon with embossed logo lining. Reflective stripe and silicone logo trim at top flap. 24L.', 'Bags', 158.00),
('Camera Bag', 'Water resistant Cordura nylon with embossed logo lining. Silicone logo trim at back. 1.5L.', 'Bags', 58.00),
('Waist Bag', 'Water resistant Cordura nylon with embossed logo lining. Woven logo label, 3M Reflective stripe and silicone logo trim at front. 4L.', 'Bags', 78.00),
('Duffel Bag', 'Water resistant Cordura nylon with embossed logo lining. Woven logo label and 3M Reflective stripe at front. Silicone logo trim at sides and back. 47L.', 'Bags', 168.00),
('Supreme/Jordan Basketball', 'Composite leather indoor basketball with debossed graphics and logos. Size 7. Made exclusively for Supreme.', 'Accessories', 118.00),
('Replica Chopped Cheese Sandwich', 'Sampuru-style replica sandwich. Polyurethane, epoxy resin, and PVC construction. 9" ceramic plate with printed logo and logo wax paper.', 'Accessories', 148.00),
('Supreme/dearcloud Blemish Patches', 'Pack of dearcloud Hydrocolloid Blemish Patches. Four patches per shset; nine sheets included. Made exclusively for Supreme.', 'Accessories', 22.00),
('Supreme/Hanes Boxer Briefs (4 Pack)', 'All cotton classic Hanes boxer brief.', 'Accessories', 40.00),
('Blood And Body Skateboard', 'Supreme skate deck with natural veneer and tonal top ply. Original artwork by Sean Cliver.', 'Skate', 60.00),
('Supreme/Spitfire Shop Wheels (Set of 4)', 'Classic Spitfire wheels with custom Supreme art. Made eclusively for Supreme.', 'Skate', 36.00),
('Supreme/Independent Truck', 'Classic Independent truck with custom Supreme art. Made exclusively for Supreme.', 'Skate', 60.00);


INSERT INTO colors (color_name) VALUES
('Navy'), ('Camo'), ('Dusty Pink'), ('Off White'), ('Purple'), ('Blue Stripe'), ('Light Blue'),
('Ash Grey'), ('Light Olive'), ('Black'), ('Tan'), ('Medium Washed Indigo'), ('Woodland Camo'),
('Denim'), ('Cardinal'), ('Red'), ('Natural');


INSERT INTO sizes (size_name) VALUES
('XS'), ('S'), ('M'), ('L'), ('XL'), ('XXL'), ('One Size');


INSERT INTO product_variants (product_id, color_id, size_id, sku, price, stock_quantity)
VALUES
	-- Supreme/Jordan Puffer Jacket
	(1, (SELECT color_id FROM colors WHERE color_name = 'Navy'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'SUP-JOR-PUF-NAV-S', 368.00, 100),
	(1, (SELECT color_id FROM colors WHERE color_name = 'Navy'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'SUP-JOR-PUF-NAV-M', 368.00, 150),
	(1, (SELECT color_id FROM colors WHERE color_name = 'Navy'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'SUP-JOR-PUF-NAV-L', 368.00, 150),
	(1, (SELECT color_id FROM colors WHERE color_name = 'Navy'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'SUP-JOR-PUF-NAV-XL', 368.00, 100),

	-- Polartec Shearling Reversible Pullover
	(2, (SELECT color_id FROM colors WHERE color_name = 'Camo'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'POL-SHE-REV-CAM-S', 199.00, 120),
	(2, (SELECT color_id FROM colors WHERE color_name = 'Camo'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'POL-SHE-REV-CAM-M', 199.00, 150),
	(2, (SELECT color_id FROM colors WHERE color_name = 'Camo'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'POL-SHE-REV-CAM-L', 199.00, 150),
	(2, (SELECT color_id FROM colors WHERE color_name = 'Camo'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'POL-SHE-REV-CAM-XL', 199.00, 120),

	-- Washed Flight Satin N-3B Parka
	(3, (SELECT color_id FROM colors WHERE color_name = 'Dusty Pink'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'WAS-FLI-PAR-PIN-S', 498.00, 80),
	(3, (SELECT color_id FROM colors WHERE color_name = 'Dusty Pink'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'WAS-FLI-PAR-PIN-M', 498.00, 100),
	(3, (SELECT color_id FROM colors WHERE color_name = 'Dusty Pink'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'WAS-FLI-PAR-PIN-L', 498.00, 100),
	(3, (SELECT color_id FROM colors WHERE color_name = 'Dusty Pink'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'WAS-FLI-PAR-PIN-XL', 498.00, 80),

	-- Loose Fit Stripe Shirt
	(4, (SELECT color_id FROM colors WHERE color_name = 'Off White'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'LOO-FIT-STR-WHT-S', 148.00, 150),
	(4, (SELECT color_id FROM colors WHERE color_name = 'Off White'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'LOO-FIT-STR-WHT-M', 148.00, 200),
	(4, (SELECT color_id FROM colors WHERE color_name = 'Off White'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'LOO-FIT-STR-WHT-L', 148.00, 200),
	(4, (SELECT color_id FROM colors WHERE color_name = 'Off White'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'LOO-FIT-STR-WHT-XL', 148.00, 150),

	-- Small Box Shirt
	(5, (SELECT color_id FROM colors WHERE color_name = 'Denim'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'SMA-BOX-SHI-DEN-S', 138.00, 150),
	(5, (SELECT color_id FROM colors WHERE color_name = 'Denim'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'SMA-BOX-SHI-DEN-M', 138.00, 200),
	(5, (SELECT color_id FROM colors WHERE color_name = 'Denim'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'SMA-BOX-SHI-DEN-L', 138.00, 200),
	(5, (SELECT color_id FROM colors WHERE color_name = 'Denim'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'SMA-BOX-SHI-DEN-XL', 138.00, 150),

	-- Plaid Flannel Shirt
	(6, (SELECT color_id FROM colors WHERE color_name = 'Purple'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'PLA-FLA-SHI-PUR-S', 138.00, 150),
	(6, (SELECT color_id FROM colors WHERE color_name = 'Purple'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'PLA-FLA-SHI-PUR-M', 138.00, 200),
	(6, (SELECT color_id FROM colors WHERE color_name = 'Purple'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'PLA-FLA-SHI-PUR-L', 138.00, 200),
	(6, (SELECT color_id FROM colors WHERE color_name = 'Purple'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'PLA-FLA-SHI-PUR-XL', 138.00, 150),

	-- Cashmere Sweater
	(7, (SELECT color_id FROM colors WHERE color_name = 'Blue Stripe'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'CAS-SWE-BLU-STR-S', 268.00, 100),
	(7, (SELECT color_id FROM colors WHERE color_name = 'Blue Stripe'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'CAS-SWE-BLU-STR-M', 268.00, 120),
	(7, (SELECT color_id FROM colors WHERE color_name = 'Blue Stripe'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'CAS-SWE-BLU-STR-L', 268.00, 120),
	(7, (SELECT color_id FROM colors WHERE color_name = 'Blue Stripe'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'CAS-SWE-BLU-STR-XL', 268.00, 100),

	-- Supreme/Jordan Warm Up Jersey
	(8, (SELECT color_id FROM colors WHERE color_name = 'Light Blue'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'SUP-JOR-JER-LBL-S', 148.00, 200),
	(8, (SELECT color_id FROM colors WHERE color_name = 'Light Blue'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'SUP-JOR-JER-LBL-M', 148.00, 250),
	(8, (SELECT color_id FROM colors WHERE color_name = 'Light Blue'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'SUP-JOR-JER-LBL-L', 148.00, 250),
	(8, (SELECT color_id FROM colors WHERE color_name = 'Light Blue'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'SUP-JOR-JER-LBL-XL', 148.00, 200),

	-- Embroidered Collar L/S Top
	(9, (SELECT color_id FROM colors WHERE color_name = 'Off White'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'EMB-COL-TOP-WHT-S', 88.00, 300),
	(9, (SELECT color_id FROM colors WHERE color_name = 'Off White'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'EMB-COL-TOP-WHT-M', 88.00, 400),
	(9, (SELECT color_id FROM colors WHERE color_name = 'Off White'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'EMB-COL-TOP-WHT-L', 88.00, 400),
	(9, (SELECT color_id FROM colors WHERE color_name = 'Off White'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'EMB-COL-TOP-WHT-XL', 88.00, 300),

	-- Supreme/Jordan Hooded Sweatshirt
	(10, (SELECT color_id FROM colors WHERE color_name = 'Ash Grey'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'SUP-JOR-HOO-GRY-S', 168.00, 150),
	(10, (SELECT color_id FROM colors WHERE color_name = 'Ash Grey'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'SUP-JOR-HOO-GRY-M', 168.00, 200),
	(10, (SELECT color_id FROM colors WHERE color_name = 'Ash Grey'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'SUP-JOR-HOO-GRY-L', 168.00, 200),
	(10, (SELECT color_id FROM colors WHERE color_name = 'Ash Grey'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'SUP-JOR-HOO-GRY-XL', 168.00, 150),

	-- S Logo Zip Up Hooded Sweatshirt
	(11, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'S-LOG-ZIP-HOO-OLI-S', 168.00, 150),
	(11, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'S-LOG-ZIP-HOO-OLI-M', 168.00, 200),
	(11, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'S-LOG-ZIP-HOO-OLI-L', 168.00, 200),
	(11, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'S-LOG-ZIP-HOO-OLI-XL', 168.00, 150),

	-- Collegiate Sleeve Hooded Sweatshirt
	(12, (SELECT color_id FROM colors WHERE color_name = 'Black'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'COL-SLE-HOO-BLK-S', 158.00, 150),
	(12, (SELECT color_id FROM colors WHERE color_name = 'Black'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'COL-SLE-HOO-BLK-M', 158.00, 200),
	(12, (SELECT color_id FROM colors WHERE color_name = 'Black'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'COL-SLE-HOO-BLK-L', 158.00, 200),
	(12, (SELECT color_id FROM colors WHERE color_name = 'Black'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'COL-SLE-HOO-BLK-XL', 158.00, 150),

	-- Supreme/Jordan Tricot Track Pant
	(13, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'SUP-JOR-TRA-PAN-OLI-S', 178.00, 150),
	(13, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'SUP-JOR-TRA-PAN-OLI-M', 178.00, 200),
	(13, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'SUP-JOR-TRA-PAN-OLI-L', 178.00, 200),
	(13, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'SUP-JOR-TRA-PAN-OLI-XL', 178.00, 150),

	-- Washed Flight Satin Cargo Pant
	(14, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'WAS-FLI-CAR-PAN-OLI-S', 298.00, 100),
	(14, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'WAS-FLI-CAR-PAN-OLI-M', 298.00, 120),
	(14, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'WAS-FLI-CAR-PAN-OLI-L', 298.00, 120),
	(14, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'WAS-FLI-CAR-PAN-OLI-XL', 298.00, 100),

	-- S Logo Sweatpant
	(15, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'S-LOG-SWE-PAN-OLI-S', 158.00, 150),
	(15, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'S-LOG-SWE-PAN-OLI-M', 158.00, 200),
	(15, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'S-LOG-SWE-PAN-OLI-L', 158.00, 200),
	(15, (SELECT color_id FROM colors WHERE color_name = 'Light Olive'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'S-LOG-SWE-PAN-OLI-XL', 158.00, 150),

	-- Cargo Pant
	(16, (SELECT color_id FROM colors WHERE color_name = 'Tan'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'CAR-PAN-TAN-S', 168.00, 150),
	(16, (SELECT color_id FROM colors WHERE color_name = 'Tan'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'CAR-PAN-TAN-M', 168.00, 200),
	(16, (SELECT color_id FROM colors WHERE color_name = 'Tan'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'CAR-PAN-TAN-L', 168.00, 200),
	(16, (SELECT color_id FROM colors WHERE color_name = 'Tan'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'CAR-PAN-TAN-XL', 168.00, 150),

	-- Baggy Jean
	(17, (SELECT color_id FROM colors WHERE color_name = 'Medium Washed Indigo'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'BAG-JEA-IND-S', 168.00, 250),
	(17, (SELECT color_id FROM colors WHERE color_name = 'Medium Washed Indigo'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'BAG-JEA-IND-M', 168.00, 300),
	(17, (SELECT color_id FROM colors WHERE color_name = 'Medium Washed Indigo'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'BAG-JEA-IND-L', 168.00, 300),
	(17, (SELECT color_id FROM colors WHERE color_name = 'Medium Washed Indigo'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'BAG-JEA-IND-XL', 168.00, 250),

	-- Supreme/Jordan Warm Up Short
	(18, (SELECT color_id FROM colors WHERE color_name = 'Light Blue'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'SUP-JOR-SHO-LBL-S', 138.00, 150),
	(18, (SELECT color_id FROM colors WHERE color_name = 'Light Blue'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'SUP-JOR-SHO-LBL-M', 138.00, 200),
	(18, (SELECT color_id FROM colors WHERE color_name = 'Light Blue'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'SUP-JOR-SHO-LBL-L', 138.00, 200),
	(18, (SELECT color_id FROM colors WHERE color_name = 'Light Blue'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'SUP-JOR-SHO-LBL-XL', 138.00, 150),

	-- Screw Ball S Logo New Era
	(19, (SELECT color_id FROM colors WHERE color_name = 'Woodland Camo'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'SCR-BAL-NEW-WOO-OS', 54.00, 5000),

	-- Washed Chino Twill Camp Cap
	(20, (SELECT color_id FROM colors WHERE color_name = 'Denim'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'WAS-CHI-CAP-DEN-OS', 48.00, 6000),

	-- Underline Mesh Back 5-Panel
	(21, (SELECT color_id FROM colors WHERE color_name = 'Cardinal'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'UND-MES-5PAN-CAR-OS', 48.00, 5000),

	-- Classic Logo Crusher
	(22, (SELECT color_id FROM colors WHERE color_name = 'Denim'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'CLA-LOG-CRU-DEN-OS', 58.00, 4000),

	-- Backpack
	(23, (SELECT color_id FROM colors WHERE color_name = 'Tan'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'BAC-PAC-TAN-OS', 158.00, 1000),

	-- Camera Bag
	(24, (SELECT color_id FROM colors WHERE color_name = 'Tan'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'CAM-BAG-TAN-OS', 58.00, 1000),

	-- Waist Bag
	(25, (SELECT color_id FROM colors WHERE color_name = 'Tan'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'WAI-BAG-TAN-OS', 78.00, 2000),

	-- Duffel Bag
	(26, (SELECT color_id FROM colors WHERE color_name = 'Red'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'DUF-BAG-RED-OS', 168.00, 1000),

	-- Supreme/Jordan Basketball
	(27, (SELECT color_id FROM colors WHERE color_name = 'Natural'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'SUP-JOR-BAS-NAT-OS', 118.00, 500),

	-- Replica Chopped Cheese Sandwich
	(28, (SELECT color_id FROM colors WHERE color_name = 'Natural'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'REP-CHO-CHE-NAT-OS', 148.00, 250),

	-- Supreme/dearcloud Blemish Patches
	(29, (SELECT color_id FROM colors WHERE color_name = 'Black'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'SUP-DEA-BLE-BLK-OS', 22.00, 25000),

	-- Supreme/Hanes Boxer Briefs (4 Pack)
	(30, (SELECT color_id FROM colors WHERE color_name = 'Black'), (SELECT size_id FROM sizes WHERE size_name = 'S'), 'SUP-HAN-BOX-BLK-S', 40.00, 5000),
	(30, (SELECT color_id FROM colors WHERE color_name = 'Black'), (SELECT size_id FROM sizes WHERE size_name = 'M'), 'SUP-HAN-BOX-BLK-M', 40.00, 7500),
	(30, (SELECT color_id FROM colors WHERE color_name = 'Black'), (SELECT size_id FROM sizes WHERE size_name = 'L'), 'SUP-HAN-BOX-BLK-L', 40.00, 7500),
	(30, (SELECT color_id FROM colors WHERE color_name = 'Black'), (SELECT size_id FROM sizes WHERE size_name = 'XL'), 'SUP-HAN-BOX-BLK-XL', 40.00, 5000),

	-- Blood And Body Skateboard
	(31, (SELECT color_id FROM colors WHERE color_name = 'Purple'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'BLO-BOD-SKA-PUR-OS', 60.00, 3000),

	-- Supreme/Spitfire Shop Wheels (Set of 4)
	(32, (SELECT color_id FROM colors WHERE color_name = 'Natural'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'SUP-SPI-WHE-NAT-OS', 36.00, 5000),

	-- Supreme/Independent Truck
	(33, (SELECT color_id FROM colors WHERE color_name = 'Silver'), (SELECT size_id FROM sizes WHERE size_name = 'One Size'), 'SUP-IND-TRU-SIL-OS', 60.00, 13000);


INSERT INTO customers (first_name, last_name, email, phone, address, created_at) VALUES
	('Emma', 'Johnson', 'emma.johnson@email.com', '212-555-1234', '456 Fashion Ave, New York, NY 10018', '2023-09-15 10:30:00'),
	('Liam', 'Williams', 'liam.williams@email.com', '310-555-5678', '789 Rodeo Dr, Beverly Hills, CA 90210', '2023-10-02 14:45:00'),
	('Olivia', 'Brown', 'olivia.brown@email.com', '415-555-9012', '101 Haight St, San Francisco, CA 94117', '2023-10-20 09:15:00'),
	('Noah', 'Jones', 'noah.jones@email.com', '312-555-3456', '202 N Michigan Ave, Chicago, IL 60601', '2023-11-05 16:20:00'),
	('Ava', 'Garcia', 'ava.garcia@email.com', '305-555-7890', '303 Ocean Dr, Miami Beach, FL 33139', '2023-11-18 11:40:00'),
	('Ethan', 'Miller', 'ethan.miller@email.com', '206-555-2345', '404 Pike St, Seattle, WA 98101', '2023-12-01 13:55:00'),
	('Sophia', 'Davis', 'sophia.davis@email.com', '512-555-6789', '505 S Congress Ave, Austin, TX 78704', '2023-12-15 10:10:00'),
	('Mason', 'Rodriguez', 'mason.rodriguez@email.com', '702-555-0123', '606 Las Vegas Blvd, Las Vegas, NV 89109', '2024-01-03 15:30:00'),
	('Isabella', 'Martinez', 'isabella.martinez@email.com', '404-555-4567', '707 Peachtree St NE, Atlanta, GA 30308', '2024-01-20 12:25:00'),
	('William', 'Hernandez', 'william.hernandez@email.com', '617-555-8901', '808 Newbury St, Boston, MA 02116', '2024-02-05 09:50:00'),
	('Mia', 'Lopez', 'mia.lopez@email.com', '503-555-2345', '909 Pearl District, Portland, OR 97209', '2024-02-18 14:15:00'),
	('James', 'Gonzalez', 'james.gonzalez@email.com', '303-555-6789', '1010 16th St Mall, Denver, CO 80202', '2024-03-02 11:05:00'),
	('Charlotte', 'Wilson', 'charlotte.wilson@email.com', '215-555-0123', '1111 South St, Philadelphia, PA 19147', '2024-03-15 16:40:00'),
	('Benjamin', 'Anderson', 'benjamin.anderson@email.com', '615-555-4567', '1212 Broadway, Nashville, TN 37203', '2024-03-30 10:55:00'),
	('Amelia', 'Taylor', 'amelia.taylor@email.com', '504-555-8901', '1313 Bourbon St, New Orleans, LA 70116', '2024-04-12 13:20:00');


INSERT INTO orders (order_id, order_date, total_amount, status) VALUES
	(1, '2023-09-20 14:30:00', 566.00, 'Delivered'),
	(2, '2023-10-05 11:15:00', 386.00, 'Shipped'),
	(3, '2023-10-25 09:45:00', 436.00, 'Delivered'),
	(4, '2023-11-10 16:20:00', 326.00, 'Delivered'),
	(5, '2023-11-22 13:10:00', 426.00, 'Shipped'),
	(6, '2023-12-05 10:30:00', 308.00, 'Processing'),
	(7, '2023-12-18 15:45:00', 546.00, 'Shipped'),
	(8, '2024-01-07 12:20:00', 226.00, 'Delivered'),
	(9, '2024-01-25 09:55:00', 666.00, 'Processing'),
	(10, '2024-02-08 14:40:00', 406.00, 'Shipped'),
	(11, '2024-02-22 11:05:00', 336.00, 'Processing'),
	(12, '2024-03-05 16:30:00', 486.00, 'Shipped'),
	(13, '2024-03-18 10:15:00', 296.00, 'Processing'),
	(14, '2024-04-01 13:50:00', 466.00, 'Pending'),
	(15, '2024-04-15 11:25:00', 386.00, 'Pending');


INSERT INTO order_items (order_id, variant_id, quantity, price) VALUES
	(1, 1, 2, 368.00),  
	(1, 4, 3, 198.00),  
	(2, 2, 1, 199.00),  
	(2, 5, 1, 138.00),  
	(2, 19, 1, 49.00),  
	(3, 7, 1, 268.00),  
	(3, 20, 7, 168.00), 
	(4, 10, 5, 168.00), 
	(4, 21, 3, 158.00), 
	(5, 13, 1, 178.00),
	(5, 22, 3, 148.00),
	(6, 3, 1, 368.00),
	(6, 23, 1, 58.00),
	(7, 8, 1, 148.00),
	(7, 24, 1, 60.00),
	(8, 14, 2, 298.00),
	(8, 25, 1, 48.00),
	(9, 18, 1, 138.00),
	(9, 26, 1, 88.00),
	(10, 1, 1, 368.00),
	(10, 7, 1, 298.00),
	(11, 11, 1, 168.00),
	(11, 27, 1, 238.00),
	(12, 15, 1, 158.00),
	(12, 28, 1, 178.00),
	(13, 6, 1, 138.00),
	(13, 9, 1, 348.00),
	(14, 16, 1, 168.00),
	(14, 29, 1, 128.00),
	(15, 17, 1, 168.00),
	(15, 30, 1, 298.00),
	(16, 12, 1, 158.00),
	(16, 31, 1, 228.00);
