-- REPLACE ALL TESTLINKUSER MATCHES WITH THE PROPER USERNAME
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2023-04-17 15:45:03

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
-- TOC entry 5 (class 2615 OID 20600)
-- Name: public; Type: SCHEMA; Schema: -; Owner: *
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO "TESTLINKUSER";

--
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: *
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 248 (class 1259 OID 21052)
-- Name: assignment_status; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.assignment_status (
    id bigint NOT NULL,
    description character varying(100) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.assignment_status OWNER TO "TESTLINKUSER";

--
-- TOC entry 247 (class 1259 OID 21051)
-- Name: assignment_status_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.assignment_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assignment_status_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 247
-- Name: assignment_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.assignment_status_id_seq OWNED BY public.assignment_status.id;


--
-- TOC entry 250 (class 1259 OID 21060)
-- Name: assignment_types; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.assignment_types (
    id bigint NOT NULL,
    fk_table character varying(30) DEFAULT ''::character varying,
    description character varying(100) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.assignment_types OWNER TO "TESTLINKUSER";

--
-- TOC entry 249 (class 1259 OID 21059)
-- Name: assignment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.assignment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assignment_types_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 249
-- Name: assignment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.assignment_types_id_seq OWNED BY public.assignment_types.id;


--
-- TOC entry 252 (class 1259 OID 21069)
-- Name: attachments; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.attachments (
    id bigint NOT NULL,
    fk_id bigint DEFAULT '0'::bigint NOT NULL,
    fk_table character varying(250) DEFAULT ''::character varying,
    title character varying(250) DEFAULT ''::character varying,
    description character varying(250) DEFAULT ''::character varying,
    file_name character varying(250) DEFAULT ''::character varying NOT NULL,
    file_path character varying(250) DEFAULT ''::character varying,
    file_size integer DEFAULT 0 NOT NULL,
    file_type character varying(250) DEFAULT ''::character varying NOT NULL,
    date_added timestamp without time zone DEFAULT now() NOT NULL,
    content bytea,
    compression_type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.attachments OWNER TO "TESTLINKUSER";

--
-- TOC entry 251 (class 1259 OID 21068)
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 251
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- TOC entry 314 (class 1259 OID 21834)
-- Name: baseline_l1l2_context; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.baseline_l1l2_context (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT '0'::bigint NOT NULL,
    platform_id bigint DEFAULT '0'::bigint NOT NULL,
    begin_exec_ts timestamp without time zone NOT NULL,
    end_exec_ts timestamp without time zone NOT NULL,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.baseline_l1l2_context OWNER TO "TESTLINKUSER";

--
-- TOC entry 313 (class 1259 OID 21833)
-- Name: baseline_l1l2_context_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.baseline_l1l2_context_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baseline_l1l2_context_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 313
-- Name: baseline_l1l2_context_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.baseline_l1l2_context_id_seq OWNED BY public.baseline_l1l2_context.id;


--
-- TOC entry 316 (class 1259 OID 21855)
-- Name: baseline_l1l2_details; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.baseline_l1l2_details (
    id bigint NOT NULL,
    context_id bigint DEFAULT '0'::bigint NOT NULL,
    top_tsuite_id bigint DEFAULT '0'::bigint NOT NULL,
    child_tsuite_id bigint DEFAULT '0'::bigint NOT NULL,
    status character(1) DEFAULT NULL::bpchar,
    qty integer DEFAULT 0 NOT NULL,
    total_tc integer DEFAULT 0
);


ALTER TABLE public.baseline_l1l2_details OWNER TO "TESTLINKUSER";

--
-- TOC entry 315 (class 1259 OID 21854)
-- Name: baseline_l1l2_details_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.baseline_l1l2_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baseline_l1l2_details_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 315
-- Name: baseline_l1l2_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.baseline_l1l2_details_id_seq OWNED BY public.baseline_l1l2_details.id;


--
-- TOC entry 230 (class 1259 OID 20757)
-- Name: builds; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.builds (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT '0'::bigint NOT NULL,
    name character varying(100) DEFAULT 'undefined'::character varying NOT NULL,
    notes text,
    active smallint DEFAULT '1'::smallint NOT NULL,
    is_open smallint DEFAULT '1'::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    release_date date,
    closed_on_date date,
    commit_id character varying(64),
    tag character varying(64),
    branch character varying(64),
    release_candidate character varying(100)
);


ALTER TABLE public.builds OWNER TO "TESTLINKUSER";

--
-- TOC entry 229 (class 1259 OID 20756)
-- Name: builds_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.builds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.builds_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 229
-- Name: builds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.builds_id_seq OWNED BY public.builds.id;


--
-- TOC entry 300 (class 1259 OID 21673)
-- Name: cfield_build_design_values; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.cfield_build_design_values (
    field_id integer DEFAULT 0 NOT NULL,
    node_id integer DEFAULT 0 NOT NULL,
    value character varying(4000) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.cfield_build_design_values OWNER TO "TESTLINKUSER";

--
-- TOC entry 243 (class 1259 OID 20959)
-- Name: cfield_design_values; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.cfield_design_values (
    field_id integer DEFAULT 0 NOT NULL,
    node_id integer DEFAULT 0 NOT NULL,
    value character varying(4000) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.cfield_design_values OWNER TO "TESTLINKUSER";

--
-- TOC entry 244 (class 1259 OID 20980)
-- Name: cfield_execution_values; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.cfield_execution_values (
    field_id integer DEFAULT 0 NOT NULL,
    execution_id integer DEFAULT 0 NOT NULL,
    testplan_id integer DEFAULT 0 NOT NULL,
    tcversion_id integer DEFAULT 0 NOT NULL,
    value character varying(4000) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.cfield_execution_values OWNER TO "TESTLINKUSER";

--
-- TOC entry 246 (class 1259 OID 21033)
-- Name: cfield_node_types; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.cfield_node_types (
    field_id integer DEFAULT 0 NOT NULL,
    node_type_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cfield_node_types OWNER TO "TESTLINKUSER";

--
-- TOC entry 245 (class 1259 OID 21012)
-- Name: cfield_testplan_design_values; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.cfield_testplan_design_values (
    field_id integer DEFAULT 0 NOT NULL,
    link_id integer DEFAULT 0 NOT NULL,
    value character varying(4000) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.cfield_testplan_design_values OWNER TO "TESTLINKUSER";

--
-- TOC entry 242 (class 1259 OID 20935)
-- Name: cfield_testprojects; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.cfield_testprojects (
    field_id bigint DEFAULT '0'::bigint NOT NULL,
    testproject_id bigint DEFAULT '0'::bigint NOT NULL,
    display_order integer DEFAULT 1 NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    location smallint DEFAULT '1'::smallint NOT NULL,
    required smallint DEFAULT '0'::smallint NOT NULL,
    required_on_design smallint DEFAULT '0'::smallint NOT NULL,
    required_on_execution smallint DEFAULT '0'::smallint NOT NULL,
    monitorable smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.cfield_testprojects OWNER TO "TESTLINKUSER";

--
-- TOC entry 309 (class 1259 OID 21779)
-- Name: codetrackers; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.codetrackers (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    cfg text
);


ALTER TABLE public.codetrackers OWNER TO "TESTLINKUSER";

--
-- TOC entry 308 (class 1259 OID 21778)
-- Name: codetrackers_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.codetrackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.codetrackers_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 308
-- Name: codetrackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.codetrackers_id_seq OWNED BY public.codetrackers.id;


--
-- TOC entry 240 (class 1259 OID 20885)
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.custom_fields (
    id integer NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    label character varying(64) DEFAULT ''::character varying NOT NULL,
    type smallint DEFAULT '0'::smallint NOT NULL,
    possible_values character varying(4000) DEFAULT ''::character varying NOT NULL,
    default_value character varying(4000) DEFAULT ''::character varying NOT NULL,
    valid_regexp character varying(255) DEFAULT ''::character varying NOT NULL,
    length_min integer DEFAULT 0 NOT NULL,
    length_max integer DEFAULT 0 NOT NULL,
    show_on_design smallint DEFAULT '1'::smallint NOT NULL,
    enable_on_design smallint DEFAULT '1'::smallint NOT NULL,
    show_on_execution smallint DEFAULT '0'::smallint NOT NULL,
    enable_on_execution smallint DEFAULT '0'::smallint NOT NULL,
    show_on_testplan_design smallint DEFAULT '0'::smallint NOT NULL,
    enable_on_testplan_design smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.custom_fields OWNER TO "TESTLINKUSER";

--
-- TOC entry 239 (class 1259 OID 20884)
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.custom_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_fields_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 239
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.custom_fields_id_seq OWNED BY public.custom_fields.id;


--
-- TOC entry 253 (class 1259 OID 21088)
-- Name: db_version; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.db_version (
    version character varying(50) DEFAULT 'unknown'::character varying NOT NULL,
    upgrade_ts timestamp without time zone DEFAULT now() NOT NULL,
    notes text
);


ALTER TABLE public.db_version OWNER TO "TESTLINKUSER";

--
-- TOC entry 221 (class 1259 OID 20638)
-- Name: events; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    transaction_id bigint DEFAULT '0'::bigint NOT NULL,
    log_level smallint DEFAULT '0'::smallint NOT NULL,
    source character varying(45),
    description text NOT NULL,
    fired_at integer DEFAULT 0 NOT NULL,
    activity character varying(45),
    object_id bigint,
    object_type character varying(45)
);


ALTER TABLE public.events OWNER TO "TESTLINKUSER";

--
-- TOC entry 220 (class 1259 OID 20637)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 220
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 232 (class 1259 OID 20778)
-- Name: executions; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.executions (
    id bigint NOT NULL,
    build_id integer DEFAULT 0 NOT NULL,
    tester_id bigint,
    execution_ts timestamp without time zone,
    status character(1) DEFAULT NULL::bpchar,
    testplan_id bigint DEFAULT '0'::bigint NOT NULL,
    tcversion_id bigint DEFAULT '0'::bigint NOT NULL,
    tcversion_number integer DEFAULT 1 NOT NULL,
    platform_id bigint DEFAULT '0'::bigint NOT NULL,
    execution_type smallint DEFAULT '1'::smallint NOT NULL,
    execution_duration numeric(6,2),
    notes text
);


ALTER TABLE public.executions OWNER TO "TESTLINKUSER";

--
-- TOC entry 217 (class 1259 OID 20610)
-- Name: nodes_hierarchy; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.nodes_hierarchy (
    id bigint NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    parent_id bigint,
    node_type_id bigint DEFAULT '1'::bigint NOT NULL,
    node_order bigint
);


ALTER TABLE public.nodes_hierarchy OWNER TO "TESTLINKUSER";

--
-- TOC entry 228 (class 1259 OID 20736)
-- Name: testplans; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testplans (
    id bigint DEFAULT '0'::bigint NOT NULL,
    testproject_id bigint DEFAULT '0'::bigint NOT NULL,
    notes text,
    active smallint DEFAULT '1'::smallint NOT NULL,
    is_open smallint DEFAULT '1'::smallint NOT NULL,
    is_public smallint DEFAULT '1'::smallint NOT NULL,
    api_key character varying(64) DEFAULT (md5((random())::text) || md5((random())::text)) NOT NULL
);


ALTER TABLE public.testplans OWNER TO "TESTLINKUSER";

--
-- TOC entry 329 (class 1259 OID 21937)
-- Name: exec_by_date_time; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.exec_by_date_time AS
 SELECT nhtpl.name AS testplan_name,
    to_char(e.execution_ts, 'YYYY-MM-DD'::text) AS yyyy_mm_dd,
    to_char(e.execution_ts, 'YYYY-MM'::text) AS yyyy_mm,
    to_char(e.execution_ts, 'HH24'::text) AS hh,
    to_char(e.execution_ts, 'HH24'::text) AS hour,
    e.id,
    e.build_id,
    e.tester_id,
    e.execution_ts,
    e.status,
    e.testplan_id,
    e.tcversion_id,
    e.tcversion_number,
    e.platform_id,
    e.execution_type,
    e.execution_duration,
    e.notes
   FROM ((public.executions e
     JOIN public.testplans tpl ON ((tpl.id = e.testplan_id)))
     JOIN public.nodes_hierarchy nhtpl ON ((nhtpl.id = tpl.id)));


ALTER TABLE public.exec_by_date_time OWNER TO "TESTLINKUSER";

--
-- TOC entry 254 (class 1259 OID 21097)
-- Name: execution_bugs; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.execution_bugs (
    execution_id bigint DEFAULT '0'::bigint NOT NULL,
    bug_id character varying(64) DEFAULT '0'::character varying NOT NULL,
    tcstep_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.execution_bugs OWNER TO "TESTLINKUSER";

--
-- TOC entry 234 (class 1259 OID 20812)
-- Name: execution_tcsteps; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.execution_tcsteps (
    id bigint NOT NULL,
    execution_id integer DEFAULT 0 NOT NULL,
    tcstep_id integer DEFAULT 0 NOT NULL,
    notes text,
    status character(1) DEFAULT NULL::bpchar
);


ALTER TABLE public.execution_tcsteps OWNER TO "TESTLINKUSER";

--
-- TOC entry 233 (class 1259 OID 20811)
-- Name: execution_tcsteps_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.execution_tcsteps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.execution_tcsteps_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 233
-- Name: execution_tcsteps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.execution_tcsteps_id_seq OWNED BY public.execution_tcsteps.id;


--
-- TOC entry 236 (class 1259 OID 20835)
-- Name: execution_tcsteps_wip; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.execution_tcsteps_wip (
    id bigint NOT NULL,
    tcstep_id integer DEFAULT 0 NOT NULL,
    testplan_id integer DEFAULT 0 NOT NULL,
    platform_id integer DEFAULT 0 NOT NULL,
    build_id integer DEFAULT 0 NOT NULL,
    tester_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    notes text,
    status character(1) DEFAULT NULL::bpchar
);


ALTER TABLE public.execution_tcsteps_wip OWNER TO "TESTLINKUSER";

--
-- TOC entry 235 (class 1259 OID 20834)
-- Name: execution_tcsteps_wip_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.execution_tcsteps_wip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.execution_tcsteps_wip_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 235
-- Name: execution_tcsteps_wip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.execution_tcsteps_wip_id_seq OWNED BY public.execution_tcsteps_wip.id;


--
-- TOC entry 231 (class 1259 OID 20777)
-- Name: executions_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.executions_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 231
-- Name: executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.executions_id_seq OWNED BY public.executions.id;


--
-- TOC entry 289 (class 1259 OID 21516)
-- Name: inventory; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.inventory (
    id bigint NOT NULL,
    testproject_id bigint DEFAULT '0'::bigint NOT NULL,
    owner_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    ipaddress character varying(255) NOT NULL,
    content text,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    modification_ts timestamp without time zone
);


ALTER TABLE public.inventory OWNER TO "TESTLINKUSER";

--
-- TOC entry 288 (class 1259 OID 21515)
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 288
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.id;


--
-- TOC entry 295 (class 1259 OID 21618)
-- Name: issuetrackers; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.issuetrackers (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    cfg text
);


ALTER TABLE public.issuetrackers OWNER TO "TESTLINKUSER";

--
-- TOC entry 294 (class 1259 OID 21617)
-- Name: issuetrackers_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.issuetrackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issuetrackers_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 294
-- Name: issuetrackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.issuetrackers_id_seq OWNED BY public.issuetrackers.id;


--
-- TOC entry 257 (class 1259 OID 21122)
-- Name: keywords; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.keywords (
    id bigint NOT NULL,
    keyword character varying(100) DEFAULT ''::character varying NOT NULL,
    testproject_id bigint DEFAULT '0'::bigint NOT NULL,
    notes text
);


ALTER TABLE public.keywords OWNER TO "TESTLINKUSER";

--
-- TOC entry 256 (class 1259 OID 21121)
-- Name: keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keywords_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 256
-- Name: keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.keywords_id_seq OWNED BY public.keywords.id;


--
-- TOC entry 326 (class 1259 OID 21924)
-- Name: latest_exec_by_context; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.latest_exec_by_context AS
 SELECT executions.tcversion_id,
    executions.testplan_id,
    executions.build_id,
    executions.platform_id,
    max(executions.id) AS id
   FROM public.executions
  GROUP BY executions.tcversion_id, executions.testplan_id, executions.build_id, executions.platform_id;


ALTER TABLE public.latest_exec_by_context OWNER TO "TESTLINKUSER";

--
-- TOC entry 325 (class 1259 OID 21920)
-- Name: latest_exec_by_testplan; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.latest_exec_by_testplan AS
 SELECT executions.tcversion_id,
    executions.testplan_id,
    max(executions.id) AS id
   FROM public.executions
  GROUP BY executions.tcversion_id, executions.testplan_id;


ALTER TABLE public.latest_exec_by_testplan OWNER TO "TESTLINKUSER";

--
-- TOC entry 264 (class 1259 OID 21212)
-- Name: req_versions; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.req_versions (
    id bigint DEFAULT '0'::bigint NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    revision integer DEFAULT 1 NOT NULL,
    scope text,
    status character(1) DEFAULT 'V'::bpchar NOT NULL,
    type character(1) DEFAULT NULL::bpchar,
    active smallint DEFAULT '1'::smallint NOT NULL,
    is_open smallint DEFAULT '1'::smallint NOT NULL,
    expected_coverage integer DEFAULT 1 NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    modifier_id bigint,
    modification_ts timestamp without time zone,
    log_message text
);


ALTER TABLE public.req_versions OWNER TO "TESTLINKUSER";

--
-- TOC entry 263 (class 1259 OID 21194)
-- Name: requirements; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.requirements (
    id bigint DEFAULT '0'::bigint NOT NULL,
    srs_id bigint DEFAULT '0'::bigint NOT NULL,
    req_doc_id character varying(64) NOT NULL
);


ALTER TABLE public.requirements OWNER TO "TESTLINKUSER";

--
-- TOC entry 321 (class 1259 OID 21903)
-- Name: latest_req_version; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.latest_req_version AS
 SELECT rq.id AS req_id,
    max(rqv.version) AS version
   FROM ((public.nodes_hierarchy nhrqv
     JOIN public.requirements rq ON ((rq.id = nhrqv.parent_id)))
     JOIN public.req_versions rqv ON ((rqv.id = nhrqv.id)))
  GROUP BY rq.id;


ALTER TABLE public.latest_req_version OWNER TO "TESTLINKUSER";

--
-- TOC entry 322 (class 1259 OID 21908)
-- Name: latest_req_version_id; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.latest_req_version_id AS
 SELECT lrqvn.req_id,
    lrqvn.version,
    reqv.id AS req_version_id
   FROM ((public.latest_req_version lrqvn
     JOIN public.nodes_hierarchy nhrqv ON ((nhrqv.parent_id = lrqvn.req_id)))
     JOIN public.req_versions reqv ON (((reqv.id = nhrqv.id) AND (reqv.version = lrqvn.version))));


ALTER TABLE public.latest_req_version_id OWNER TO "TESTLINKUSER";

--
-- TOC entry 262 (class 1259 OID 21175)
-- Name: req_specs; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.req_specs (
    id bigint DEFAULT '0'::bigint NOT NULL,
    testproject_id bigint DEFAULT '0'::bigint NOT NULL,
    doc_id character varying(64) NOT NULL
);


ALTER TABLE public.req_specs OWNER TO "TESTLINKUSER";

--
-- TOC entry 293 (class 1259 OID 21592)
-- Name: req_specs_revisions; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.req_specs_revisions (
    parent_id bigint DEFAULT '0'::bigint NOT NULL,
    id bigint DEFAULT '0'::bigint NOT NULL,
    revision integer DEFAULT 1 NOT NULL,
    doc_id character varying(64),
    name character varying(100),
    scope text,
    total_req integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    type character(1) DEFAULT 'N'::bpchar,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    modifier_id bigint,
    modification_ts timestamp without time zone,
    log_message text
);


ALTER TABLE public.req_specs_revisions OWNER TO "TESTLINKUSER";

--
-- TOC entry 323 (class 1259 OID 21912)
-- Name: latest_rspec_revision; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.latest_rspec_revision AS
 SELECT rsr.parent_id AS req_spec_id,
    rs.testproject_id,
    max(rsr.revision) AS revision
   FROM (public.req_specs_revisions rsr
     JOIN public.req_specs rs ON ((rs.id = rsr.parent_id)))
  GROUP BY rsr.parent_id, rs.testproject_id;


ALTER TABLE public.latest_rspec_revision OWNER TO "TESTLINKUSER";

--
-- TOC entry 226 (class 1259 OID 20689)
-- Name: tcversions; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.tcversions (
    id bigint DEFAULT '0'::bigint NOT NULL,
    tc_external_id integer,
    version integer DEFAULT 1 NOT NULL,
    layout integer DEFAULT 1 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    summary text,
    preconditions text,
    importance smallint DEFAULT '2'::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    updater_id bigint,
    modification_ts timestamp without time zone,
    active smallint DEFAULT '1'::smallint NOT NULL,
    is_open smallint DEFAULT '1'::smallint NOT NULL,
    execution_type smallint DEFAULT '1'::smallint NOT NULL,
    estimated_exec_duration numeric(6,2)
);


ALTER TABLE public.tcversions OWNER TO "TESTLINKUSER";

--
-- TOC entry 319 (class 1259 OID 21893)
-- Name: latest_tcase_version_number; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.latest_tcase_version_number AS
 SELECT nh_tc.id AS testcase_id,
    max(tcv.version) AS version
   FROM ((public.nodes_hierarchy nh_tc
     JOIN public.nodes_hierarchy nh_tcv ON ((nh_tcv.parent_id = nh_tc.id)))
     JOIN public.tcversions tcv ON ((nh_tcv.id = tcv.id)))
  GROUP BY nh_tc.id;


ALTER TABLE public.latest_tcase_version_number OWNER TO "TESTLINKUSER";

--
-- TOC entry 320 (class 1259 OID 21898)
-- Name: latest_tcase_version_id; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.latest_tcase_version_id AS
 SELECT ltcvn.testcase_id,
    ltcvn.version,
    tcv.id AS tcversion_id
   FROM ((public.latest_tcase_version_number ltcvn
     JOIN public.nodes_hierarchy nhtcv ON ((nhtcv.parent_id = ltcvn.testcase_id)))
     JOIN public.tcversions tcv ON (((tcv.id = nhtcv.id) AND (tcv.version = ltcvn.version))));


ALTER TABLE public.latest_tcase_version_id OWNER TO "TESTLINKUSER";

--
-- TOC entry 259 (class 1259 OID 21141)
-- Name: milestones; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.milestones (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT '0'::bigint NOT NULL,
    target_date date NOT NULL,
    start_date date,
    a smallint DEFAULT '0'::smallint NOT NULL,
    b smallint DEFAULT '0'::smallint NOT NULL,
    c smallint DEFAULT '0'::smallint NOT NULL,
    name character varying(100) DEFAULT 'undefined'::character varying NOT NULL
);


ALTER TABLE public.milestones OWNER TO "TESTLINKUSER";

--
-- TOC entry 258 (class 1259 OID 21140)
-- Name: milestones_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.milestones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milestones_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 258
-- Name: milestones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.milestones_id_seq OWNED BY public.milestones.id;


--
-- TOC entry 215 (class 1259 OID 20602)
-- Name: node_types; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.node_types (
    id bigint NOT NULL,
    description character varying(100) DEFAULT 'testproject'::character varying NOT NULL
);


ALTER TABLE public.node_types OWNER TO "TESTLINKUSER";

--
-- TOC entry 214 (class 1259 OID 20601)
-- Name: node_types_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.node_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.node_types_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 214
-- Name: node_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.node_types_id_seq OWNED BY public.node_types.id;


--
-- TOC entry 216 (class 1259 OID 20609)
-- Name: nodes_hierarchy_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.nodes_hierarchy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nodes_hierarchy_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 216
-- Name: nodes_hierarchy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.nodes_hierarchy_id_seq OWNED BY public.nodes_hierarchy.id;


--
-- TOC entry 261 (class 1259 OID 21160)
-- Name: object_keywords; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.object_keywords (
    id bigint NOT NULL,
    fk_id bigint DEFAULT '0'::bigint NOT NULL,
    fk_table character varying(30) DEFAULT ''::character varying,
    keyword_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.object_keywords OWNER TO "TESTLINKUSER";

--
-- TOC entry 260 (class 1259 OID 21159)
-- Name: object_keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.object_keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_keywords_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 260
-- Name: object_keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.object_keywords_id_seq OWNED BY public.object_keywords.id;


--
-- TOC entry 285 (class 1259 OID 21481)
-- Name: platforms; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.platforms (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    testproject_id bigint DEFAULT '0'::bigint NOT NULL,
    notes text NOT NULL,
    enable_on_design smallint DEFAULT '0'::smallint NOT NULL,
    enable_on_execution smallint DEFAULT '1'::smallint NOT NULL,
    is_open smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.platforms OWNER TO "TESTLINKUSER";

--
-- TOC entry 284 (class 1259 OID 21480)
-- Name: platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.platforms_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4278 (class 0 OID 0)
-- Dependencies: 284
-- Name: platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.platforms_id_seq OWNED BY public.platforms.id;


--
-- TOC entry 305 (class 1259 OID 21744)
-- Name: plugins; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.plugins (
    id bigint NOT NULL,
    basename character varying(100) NOT NULL,
    enabled smallint DEFAULT '0'::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.plugins OWNER TO "TESTLINKUSER";

--
-- TOC entry 307 (class 1259 OID 21758)
-- Name: plugins_configuration; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.plugins_configuration (
    id bigint NOT NULL,
    testproject_id bigint DEFAULT '0'::bigint NOT NULL,
    config_key character varying(255) NOT NULL,
    config_type integer NOT NULL,
    config_value character varying(255) NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.plugins_configuration OWNER TO "TESTLINKUSER";

--
-- TOC entry 306 (class 1259 OID 21757)
-- Name: plugins_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.plugins_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plugins_configuration_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 306
-- Name: plugins_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.plugins_configuration_id_seq OWNED BY public.plugins_configuration.id;


--
-- TOC entry 304 (class 1259 OID 21743)
-- Name: plugins_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.plugins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plugins_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 304
-- Name: plugins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.plugins_id_seq OWNED BY public.plugins.id;


--
-- TOC entry 266 (class 1259 OID 21234)
-- Name: req_coverage; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.req_coverage (
    id bigint NOT NULL,
    req_id integer DEFAULT 0 NOT NULL,
    req_version_id integer DEFAULT 0 NOT NULL,
    testcase_id integer DEFAULT 0 NOT NULL,
    tcversion_id integer DEFAULT 0 NOT NULL,
    link_status smallint DEFAULT '1'::smallint NOT NULL,
    is_active smallint DEFAULT '1'::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    review_requester_id bigint,
    review_request_ts timestamp without time zone
);


ALTER TABLE public.req_coverage OWNER TO "TESTLINKUSER";

--
-- TOC entry 265 (class 1259 OID 21233)
-- Name: req_coverage_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.req_coverage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.req_coverage_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 265
-- Name: req_coverage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.req_coverage_id_seq OWNED BY public.req_coverage.id;


--
-- TOC entry 303 (class 1259 OID 21721)
-- Name: req_monitor; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.req_monitor (
    req_id integer DEFAULT 0 NOT NULL,
    user_id bigint NOT NULL,
    testproject_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.req_monitor OWNER TO "TESTLINKUSER";

--
-- TOC entry 291 (class 1259 OID 21539)
-- Name: req_relations; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.req_relations (
    id bigint NOT NULL,
    source_id integer DEFAULT 0 NOT NULL,
    destination_id integer DEFAULT 0 NOT NULL,
    relation_type smallint DEFAULT '1'::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.req_relations OWNER TO "TESTLINKUSER";

--
-- TOC entry 290 (class 1259 OID 21538)
-- Name: req_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.req_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.req_relations_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 290
-- Name: req_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.req_relations_id_seq OWNED BY public.req_relations.id;


--
-- TOC entry 292 (class 1259 OID 21564)
-- Name: req_revisions; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.req_revisions (
    parent_id bigint DEFAULT '0'::bigint NOT NULL,
    id bigint DEFAULT '0'::bigint NOT NULL,
    revision integer DEFAULT 1 NOT NULL,
    req_doc_id character varying(64),
    name character varying(100) DEFAULT NULL::character varying,
    scope text,
    status character(1) DEFAULT 'V'::bpchar NOT NULL,
    type character(1) DEFAULT NULL::bpchar,
    active smallint DEFAULT '1'::smallint NOT NULL,
    is_open smallint DEFAULT '1'::smallint NOT NULL,
    expected_coverage integer DEFAULT 1 NOT NULL,
    log_message text,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    modifier_id bigint,
    modification_ts timestamp without time zone
);


ALTER TABLE public.req_revisions OWNER TO "TESTLINKUSER";

--
-- TOC entry 298 (class 1259 OID 21646)
-- Name: reqmgrsystems; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.reqmgrsystems (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    cfg text
);


ALTER TABLE public.reqmgrsystems OWNER TO "TESTLINKUSER";

--
-- TOC entry 297 (class 1259 OID 21645)
-- Name: reqmgrsystems_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.reqmgrsystems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reqmgrsystems_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 297
-- Name: reqmgrsystems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.reqmgrsystems_id_seq OWNED BY public.reqmgrsystems.id;


--
-- TOC entry 268 (class 1259 OID 21269)
-- Name: rights; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.rights (
    id bigint NOT NULL,
    description character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.rights OWNER TO "TESTLINKUSER";

--
-- TOC entry 267 (class 1259 OID 21268)
-- Name: rights_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.rights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rights_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4284 (class 0 OID 0)
-- Dependencies: 267
-- Name: rights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.rights_id_seq OWNED BY public.rights.id;


--
-- TOC entry 270 (class 1259 OID 21278)
-- Name: risk_assignments; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.risk_assignments (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT '0'::bigint NOT NULL,
    node_id bigint DEFAULT '0'::bigint NOT NULL,
    risk smallint DEFAULT '2'::smallint NOT NULL,
    importance smallint DEFAULT '2'::smallint NOT NULL
);


ALTER TABLE public.risk_assignments OWNER TO "TESTLINKUSER";

--
-- TOC entry 269 (class 1259 OID 21277)
-- Name: risk_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.risk_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.risk_assignments_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4285 (class 0 OID 0)
-- Dependencies: 269
-- Name: risk_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.risk_assignments_id_seq OWNED BY public.risk_assignments.id;


--
-- TOC entry 271 (class 1259 OID 21299)
-- Name: role_rights; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.role_rights (
    role_id integer DEFAULT 0 NOT NULL,
    right_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.role_rights OWNER TO "TESTLINKUSER";

--
-- TOC entry 223 (class 1259 OID 20652)
-- Name: roles; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    description character varying(100) DEFAULT ''::character varying NOT NULL,
    notes text
);


ALTER TABLE public.roles OWNER TO "TESTLINKUSER";

--
-- TOC entry 222 (class 1259 OID 20651)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4286 (class 0 OID 0)
-- Dependencies: 222
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 317 (class 1259 OID 21883)
-- Name: tcases_active; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.tcases_active AS
 SELECT DISTINCT nhtcv.parent_id AS tcase_id,
    tcv.tc_external_id
   FROM (public.nodes_hierarchy nhtcv
     JOIN public.tcversions tcv ON ((tcv.id = nhtcv.id)))
  WHERE (tcv.active = 1);


ALTER TABLE public.tcases_active OWNER TO "TESTLINKUSER";

--
-- TOC entry 227 (class 1259 OID 20720)
-- Name: tcsteps; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.tcsteps (
    id bigint DEFAULT '0'::bigint NOT NULL,
    step_number integer DEFAULT 1 NOT NULL,
    actions text,
    expected_results text,
    active smallint DEFAULT '1'::smallint NOT NULL,
    execution_type smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.tcsteps OWNER TO "TESTLINKUSER";

--
-- TOC entry 318 (class 1259 OID 21888)
-- Name: tcversions_last_active; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.tcversions_last_active AS
 SELECT tcv.id,
    tcv.tc_external_id,
    tcv.version,
    tcv.layout,
    tcv.status,
    tcv.summary,
    tcv.preconditions,
    tcv.importance,
    tcv.author_id,
    tcv.creation_ts,
    tcv.updater_id,
    tcv.modification_ts,
    tcv.active,
    tcv.is_open,
    tcv.execution_type,
    ac.tcase_id
   FROM (public.tcversions tcv
     JOIN ( SELECT nhtcv.parent_id AS tcase_id,
            max(tcv_1.id) AS tcversion_id
           FROM (public.nodes_hierarchy nhtcv
             JOIN public.tcversions tcv_1 ON ((tcv_1.id = nhtcv.id)))
          WHERE (tcv_1.active = 1)
          GROUP BY nhtcv.parent_id, tcv_1.tc_external_id) ac ON ((tcv.id = ac.tcversion_id)));


ALTER TABLE public.tcversions_last_active OWNER TO "TESTLINKUSER";

--
-- TOC entry 273 (class 1259 OID 21317)
-- Name: testcase_keywords; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testcase_keywords (
    id bigint NOT NULL,
    testcase_id bigint DEFAULT '0'::bigint NOT NULL,
    tcversion_id bigint DEFAULT '0'::bigint NOT NULL,
    keyword_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.testcase_keywords OWNER TO "TESTLINKUSER";

--
-- TOC entry 324 (class 1259 OID 21916)
-- Name: tcversions_without_keywords; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.tcversions_without_keywords AS
 SELECT nhtcv.parent_id AS testcase_id,
    nhtcv.id
   FROM public.nodes_hierarchy nhtcv
  WHERE ((nhtcv.node_type_id = 4) AND (NOT (EXISTS ( SELECT 1
           FROM public.testcase_keywords tck
          WHERE (tck.tcversion_id = nhtcv.id)))));


ALTER TABLE public.tcversions_without_keywords OWNER TO "TESTLINKUSER";

--
-- TOC entry 312 (class 1259 OID 21807)
-- Name: testcase_platforms; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testcase_platforms (
    id bigint NOT NULL,
    testcase_id bigint DEFAULT '0'::bigint NOT NULL,
    tcversion_id bigint DEFAULT '0'::bigint NOT NULL,
    platform_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.testcase_platforms OWNER TO "TESTLINKUSER";

--
-- TOC entry 327 (class 1259 OID 21928)
-- Name: tcversions_without_platforms; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.tcversions_without_platforms AS
 SELECT nhtcv.parent_id AS testcase_id,
    nhtcv.id
   FROM public.nodes_hierarchy nhtcv
  WHERE ((nhtcv.node_type_id = 4) AND (NOT (EXISTS ( SELECT 1
           FROM public.testcase_platforms tcpl
          WHERE (tcpl.tcversion_id = nhtcv.id)))));


ALTER TABLE public.tcversions_without_platforms OWNER TO "TESTLINKUSER";

--
-- TOC entry 272 (class 1259 OID 21316)
-- Name: testcase_keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.testcase_keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testcase_keywords_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 272
-- Name: testcase_keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.testcase_keywords_id_seq OWNED BY public.testcase_keywords.id;


--
-- TOC entry 311 (class 1259 OID 21806)
-- Name: testcase_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.testcase_platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testcase_platforms_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 311
-- Name: testcase_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.testcase_platforms_id_seq OWNED BY public.testcase_platforms.id;


--
-- TOC entry 302 (class 1259 OID 21695)
-- Name: testcase_relations; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testcase_relations (
    id bigint NOT NULL,
    source_id integer DEFAULT 0 NOT NULL,
    destination_id integer DEFAULT 0 NOT NULL,
    relation_type smallint DEFAULT '1'::smallint NOT NULL,
    link_status smallint DEFAULT '1'::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.testcase_relations OWNER TO "TESTLINKUSER";

--
-- TOC entry 301 (class 1259 OID 21694)
-- Name: testcase_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.testcase_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testcase_relations_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4289 (class 0 OID 0)
-- Dependencies: 301
-- Name: testcase_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.testcase_relations_id_seq OWNED BY public.testcase_relations.id;


--
-- TOC entry 255 (class 1259 OID 21110)
-- Name: testcase_script_links; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testcase_script_links (
    tcversion_id bigint DEFAULT '0'::bigint NOT NULL,
    project_key character varying(64) NOT NULL,
    repository_name character varying(64) NOT NULL,
    code_path character varying(255) NOT NULL,
    branch_name character varying(64),
    commit_id character varying(40)
);


ALTER TABLE public.testcase_script_links OWNER TO "TESTLINKUSER";

--
-- TOC entry 287 (class 1259 OID 21500)
-- Name: testplan_platforms; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testplan_platforms (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT '0'::bigint NOT NULL,
    platform_id bigint DEFAULT '0'::bigint NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL
);


ALTER TABLE public.testplan_platforms OWNER TO "TESTLINKUSER";

--
-- TOC entry 286 (class 1259 OID 21499)
-- Name: testplan_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.testplan_platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testplan_platforms_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 286
-- Name: testplan_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.testplan_platforms_id_seq OWNED BY public.testplan_platforms.id;


--
-- TOC entry 238 (class 1259 OID 20861)
-- Name: testplan_tcversions; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testplan_tcversions (
    id bigint NOT NULL,
    testplan_id bigint DEFAULT '0'::bigint NOT NULL,
    tcversion_id bigint DEFAULT '0'::bigint NOT NULL,
    platform_id bigint DEFAULT '0'::bigint NOT NULL,
    node_order bigint DEFAULT 1 NOT NULL,
    urgency smallint DEFAULT '2'::smallint NOT NULL,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.testplan_tcversions OWNER TO "TESTLINKUSER";

--
-- TOC entry 237 (class 1259 OID 20860)
-- Name: testplan_tcversions_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.testplan_tcversions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testplan_tcversions_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4291 (class 0 OID 0)
-- Dependencies: 237
-- Name: testplan_tcversions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.testplan_tcversions_id_seq OWNED BY public.testplan_tcversions.id;


--
-- TOC entry 310 (class 1259 OID 21789)
-- Name: testproject_codetracker; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testproject_codetracker (
    testproject_id bigint DEFAULT '0'::bigint NOT NULL,
    codetracker_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.testproject_codetracker OWNER TO "TESTLINKUSER";

--
-- TOC entry 296 (class 1259 OID 21628)
-- Name: testproject_issuetracker; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testproject_issuetracker (
    testproject_id bigint DEFAULT '0'::bigint NOT NULL,
    issuetracker_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.testproject_issuetracker OWNER TO "TESTLINKUSER";

--
-- TOC entry 299 (class 1259 OID 21656)
-- Name: testproject_reqmgrsystem; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testproject_reqmgrsystem (
    testproject_id bigint DEFAULT '0'::bigint NOT NULL,
    reqmgrsystem_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE public.testproject_reqmgrsystem OWNER TO "TESTLINKUSER";

--
-- TOC entry 241 (class 1259 OID 20908)
-- Name: testprojects; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testprojects (
    id bigint DEFAULT '0'::bigint NOT NULL,
    notes text,
    color character varying(12) DEFAULT '#9BD'::character varying NOT NULL,
    active smallint DEFAULT '1'::smallint NOT NULL,
    option_reqs smallint DEFAULT '0'::smallint NOT NULL,
    option_priority smallint DEFAULT '0'::smallint NOT NULL,
    option_automation smallint DEFAULT '0'::smallint NOT NULL,
    options text,
    prefix character varying(16) NOT NULL,
    tc_counter integer DEFAULT 0 NOT NULL,
    is_public smallint DEFAULT '1'::smallint NOT NULL,
    issue_tracker_enabled smallint DEFAULT '0'::smallint NOT NULL,
    code_tracker_enabled smallint DEFAULT '0'::smallint NOT NULL,
    reqmgr_integration_enabled smallint DEFAULT '0'::smallint NOT NULL,
    api_key character varying(64) DEFAULT (md5((random())::text) || md5((random())::text)) NOT NULL
);


ALTER TABLE public.testprojects OWNER TO "TESTLINKUSER";

--
-- TOC entry 274 (class 1259 OID 21343)
-- Name: testsuites; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.testsuites (
    id bigint DEFAULT '0'::bigint NOT NULL,
    details text
);


ALTER TABLE public.testsuites OWNER TO "TESTLINKUSER";

--
-- TOC entry 280 (class 1259 OID 21431)
-- Name: text_templates; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.text_templates (
    id bigint NOT NULL,
    type integer NOT NULL,
    title character varying(100) NOT NULL,
    template_data text,
    author_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    is_public smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.text_templates OWNER TO "TESTLINKUSER";

--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE text_templates; Type: COMMENT; Schema: public; Owner: *
--

COMMENT ON TABLE public.text_templates IS 'Global Project Templates';


--
-- TOC entry 279 (class 1259 OID 21430)
-- Name: text_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.text_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.text_templates_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 279
-- Name: text_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.text_templates_id_seq OWNED BY public.text_templates.id;


--
-- TOC entry 219 (class 1259 OID 20626)
-- Name: transactions; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    entry_point character varying(45) DEFAULT ''::character varying NOT NULL,
    start_time integer DEFAULT 0 NOT NULL,
    end_time integer DEFAULT 0 NOT NULL,
    user_id bigint DEFAULT 0,
    session_id character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public.transactions OWNER TO "TESTLINKUSER";

--
-- TOC entry 218 (class 1259 OID 20625)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4294 (class 0 OID 0)
-- Dependencies: 218
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- TOC entry 328 (class 1259 OID 21932)
-- Name: tsuites_tree_depth_2; Type: VIEW; Schema: public; Owner: *
--

CREATE VIEW public.tsuites_tree_depth_2 AS
 SELECT tprj.prefix,
    nhtprj.name AS testproject_name,
    nhts_l1.name AS level1_name,
    nhts_l2.name AS level2_name,
    nhtprj.id AS testproject_id,
    nhts_l1.id AS level1_id,
    nhts_l2.id AS level2_id
   FROM (((public.testprojects tprj
     JOIN public.nodes_hierarchy nhtprj ON ((tprj.id = nhtprj.id)))
     LEFT JOIN public.nodes_hierarchy nhts_l1 ON ((nhts_l1.parent_id = nhtprj.id)))
     LEFT JOIN public.nodes_hierarchy nhts_l2 ON ((nhts_l2.parent_id = nhts_l1.id)))
  WHERE ((nhtprj.node_type_id = 1) AND (nhts_l1.node_type_id = 2) AND (nhts_l2.node_type_id = 2));


ALTER TABLE public.tsuites_tree_depth_2 OWNER TO "TESTLINKUSER";

--
-- TOC entry 276 (class 1259 OID 21357)
-- Name: user_assignments; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.user_assignments (
    id bigint NOT NULL,
    type bigint DEFAULT '0'::bigint NOT NULL,
    feature_id bigint DEFAULT '0'::bigint NOT NULL,
    user_id bigint,
    build_id bigint,
    deadline_ts timestamp without time zone DEFAULT (now() + '10 days'::interval) NOT NULL,
    assigner_id bigint,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.user_assignments OWNER TO "TESTLINKUSER";

--
-- TOC entry 275 (class 1259 OID 21356)
-- Name: user_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.user_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_assignments_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4295 (class 0 OID 0)
-- Dependencies: 275
-- Name: user_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.user_assignments_id_seq OWNED BY public.user_assignments.id;


--
-- TOC entry 282 (class 1259 OID 21448)
-- Name: user_group; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.user_group (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    owner_id bigint NOT NULL,
    testproject_id bigint NOT NULL
);


ALTER TABLE public.user_group OWNER TO "TESTLINKUSER";

--
-- TOC entry 283 (class 1259 OID 21467)
-- Name: user_group_assign; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.user_group_assign (
    usergroup_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_group_assign OWNER TO "TESTLINKUSER";

--
-- TOC entry 281 (class 1259 OID 21447)
-- Name: user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_group_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 281
-- Name: user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.user_group_id_seq OWNED BY public.user_group.id;


--
-- TOC entry 277 (class 1259 OID 21384)
-- Name: user_testplan_roles; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.user_testplan_roles (
    user_id integer DEFAULT 0 NOT NULL,
    testplan_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_testplan_roles OWNER TO "TESTLINKUSER";

--
-- TOC entry 278 (class 1259 OID 21407)
-- Name: user_testproject_roles; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.user_testproject_roles (
    user_id integer DEFAULT 0 NOT NULL,
    testproject_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_testproject_roles OWNER TO "TESTLINKUSER";

--
-- TOC entry 225 (class 1259 OID 20663)
-- Name: users; Type: TABLE; Schema: public; Owner: *
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    login character varying(100) DEFAULT ''::character varying NOT NULL,
    password character varying(255) DEFAULT ''::character varying NOT NULL,
    role_id smallint DEFAULT '0'::smallint NOT NULL,
    email character varying(100) DEFAULT ''::character varying NOT NULL,
    first character varying(50) DEFAULT ''::character varying NOT NULL,
    last character varying(50) DEFAULT ''::character varying NOT NULL,
    locale character varying(10) DEFAULT 'en_GB'::character varying NOT NULL,
    default_testproject_id integer,
    active smallint DEFAULT '1'::smallint NOT NULL,
    script_key character varying(32),
    cookie_string character varying(64) DEFAULT ''::character varying NOT NULL,
    auth_method character varying(10) DEFAULT ''::character varying,
    creation_ts timestamp without time zone DEFAULT now() NOT NULL,
    expiration_date date
);


ALTER TABLE public.users OWNER TO "TESTLINKUSER";

--
-- TOC entry 224 (class 1259 OID 20662)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: *
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "TESTLINKUSER";

--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: *
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3647 (class 2604 OID 21055)
-- Name: assignment_status id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.assignment_status ALTER COLUMN id SET DEFAULT nextval('public.assignment_status_id_seq'::regclass);


--
-- TOC entry 3649 (class 2604 OID 21063)
-- Name: assignment_types id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.assignment_types ALTER COLUMN id SET DEFAULT nextval('public.assignment_types_id_seq'::regclass);


--
-- TOC entry 3652 (class 2604 OID 21072)
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- TOC entry 3800 (class 2604 OID 21837)
-- Name: baseline_l1l2_context id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.baseline_l1l2_context ALTER COLUMN id SET DEFAULT nextval('public.baseline_l1l2_context_id_seq'::regclass);


--
-- TOC entry 3804 (class 2604 OID 21858)
-- Name: baseline_l1l2_details id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.baseline_l1l2_details ALTER COLUMN id SET DEFAULT nextval('public.baseline_l1l2_details_id_seq'::regclass);


--
-- TOC entry 3566 (class 2604 OID 20760)
-- Name: builds id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.builds ALTER COLUMN id SET DEFAULT nextval('public.builds_id_seq'::regclass);


--
-- TOC entry 3792 (class 2604 OID 21782)
-- Name: codetrackers id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.codetrackers ALTER COLUMN id SET DEFAULT nextval('public.codetrackers_id_seq'::regclass);


--
-- TOC entry 3598 (class 2604 OID 20888)
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_id_seq'::regclass);


--
-- TOC entry 3529 (class 2604 OID 20641)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 3580 (class 2604 OID 20815)
-- Name: execution_tcsteps id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.execution_tcsteps ALTER COLUMN id SET DEFAULT nextval('public.execution_tcsteps_id_seq'::regclass);


--
-- TOC entry 3584 (class 2604 OID 20838)
-- Name: execution_tcsteps_wip id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.execution_tcsteps_wip ALTER COLUMN id SET DEFAULT nextval('public.execution_tcsteps_wip_id_seq'::regclass);


--
-- TOC entry 3572 (class 2604 OID 20781)
-- Name: executions id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.executions ALTER COLUMN id SET DEFAULT nextval('public.executions_id_seq'::regclass);


--
-- TOC entry 3742 (class 2604 OID 21519)
-- Name: inventory id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.inventory ALTER COLUMN id SET DEFAULT nextval('public.inventory_id_seq'::regclass);


--
-- TOC entry 3767 (class 2604 OID 21621)
-- Name: issuetrackers id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.issuetrackers ALTER COLUMN id SET DEFAULT nextval('public.issuetrackers_id_seq'::regclass);


--
-- TOC entry 3669 (class 2604 OID 21125)
-- Name: keywords id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.keywords ALTER COLUMN id SET DEFAULT nextval('public.keywords_id_seq'::regclass);


--
-- TOC entry 3672 (class 2604 OID 21144)
-- Name: milestones id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.milestones ALTER COLUMN id SET DEFAULT nextval('public.milestones_id_seq'::regclass);


--
-- TOC entry 3518 (class 2604 OID 20605)
-- Name: node_types id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.node_types ALTER COLUMN id SET DEFAULT nextval('public.node_types_id_seq'::regclass);


--
-- TOC entry 3520 (class 2604 OID 20613)
-- Name: nodes_hierarchy id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.nodes_hierarchy ALTER COLUMN id SET DEFAULT nextval('public.nodes_hierarchy_id_seq'::regclass);


--
-- TOC entry 3678 (class 2604 OID 21163)
-- Name: object_keywords id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.object_keywords ALTER COLUMN id SET DEFAULT nextval('public.object_keywords_id_seq'::regclass);


--
-- TOC entry 3733 (class 2604 OID 21484)
-- Name: platforms id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.platforms ALTER COLUMN id SET DEFAULT nextval('public.platforms_id_seq'::regclass);


--
-- TOC entry 3786 (class 2604 OID 21747)
-- Name: plugins id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.plugins ALTER COLUMN id SET DEFAULT nextval('public.plugins_id_seq'::regclass);


--
-- TOC entry 3789 (class 2604 OID 21761)
-- Name: plugins_configuration id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.plugins_configuration ALTER COLUMN id SET DEFAULT nextval('public.plugins_configuration_id_seq'::regclass);


--
-- TOC entry 3695 (class 2604 OID 21237)
-- Name: req_coverage id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_coverage ALTER COLUMN id SET DEFAULT nextval('public.req_coverage_id_seq'::regclass);


--
-- TOC entry 3745 (class 2604 OID 21542)
-- Name: req_relations id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_relations ALTER COLUMN id SET DEFAULT nextval('public.req_relations_id_seq'::regclass);


--
-- TOC entry 3771 (class 2604 OID 21649)
-- Name: reqmgrsystems id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.reqmgrsystems ALTER COLUMN id SET DEFAULT nextval('public.reqmgrsystems_id_seq'::regclass);


--
-- TOC entry 3703 (class 2604 OID 21272)
-- Name: rights id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.rights ALTER COLUMN id SET DEFAULT nextval('public.rights_id_seq'::regclass);


--
-- TOC entry 3705 (class 2604 OID 21281)
-- Name: risk_assignments id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.risk_assignments ALTER COLUMN id SET DEFAULT nextval('public.risk_assignments_id_seq'::regclass);


--
-- TOC entry 3533 (class 2604 OID 20655)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3712 (class 2604 OID 21320)
-- Name: testcase_keywords id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_keywords ALTER COLUMN id SET DEFAULT nextval('public.testcase_keywords_id_seq'::regclass);


--
-- TOC entry 3796 (class 2604 OID 21810)
-- Name: testcase_platforms id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_platforms ALTER COLUMN id SET DEFAULT nextval('public.testcase_platforms_id_seq'::regclass);


--
-- TOC entry 3778 (class 2604 OID 21698)
-- Name: testcase_relations id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_relations ALTER COLUMN id SET DEFAULT nextval('public.testcase_relations_id_seq'::regclass);


--
-- TOC entry 3738 (class 2604 OID 21503)
-- Name: testplan_platforms id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testplan_platforms ALTER COLUMN id SET DEFAULT nextval('public.testplan_platforms_id_seq'::regclass);


--
-- TOC entry 3591 (class 2604 OID 20864)
-- Name: testplan_tcversions id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testplan_tcversions ALTER COLUMN id SET DEFAULT nextval('public.testplan_tcversions_id_seq'::regclass);


--
-- TOC entry 3729 (class 2604 OID 21434)
-- Name: text_templates id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.text_templates ALTER COLUMN id SET DEFAULT nextval('public.text_templates_id_seq'::regclass);


--
-- TOC entry 3523 (class 2604 OID 20629)
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- TOC entry 3717 (class 2604 OID 21360)
-- Name: user_assignments id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_assignments ALTER COLUMN id SET DEFAULT nextval('public.user_assignments_id_seq'::regclass);


--
-- TOC entry 3732 (class 2604 OID 21451)
-- Name: user_group id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_group ALTER COLUMN id SET DEFAULT nextval('public.user_group_id_seq'::regclass);


--
-- TOC entry 3535 (class 2604 OID 20666)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3878 (class 2606 OID 21058)
-- Name: assignment_status assignment_status_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.assignment_status
    ADD CONSTRAINT assignment_status_pkey PRIMARY KEY (id);


--
-- TOC entry 3880 (class 2606 OID 21067)
-- Name: assignment_types assignment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.assignment_types
    ADD CONSTRAINT assignment_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3883 (class 2606 OID 21086)
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 3990 (class 2606 OID 21842)
-- Name: baseline_l1l2_context baseline_l1l2_context_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.baseline_l1l2_context
    ADD CONSTRAINT baseline_l1l2_context_pkey PRIMARY KEY (id);


--
-- TOC entry 3993 (class 2606 OID 21866)
-- Name: baseline_l1l2_details baseline_l1l2_details_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.baseline_l1l2_details
    ADD CONSTRAINT baseline_l1l2_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3839 (class 2606 OID 20769)
-- Name: builds builds_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.builds
    ADD CONSTRAINT builds_pkey PRIMARY KEY (id);


--
-- TOC entry 3970 (class 2606 OID 21682)
-- Name: cfield_build_design_values cfield_build_design_values_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_build_design_values
    ADD CONSTRAINT cfield_build_design_values_pkey PRIMARY KEY (field_id, node_id);


--
-- TOC entry 3867 (class 2606 OID 20968)
-- Name: cfield_design_values cfield_design_values_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_design_values
    ADD CONSTRAINT cfield_design_values_pkey PRIMARY KEY (field_id, node_id);


--
-- TOC entry 3870 (class 2606 OID 20991)
-- Name: cfield_execution_values cfield_execution_values_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_execution_values
    ADD CONSTRAINT cfield_execution_values_pkey PRIMARY KEY (field_id, execution_id, testplan_id, tcversion_id);


--
-- TOC entry 3876 (class 2606 OID 21039)
-- Name: cfield_node_types cfield_node_types_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_node_types
    ADD CONSTRAINT cfield_node_types_pkey PRIMARY KEY (field_id, node_type_id);


--
-- TOC entry 3872 (class 2606 OID 21021)
-- Name: cfield_testplan_design_values cfield_testplan_design_values_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_testplan_design_values
    ADD CONSTRAINT cfield_testplan_design_values_pkey PRIMARY KEY (field_id, link_id);


--
-- TOC entry 3865 (class 2606 OID 20948)
-- Name: cfield_testprojects cfield_testprojects_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_testprojects
    ADD CONSTRAINT cfield_testprojects_pkey PRIMARY KEY (field_id, testproject_id);


--
-- TOC entry 3981 (class 2606 OID 21787)
-- Name: codetrackers codetrackers_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.codetrackers
    ADD CONSTRAINT codetrackers_pkey PRIMARY KEY (id);


--
-- TOC entry 3857 (class 2606 OID 20906)
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- TOC entry 3885 (class 2606 OID 21096)
-- Name: db_version db_version_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.db_version
    ADD CONSTRAINT db_version_pkey PRIMARY KEY (version);


--
-- TOC entry 3821 (class 2606 OID 20648)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 3887 (class 2606 OID 21104)
-- Name: execution_bugs execution_bugs_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.execution_bugs
    ADD CONSTRAINT execution_bugs_pkey PRIMARY KEY (execution_id, bug_id, tcstep_id);


--
-- TOC entry 3848 (class 2606 OID 20822)
-- Name: execution_tcsteps execution_tcsteps_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.execution_tcsteps
    ADD CONSTRAINT execution_tcsteps_pkey PRIMARY KEY (id);


--
-- TOC entry 3851 (class 2606 OID 20848)
-- Name: execution_tcsteps_wip execution_tcsteps_wip_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.execution_tcsteps_wip
    ADD CONSTRAINT execution_tcsteps_wip_pkey PRIMARY KEY (id);


--
-- TOC entry 3846 (class 2606 OID 20792)
-- Name: executions executions_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.executions
    ADD CONSTRAINT executions_pkey PRIMARY KEY (id);


--
-- TOC entry 3949 (class 2606 OID 21525)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 3960 (class 2606 OID 21626)
-- Name: issuetrackers issuetrackers_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.issuetrackers
    ADD CONSTRAINT issuetrackers_pkey PRIMARY KEY (id);


--
-- TOC entry 3893 (class 2606 OID 21131)
-- Name: keywords keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (id);


--
-- TOC entry 3896 (class 2606 OID 21151)
-- Name: milestones milestones_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.milestones
    ADD CONSTRAINT milestones_pkey PRIMARY KEY (id);


--
-- TOC entry 3812 (class 2606 OID 20608)
-- Name: node_types node_types_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.node_types
    ADD CONSTRAINT node_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3816 (class 2606 OID 20617)
-- Name: nodes_hierarchy nodes_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.nodes_hierarchy
    ADD CONSTRAINT nodes_hierarchy_pkey PRIMARY KEY (id);


--
-- TOC entry 3900 (class 2606 OID 21168)
-- Name: object_keywords object_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.object_keywords
    ADD CONSTRAINT object_keywords_pkey PRIMARY KEY (id);


--
-- TOC entry 3942 (class 2606 OID 21492)
-- Name: platforms platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (id);


--
-- TOC entry 3979 (class 2606 OID 21767)
-- Name: plugins_configuration plugins_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.plugins_configuration
    ADD CONSTRAINT plugins_configuration_pkey PRIMARY KEY (id);


--
-- TOC entry 3977 (class 2606 OID 21751)
-- Name: plugins plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_pkey PRIMARY KEY (id);


--
-- TOC entry 3913 (class 2606 OID 21246)
-- Name: req_coverage req_coverage_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_coverage
    ADD CONSTRAINT req_coverage_pkey PRIMARY KEY (id);


--
-- TOC entry 3975 (class 2606 OID 21727)
-- Name: req_monitor req_monitor_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_monitor
    ADD CONSTRAINT req_monitor_pkey PRIMARY KEY (req_id, user_id, testproject_id);


--
-- TOC entry 3952 (class 2606 OID 21548)
-- Name: req_relations req_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_relations
    ADD CONSTRAINT req_relations_pkey PRIMARY KEY (id);


--
-- TOC entry 3954 (class 2606 OID 21580)
-- Name: req_revisions req_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_revisions
    ADD CONSTRAINT req_revisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3903 (class 2606 OID 21181)
-- Name: req_specs req_specs_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_specs
    ADD CONSTRAINT req_specs_pkey PRIMARY KEY (id);


--
-- TOC entry 3958 (class 2606 OID 21605)
-- Name: req_specs_revisions req_specs_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_specs_revisions
    ADD CONSTRAINT req_specs_revisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3910 (class 2606 OID 21227)
-- Name: req_versions req_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_versions
    ADD CONSTRAINT req_versions_pkey PRIMARY KEY (id);


--
-- TOC entry 3965 (class 2606 OID 21654)
-- Name: reqmgrsystems reqmgrsystems_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.reqmgrsystems
    ADD CONSTRAINT reqmgrsystems_pkey PRIMARY KEY (id);


--
-- TOC entry 3908 (class 2606 OID 21200)
-- Name: requirements requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (id);


--
-- TOC entry 3915 (class 2606 OID 21275)
-- Name: rights rights_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.rights
    ADD CONSTRAINT rights_pkey PRIMARY KEY (id);


--
-- TOC entry 3918 (class 2606 OID 21287)
-- Name: risk_assignments risk_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.risk_assignments
    ADD CONSTRAINT risk_assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 3921 (class 2606 OID 21305)
-- Name: role_rights role_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.role_rights
    ADD CONSTRAINT role_rights_pkey PRIMARY KEY (role_id, right_id);


--
-- TOC entry 3824 (class 2606 OID 20660)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3833 (class 2606 OID 20730)
-- Name: tcsteps tcsteps_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.tcsteps
    ADD CONSTRAINT tcsteps_pkey PRIMARY KEY (id);


--
-- TOC entry 3831 (class 2606 OID 20704)
-- Name: tcversions tcversions_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.tcversions
    ADD CONSTRAINT tcversions_pkey PRIMARY KEY (id);


--
-- TOC entry 3925 (class 2606 OID 21325)
-- Name: testcase_keywords testcase_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_keywords
    ADD CONSTRAINT testcase_keywords_pkey PRIMARY KEY (id);


--
-- TOC entry 3988 (class 2606 OID 21815)
-- Name: testcase_platforms testcase_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_platforms
    ADD CONSTRAINT testcase_platforms_pkey PRIMARY KEY (id);


--
-- TOC entry 3973 (class 2606 OID 21705)
-- Name: testcase_relations testcase_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_relations
    ADD CONSTRAINT testcase_relations_pkey PRIMARY KEY (id);


--
-- TOC entry 3889 (class 2606 OID 21115)
-- Name: testcase_script_links testcase_script_links_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_script_links
    ADD CONSTRAINT testcase_script_links_pkey PRIMARY KEY (tcversion_id, project_key, repository_name, code_path);


--
-- TOC entry 3945 (class 2606 OID 21508)
-- Name: testplan_platforms testplan_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testplan_platforms
    ADD CONSTRAINT testplan_platforms_pkey PRIMARY KEY (id);


--
-- TOC entry 3854 (class 2606 OID 20872)
-- Name: testplan_tcversions testplan_tcversions_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testplan_tcversions
    ADD CONSTRAINT testplan_tcversions_pkey PRIMARY KEY (id);


--
-- TOC entry 3835 (class 2606 OID 20748)
-- Name: testplans testplans_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testplans
    ADD CONSTRAINT testplans_pkey PRIMARY KEY (id);


--
-- TOC entry 3984 (class 2606 OID 21795)
-- Name: testproject_codetracker testproject_codetracker_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testproject_codetracker
    ADD CONSTRAINT testproject_codetracker_pkey PRIMARY KEY (testproject_id);


--
-- TOC entry 3963 (class 2606 OID 21634)
-- Name: testproject_issuetracker testproject_issuetracker_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testproject_issuetracker
    ADD CONSTRAINT testproject_issuetracker_pkey PRIMARY KEY (testproject_id);


--
-- TOC entry 3968 (class 2606 OID 21662)
-- Name: testproject_reqmgrsystem testproject_reqmgrsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testproject_reqmgrsystem
    ADD CONSTRAINT testproject_reqmgrsystem_pkey PRIMARY KEY (testproject_id);


--
-- TOC entry 3861 (class 2606 OID 20926)
-- Name: testprojects testprojects_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testprojects
    ADD CONSTRAINT testprojects_pkey PRIMARY KEY (id);


--
-- TOC entry 3927 (class 2606 OID 21350)
-- Name: testsuites testsuites_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testsuites
    ADD CONSTRAINT testsuites_pkey PRIMARY KEY (id);


--
-- TOC entry 3936 (class 2606 OID 21440)
-- Name: text_templates text_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.text_templates
    ADD CONSTRAINT text_templates_pkey PRIMARY KEY (id);


--
-- TOC entry 3818 (class 2606 OID 20636)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 3930 (class 2606 OID 21367)
-- Name: user_assignments user_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_assignments
    ADD CONSTRAINT user_assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 3939 (class 2606 OID 21455)
-- Name: user_group user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3932 (class 2606 OID 21391)
-- Name: user_testplan_roles user_testplan_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_testplan_roles
    ADD CONSTRAINT user_testplan_roles_pkey PRIMARY KEY (user_id, testplan_id);


--
-- TOC entry 3934 (class 2606 OID 21414)
-- Name: user_testproject_roles user_testproject_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_testproject_roles
    ADD CONSTRAINT user_testproject_roles_pkey PRIMARY KEY (user_id, testproject_id);


--
-- TOC entry 3827 (class 2606 OID 20681)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3881 (class 1259 OID 21087)
-- Name: attachments_idx1; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX attachments_idx1 ON public.attachments USING btree (fk_id);


--
-- TOC entry 3840 (class 1259 OID 20776)
-- Name: builds_testplan_id; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX builds_testplan_id ON public.builds USING btree (testplan_id);


--
-- TOC entry 3841 (class 1259 OID 20775)
-- Name: builds_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX builds_uidx1 ON public.builds USING btree (testplan_id, name);


--
-- TOC entry 3874 (class 1259 OID 21050)
-- Name: cfield_node_types_idx_custom_fields_assign; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX cfield_node_types_idx_custom_fields_assign ON public.cfield_node_types USING btree (node_type_id);


--
-- TOC entry 3982 (class 1259 OID 21788)
-- Name: codetrackers_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX codetrackers_uidx1 ON public.codetrackers USING btree (name);


--
-- TOC entry 3858 (class 1259 OID 20907)
-- Name: custom_fields_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX custom_fields_uidx1 ON public.custom_fields USING btree (name);


--
-- TOC entry 3819 (class 1259 OID 20650)
-- Name: events_fired_at; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX events_fired_at ON public.events USING btree (fired_at);


--
-- TOC entry 3822 (class 1259 OID 20649)
-- Name: events_transaction_id; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX events_transaction_id ON public.events USING btree (transaction_id);


--
-- TOC entry 3849 (class 1259 OID 20833)
-- Name: execution_tcsteps_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX execution_tcsteps_uidx1 ON public.execution_tcsteps USING btree (execution_id, tcstep_id);


--
-- TOC entry 3852 (class 1259 OID 20859)
-- Name: execution_tcsteps_wip_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX execution_tcsteps_wip_uidx1 ON public.execution_tcsteps_wip USING btree (tcstep_id, testplan_id, platform_id, build_id);


--
-- TOC entry 3842 (class 1259 OID 20808)
-- Name: executions_idx1; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX executions_idx1 ON public.executions USING btree (testplan_id, tcversion_id, platform_id, build_id);


--
-- TOC entry 3843 (class 1259 OID 20809)
-- Name: executions_idx2; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX executions_idx2 ON public.executions USING btree (execution_type);


--
-- TOC entry 3844 (class 1259 OID 20810)
-- Name: executions_idx3; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX executions_idx3 ON public.executions USING btree (tcversion_id);


--
-- TOC entry 3922 (class 1259 OID 21341)
-- Name: idx01_testcase_keywords; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX idx01_testcase_keywords ON public.testcase_keywords USING btree (testcase_id, tcversion_id, keyword_id);


--
-- TOC entry 3985 (class 1259 OID 21831)
-- Name: idx01_testcase_platforms; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX idx01_testcase_platforms ON public.testcase_platforms USING btree (testcase_id, tcversion_id, platform_id);


--
-- TOC entry 3923 (class 1259 OID 21342)
-- Name: idx02_testcase_keywords; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX idx02_testcase_keywords ON public.testcase_keywords USING btree (tcversion_id);


--
-- TOC entry 3986 (class 1259 OID 21832)
-- Name: idx02_testcase_platforms; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX idx02_testcase_platforms ON public.testcase_platforms USING btree (tcversion_id);


--
-- TOC entry 3947 (class 1259 OID 21536)
-- Name: inventory_idx1; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX inventory_idx1 ON public.inventory USING btree (testproject_id);


--
-- TOC entry 3950 (class 1259 OID 21537)
-- Name: inventory_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX inventory_uidx1 ON public.inventory USING btree (name, testproject_id);


--
-- TOC entry 3961 (class 1259 OID 21627)
-- Name: issuetrackers_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX issuetrackers_uidx1 ON public.issuetrackers USING btree (name);


--
-- TOC entry 3971 (class 1259 OID 21693)
-- Name: ix_cfield_build_design_values; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX ix_cfield_build_design_values ON public.cfield_build_design_values USING btree (node_id);


--
-- TOC entry 3868 (class 1259 OID 20979)
-- Name: ix_cfield_design_values; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX ix_cfield_design_values ON public.cfield_design_values USING btree (node_id);


--
-- TOC entry 3873 (class 1259 OID 21032)
-- Name: ix_cfield_tplan_design_val; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX ix_cfield_tplan_design_val ON public.cfield_testplan_design_values USING btree (link_id);


--
-- TOC entry 3890 (class 1259 OID 21138)
-- Name: keywords_keyword; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX keywords_keyword ON public.keywords USING btree (keyword);


--
-- TOC entry 3891 (class 1259 OID 21139)
-- Name: keywords_keyword_testproject_id; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX keywords_keyword_testproject_id ON public.keywords USING btree (testproject_id, keyword);


--
-- TOC entry 3894 (class 1259 OID 21137)
-- Name: keywords_testproject_id; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX keywords_testproject_id ON public.keywords USING btree (testproject_id);


--
-- TOC entry 3897 (class 1259 OID 21158)
-- Name: milestones_testplan_id; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX milestones_testplan_id ON public.milestones USING btree (testplan_id);


--
-- TOC entry 3898 (class 1259 OID 21157)
-- Name: milestones_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX milestones_uidx1 ON public.milestones USING btree (name, testplan_id);


--
-- TOC entry 3813 (class 1259 OID 20624)
-- Name: nodes_hierarchy_node_type_id; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX nodes_hierarchy_node_type_id ON public.nodes_hierarchy USING btree (node_type_id);


--
-- TOC entry 3814 (class 1259 OID 20623)
-- Name: nodes_hierarchy_pid_m_nodeorder; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX nodes_hierarchy_pid_m_nodeorder ON public.nodes_hierarchy USING btree (parent_id, node_order);


--
-- TOC entry 3901 (class 1259 OID 21174)
-- Name: object_keywords_udx01; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX object_keywords_udx01 ON public.object_keywords USING btree (fk_id, fk_table, keyword_id);


--
-- TOC entry 3943 (class 1259 OID 21498)
-- Name: platforms_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX platforms_uidx1 ON public.platforms USING btree (testproject_id, name);


--
-- TOC entry 3911 (class 1259 OID 21267)
-- Name: req_coverage_full_link; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX req_coverage_full_link ON public.req_coverage USING btree (req_id, req_version_id, testcase_id, tcversion_id);


--
-- TOC entry 3955 (class 1259 OID 21591)
-- Name: req_revisions_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX req_revisions_uidx1 ON public.req_revisions USING btree (parent_id, revision);


--
-- TOC entry 3956 (class 1259 OID 21616)
-- Name: req_specs_revisions_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX req_specs_revisions_uidx1 ON public.req_revisions USING btree (parent_id, revision);


--
-- TOC entry 3904 (class 1259 OID 21193)
-- Name: req_specs_testproject_id; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX req_specs_testproject_id ON public.req_specs USING btree (testproject_id);


--
-- TOC entry 3905 (class 1259 OID 21192)
-- Name: req_specs_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX req_specs_uidx1 ON public.req_specs USING btree (doc_id, testproject_id);


--
-- TOC entry 3966 (class 1259 OID 21655)
-- Name: reqmgrsystems_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX reqmgrsystems_uidx1 ON public.reqmgrsystems USING btree (name);


--
-- TOC entry 3906 (class 1259 OID 21211)
-- Name: requirements_idx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX requirements_idx1 ON public.requirements USING btree (srs_id, req_doc_id);


--
-- TOC entry 3916 (class 1259 OID 21276)
-- Name: rights_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX rights_uidx1 ON public.rights USING btree (description);


--
-- TOC entry 3919 (class 1259 OID 21298)
-- Name: risk_assignments_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX risk_assignments_uidx1 ON public.risk_assignments USING btree (testplan_id, node_id);


--
-- TOC entry 3825 (class 1259 OID 20661)
-- Name: roles_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX roles_uidx1 ON public.roles USING btree (description);


--
-- TOC entry 3946 (class 1259 OID 21514)
-- Name: testplan_platforms_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX testplan_platforms_uidx1 ON public.testplan_platforms USING btree (testplan_id, platform_id);


--
-- TOC entry 3855 (class 1259 OID 20883)
-- Name: testplan_tcversions_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX testplan_tcversions_uidx1 ON public.testplan_tcversions USING btree (testplan_id, tcversion_id, platform_id);


--
-- TOC entry 3836 (class 1259 OID 20754)
-- Name: testplans_testproject_id_active; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX testplans_testproject_id_active ON public.testplans USING btree (testproject_id, active);


--
-- TOC entry 3837 (class 1259 OID 20755)
-- Name: testplans_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX testplans_uidx1 ON public.testplans USING btree (api_key);


--
-- TOC entry 3859 (class 1259 OID 20934)
-- Name: testprojects_id_active; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX testprojects_id_active ON public.testprojects USING btree (id, active);


--
-- TOC entry 3862 (class 1259 OID 20932)
-- Name: testprojects_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX testprojects_uidx1 ON public.testprojects USING btree (prefix);


--
-- TOC entry 3863 (class 1259 OID 20933)
-- Name: testprojects_uidx2; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX testprojects_uidx2 ON public.testprojects USING btree (api_key);


--
-- TOC entry 3937 (class 1259 OID 21446)
-- Name: text_templates_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX text_templates_uidx1 ON public.text_templates USING btree (type, title);


--
-- TOC entry 3991 (class 1259 OID 21853)
-- Name: udx1_context; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX udx1_context ON public.baseline_l1l2_context USING btree (testplan_id, platform_id, creation_ts);


--
-- TOC entry 3994 (class 1259 OID 21882)
-- Name: udx1_details; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX udx1_details ON public.baseline_l1l2_details USING btree (context_id, top_tsuite_id, child_tsuite_id, status);


--
-- TOC entry 3928 (class 1259 OID 21383)
-- Name: user_assignments_feature_id; Type: INDEX; Schema: public; Owner: *
--

CREATE INDEX user_assignments_feature_id ON public.user_assignments USING btree (feature_id);


--
-- TOC entry 3940 (class 1259 OID 21466)
-- Name: user_group_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX user_group_uidx1 ON public.user_group USING btree (title);


--
-- TOC entry 3828 (class 1259 OID 20687)
-- Name: users_uidx1; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX users_uidx1 ON public.users USING btree (login);


--
-- TOC entry 3829 (class 1259 OID 20688)
-- Name: users_uidx2; Type: INDEX; Schema: public; Owner: *
--

CREATE UNIQUE INDEX users_uidx2 ON public.users USING btree (cookie_string);


--
-- TOC entry 4092 (class 2606 OID 21848)
-- Name: baseline_l1l2_context baseline_l1l2_context_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.baseline_l1l2_context
    ADD CONSTRAINT baseline_l1l2_context_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platforms(id) ON DELETE CASCADE;


--
-- TOC entry 4093 (class 2606 OID 21843)
-- Name: baseline_l1l2_context baseline_l1l2_context_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.baseline_l1l2_context
    ADD CONSTRAINT baseline_l1l2_context_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES public.testplans(id);


--
-- TOC entry 4094 (class 2606 OID 21877)
-- Name: baseline_l1l2_details baseline_l1l2_details_child_tsuite_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.baseline_l1l2_details
    ADD CONSTRAINT baseline_l1l2_details_child_tsuite_id_fkey FOREIGN KEY (child_tsuite_id) REFERENCES public.testsuites(id);


--
-- TOC entry 4095 (class 2606 OID 21867)
-- Name: baseline_l1l2_details baseline_l1l2_details_context_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.baseline_l1l2_details
    ADD CONSTRAINT baseline_l1l2_details_context_id_fkey FOREIGN KEY (context_id) REFERENCES public.baseline_l1l2_context(id);


--
-- TOC entry 4096 (class 2606 OID 21872)
-- Name: baseline_l1l2_details baseline_l1l2_details_top_tsuite_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.baseline_l1l2_details
    ADD CONSTRAINT baseline_l1l2_details_top_tsuite_id_fkey FOREIGN KEY (top_tsuite_id) REFERENCES public.testsuites(id);


--
-- TOC entry 4002 (class 2606 OID 20770)
-- Name: builds builds_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.builds
    ADD CONSTRAINT builds_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES public.testplans(id);


--
-- TOC entry 4076 (class 2606 OID 21683)
-- Name: cfield_build_design_values cfield_build_design_values_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_build_design_values
    ADD CONSTRAINT cfield_build_design_values_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.custom_fields(id) ON DELETE CASCADE;


--
-- TOC entry 4077 (class 2606 OID 21688)
-- Name: cfield_build_design_values cfield_build_design_values_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_build_design_values
    ADD CONSTRAINT cfield_build_design_values_node_id_fkey FOREIGN KEY (node_id) REFERENCES public.builds(id) ON DELETE CASCADE;


--
-- TOC entry 4015 (class 2606 OID 20969)
-- Name: cfield_design_values cfield_design_values_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_design_values
    ADD CONSTRAINT cfield_design_values_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.custom_fields(id) ON DELETE CASCADE;


--
-- TOC entry 4016 (class 2606 OID 20974)
-- Name: cfield_design_values cfield_design_values_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_design_values
    ADD CONSTRAINT cfield_design_values_node_id_fkey FOREIGN KEY (node_id) REFERENCES public.nodes_hierarchy(id) ON DELETE CASCADE;


--
-- TOC entry 4017 (class 2606 OID 20997)
-- Name: cfield_execution_values cfield_execution_values_execution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_execution_values
    ADD CONSTRAINT cfield_execution_values_execution_id_fkey FOREIGN KEY (execution_id) REFERENCES public.executions(id) ON DELETE CASCADE;


--
-- TOC entry 4018 (class 2606 OID 20992)
-- Name: cfield_execution_values cfield_execution_values_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_execution_values
    ADD CONSTRAINT cfield_execution_values_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.custom_fields(id) ON DELETE CASCADE;


--
-- TOC entry 4019 (class 2606 OID 21007)
-- Name: cfield_execution_values cfield_execution_values_tcversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_execution_values
    ADD CONSTRAINT cfield_execution_values_tcversion_id_fkey FOREIGN KEY (tcversion_id) REFERENCES public.tcversions(id) ON DELETE CASCADE;


--
-- TOC entry 4020 (class 2606 OID 21002)
-- Name: cfield_execution_values cfield_execution_values_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_execution_values
    ADD CONSTRAINT cfield_execution_values_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES public.testplans(id) ON DELETE CASCADE;


--
-- TOC entry 4023 (class 2606 OID 21040)
-- Name: cfield_node_types cfield_node_types_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_node_types
    ADD CONSTRAINT cfield_node_types_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.custom_fields(id) ON DELETE CASCADE;


--
-- TOC entry 4024 (class 2606 OID 21045)
-- Name: cfield_node_types cfield_node_types_node_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_node_types
    ADD CONSTRAINT cfield_node_types_node_type_id_fkey FOREIGN KEY (node_type_id) REFERENCES public.node_types(id) ON DELETE CASCADE;


--
-- TOC entry 4021 (class 2606 OID 21022)
-- Name: cfield_testplan_design_values cfield_testplan_design_values_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_testplan_design_values
    ADD CONSTRAINT cfield_testplan_design_values_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.custom_fields(id) ON DELETE CASCADE;


--
-- TOC entry 4022 (class 2606 OID 21027)
-- Name: cfield_testplan_design_values cfield_testplan_design_values_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_testplan_design_values
    ADD CONSTRAINT cfield_testplan_design_values_link_id_fkey FOREIGN KEY (link_id) REFERENCES public.testplan_tcversions(id) ON DELETE CASCADE;


--
-- TOC entry 4013 (class 2606 OID 20949)
-- Name: cfield_testprojects cfield_testprojects_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_testprojects
    ADD CONSTRAINT cfield_testprojects_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.custom_fields(id) ON DELETE CASCADE;


--
-- TOC entry 4014 (class 2606 OID 20954)
-- Name: cfield_testprojects cfield_testprojects_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.cfield_testprojects
    ADD CONSTRAINT cfield_testprojects_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4025 (class 2606 OID 21105)
-- Name: execution_bugs execution_bugs_execution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.execution_bugs
    ADD CONSTRAINT execution_bugs_execution_id_fkey FOREIGN KEY (execution_id) REFERENCES public.executions(id) ON DELETE CASCADE;


--
-- TOC entry 4006 (class 2606 OID 20823)
-- Name: execution_tcsteps execution_tcsteps_execution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.execution_tcsteps
    ADD CONSTRAINT execution_tcsteps_execution_id_fkey FOREIGN KEY (execution_id) REFERENCES public.executions(id);


--
-- TOC entry 4007 (class 2606 OID 20828)
-- Name: execution_tcsteps execution_tcsteps_tcstep_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.execution_tcsteps
    ADD CONSTRAINT execution_tcsteps_tcstep_id_fkey FOREIGN KEY (tcstep_id) REFERENCES public.tcsteps(id);


--
-- TOC entry 4008 (class 2606 OID 20849)
-- Name: execution_tcsteps_wip execution_tcsteps_wip_tcstep_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.execution_tcsteps_wip
    ADD CONSTRAINT execution_tcsteps_wip_tcstep_id_fkey FOREIGN KEY (tcstep_id) REFERENCES public.tcsteps(id);


--
-- TOC entry 4009 (class 2606 OID 20854)
-- Name: execution_tcsteps_wip execution_tcsteps_wip_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.execution_tcsteps_wip
    ADD CONSTRAINT execution_tcsteps_wip_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES public.testplans(id);


--
-- TOC entry 4003 (class 2606 OID 20793)
-- Name: executions executions_build_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.executions
    ADD CONSTRAINT executions_build_id_fkey FOREIGN KEY (build_id) REFERENCES public.builds(id);


--
-- TOC entry 4004 (class 2606 OID 20803)
-- Name: executions executions_tcversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.executions
    ADD CONSTRAINT executions_tcversion_id_fkey FOREIGN KEY (tcversion_id) REFERENCES public.tcversions(id);


--
-- TOC entry 4005 (class 2606 OID 20798)
-- Name: executions executions_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.executions
    ADD CONSTRAINT executions_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES public.testplans(id);


--
-- TOC entry 4063 (class 2606 OID 21531)
-- Name: inventory inventory_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- TOC entry 4064 (class 2606 OID 21526)
-- Name: inventory inventory_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4027 (class 2606 OID 21132)
-- Name: keywords keywords_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT keywords_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4028 (class 2606 OID 21152)
-- Name: milestones milestones_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.milestones
    ADD CONSTRAINT milestones_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES public.testplans(id) ON DELETE CASCADE;


--
-- TOC entry 3995 (class 2606 OID 20618)
-- Name: nodes_hierarchy nodes_hierarchy_node_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.nodes_hierarchy
    ADD CONSTRAINT nodes_hierarchy_node_type_id_fkey FOREIGN KEY (node_type_id) REFERENCES public.node_types(id);


--
-- TOC entry 4029 (class 2606 OID 21169)
-- Name: object_keywords object_keywords_keyword_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.object_keywords
    ADD CONSTRAINT object_keywords_keyword_id_fkey FOREIGN KEY (keyword_id) REFERENCES public.keywords(id) ON DELETE CASCADE;


--
-- TOC entry 4061 (class 2606 OID 21493)
-- Name: platforms platforms_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4084 (class 2606 OID 21752)
-- Name: plugins plugins_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- TOC entry 4085 (class 2606 OID 21773)
-- Name: plugins_configuration plugins_configuration_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.plugins_configuration
    ADD CONSTRAINT plugins_configuration_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- TOC entry 4086 (class 2606 OID 21768)
-- Name: plugins_configuration plugins_configuration_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.plugins_configuration
    ADD CONSTRAINT plugins_configuration_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4035 (class 2606 OID 21257)
-- Name: req_coverage req_coverage_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_coverage
    ADD CONSTRAINT req_coverage_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- TOC entry 4036 (class 2606 OID 21247)
-- Name: req_coverage req_coverage_req_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_coverage
    ADD CONSTRAINT req_coverage_req_id_fkey FOREIGN KEY (req_id) REFERENCES public.requirements(id) ON DELETE CASCADE;


--
-- TOC entry 4037 (class 2606 OID 21252)
-- Name: req_coverage req_coverage_req_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_coverage
    ADD CONSTRAINT req_coverage_req_version_id_fkey FOREIGN KEY (req_version_id) REFERENCES public.req_versions(id) ON DELETE CASCADE;


--
-- TOC entry 4038 (class 2606 OID 21262)
-- Name: req_coverage req_coverage_review_requester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_coverage
    ADD CONSTRAINT req_coverage_review_requester_id_fkey FOREIGN KEY (review_requester_id) REFERENCES public.users(id);


--
-- TOC entry 4081 (class 2606 OID 21728)
-- Name: req_monitor req_monitor_req_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_monitor
    ADD CONSTRAINT req_monitor_req_id_fkey FOREIGN KEY (req_id) REFERENCES public.requirements(id) ON DELETE CASCADE;


--
-- TOC entry 4082 (class 2606 OID 21738)
-- Name: req_monitor req_monitor_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_monitor
    ADD CONSTRAINT req_monitor_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4083 (class 2606 OID 21733)
-- Name: req_monitor req_monitor_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_monitor
    ADD CONSTRAINT req_monitor_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4065 (class 2606 OID 21559)
-- Name: req_relations req_relations_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_relations
    ADD CONSTRAINT req_relations_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- TOC entry 4066 (class 2606 OID 21554)
-- Name: req_relations req_relations_destination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_relations
    ADD CONSTRAINT req_relations_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.requirements(id) ON DELETE CASCADE;


--
-- TOC entry 4067 (class 2606 OID 21549)
-- Name: req_relations req_relations_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_relations
    ADD CONSTRAINT req_relations_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.requirements(id) ON DELETE CASCADE;


--
-- TOC entry 4068 (class 2606 OID 21586)
-- Name: req_revisions req_revisions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_revisions
    ADD CONSTRAINT req_revisions_id_fkey FOREIGN KEY (id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 4069 (class 2606 OID 21581)
-- Name: req_revisions req_revisions_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_revisions
    ADD CONSTRAINT req_revisions_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.req_versions(id) ON DELETE CASCADE;


--
-- TOC entry 4030 (class 2606 OID 21182)
-- Name: req_specs req_specs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_specs
    ADD CONSTRAINT req_specs_id_fkey FOREIGN KEY (id) REFERENCES public.nodes_hierarchy(id) ON DELETE CASCADE;


--
-- TOC entry 4070 (class 2606 OID 21611)
-- Name: req_specs_revisions req_specs_revisions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_specs_revisions
    ADD CONSTRAINT req_specs_revisions_id_fkey FOREIGN KEY (id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 4071 (class 2606 OID 21606)
-- Name: req_specs_revisions req_specs_revisions_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_specs_revisions
    ADD CONSTRAINT req_specs_revisions_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.req_specs(id) ON DELETE CASCADE;


--
-- TOC entry 4031 (class 2606 OID 21187)
-- Name: req_specs req_specs_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_specs
    ADD CONSTRAINT req_specs_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4034 (class 2606 OID 21228)
-- Name: req_versions req_versions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.req_versions
    ADD CONSTRAINT req_versions_id_fkey FOREIGN KEY (id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 4032 (class 2606 OID 21201)
-- Name: requirements requirements_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_id_fkey FOREIGN KEY (id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 4033 (class 2606 OID 21206)
-- Name: requirements requirements_srs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_srs_id_fkey FOREIGN KEY (srs_id) REFERENCES public.req_specs(id) ON DELETE CASCADE;


--
-- TOC entry 4039 (class 2606 OID 21293)
-- Name: risk_assignments risk_assignments_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.risk_assignments
    ADD CONSTRAINT risk_assignments_node_id_fkey FOREIGN KEY (node_id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 4040 (class 2606 OID 21288)
-- Name: risk_assignments risk_assignments_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.risk_assignments
    ADD CONSTRAINT risk_assignments_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES public.testplans(id) ON DELETE CASCADE;


--
-- TOC entry 4041 (class 2606 OID 21311)
-- Name: role_rights role_rights_right_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.role_rights
    ADD CONSTRAINT role_rights_right_id_fkey FOREIGN KEY (right_id) REFERENCES public.rights(id) ON DELETE CASCADE;


--
-- TOC entry 4042 (class 2606 OID 21306)
-- Name: role_rights role_rights_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.role_rights
    ADD CONSTRAINT role_rights_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 4000 (class 2606 OID 20731)
-- Name: tcsteps tcsteps_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.tcsteps
    ADD CONSTRAINT tcsteps_id_fkey FOREIGN KEY (id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 3997 (class 2606 OID 20710)
-- Name: tcversions tcversions_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.tcversions
    ADD CONSTRAINT tcversions_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- TOC entry 3998 (class 2606 OID 20705)
-- Name: tcversions tcversions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.tcversions
    ADD CONSTRAINT tcversions_id_fkey FOREIGN KEY (id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 3999 (class 2606 OID 20715)
-- Name: tcversions tcversions_updater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.tcversions
    ADD CONSTRAINT tcversions_updater_id_fkey FOREIGN KEY (updater_id) REFERENCES public.users(id);


--
-- TOC entry 4043 (class 2606 OID 21336)
-- Name: testcase_keywords testcase_keywords_keyword_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_keywords
    ADD CONSTRAINT testcase_keywords_keyword_id_fkey FOREIGN KEY (keyword_id) REFERENCES public.keywords(id) ON DELETE CASCADE;


--
-- TOC entry 4044 (class 2606 OID 21331)
-- Name: testcase_keywords testcase_keywords_tcversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_keywords
    ADD CONSTRAINT testcase_keywords_tcversion_id_fkey FOREIGN KEY (tcversion_id) REFERENCES public.tcversions(id);


--
-- TOC entry 4045 (class 2606 OID 21326)
-- Name: testcase_keywords testcase_keywords_testcase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_keywords
    ADD CONSTRAINT testcase_keywords_testcase_id_fkey FOREIGN KEY (testcase_id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 4089 (class 2606 OID 21826)
-- Name: testcase_platforms testcase_platforms_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_platforms
    ADD CONSTRAINT testcase_platforms_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platforms(id) ON DELETE CASCADE;


--
-- TOC entry 4090 (class 2606 OID 21821)
-- Name: testcase_platforms testcase_platforms_tcversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_platforms
    ADD CONSTRAINT testcase_platforms_tcversion_id_fkey FOREIGN KEY (tcversion_id) REFERENCES public.tcversions(id);


--
-- TOC entry 4091 (class 2606 OID 21816)
-- Name: testcase_platforms testcase_platforms_testcase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_platforms
    ADD CONSTRAINT testcase_platforms_testcase_id_fkey FOREIGN KEY (testcase_id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 4078 (class 2606 OID 21716)
-- Name: testcase_relations testcase_relations_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_relations
    ADD CONSTRAINT testcase_relations_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- TOC entry 4079 (class 2606 OID 21711)
-- Name: testcase_relations testcase_relations_destination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_relations
    ADD CONSTRAINT testcase_relations_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.nodes_hierarchy(id) ON DELETE CASCADE;


--
-- TOC entry 4080 (class 2606 OID 21706)
-- Name: testcase_relations testcase_relations_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_relations
    ADD CONSTRAINT testcase_relations_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.nodes_hierarchy(id) ON DELETE CASCADE;


--
-- TOC entry 4026 (class 2606 OID 21116)
-- Name: testcase_script_links testcase_script_links_tcversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testcase_script_links
    ADD CONSTRAINT testcase_script_links_tcversion_id_fkey FOREIGN KEY (tcversion_id) REFERENCES public.tcversions(id) ON DELETE CASCADE;


--
-- TOC entry 4062 (class 2606 OID 21509)
-- Name: testplan_platforms testplan_platforms_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testplan_platforms
    ADD CONSTRAINT testplan_platforms_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES public.testplans(id) ON DELETE CASCADE;


--
-- TOC entry 4010 (class 2606 OID 20878)
-- Name: testplan_tcversions testplan_tcversions_tcversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testplan_tcversions
    ADD CONSTRAINT testplan_tcversions_tcversion_id_fkey FOREIGN KEY (tcversion_id) REFERENCES public.tcversions(id);


--
-- TOC entry 4011 (class 2606 OID 20873)
-- Name: testplan_tcversions testplan_tcversions_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testplan_tcversions
    ADD CONSTRAINT testplan_tcversions_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES public.testplans(id);


--
-- TOC entry 4001 (class 2606 OID 20749)
-- Name: testplans testplans_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testplans
    ADD CONSTRAINT testplans_id_fkey FOREIGN KEY (id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 4087 (class 2606 OID 21801)
-- Name: testproject_codetracker testproject_codetracker_codetracker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testproject_codetracker
    ADD CONSTRAINT testproject_codetracker_codetracker_id_fkey FOREIGN KEY (codetracker_id) REFERENCES public.codetrackers(id) ON DELETE CASCADE;


--
-- TOC entry 4088 (class 2606 OID 21796)
-- Name: testproject_codetracker testproject_codetracker_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testproject_codetracker
    ADD CONSTRAINT testproject_codetracker_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4072 (class 2606 OID 21640)
-- Name: testproject_issuetracker testproject_issuetracker_issuetracker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testproject_issuetracker
    ADD CONSTRAINT testproject_issuetracker_issuetracker_id_fkey FOREIGN KEY (issuetracker_id) REFERENCES public.issuetrackers(id) ON DELETE CASCADE;


--
-- TOC entry 4073 (class 2606 OID 21635)
-- Name: testproject_issuetracker testproject_issuetracker_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testproject_issuetracker
    ADD CONSTRAINT testproject_issuetracker_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4074 (class 2606 OID 21668)
-- Name: testproject_reqmgrsystem testproject_reqmgrsystem_reqmgrsystem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testproject_reqmgrsystem
    ADD CONSTRAINT testproject_reqmgrsystem_reqmgrsystem_id_fkey FOREIGN KEY (reqmgrsystem_id) REFERENCES public.reqmgrsystems(id) ON DELETE CASCADE;


--
-- TOC entry 4075 (class 2606 OID 21663)
-- Name: testproject_reqmgrsystem testproject_reqmgrsystem_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testproject_reqmgrsystem
    ADD CONSTRAINT testproject_reqmgrsystem_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4012 (class 2606 OID 20927)
-- Name: testprojects testprojects_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testprojects
    ADD CONSTRAINT testprojects_id_fkey FOREIGN KEY (id) REFERENCES public.nodes_hierarchy(id) ON DELETE CASCADE;


--
-- TOC entry 4046 (class 2606 OID 21351)
-- Name: testsuites testsuites_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.testsuites
    ADD CONSTRAINT testsuites_id_fkey FOREIGN KEY (id) REFERENCES public.nodes_hierarchy(id);


--
-- TOC entry 4056 (class 2606 OID 21441)
-- Name: text_templates text_templates_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.text_templates
    ADD CONSTRAINT text_templates_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- TOC entry 4047 (class 2606 OID 21378)
-- Name: user_assignments user_assignments_assigner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_assignments
    ADD CONSTRAINT user_assignments_assigner_id_fkey FOREIGN KEY (assigner_id) REFERENCES public.users(id);


--
-- TOC entry 4048 (class 2606 OID 21373)
-- Name: user_assignments user_assignments_build_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_assignments
    ADD CONSTRAINT user_assignments_build_id_fkey FOREIGN KEY (build_id) REFERENCES public.builds(id) ON DELETE CASCADE;


--
-- TOC entry 4049 (class 2606 OID 21368)
-- Name: user_assignments user_assignments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_assignments
    ADD CONSTRAINT user_assignments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4059 (class 2606 OID 21475)
-- Name: user_group_assign user_group_assign_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_group_assign
    ADD CONSTRAINT user_group_assign_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4060 (class 2606 OID 21470)
-- Name: user_group_assign user_group_assign_usergroup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_group_assign
    ADD CONSTRAINT user_group_assign_usergroup_id_fkey FOREIGN KEY (usergroup_id) REFERENCES public.user_group(id);


--
-- TOC entry 4057 (class 2606 OID 21456)
-- Name: user_group user_group_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- TOC entry 4058 (class 2606 OID 21461)
-- Name: user_group user_group_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT user_group_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4050 (class 2606 OID 21402)
-- Name: user_testplan_roles user_testplan_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_testplan_roles
    ADD CONSTRAINT user_testplan_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 4051 (class 2606 OID 21397)
-- Name: user_testplan_roles user_testplan_roles_testplan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_testplan_roles
    ADD CONSTRAINT user_testplan_roles_testplan_id_fkey FOREIGN KEY (testplan_id) REFERENCES public.testplans(id) ON DELETE CASCADE;


--
-- TOC entry 4052 (class 2606 OID 21392)
-- Name: user_testplan_roles user_testplan_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_testplan_roles
    ADD CONSTRAINT user_testplan_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4053 (class 2606 OID 21425)
-- Name: user_testproject_roles user_testproject_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_testproject_roles
    ADD CONSTRAINT user_testproject_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 4054 (class 2606 OID 21420)
-- Name: user_testproject_roles user_testproject_roles_testproject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_testproject_roles
    ADD CONSTRAINT user_testproject_roles_testproject_id_fkey FOREIGN KEY (testproject_id) REFERENCES public.testprojects(id) ON DELETE CASCADE;


--
-- TOC entry 4055 (class 2606 OID 21415)
-- Name: user_testproject_roles user_testproject_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.user_testproject_roles
    ADD CONSTRAINT user_testproject_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3996 (class 2606 OID 20682)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: *
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: *
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2023-04-17 15:45:04

--
-- PostgreSQL database dump complete
--
