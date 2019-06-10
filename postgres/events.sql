--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3 (Debian 11.3-1.pgdg90+1)
-- Dumped by pg_dump version 11.3

-- Started on 2019-06-10 01:31:44 UTC

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

--
-- TOC entry 2 (class 3079 OID 16443)
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16385)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    name text NOT NULL,
    postal_code character varying(9) NOT NULL,
    country_code character(2) NOT NULL,
    CONSTRAINT cities_postal_code_check CHECK (((postal_code)::text <> ''::text))
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16392)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_code character(2) NOT NULL,
    country_name text
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16398)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    event_id integer NOT NULL,
    title character varying(255) NOT NULL,
    starts timestamp without time zone NOT NULL,
    ends timestamp without time zone NOT NULL,
    venue_id integer
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16401)
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_event_id_seq OWNER TO postgres;

--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 200
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.event_id;


--
-- TOC entry 201 (class 1259 OID 16403)
-- Name: venues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venues (
    venue_id integer NOT NULL,
    name character varying(255),
    street_address text,
    type character(7) DEFAULT 'public'::bpchar,
    postal_code character varying(9),
    country_code character(2),
    active boolean DEFAULT true,
    CONSTRAINT venues_type_check CHECK ((type = ANY (ARRAY['public'::bpchar, 'private'::bpchar])))
);


ALTER TABLE public.venues OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16412)
-- Name: venues_venue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venues_venue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venues_venue_id_seq OWNER TO postgres;

--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 202
-- Name: venues_venue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venues_venue_id_seq OWNED BY public.venues.venue_id;


--
-- TOC entry 2782 (class 2604 OID 16414)
-- Name: events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- TOC entry 2785 (class 2604 OID 16415)
-- Name: venues venue_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues ALTER COLUMN venue_id SET DEFAULT nextval('public.venues_venue_id_seq'::regclass);


--
-- TOC entry 2922 (class 0 OID 16385)
-- Dependencies: 197
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (name, postal_code, country_code) FROM stdin;
Juazeiro do Norte	63041-000	br
Portland	97206	us
\.


--
-- TOC entry 2923 (class 0 OID 16392)
-- Dependencies: 198
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_code, country_name) FROM stdin;
us	United States
mx	Mexico
au	Australia
gb	United Kingdon
de	Germany
br	Brazil
\.


--
-- TOC entry 2924 (class 0 OID 16398)
-- Dependencies: 199
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (event_id, title, starts, ends, venue_id) FROM stdin;
1	Fight Club	2018-02-15 17:30:00	2018-02-15 19:30:00	2
2	April Fools Day	2018-04-01 00:00:00	2018-04-01 23:59:00	\N
3	Christmas Day	2018-12-25 00:00:00	2018-12-25 23:59:00	\N
4	Fogueira de São João	2019-06-23 18:00:00	2019-06-24 06:00:00	5
\.


--
-- TOC entry 2926 (class 0 OID 16403)
-- Dependencies: 201
-- Data for Name: venues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venues (venue_id, name, street_address, type, postal_code, country_code, active) FROM stdin;
2	Crystal Ballroom	\N	public 	97206	us	t
3	Voodoo Doughnut	\N	public 	97206	us	t
5	Avenida Padre Cicero	\N	public 	63041-000	br	f
\.


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 200
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_event_id_seq', 4, true);


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 202
-- Name: venues_venue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venues_venue_id_seq', 5, true);


--
-- TOC entry 2788 (class 2606 OID 16417)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (country_code, postal_code);


--
-- TOC entry 2790 (class 2606 OID 16419)
-- Name: countries countries_country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_name_key UNIQUE (country_name);


--
-- TOC entry 2792 (class 2606 OID 16421)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_code);


--
-- TOC entry 2794 (class 2606 OID 16423)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- TOC entry 2796 (class 2606 OID 16425)
-- Name: venues venues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_pkey PRIMARY KEY (venue_id);


--
-- TOC entry 2921 (class 2618 OID 16442)
-- Name: venues delete_venues; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE delete_venues AS
    ON DELETE TO public.venues DO INSTEAD  UPDATE public.venues SET active = false
  WHERE (venues.venue_id = old.venue_id);


--
-- TOC entry 2797 (class 2606 OID 16426)
-- Name: cities cities_country_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_country_code_fkey FOREIGN KEY (country_code) REFERENCES public.countries(country_code);


--
-- TOC entry 2798 (class 2606 OID 16431)
-- Name: events events_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES public.venues(venue_id);


--
-- TOC entry 2799 (class 2606 OID 16436)
-- Name: venues venues_country_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_country_code_fkey FOREIGN KEY (country_code, postal_code) REFERENCES public.cities(country_code, postal_code) MATCH FULL;


-- Completed on 2019-06-10 01:31:44 UTC

--
-- PostgreSQL database dump complete
--

