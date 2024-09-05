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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    composition text,
    is_near_earth boolean NOT NULL,
    orbit_period numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age numeric NOT NULL,
    is_spiral boolean NOT NULL,
    distance numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    type character varying,
    has_water boolean,
    diameter integer,
    orbit_period numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    type character varying,
    has_life boolean,
    radius integer,
    orbit_distance numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(30),
    mass numeric,
    is_main_sequence boolean,
    temperature integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Dwarf Planet', 'Rock/Ice', false, 4.6);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Asteroid', 'Rock', false, 3.63);
INSERT INTO public.asteroid VALUES (3, 'Pallas', ' Asteroid', 'Rock', false, 4.62);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'Asteroid', 'Rock/Ice', false, 5.56);
INSERT INTO public.asteroid VALUES (5, 'Eros', 'Near-Earth', 'Rock', true, 1.76);
INSERT INTO public.asteroid VALUES (6, 'Itokawa', 'Near-Earth', 'Rock', true, 1.52);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home galaxy', 13.51, true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Neighbor galaxy', 10, true, 2.537);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy', 10, true, 3);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interactin galaxy', 0.5, true, 23);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Hat-shaped galaxy', 13, false, 31);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Dust lane galaxy', 13, true, 17.09);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Terrestrial', true, 3474, 27.3);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Asteroid', false, 22, 0.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Asteroid', false, 12, 1.3);
INSERT INTO public.moon VALUES (4, 'Europa', 3, ' Ice Moon', true, 3121, 3.5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 'Ice Moon', true, 5268, 3.5);
INSERT INTO public.moon VALUES (6, 'Calliso', 3, 'Ice Moon', true, 4820, 16.7);
INSERT INTO public.moon VALUES (7, 'Io', 3, 'Volcanic Moon', false, 3642, 1.8);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 'Ice Moon', true, 5150, 15.9);
INSERT INTO public.moon VALUES (9, 'Iapetus', 4, 'Ice Moon', false, 1470, 79.3);
INSERT INTO public.moon VALUES (10, 'Oberon', 5, ' Ice Moon', true, 1523, 13.5);
INSERT INTO public.moon VALUES (11, 'Titania', 5, 'Ice Moon', true, 1578, 8.7);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 'Ice Moon', true, 1528, 4.5);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 'Ice Moon', true, 504, 1.4);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 'Ice Moon', true, 1123, 2.7);
INSERT INTO public.moon VALUES (15, 'Tethys', 7, 'Ice Moon', true, 1062, 1.9);
INSERT INTO public.moon VALUES (16, 'Triton', 6, 'Ice Moon', true, 2707, 5.9);
INSERT INTO public.moon VALUES (17, 'Charon', 6, 'Ice Moon', true, 1213, 6.4);
INSERT INTO public.moon VALUES (18, 'Miranda', 5, 'Ice Moon', true, 473, 1.41);
INSERT INTO public.moon VALUES (19, 'Ariel', 5, ' Ice Moon', true, 1158, 2.52);
INSERT INTO public.moon VALUES (20, 'Umbriel', 5, 'Ice Moon', true, 1169, 4.14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', true, 6371, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', false, 3389, 1.52);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', false, 69911, 5.2);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', false, 58232, 9.58);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 'Ice Giant', false, 25362, 19.22);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 'Ice Giant', false, 24622, 30.07);
INSERT INTO public.planet VALUES (7, 'Mercury', 2, 'Terrestrial', false, 2440, 0.39);
INSERT INTO public.planet VALUES (8, 'Venus', 2, 'Terrestrial', false, 6052, 0.72);
INSERT INTO public.planet VALUES (9, 'Kepler-452b0', 3, 'Super-Earth', false, 9100, 1.05);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 3, 'Super-Earth', false, 16000, 0.13);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 3, 'Terrestrial', false, 7150, 0.0485);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bb', 3, 'Terrestrial', false, 5800, 0.04);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1, true, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 'A1V', 2.02, true, 9940);
INSERT INTO public.star VALUES (3, 'Proxima', 3, 'M5.5Ve', 0.12, true, 3042);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 4, 'M1-2la-lab', 20, false, 3500);
INSERT INTO public.star VALUES (5, 'Rigel', 5, 'B8lae', 21, false, 12100);
INSERT INTO public.star VALUES (6, 'Vega', 6, 'A0V', 2.1, true, 9600);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

