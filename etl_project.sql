--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2019-08-05 16:40:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 25080)
-- Name: Clinical_trials_ID_name; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clinical_trials_ID_name" (
    "CTID" character varying(30) NOT NULL,
    "Title" character varying(500)
);


ALTER TABLE public."Clinical_trials_ID_name" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 25267)
-- Name: Clinical_trials_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clinical_trials_company" (
    "Company_ticker" character varying(10),
    "CTID" character varying(30)
);


ALTER TABLE public."Clinical_trials_company" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 25088)
-- Name: Clinical_trials_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clinical_trials_description" (
    "CTID" character varying(30),
    "Disease_condition" character varying(500),
    "Intervention" character varying(500),
    "Study_type" character varying(500),
    "CT_results_posted_date" date
);


ALTER TABLE public."Clinical_trials_description" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 25261)
-- Name: Company_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Company_information" (
    "Company_name" character varying(100),
    "Company_ticker" character varying(10) NOT NULL,
    "MarketCap" double precision,
    "IPO_year" double precision,
    "Industry" character varying(100)
);


ALTER TABLE public."Company_information" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 25280)
-- Name: Company_stock_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Company_stock_prices" (
    "Company_ticker" character varying(10),
    "Date" date,
    "High" double precision,
    "Low" double precision,
    "Open" double precision,
    "Close" double precision,
    "Volume" integer,
    "Adj_close" double precision
);


ALTER TABLE public."Company_stock_prices" OWNER TO postgres;

--
-- TOC entry 2702 (class 2606 OID 25087)
-- Name: Clinical_trials_ID_name pk_Clinical_trials_ID_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clinical_trials_ID_name"
    ADD CONSTRAINT "pk_Clinical_trials_ID_name" PRIMARY KEY ("CTID");


--
-- TOC entry 2704 (class 2606 OID 25265)
-- Name: Company_information pk_Company_information; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company_information"
    ADD CONSTRAINT "pk_Company_information" PRIMARY KEY ("Company_ticker");


--
-- TOC entry 2707 (class 2606 OID 25275)
-- Name: Clinical_trials_company fk_Clinical_trials_company_CTID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clinical_trials_company"
    ADD CONSTRAINT "fk_Clinical_trials_company_CTID" FOREIGN KEY ("CTID") REFERENCES public."Clinical_trials_ID_name"("CTID");


--
-- TOC entry 2706 (class 2606 OID 25270)
-- Name: Clinical_trials_company fk_Clinical_trials_company_Company_ticker; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clinical_trials_company"
    ADD CONSTRAINT "fk_Clinical_trials_company_Company_ticker" FOREIGN KEY ("Company_ticker") REFERENCES public."Company_information"("Company_ticker");


--
-- TOC entry 2705 (class 2606 OID 25112)
-- Name: Clinical_trials_description fk_Clinical_trials_description_CTID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clinical_trials_description"
    ADD CONSTRAINT "fk_Clinical_trials_description_CTID" FOREIGN KEY ("CTID") REFERENCES public."Clinical_trials_ID_name"("CTID");


--
-- TOC entry 2708 (class 2606 OID 25283)
-- Name: Company_stock_prices fk_Company_stock_prices_Company_ticker; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company_stock_prices"
    ADD CONSTRAINT "fk_Company_stock_prices_Company_ticker" FOREIGN KEY ("Company_ticker") REFERENCES public."Company_information"("Company_ticker");


-- Completed on 2019-08-05 16:40:51

--
-- PostgreSQL database dump complete
--

