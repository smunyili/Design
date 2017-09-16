--THIS SCRIPT IS USED TO CREATE A NEW DATABASE CALLED SHOPPINGLIST
-- Database: ShoppingList

-- DROP DATABASE "ShoppingList";

CREATE DATABASE "ShoppingList"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "ShoppingList"
    IS 'My Shopping List Assignment Database';

-- THIS SCRIPT WILL BE USED TO CREATE A NEW DATABASE TABLE CALLED lIST_DETAIL IN THE SHOPPING LIST DATABSE
-- Table: public."List_Detail"

-- DROP TABLE public."List_Detail";

CREATE TABLE public."List_Detail"
(
    "ID" integer NOT NULL,
    "List_Id" integer NOT NULL,
    "Product_it" integer NOT NULL,
    "Quantity" double precision NOT NULL,
    "Pref_Vendor" integer,
    "Price" money NOT NULL,
    "Paid_for" boolean NOT NULL DEFAULT false,
    "Delivered" boolean NOT NULL DEFAULT false,
    "Complete" boolean NOT NULL DEFAULT false,
    "Dropped" boolean NOT NULL DEFAULT false,
    CONSTRAINT "List_Detail_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."List_Detail"
    OWNER to postgres;

-- Table: public."Products"

-- DROP TABLE public."Products";

CREATE TABLE public."Products"
(
    "ID" integer NOT NULL,
    "Product_name" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    "Prefered_Supplier" integer,
    CONSTRAINT "Products_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "Products_Product_name_key" UNIQUE ("Product_name")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Products"
    OWNER to postgres;

-- Table: public."ShoppingList"

-- DROP TABLE public."ShoppingList";

CREATE TABLE public."ShoppingList"
(
    "ID" integer NOT NULL,
    "User_Id" integer NOT NULL,
    "DateCreated" date NOT NULL DEFAULT ('now'::text)::date,
    "LastModified" date NOT NULL DEFAULT ('now'::text)::date,
    "SharedBy" integer,
    "DateShared" date,
    "Active" boolean NOT NULL DEFAULT true,
    "List_Name" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "DateRequired" date NOT NULL,
    CONSTRAINT "ShoppingList_pkey" PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."ShoppingList"
    OWNER to postgres;

COMMENT ON COLUMN public."ShoppingList"."User_Id"
    IS 'Id of the user who owns the List';

COMMENT ON COLUMN public."ShoppingList"."LastModified"
    IS 'Records the time when the list was modified';

-- Table: public."Users"

-- DROP TABLE public."Users";

CREATE TABLE public."Users"
(
    "ID" integer NOT NULL DEFAULT 0,
    "Login_Name" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "User_Name" text COLLATE pg_catalog."default" NOT NULL,
    "DateCreated" date DEFAULT ('now'::text)::date,
    "Password" text COLLATE pg_catalog."default",
    CONSTRAINT "Users_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "Users_Login_Name_key" UNIQUE ("Login_Name")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Users"
    OWNER to postgres;

COMMENT ON COLUMN public."Users"."ID"
    IS 'User_Id';

COMMENT ON COLUMN public."Users"."Login_Name"
    IS 'User_Login_Name';

COMMENT ON COLUMN public."Users"."User_Name"
    IS 'Name of Users';

-- Table: public."Vendors"

-- DROP TABLE public."Vendors";

CREATE TABLE public."Vendors"
(
    "ID" integer NOT NULL,
    "Vendor_Name" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    "Mode_Of_Shopping" character(200) COLLATE pg_catalog."default",
    "Active" boolean NOT NULL DEFAULT true,
    CONSTRAINT "Vendors_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "Vendors_Vendor_Name_key" UNIQUE ("Vendor_Name")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Vendors"
    OWNER to postgres;