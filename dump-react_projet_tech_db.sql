-- react_projet_tech_db.attribute_groups definition

create table `attribute_groups` (
  `id` bigint(20) unsigned not null auto_increment,
`position` int(11) default 0,
`created_at` timestamp null default current_timestamp(),
`updated_at` timestamp null default current_timestamp() on
update
    current_timestamp(),
    primary key (`id`)
) engine = InnoDB auto_increment = 32 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.branches definition

create table `branches` (
  `id` int(11) not null auto_increment,
`name` varchar(255) not null,
`address` varchar(255) default null,
`is_active` tinyint(1) default 1,
primary key (`id`)
) engine = InnoDB auto_increment = 16 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.brands definition

create table `brands` (
  `id` int(11) not null auto_increment,
`name` varchar(100) not null,
`slug` varchar(100) not null,
`logo_url` varchar(255) default null,
`created_at` timestamp not null default current_timestamp(),
`updated_at` timestamp not null default current_timestamp() on
update
    current_timestamp(),
    primary key (`id`),
    unique key `name` (`name`),
    unique key `slug` (`slug`)
) engine = InnoDB auto_increment = 62 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.coupons definition

create table `coupons` (
  `id` int(11) not null auto_increment,
`code` varchar(50) not null,
`discount_percent` int(11) default null,
`discount_amount` decimal(10, 2) default null,
`expires_at` datetime default null,
`is_active` tinyint(1) default 1,
primary key (`id`),
unique key `code` (`code`)
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.orders definition

create table `orders` (
  `id` int(11) not null auto_increment,
`user_id` int(11) default null,
`guest_email` varchar(255) default null,
`total_price` decimal(10, 2) not null,
`status` enum('pending', 'processing', 'shipped', 'delivered', 'cancelled') default 'pending',
`shipping_address` text not null,
`created_at` timestamp not null default current_timestamp(),
`updated_at` timestamp not null default current_timestamp() on
update
    current_timestamp(),
    primary key (`id`)
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.users definition

create table `users` (
  `id` int(11) not null auto_increment,
`name` varchar(255) not null,
`email` varchar(255) not null,
`password` varchar(255) not null,
`phone` varchar(50) default null,
`address` text default null,
`role` enum('user', 'admin') default 'user',
`created_at` timestamp not null default current_timestamp(),
`updated_at` timestamp not null default current_timestamp() on
update
    current_timestamp(),
    primary key (`id`),
    unique key `email` (`email`)
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.attribute_group_translations definition

create table `attribute_group_translations` (
  `id` int(11) not null auto_increment,
`attribute_group_id` bigint(20) unsigned not null,
`locale` varchar(10) not null,
`name` varchar(255) not null,
primary key (`id`),
unique key `attr_group_locale_unique` (`attribute_group_id`,
`locale`),
constraint `attribute_group_translations_ibfk_1` foreign key (`attribute_group_id`) references `attribute_groups` (`id`) on
delete
    cascade
) engine = InnoDB auto_increment = 47 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.`attributes` definition

create table `attributes` (
  `id` int(11) not null auto_increment,
`attribute_group_id` bigint(20) unsigned default null,
primary key (`id`),
key `fk_attributes_group` (`attribute_group_id`),
constraint `fk_attributes_group` foreign key (`attribute_group_id`) references `attribute_groups` (`id`) on
delete
    set
    null
) engine = InnoDB auto_increment = 35 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.categories definition

create table `categories` (
  `id` int(11) not null auto_increment,
`slug` varchar(255) not null,
`parent_id` int(11) default null,
`image` longtext character set utf8mb4 collate utf8mb4_bin default null check (json_valid(`image`)),
primary key (`id`),
unique key `slug` (`slug`),
key `parent_id` (`parent_id`),
constraint `categories_ibfk_1` foreign key (`parent_id`) references `categories` (`id`) on
delete
    set
    null
) engine = InnoDB auto_increment = 257 default CHARSET = utf8mb4 collate = utf8mb4_unicode_ci;
-- react_projet_tech_db.category_attributes definition

create table `category_attributes` (
  `id` int(11) not null auto_increment,
`category_id` int(11) not null,
`attribute_groups_id` bigint(20) unsigned not null,
`display_order` int(11) default 0,
`is_filterable` tinyint(1) default 1,
primary key (`id`),
unique key `unique_category_attribute` (`category_id`,
`attribute_groups_id`),
key `fk_ca_attribute_group` (`attribute_groups_id`),
constraint `fk_ca_attribute_group` foreign key (`attribute_groups_id`) references `attribute_groups` (`id`) on
delete
    cascade on
    update
        cascade,
        constraint `fk_ca_category` foreign key (`category_id`) references `categories` (`id`) on
        delete
            cascade on
            update
                cascade
) engine = InnoDB auto_increment = 7 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.category_translations definition

create table `category_translations` (
  `id` int(11) not null auto_increment,
`category_id` int(11) not null,
`lang` varchar(5) not null,
`title` varchar(255) not null,
primary key (`id`),
key `idx_lang` (`lang`),
key `fk_category_translation` (`category_id`),
constraint `fk_category_translation` foreign key (`category_id`) references `categories` (`id`) on
delete
    cascade
) engine = InnoDB auto_increment = 251 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.payments definition

create table `payments` (
  `id` int(11) not null auto_increment,
`order_id` int(11) not null,
`payment_method` varchar(50) not null,
`transaction_id` varchar(255) default null,
`amount` decimal(10, 2) not null,
`status` enum('pending', 'completed', 'failed', 'refunded') default 'pending',
`created_at` timestamp not null default current_timestamp(),
primary key (`id`),
key `order_id` (`order_id`),
constraint `payments_ibfk_1` foreign key (`order_id`) references `orders` (`id`) on
delete
    cascade
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.products definition

create table `products` (
  `id` int(11) not null auto_increment,
`name` varchar(255) not null,
`category_id` int(11) default null,
`slug` varchar(255) not null,
`brand_id` int(11) default null,
`specifications` longtext character set utf8mb4 collate utf8mb4_bin default null check (json_valid(`specifications`)),
`description` text default null,
`short_description` varchar(500) default null,
`price` decimal(10, 2) not null default 0.00,
`discount_price` decimal(10, 2) default null,
`image` varchar(500) character set utf8mb4 collate utf8mb4_bin default null,
`images_gallery` text default null,
`is_active` tinyint(1) not null default 1,
`views` int(11) not null default 0,
`created_at` timestamp not null default current_timestamp(),
`updated_at` timestamp not null default current_timestamp() on
update
    current_timestamp(),
    `stock` int(11) not null default 0,
    primary key (`id`),
    unique key `slug` (`slug`),
    key `fk_product_category` (`category_id`),
    key `brand_id` (`brand_id`),
    constraint `fk_product_category` foreign key (`category_id`) references `categories` (`id`) on
    delete
        set
        null,
        constraint `products_ibfk_1` foreign key (`brand_id`) references `brands` (`id`) on
        delete
            set
            null on
            update
                cascade
) engine = InnoDB auto_increment = 310 default CHARSET = utf8mb4 collate = utf8mb4_unicode_ci;
-- react_projet_tech_db.reviews definition

create table `reviews` (
  `id` int(11) not null auto_increment,
`product_id` int(11) not null,
`user_id` int(11) not null,
`rating` tinyint(1) not null,
`comment` text default null,
`created_at` timestamp not null default current_timestamp(),
primary key (`id`),
key `product_id` (`product_id`),
key `user_id` (`user_id`),
constraint `reviews_ibfk_1` foreign key (`product_id`) references `products` (`id`) on
delete
    cascade,
    constraint `reviews_ibfk_2` foreign key (`user_id`) references `users` (`id`) on
    delete
        cascade
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.user_addresses definition

create table `user_addresses` (
  `id` bigint(20) unsigned not null auto_increment,
`user_id` int(11) not null,
`title` varchar(50) default null,
`first_name` varchar(255) not null,
`last_name` varchar(255) not null,
`phone` varchar(50) not null,
`city` varchar(255) not null,
`address_line_1` varchar(255) not null,
`address_line_2` varchar(255) default null,
`zip_code` varchar(20) default null,
`is_default` tinyint(1) default 0,
`created_at` timestamp null default current_timestamp(),
`updated_at` timestamp null default current_timestamp() on
update
    current_timestamp(),
    primary key (`id`),
    key `user_id` (`user_id`),
    constraint `user_addresses_ibfk_1` foreign key (`user_id`) references `users` (`id`) on
    delete
        cascade
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.wishlists definition

create table `wishlists` (
  `id` int(11) not null auto_increment,
`user_id` int(11) not null,
`product_id` int(11) not null,
`created_at` timestamp not null default current_timestamp(),
primary key (`id`),
key `user_id` (`user_id`),
key `product_id` (`product_id`),
constraint `wishlists_ibfk_1` foreign key (`user_id`) references `users` (`id`) on
delete
    cascade,
    constraint `wishlists_ibfk_2` foreign key (`product_id`) references `products` (`id`) on
    delete
        cascade
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.attribute_screen_groups definition

create table `attribute_screen_groups` (
  `id` int(11) not null auto_increment,
`categories_id` int(11) default 0,
`attribute_id` int(11) default null,
`position` int(11) default 0,
primary key (`id`),
key `attribute_screen_groups_categories_FK` (`categories_id`),
key `attribute_screen_groups_attributes_FK` (`attribute_id`),
constraint `attribute_screen_groups_attributes_FK` foreign key (`attribute_id`) references `attributes` (`id`) on
delete
    cascade on
    update
        cascade,
        constraint `attribute_screen_groups_categories_FK` foreign key (`categories_id`) references `categories` (`id`) on
        delete
            cascade on
            update
                cascade
) engine = InnoDB auto_increment = 23 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.attribute_translations definition

create table `attribute_translations` (
  `id` int(11) not null auto_increment,
`attribute_id` int(11) not null,
`locale` varchar(10) not null,
`name` varchar(255) not null,
primary key (`id`),
unique key `attr_locale_unique` (`attribute_id`,
`locale`),
constraint `attribute_translations_ibfk_1` foreign key (`attribute_id`) references `attributes` (`id`) on
delete
    cascade
) engine = InnoDB auto_increment = 60 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.cart_items definition

create table `cart_items` (
  `id` int(11) not null auto_increment,
`user_id` int(11) not null,
`product_id` int(11) not null,
`quantity` int(11) not null default 1,
`created_at` timestamp not null default current_timestamp(),
primary key (`id`),
key `user_id` (`user_id`),
key `product_id` (`product_id`),
constraint `cart_items_ibfk_1` foreign key (`user_id`) references `users` (`id`) on
delete
    cascade,
    constraint `cart_items_ibfk_2` foreign key (`product_id`) references `products` (`id`) on
    delete
        cascade
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.order_items definition

create table `order_items` (
  `id` int(11) not null auto_increment,
`order_id` int(11) not null,
`product_id` int(11) not null,
`quantity` int(11) not null default 1,
`price_at_purchase` decimal(10, 2) not null,
`created_at` timestamp not null default current_timestamp(),
primary key (`id`),
key `order_id` (`order_id`),
key `product_id` (`product_id`),
constraint `order_items_ibfk_1` foreign key (`order_id`) references `orders` (`id`) on
delete
    cascade,
    constraint `order_items_ibfk_2` foreign key (`product_id`) references `products` (`id`)
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.product_attribute_values definition

create table `product_attribute_values` (
  `id` int(11) not null auto_increment,
`product_id` int(11) not null,
`attribute_id` int(11) not null,
primary key (`id`),
key `product_id` (`product_id`),
key `attribute_id` (`attribute_id`),
constraint `product_attribute_values_ibfk_1` foreign key (`product_id`) references `products` (`id`) on
delete
    cascade,
    constraint `product_attribute_values_ibfk_2` foreign key (`attribute_id`) references `attributes` (`id`) on
    delete
        cascade
) engine = InnoDB auto_increment = 932 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.product_attribute_values_translations definition

create table `product_attribute_values_translations` (
  `id` int(11) not null auto_increment,
`product_attribute_value_id` int(11) not null,
`lang` varchar(10) not null,
`value` text not null,
primary key (`id`),
unique key `unique_pav_lang` (`product_attribute_value_id`,
`lang`),
constraint `fk_pav_translations_pav_id` foreign key (`product_attribute_value_id`) references `product_attribute_values` (`id`) on
delete
    cascade on
    update
        cascade
) engine = InnoDB auto_increment = 1752 default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.product_branches definition

create table `product_branches` (
  `product_id` int(11) not null,
`branch_id` int(11) not null,
`quantity` int(11) default 0,
primary key (`product_id`,
`branch_id`),
key `branch_id` (`branch_id`),
constraint `product_branches_ibfk_1` foreign key (`product_id`) references `products` (`id`) on
delete
    cascade,
    constraint `product_branches_ibfk_2` foreign key (`branch_id`) references `branches` (`id`) on
    delete
        cascade
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.product_categories definition

create table `product_categories` (
  `product_id` int(11) not null,
`category_id` int(11) not null,
primary key (`product_id`,
`category_id`),
key `category_id` (`category_id`),
constraint `product_categories_ibfk_1` foreign key (`product_id`) references `products` (`id`) on
delete
    cascade,
    constraint `product_categories_ibfk_2` foreign key (`category_id`) references `categories` (`id`) on
    delete
        cascade
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.product_images definition

create table `product_images` (
  `id` int(11) not null auto_increment,
`product_id` int(11) not null,
`image_url` varchar(500) not null,
`is_main` tinyint(1) default 0,
`sort_order` int(11) default 0,
`created_at` timestamp not null default current_timestamp(),
primary key (`id`),
key `fk_product_images_products` (`product_id`),
constraint `fk_product_images_products` foreign key (`product_id`) references `products` (`id`) on
delete
    cascade
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
-- react_projet_tech_db.product_translations definition

create table `product_translations` (
  `id` int(11) not null auto_increment,
`product_id` int(11) not null,
`locale` varchar(10) not null,
`name` varchar(255) not null,
`description` text default null,
`short_description` varchar(500) default null,
primary key (`id`),
key `product_id` (`product_id`),
constraint `product_translations_ibfk_1` foreign key (`product_id`) references `products` (`id`) on
delete
    cascade
) engine = InnoDB default CHARSET = utf8mb4 collate = utf8mb4_general_ci;
