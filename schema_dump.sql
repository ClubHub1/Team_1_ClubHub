--
-- PostgreSQL database dump
--

\restrict l76NtBfy9cPPTZy32NFaV2VlZ1NBwAD5du2zvaygz42gpfFupHUUp0wehlAoo08

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: private; Type: SCHEMA; Schema: -; Owner: chadmin
--

CREATE SCHEMA private;


ALTER SCHEMA private OWNER TO chadmin;

--
-- Name: attendance_status; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.attendance_status AS ENUM (
    'Present',
    'Absent'
);


ALTER TYPE public.attendance_status OWNER TO chadmin;

--
-- Name: club_status; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.club_status AS ENUM (
    'Active',
    'Inactive'
);


ALTER TYPE public.club_status OWNER TO chadmin;

--
-- Name: task_priority; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.task_priority AS ENUM (
    'Low',
    'Medium',
    'High'
);


ALTER TYPE public.task_priority OWNER TO chadmin;

--
-- Name: task_status; Type: TYPE; Schema: public; Owner: chadmin
--

CREATE TYPE public.task_status AS ENUM (
    'Not Started',
    'In Progress',
    'Complete'
);


ALTER TYPE public.task_status OWNER TO chadmin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Attendance; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Attendance" (
    attendance_id integer NOT NULL,
    event integer NOT NULL,
    "user" integer NOT NULL,
    status public.attendance_status NOT NULL,
    "time" timestamp with time zone
);


ALTER TABLE public."Attendance" OWNER TO chadmin;

--
-- Name: Attendance_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Attendance_attendance_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Attendance_attendance_id_seq" OWNER TO chadmin;

--
-- Name: Attendance_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Attendance_attendance_id_seq" OWNED BY public."Attendance".attendance_id;


--
-- Name: Attendance_event_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Attendance_event_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Attendance_event_seq" OWNER TO chadmin;

--
-- Name: Attendance_event_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Attendance_event_seq" OWNED BY public."Attendance".event;


--
-- Name: Attendance_user_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Attendance_user_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Attendance_user_seq" OWNER TO chadmin;

--
-- Name: Attendance_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Attendance_user_seq" OWNED BY public."Attendance"."user";


--
-- Name: Club; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Club" (
    club_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    activity_status public.club_status NOT NULL
);


ALTER TABLE public."Club" OWNER TO chadmin;

--
-- Name: Club Membership; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Club Membership" (
    membership_id integer NOT NULL,
    clubid integer NOT NULL,
    userid integer NOT NULL,
    role character varying(100),
    is_active boolean NOT NULL,
    dues_paid boolean NOT NULL
);


ALTER TABLE public."Club Membership" OWNER TO chadmin;

--
-- Name: Club Membership_clubid_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Club Membership_clubid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Club Membership_clubid_seq" OWNER TO chadmin;

--
-- Name: Club Membership_clubid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club Membership_clubid_seq" OWNED BY public."Club Membership".clubid;


--
-- Name: Club Membership_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Club Membership_membership_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Club Membership_membership_id_seq" OWNER TO chadmin;

--
-- Name: Club Membership_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club Membership_membership_id_seq" OWNED BY public."Club Membership".membership_id;


--
-- Name: Club Membership_userid_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Club Membership_userid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Club Membership_userid_seq" OWNER TO chadmin;

--
-- Name: Club Membership_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club Membership_userid_seq" OWNED BY public."Club Membership".userid;


--
-- Name: Club_club_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Club_club_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Club_club_id_seq" OWNER TO chadmin;

--
-- Name: Club_club_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Club_club_id_seq" OWNED BY public."Club".club_id;


--
-- Name: Event; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Event" (
    event_id integer NOT NULL,
    club integer NOT NULL,
    name character varying(255),
    description text,
    start_datetime timestamp with time zone,
    end_datetime timestamp with time zone,
    location character varying(255),
    created_at timestamp with time zone
);


ALTER TABLE public."Event" OWNER TO chadmin;

--
-- Name: Event_club_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Event_club_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Event_club_seq" OWNER TO chadmin;

--
-- Name: Event_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Event_club_seq" OWNED BY public."Event".club;


--
-- Name: Event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Event_event_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Event_event_id_seq" OWNER TO chadmin;

--
-- Name: Event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Event_event_id_seq" OWNED BY public."Event".event_id;


--
-- Name: File Resource; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."File Resource" (
    file_id integer NOT NULL,
    club integer NOT NULL,
    event integer NOT NULL,
    source_url text NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public."File Resource" OWNER TO chadmin;

--
-- Name: File Resource_club_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."File Resource_club_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."File Resource_club_seq" OWNER TO chadmin;

--
-- Name: File Resource_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."File Resource_club_seq" OWNED BY public."File Resource".club;


--
-- Name: File Resource_event_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."File Resource_event_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."File Resource_event_seq" OWNER TO chadmin;

--
-- Name: File Resource_event_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."File Resource_event_seq" OWNED BY public."File Resource".event;


--
-- Name: File Resource_file_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."File Resource_file_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."File Resource_file_id_seq" OWNER TO chadmin;

--
-- Name: File Resource_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."File Resource_file_id_seq" OWNED BY public."File Resource".file_id;


--
-- Name: Task; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Task" (
    task_id integer NOT NULL,
    club integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    due_date date NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    priority public.task_priority NOT NULL,
    status public.task_status NOT NULL
);


ALTER TABLE public."Task" OWNER TO chadmin;

--
-- Name: Task Assignment; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."Task Assignment" (
    assignment_id integer NOT NULL,
    task integer NOT NULL,
    "user" integer NOT NULL,
    assigned_at timestamp without time zone NOT NULL
);


ALTER TABLE public."Task Assignment" OWNER TO chadmin;

--
-- Name: Task Assignment_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Task Assignment_assignment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Task Assignment_assignment_id_seq" OWNER TO chadmin;

--
-- Name: Task Assignment_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task Assignment_assignment_id_seq" OWNED BY public."Task Assignment".assignment_id;


--
-- Name: Task Assignment_task_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Task Assignment_task_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Task Assignment_task_seq" OWNER TO chadmin;

--
-- Name: Task Assignment_task_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task Assignment_task_seq" OWNED BY public."Task Assignment".task;


--
-- Name: Task Assignment_user_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Task Assignment_user_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Task Assignment_user_seq" OWNER TO chadmin;

--
-- Name: Task Assignment_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task Assignment_user_seq" OWNED BY public."Task Assignment"."user";


--
-- Name: Task_club_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Task_club_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Task_club_seq" OWNER TO chadmin;

--
-- Name: Task_club_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task_club_seq" OWNED BY public."Task".club;


--
-- Name: Task_task_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Task_task_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Task_task_id_seq" OWNER TO chadmin;

--
-- Name: Task_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Task_task_id_seq" OWNED BY public."Task".task_id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: chadmin
--

CREATE TABLE public."User" (
    user_id integer CONSTRAINT "Users_user_id_not_null" NOT NULL,
    school_email character varying(255) CONSTRAINT "Users_school_email_not_null" NOT NULL,
    password character varying(255) CONSTRAINT "Users_password_not_null" NOT NULL,
    first_name character varying(100) CONSTRAINT "Users_first_name_not_null" NOT NULL,
    last_name character varying(100) CONSTRAINT "Users_last_name_not_null" NOT NULL,
    role character varying(50) CONSTRAINT "Users_role_not_null" NOT NULL,
    created_at timestamp with time zone CONSTRAINT "Users_created_at_not_null" NOT NULL
);


ALTER TABLE public."User" OWNER TO chadmin;

--
-- Name: Users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: chadmin
--

CREATE SEQUENCE public."Users_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_user_id_seq" OWNER TO chadmin;

--
-- Name: Users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chadmin
--

ALTER SEQUENCE public."Users_user_id_seq" OWNED BY public."User".user_id;


--
-- Name: Attendance attendance_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance" ALTER COLUMN attendance_id SET DEFAULT nextval('public."Attendance_attendance_id_seq"'::regclass);


--
-- Name: Attendance event; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance" ALTER COLUMN event SET DEFAULT nextval('public."Attendance_event_seq"'::regclass);


--
-- Name: Attendance user; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance" ALTER COLUMN "user" SET DEFAULT nextval('public."Attendance_user_seq"'::regclass);


--
-- Name: Club club_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club" ALTER COLUMN club_id SET DEFAULT nextval('public."Club_club_id_seq"'::regclass);


--
-- Name: Club Membership membership_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership" ALTER COLUMN membership_id SET DEFAULT nextval('public."Club Membership_membership_id_seq"'::regclass);


--
-- Name: Club Membership clubid; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership" ALTER COLUMN clubid SET DEFAULT nextval('public."Club Membership_clubid_seq"'::regclass);


--
-- Name: Club Membership userid; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership" ALTER COLUMN userid SET DEFAULT nextval('public."Club Membership_userid_seq"'::regclass);


--
-- Name: Event event_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event" ALTER COLUMN event_id SET DEFAULT nextval('public."Event_event_id_seq"'::regclass);


--
-- Name: Event club; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event" ALTER COLUMN club SET DEFAULT nextval('public."Event_club_seq"'::regclass);


--
-- Name: File Resource file_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource" ALTER COLUMN file_id SET DEFAULT nextval('public."File Resource_file_id_seq"'::regclass);


--
-- Name: File Resource club; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource" ALTER COLUMN club SET DEFAULT nextval('public."File Resource_club_seq"'::regclass);


--
-- Name: File Resource event; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource" ALTER COLUMN event SET DEFAULT nextval('public."File Resource_event_seq"'::regclass);


--
-- Name: Task task_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task" ALTER COLUMN task_id SET DEFAULT nextval('public."Task_task_id_seq"'::regclass);


--
-- Name: Task club; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task" ALTER COLUMN club SET DEFAULT nextval('public."Task_club_seq"'::regclass);


--
-- Name: Task Assignment assignment_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment" ALTER COLUMN assignment_id SET DEFAULT nextval('public."Task Assignment_assignment_id_seq"'::regclass);


--
-- Name: Task Assignment task; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment" ALTER COLUMN task SET DEFAULT nextval('public."Task Assignment_task_seq"'::regclass);


--
-- Name: Task Assignment user; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment" ALTER COLUMN "user" SET DEFAULT nextval('public."Task Assignment_user_seq"'::regclass);


--
-- Name: User user_id; Type: DEFAULT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User" ALTER COLUMN user_id SET DEFAULT nextval('public."Users_user_id_seq"'::regclass);


--
-- Name: Club Club_club_id_name_key; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club"
    ADD CONSTRAINT "Club_club_id_name_key" UNIQUE (club_id, name);


--
-- Name: Club Club_pkey; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club"
    ADD CONSTRAINT "Club_pkey" PRIMARY KEY (club_id);


--
-- Name: User Users_pkey; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);


--
-- Name: Task Assignment assignment_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment"
    ADD CONSTRAINT assignment_pk PRIMARY KEY (assignment_id);


--
-- Name: Attendance attendance_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT attendance_pk PRIMARY KEY (attendance_id);


--
-- Name: Club Membership cm_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT cm_pk PRIMARY KEY (membership_id);


--
-- Name: Club Membership cm_unique; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT cm_unique UNIQUE (membership_id, clubid, userid);


--
-- Name: Event event_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT event_pk PRIMARY KEY (event_id);


--
-- Name: File Resource file_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_pk PRIMARY KEY (file_id);


--
-- Name: File Resource file_uniq; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_uniq UNIQUE (file_id, source_url);


--
-- Name: User pass_unique; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT pass_unique UNIQUE (password);


--
-- Name: Task task_pk; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT task_pk PRIMARY KEY (task_id);


--
-- Name: Task task_uniq; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT task_uniq UNIQUE (task_id, club, title);


--
-- Name: User user_id_unique; Type: CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT user_id_unique UNIQUE (user_id);


--
-- Name: Task Assignment assignment_task_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment"
    ADD CONSTRAINT assignment_task_fk FOREIGN KEY (task) REFERENCES public."Task"(task_id);


--
-- Name: Task Assignment assignment_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task Assignment"
    ADD CONSTRAINT assignment_user_fk FOREIGN KEY ("user") REFERENCES public."User"(user_id);


--
-- Name: Attendance attendance_event_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT attendance_event_fk FOREIGN KEY (event) REFERENCES public."Event"(event_id);


--
-- Name: Attendance attendance_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT attendance_user_fk FOREIGN KEY ("user") REFERENCES public."User"(user_id);


--
-- Name: Club Membership club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT club_fk FOREIGN KEY (clubid) REFERENCES public."Club"(club_id);


--
-- Name: Event event_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT event_fk FOREIGN KEY (club) REFERENCES public."Club"(club_id);


--
-- Name: File Resource file_club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_club_fk FOREIGN KEY (club) REFERENCES public."Club"(club_id);


--
-- Name: File Resource file_event_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."File Resource"
    ADD CONSTRAINT file_event_fk FOREIGN KEY (event) REFERENCES public."Event"(event_id);


--
-- Name: Task task_club_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Task"
    ADD CONSTRAINT task_club_fk FOREIGN KEY (club) REFERENCES public."Club"(club_id);


--
-- Name: Club Membership user_fk; Type: FK CONSTRAINT; Schema: public; Owner: chadmin
--

ALTER TABLE ONLY public."Club Membership"
    ADD CONSTRAINT user_fk FOREIGN KEY (userid) REFERENCES public."User"(user_id);


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: private; Owner: chadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE chadmin IN SCHEMA private GRANT ALL ON TABLES TO chadmin;


--
-- PostgreSQL database dump complete
--

\unrestrict l76NtBfy9cPPTZy32NFaV2VlZ1NBwAD5du2zvaygz42gpfFupHUUp0wehlAoo08

