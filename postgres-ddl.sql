--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: candidate_committee_linkage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE candidate_committee_linkage (
    candidate_identification text,
    candidate_election_year bigint,
    fec_election_year bigint,
    committee_identification text,
    committee_type text,
    committee_designation text,
    linkage_id bigint
);


ALTER TABLE public.candidate_committee_linkage OWNER TO postgres;

--
-- Name: candidate_master; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE candidate_master (
    committee_identification text,
    committee_name text,
    treasurers_name text,
    street_one text,
    street_two text,
    city_or_town text,
    state text,
    zip text,
    committee_designation text,
    committee_type text,
    committee_party text,
    filing_frequency text,
    interest_group_category text,
    connected_organizations_name text,
    candidate_identification text
);


ALTER TABLE public.candidate_master OWNER TO postgres;

--
-- Name: committee_master; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE committee_master (
    committee_identification text,
    committee_name text,
    treasurers_name text,
    street_one text,
    street_two text,
    city_or_town text,
    state text,
    zip text,
    committee_designation text,
    committee_type text,
    committee_party text,
    filing_frequency text,
    interest_group_category text,
    connected_organizations_name text,
    candidate_identification text
);


ALTER TABLE public.committee_master OWNER TO postgres;

--
-- Name: committee_to_candidate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE committee_to_candidate (
    filer_identification_number text,
    amendment_indicator text,
    report_type text,
    primary_general_indicator text,
    image_number text,
    transaction_type text,
    entity_type text,
    recipient_or_payee text,
    city_or_town text,
    state text,
    zip_code text,
    employer text,
    occupation text,
    transaction_date text,
    transaction_amount double precision,
    other_identification_number text,
    candidate_identification_number text,
    transaction_id text,
    file_number_or_report_id text,
    memo_code text,
    memo_text text,
    fec_record_number bigint
);


ALTER TABLE public.committee_to_candidate OWNER TO postgres;

--
-- Name: committee_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE committee_type (
    "Committee Type Code" text,
    "Committee Type" text,
    "Explanation" text
);


ALTER TABLE public.committee_type OWNER TO postgres;

--
-- Name: disbursment_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE disbursment_type (
    "Disbursment Category Code" bigint,
    "Disbursment Category Code Description" text
);


ALTER TABLE public.disbursment_type OWNER TO postgres;

--
-- Name: individual_contributions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE individual_contributions (
    filer_identification_number text,
    amendment_indicator text,
    report_type text,
    primary_general_indicator text,
    image_number text,
    transaction_type text,
    entity_type text,
    contributor_or_lender_or_transfer_name text,
    city_or_town text,
    state text,
    zip_code text,
    employer text,
    occupation text,
    transaction_date text,
    transaction_amount double precision,
    other_identification_number text,
    transaction_id text,
    file_number_or_report_id text,
    memo_code text,
    memo_text text,
    fec_record_number text
);


ALTER TABLE public.individual_contributions OWNER TO postgres;

--
-- Name: inter_committee_transactions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inter_committee_transactions (
    filer_identification_number text,
    amendment_indicator text,
    report_type text,
    primary_general_indicator text,
    image_number text,
    transaction_type text,
    entity_type text,
    contributor_or_lender_or_transfer_name text,
    city_or_town text,
    state text,
    zip_code text,
    employer text,
    occupation text,
    transaction_date text,
    transaction_amount double precision,
    other_identification_number text,
    transaction_id text,
    file_number_or_report_id text,
    memo_code text,
    memo_text text,
    fec_record_number bigint
);


ALTER TABLE public.inter_committee_transactions OWNER TO postgres;

--
-- Name: operating_expenditures; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE operating_expenditures (
    filer_identification_number text,
    amendment_indicator text,
    report_year bigint,
    report_type text,
    image_number text,
    line_number text,
    form_type text,
    schedule_type text,
    contributor_or_lender_or_transfer_name text,
    city_or_town text,
    state text,
    zip_code text,
    transaction_date timestamp without time zone,
    transaction_amount double precision,
    primary_general_indicator text,
    purpose text,
    disbursement_category_code text,
    disbursement_category_code_description text,
    memo_code text,
    memo_text text,
    entity_type text,
    fec_record_number text,
    file_number_or_report_id text,
    transaction_id text,
    back_reference_transaction_id text,
    "null" text
);


ALTER TABLE public.operating_expenditures OWNER TO postgres;

--
-- Name: party_codes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE party_codes (
    "Party Code" text,
    "Party Code Description" text,
    "Notes" text
);


ALTER TABLE public.party_codes OWNER TO postgres;

--
-- Name: report_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE report_type (
    "Report Type Code" text,
    "Report Type" text,
    "Explanation" text
);


ALTER TABLE public.report_type OWNER TO postgres;

--
-- Name: transaction_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE transaction_type (
    "Transaction Type" text,
    "Transaction Type Description" text
);


ALTER TABLE public.transaction_type OWNER TO postgres;

--
-- PostgreSQL database dump complete
--

