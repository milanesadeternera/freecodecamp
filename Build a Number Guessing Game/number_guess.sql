--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 5);
INSERT INTO public.games VALUES (1, 10);
INSERT INTO public.games VALUES (2, 3);
INSERT INTO public.games VALUES (1, 6);
INSERT INTO public.games VALUES (4, 2);
INSERT INTO public.games VALUES (5, 532);
INSERT INTO public.games VALUES (5, 108);
INSERT INTO public.games VALUES (6, 314);
INSERT INTO public.games VALUES (6, 404);
INSERT INTO public.games VALUES (5, 470);
INSERT INTO public.games VALUES (5, 828);
INSERT INTO public.games VALUES (5, 516);
INSERT INTO public.games VALUES (7, 743);
INSERT INTO public.games VALUES (7, 692);
INSERT INTO public.games VALUES (8, 823);
INSERT INTO public.games VALUES (8, 414);
INSERT INTO public.games VALUES (7, 457);
INSERT INTO public.games VALUES (7, 868);
INSERT INTO public.games VALUES (7, 333);
INSERT INTO public.games VALUES (1, 1);
INSERT INTO public.games VALUES (1, 0);
INSERT INTO public.games VALUES (9, 236);
INSERT INTO public.games VALUES (9, 321);
INSERT INTO public.games VALUES (10, 862);
INSERT INTO public.games VALUES (10, 101);
INSERT INTO public.games VALUES (9, 367);
INSERT INTO public.games VALUES (9, 821);
INSERT INTO public.games VALUES (9, 535);
INSERT INTO public.games VALUES (11, 598);
INSERT INTO public.games VALUES (11, 701);
INSERT INTO public.games VALUES (12, 175);
INSERT INTO public.games VALUES (12, 655);
INSERT INTO public.games VALUES (11, 876);
INSERT INTO public.games VALUES (11, 865);
INSERT INTO public.games VALUES (11, 202);
INSERT INTO public.games VALUES (1, 1);
INSERT INTO public.games VALUES (13, 757);
INSERT INTO public.games VALUES (13, 982);
INSERT INTO public.games VALUES (14, 496);
INSERT INTO public.games VALUES (14, 636);
INSERT INTO public.games VALUES (13, 424);
INSERT INTO public.games VALUES (13, 766);
INSERT INTO public.games VALUES (13, 697);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'coco');
INSERT INTO public.users VALUES (2, 'a');
INSERT INTO public.users VALUES (3, 'b');
INSERT INTO public.users VALUES (4, 'coco2');
INSERT INTO public.users VALUES (5, 'user_1654871425982');
INSERT INTO public.users VALUES (6, 'user_1654871425981');
INSERT INTO public.users VALUES (7, 'user_1654871768271');
INSERT INTO public.users VALUES (8, 'user_1654871768270');
INSERT INTO public.users VALUES (9, 'user_1654871954206');
INSERT INTO public.users VALUES (10, 'user_1654871954205');
INSERT INTO public.users VALUES (11, 'user_1654872045590');
INSERT INTO public.users VALUES (12, 'user_1654872045589');
INSERT INTO public.users VALUES (13, 'user_1654872184588');
INSERT INTO public.users VALUES (14, 'user_1654872184587');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

