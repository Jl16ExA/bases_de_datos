--Describe the tables

-- - olist_products;
-- - olist_order_items;
-- - olist_orders;
-- - olist_order_payments;
-- - olist_product_category_name_translation;

-- Crea un esquema usando dscr teniendo el cuneta el siguiente ejemplo:

//// -- LEVEL 1
//// -- Schemas, Tables and References

// Creating tables
// You can define the tables with full schema names
Table ecommerce.merchants {
  id int
  country_code int
  merchant_name varchar
  
  "created at" varchar
  admin_id int [ref: > U.id]
  Indexes {
    (id, country_code) [pk]
  }
}

// If schema name is omitted, it will default to "public" schema.
Table users as U {
  id int [pk, increment] // auto-increment
  full_name varchar
  created_at timestamp
  country_code int
}

Table countries {
  code int [pk]
  name varchar
  continent_name varchar
 }

// Creating references
// You can also define relaionship separately
// > many-to-one; < one-to-many; - one-to-one; <> many-to-many
Ref: U.country_code > countries.code  
Ref: ecommerce.merchants.country_code > countries.code

//----------------------------------------------//

//// -- LEVEL 2
//// -- Adding column settings

Table ecommerce.order_items {
  order_id int [ref: > ecommerce.orders.id] // inline relationship (many-to-one)
  product_id int
  quantity int [default: 1] // default value
}

Ref: ecommerce.order_items.product_id > ecommerce.products.id

Table ecommerce.orders {
  id int [pk] // primary key
  user_id int [not null, unique]
  status varchar
  created_at varchar [note: 'When order created'] // add column note
}

//----------------------------------------------//

//// -- Level 3 
//// -- Enum, Indexes

// Enum for 'products' table below
Enum ecommerce.products_status {
  out_of_stock
  in_stock
  running_low [note: 'less than 20'] // add column note
}

// Indexes: You can define a single or multi-column index 
Table ecommerce.products {
  id int [pk]
  name varchar
  merchant_id int [not null]
  price int
  status ecommerce.products_status
  created_at datetime [default: `now()`]
  
  Indexes {
    (merchant_id, status) [name:'product_status']
    id [unique]
  }
}

Table ecommerce.product_tags {
  id int [pk]
  name varchar
}

Table ecommerce.merchant_periods {
  id int [pk]
  merchant_id int
  country_code int
  start_date datetime
  end_date datetime
}

Ref: ecommerce.products.merchant_id > ecommerce.merchants.id // many-to-one
Ref: ecommerce.product_tags.id <> ecommerce.products.id // many-to-many
//composite foreign key
Ref: ecommerce.merchant_periods.(merchant_id, country_code) > ecommerce.merchants.(id, country_code)


-- Creat schema based on the following table descriptions:

olist_order_items

Name	Null?	Type
ORDER_ID		VARCHAR2(128)
ORDER_ITEM_ID		NUMBER(38)
PRODUCT_ID		VARCHAR2(128)
SELLER_ID		VARCHAR2(128)
SHIPPING_LIMIT_DATE		DATE
PRICE		NUMBER(38,2)
FREIGHT_VALUE		NUMBER(38,2)


olist_order_payments


Name	Null?	Type
ORDER_ID		VARCHAR2(128)
PAYMENT_SEQUENTIAL		NUMBER(38)
PAYMENT_TYPE		VARCHAR2(26)
PAYMENT_INSTALLMENTS		NUMBER(38)
PAYMENT_VALUE		NUMBER(38,2)

olist_orders


Name	Null?	Type
ORDER_ID		VARCHAR2(128)
CUSTOMER_ID		VARCHAR2(128)
ORDER_STATUS		VARCHAR2(26)
ORDER_PURCHASE_TIMESTAMP		DATE
ORDER_APPROVED_AT		DATE
ORDER_DELIVERED_CARRIER_DATE		DATE
ORDER_DELIVERED_CUSTOMER_DATE		DATE
ORDER_ESTIMATED_DELIVERY_DATE		DATE

olist_product_category_name_translation


Name	Null?	Type
PRODUCT_CATEGORY_NAME		VARCHAR2(128)
PRODUCT_CATEGORY_NAME_ENGLISH		VARCHAR2(128)

olist_products


Name	Null?	Type
PRODUCT_ID		VARCHAR2(128)
PRODUCT_CATEGORY_NAME		VARCHAR2(128)
PRODUCT_NAME_LENGHT		NUMBER(38)
PRODUCT_DESCRIPTION_LENGHT		NUMBER(38)
PRODUCT_PHOTOS_QTY		NUMBER(38)
PRODUCT_WEIGHT_G		NUMBER(38)
PRODUCT_LENGTH_CM		NUMBER(38)
PRODUCT_HEIGHT_CM		NUMBER(38)
PRODUCT_WIDTH_CM		NUMBER(38)

dsl Schema:

-- Crea un esquema usando dscr teniendo el cuneta el siguiente ejemplo:

//// -- LEVEL 1
//// -- Schemas, Tables and References

// Creating tables
// You can define the tables with full schema names
Table olist.order_items {
  order_id varchar
  order_item_id int [pk]
  product_id varchar
  seller_id varchar
  shipping_limit_date date
  price number
  freight_value number
  
  Indexes {
    (order_id, product_id) [pk]
  }
}

// If schema name is omitted, it will default to "public" schema.
Table olist.order_payments {
  order_id varchar [pk]
  payment_sequential int [pk]
  payment_type varchar
  payment_installments int
  payment_value number
  Indexes {
    (order_id, payment_sequential) [pk]
  }
}

Table olist.orders {
  order_id varchar [pk]
  customer_id varchar
  order_status varchar
  order_purchase_timestamp date
  order_approved_at date
  order_delivered_carrier_date date
  order_delivered_customer_date date
  order_estimated_delivery_date date
  Indexes {
    (order_id) [pk]
  }
}

Table olist.product_category_name_translation {
  product_category_name varchar [pk]
  product_category_name_english varchar
  Indexes {
    (product_category_name) [pk]
  }
}

Table olist.products {
  product_id varchar [pk]
  product_category_name varchar
  product_name_lenght int
  product_description_lenght int
  product_photos_qty int
  product_weight_g int
  product_length_cm int
  product_height_cm int
  product_width_cm int
  Indexes {
    (product_id) [pk]
  }
}

// Creating references
// You can also define relaionship separately
// > many-to-one; < one-to-many; - one-to-one; <> many-to-many
Ref: olist.order_items.order_id > olist.orders.order_id
Ref: olist.order_items.product_id > olist.products.product_id
Ref: olist.order_payments.order_id > olist.orders.order_id
Ref: olist.products.product_category_name > olist.product_category_name_translation.product_category_name




