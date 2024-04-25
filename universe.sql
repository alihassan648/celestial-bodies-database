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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(8,2),
    distance_from_earth numeric(10,2) NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(8,2),
    planet_id integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL
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
    name character varying(60) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(8,2),
    distance_from_earth numeric(8,2),
    star_id integer NOT NULL
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
    name character varying(60) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(8,2),
    distance_from_earth numeric(8,2),
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy containing our solar system', true, true, 13000.00, 26000.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to the Milky Way', false, true, 22000.00, 2100000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy in the Local Group', false, true, 5000.00, 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting spiral galaxy with a visible companion', false, true, 40000.00, 32000000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral galaxy with a prominent bulge and a dust lane', false, true, 90000.00, 29000000.00);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy in the constellation Ursa Major', false, true, 22000.00, 2500000.00);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Elliptical', 'Galaxies with an approximately ellipsoidal shape, containing mainly older stars.');
INSERT INTO public.galaxy_types VALUES (2, 'Spiral', 'Galaxies with a spiral arm structure, containing both old and young stars.');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'Galaxies with irregular shapes, often the result of gravitational interactions with other galaxies or intergalactic gas.');
INSERT INTO public.galaxy_types VALUES (4, 'Lenticular', 'Galaxies with a disc and a central bulge but without spiral arms, resembling both elliptical and spiral galaxies in structure.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'The Earth''s only natural satellite', false, true, 4500.00, 3, 384400.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer of the two natural satellites of Mars', false, true, 4500.00, 4, 9378.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outermost of the two natural satellites of Mars', false, true, 4500.00, 4, 23460.00);
INSERT INTO public.moon VALUES (4, 'Io', 'The innermost and third-largest of the four Galilean moons of Jupiter', false, true, 4500.00, 5, 422000.00);
INSERT INTO public.moon VALUES (5, 'Europa', 'The smallest of the four Galilean moons orbiting Jupiter', false, true, 4500.00, 5, 671100.00);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon of Jupiter and in the Solar System', false, true, 4500.00, 5, 1070400.00);
INSERT INTO public.moon VALUES (7, 'Titan', 'The largest moon of Saturn and the second-largest natural satellite in the Solar System', false, true, 4500.00, 6, 1221860.00);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'The sixth-largest moon of Saturn', false, true, 4500.00, 6, 147940.00);
INSERT INTO public.moon VALUES (9, 'Triton', 'The seventh-largest moon of Neptune', false, true, 4500.00, 7, 354760.00);
INSERT INTO public.moon VALUES (10, 'Proteus', 'The second-largest Neptunian moon', false, true, 4500.00, 8, 117646.00);
INSERT INTO public.moon VALUES (11, 'Charon', 'The largest of the five known natural satellites of Pluto', false, true, 4500.00, 9, 19591.00);
INSERT INTO public.moon VALUES (12, 'Dione', 'The 15th largest moon in the Solar System', false, true, 4500.00, 6, 377400.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in our solar system', false, true, 4500.00, 77.30, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun, named after the Roman goddess of love and beauty', false, true, 4500.00, 38.20, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet, the only known planet to support life', true, true, 4500.00, 0.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Known as the Red Planet, it has a thin atmosphere and surface features reminiscent of both the impact craters of the Moon and the valleys, deserts, and polar ice caps of Earth.', false, true, 4500.00, 54.60, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our solar system, known for its Great Red Spot and numerous moons', false, true, 4500.00, 588.00, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its prominent ring system composed of ice particles and dust', false, true, 4500.00, 1200.00, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Seventh planet from the Sun, with a unique sideways rotation', false, true, 4500.00, 2610.00, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Eighth and farthest known planet from the Sun', false, true, 4500.00, 4380.00, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'The first Earth-sized exoplanet discovered within the habitable zone of another star', false, true, 1150.00, 492.00, 2);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 'One of the planets orbiting the ultracool dwarf star TRAPPIST-1', false, true, 1150.00, 39.00, 2);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'The first exoplanet to be discovered transiting its parent star', false, true, 745.00, 159.00, 3);
INSERT INTO public.planet VALUES (12, 'WASP-17b', 'A highly inflated hot Jupiter exoplanet', false, true, 745.00, 530.00, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system', true, true, 4600.00, 0.00, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', false, true, 230.00, 8.60, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'The closest star system to the Solar System', false, true, 6500.00, 4.37, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'A companion star to Alpha Centauri A', false, true, 6500.00, 4.37, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'The nearest known star to the Sun', false, true, 12000.00, 4.24, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'The brightest star in the constellation of Lyra', false, true, 455.00, 25.05, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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

