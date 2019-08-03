-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yvR9FC
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Clinical_trials_primary" (
    "CTID" varchar(30)   NOT NULL,
    "Company_ticker" varchar(10)   NOT NULL,
    "Title" string   NOT NULL,
    "CT_results_posted_date" date   NOT NULL,
    CONSTRAINT "pk_Clinical_trials_primary" PRIMARY KEY (
        "CTID"
     )
);

CREATE TABLE "Clinical_trials_secondary" (
    "CTID" varchar(30)   NOT NULL,
    "Disease_condition" string   NOT NULL,
    "Intervention" string   NOT NULL,
    "Study_type" string   NOT NULL
);

CREATE TABLE "Company_ID_names" (
    "Company_name" string   NOT NULL,
    "Company_ticker" varchar(10)   NOT NULL,
    "MarketCap" float   NOT NULL,
    "IPO_year" int   NOT NULL,
    "Industry" string   NOT NULL,
    CONSTRAINT "pk_Company_ID_names" PRIMARY KEY (
        "Company_ticker"
     )
);

CREATE TABLE "Stock_prices" (
    "Company_ticker" varchar(10)   NOT NULL,
    "Date" date   NOT NULL,
    "High" float   NOT NULL,
    "Low" float   NOT NULL,
    "Open" float   NOT NULL,
    "Close" float   NOT NULL,
    "Volume" int   NOT NULL,
    "Adj_close" float   NOT NULL
);

ALTER TABLE "Clinical_trials_primary" ADD CONSTRAINT "fk_Clinical_trials_primary_Company_ticker" FOREIGN KEY("Company_ticker")
REFERENCES "Company_ID_names" ("Company_ticker");

ALTER TABLE "Clinical_trials_secondary" ADD CONSTRAINT "fk_Clinical_trials_secondary_CTID" FOREIGN KEY("CTID")
REFERENCES "Clinical_trials_primary" ("CTID");

ALTER TABLE "Stock_prices" ADD CONSTRAINT "fk_Stock_prices_Company_ticker" FOREIGN KEY("Company_ticker")
REFERENCES "Company_ID_names" ("Company_ticker");

