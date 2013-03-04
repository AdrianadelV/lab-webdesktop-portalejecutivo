--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.4
-- Dumped by pg_dump version 9.0.4
-- Started on 2013-03-03 19:52:11

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 318 (class 2612 OID 11574)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1514 (class 1259 OID 17205)
-- Dependencies: 5
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ciudad (
    id_ciudad integer NOT NULL,
    nombre character varying(255) NOT NULL,
    estado integer NOT NULL
);


ALTER TABLE public.ciudad OWNER TO postgres;

--
-- TOC entry 1511 (class 1259 OID 17194)
-- Dependencies: 5
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado (
    id_estado integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- TOC entry 1512 (class 1259 OID 17201)
-- Dependencies: 5
-- Name: idciudad; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idciudad
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idciudad OWNER TO postgres;

--
-- TOC entry 1827 (class 0 OID 0)
-- Dependencies: 1512
-- Name: idciudad; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('idciudad', 1, false);


--
-- TOC entry 1513 (class 1259 OID 17203)
-- Dependencies: 5
-- Name: idestado; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idestado
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idestado OWNER TO postgres;

--
-- TOC entry 1828 (class 0 OID 0)
-- Dependencies: 1513
-- Name: idestado; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('idestado', 1, false);


--
-- TOC entry 1516 (class 1259 OID 17224)
-- Dependencies: 5
-- Name: idrolusuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idrolusuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idrolusuario OWNER TO postgres;

--
-- TOC entry 1829 (class 0 OID 0)
-- Dependencies: 1516
-- Name: idrolusuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('idrolusuario', 1, false);


--
-- TOC entry 1510 (class 1259 OID 17184)
-- Dependencies: 5
-- Name: idusuarios; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idusuarios
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idusuarios OWNER TO postgres;

--
-- TOC entry 1830 (class 0 OID 0)
-- Dependencies: 1510
-- Name: idusuarios; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('idusuarios', 10, true);


--
-- TOC entry 1515 (class 1259 OID 17217)
-- Dependencies: 5
-- Name: rolusuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rolusuario (
    id_rol integer NOT NULL,
    estatus character(1) NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.rolusuario OWNER TO postgres;

--
-- TOC entry 1517 (class 1259 OID 17250)
-- Dependencies: 5
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    cedula character varying(10) NOT NULL,
    contrasena character varying(255) NOT NULL,
    direccion character varying(255),
    email character varying(255) NOT NULL,
    fecha_nacimiento date NOT NULL,
    nombre character varying(255) NOT NULL,
    nombre_login character varying(255) NOT NULL,
    sexo character(1) NOT NULL,
    telefono character varying(255),
    ciudad integer NOT NULL,
    rolusuario integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 1819 (class 0 OID 17205)
-- Dependencies: 1514
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ciudad VALUES (1, 'Barquisimeto', 2);
INSERT INTO ciudad VALUES (2, 'Valera', 1);
INSERT INTO ciudad VALUES (3, 'Valencia', 3);
INSERT INTO ciudad VALUES (4, 'Trujillo', 1);


--
-- TOC entry 1818 (class 0 OID 17194)
-- Dependencies: 1511
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estado VALUES (1, 'Trujillo');
INSERT INTO estado VALUES (2, 'Lara');
INSERT INTO estado VALUES (3, 'Carabobo');


--
-- TOC entry 1820 (class 0 OID 17217)
-- Dependencies: 1515
-- Data for Name: rolusuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rolusuario VALUES (1, 'A', 'Cliente Comprador');
INSERT INTO rolusuario VALUES (2, 'A', 'Concesionario');
INSERT INTO rolusuario VALUES (3, 'A', 'Ensambladora');
INSERT INTO rolusuario VALUES (4, 'A', 'Gobierno');


--
-- TOC entry 1821 (class 0 OID 17250)
-- Dependencies: 1517
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (7, '123', '1234', NULL, 'adriana@hotmail.com', '1991-06-01', 'adriana', 'adrianas', 'F', '4567', 1, 1);
INSERT INTO usuario VALUES (10, '12333', '1234', NULL, 'skate@hotmail.com', '1991-06-01', 'adriana', 'ElamT', 'F', '4567', 1, 1);


--
-- TOC entry 1800 (class 2606 OID 17211)
-- Dependencies: 1514 1514
-- Name: ciudad_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_nombre_key UNIQUE (nombre);


--
-- TOC entry 1802 (class 2606 OID 17209)
-- Dependencies: 1514 1514
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id_ciudad);


--
-- TOC entry 1796 (class 2606 OID 17200)
-- Dependencies: 1511 1511
-- Name: estado_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_nombre_key UNIQUE (nombre);


--
-- TOC entry 1798 (class 2606 OID 17198)
-- Dependencies: 1511 1511
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 1804 (class 2606 OID 17223)
-- Dependencies: 1515 1515
-- Name: rolusuario_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rolusuario
    ADD CONSTRAINT rolusuario_nombre_key UNIQUE (nombre);


--
-- TOC entry 1806 (class 2606 OID 17221)
-- Dependencies: 1515 1515
-- Name: rolusuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rolusuario
    ADD CONSTRAINT rolusuario_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 1808 (class 2606 OID 17259)
-- Dependencies: 1517 1517
-- Name: usuario_cedula_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_cedula_key UNIQUE (cedula);


--
-- TOC entry 1810 (class 2606 OID 17261)
-- Dependencies: 1517 1517
-- Name: usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 1812 (class 2606 OID 17263)
-- Dependencies: 1517 1517
-- Name: usuario_nombre_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_nombre_login_key UNIQUE (nombre_login);


--
-- TOC entry 1814 (class 2606 OID 17257)
-- Dependencies: 1517 1517
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 1815 (class 2606 OID 17212)
-- Dependencies: 1511 1797 1514
-- Name: fkaeee1c58bdc9aef1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT fkaeee1c58bdc9aef1 FOREIGN KEY (estado) REFERENCES estado(id_estado);


--
-- TOC entry 1816 (class 2606 OID 17264)
-- Dependencies: 1801 1517 1514
-- Name: fkf814f32eb5dd74d5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fkf814f32eb5dd74d5 FOREIGN KEY (ciudad) REFERENCES ciudad(id_ciudad);


--
-- TOC entry 1817 (class 2606 OID 17269)
-- Dependencies: 1805 1515 1517
-- Name: fkf814f32edd2dfe83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fkf814f32edd2dfe83 FOREIGN KEY (rolusuario) REFERENCES rolusuario(id_rol);


--
-- TOC entry 1826 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-03-03 19:52:12

--
-- PostgreSQL database dump complete
--

