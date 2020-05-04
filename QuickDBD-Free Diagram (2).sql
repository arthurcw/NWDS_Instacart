-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1Il6HK
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE "orders" (
    "order_id" INT   NOT NULL,
    "user_id" INT   NOT NULL,
    "eval_set" VARCHAR   NOT NULL,
    "order_number" INT   NOT NULL,
    "order_dow" INT   NOT NULL,
    "order_hour_of_day" INT   NOT NULL,
    "days_since_prior" FLOAT   NOT NULL
);

CREATE TABLE "products" (
    "product_id" INT   NOT NULL,
    "product_name" VARCHAR(50)   NOT NULL,
    "aisle_id" INT   NOT NULL,
    "department_id" INT   NOT NULL,
    CONSTRAINT "pk_products" PRIMARY KEY (
        "product_id"
     )
);

CREATE TABLE "aisles" (
    "aisle_id" INT   NOT NULL,
    "aisle" VARCHART   NOT NULL,
    CONSTRAINT "pk_aisles" PRIMARY KEY (
        "aisle_id"
     )
);

CREATE TABLE "deptartments" (
    "department_id" INT   NOT NULL,
    "department" VARCHAR   NOT NULL,
    CONSTRAINT "pk_deptartments" PRIMARY KEY (
        "department_id"
     )
);

CREATE TABLE "order_products_prior" (
    "order_id" INT   NOT NULL,
    "product_id" INT   NOT NULL,
    "add_to_cart_order" INT   NOT NULL,
    "reordered" INT   NOT NULL
);

CREATE TABLE "order_products__train" (
    "order_id" INT   NOT NULL,
    "product_id" INT   NOT NULL,
    "add_to_cart_order" INT   NOT NULL,
    "reordered" INT   NOT NULL
);

ALTER TABLE "products" ADD CONSTRAINT "fk_products_aisle_id" FOREIGN KEY("aisle_id")
REFERENCES "aisles" ("aisle_id");

ALTER TABLE "deptartments" ADD CONSTRAINT "fk_deptartments_department_id" FOREIGN KEY("department_id")
REFERENCES "products" ("department_id");

ALTER TABLE "order_products_prior" ADD CONSTRAINT "fk_order_products_prior_order_id" FOREIGN KEY("order_id")
REFERENCES "orders" ("order_id");

ALTER TABLE "order_products_prior" ADD CONSTRAINT "fk_order_products_prior_product_id" FOREIGN KEY("product_id")
REFERENCES "products" ("product_id");

ALTER TABLE "order_products__train" ADD CONSTRAINT "fk_order_products__train_order_id" FOREIGN KEY("order_id")
REFERENCES "orders" ("order_id");

ALTER TABLE "order_products__train" ADD CONSTRAINT "fk_order_products__train_product_id" FOREIGN KEY("product_id")
REFERENCES "products" ("product_id");

