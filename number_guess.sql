--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_name character varying(22) NOT NULL,
    game_played integer,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('user_1720413103255', 2, 311);
INSERT INTO public.players VALUES ('user_1720413103256', 4, 257);
INSERT INTO public.players VALUES ('user_1720413159515', 2, 261);
INSERT INTO public.players VALUES ('user_1720413159516', 4, 236);
INSERT INTO public.players VALUES ('user_1720413237241', 2, 279);
INSERT INTO public.players VALUES ('user_1720413237242', 4, 184);
INSERT INTO public.players VALUES ('Rosie', 4, 1);
INSERT INTO public.players VALUES ('user_1720413485719', 2, 117);
INSERT INTO public.players VALUES ('user_1720413485720', 4, 540);
INSERT INTO public.players VALUES ('user_1720413525985', 2, 700);
INSERT INTO public.players VALUES ('user_1720413525986', 4, 155);


--
-- PostgreSQL database dump complete
--

