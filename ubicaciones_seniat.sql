--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.26
-- Dumped by pg_dump version 9.4.26
-- Started on 2024-04-11 12:22:23 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 112717)
-- Name: t_ubicacion_seniat; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.t_ubicacion_seniat (
    id bigint,
    nombre character varying(100),
    idpadre bigint,
    idserie character varying(100)
);


--
-- TOC entry 2056 (class 0 OID 112717)
-- Dependencies: 196
-- Data for Name: t_ubicacion_seniat; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (1, 'REGIÓN CAPITAL', 0, '001');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (2, 'REGIÓN CENTRAL', 0, '002');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (3, 'REGIÓN CENTRO-OCCIDENTAL', 0, '003');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (4, 'REGIÓN GUAYANA', 0, '004');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (5, 'REGIÓN INSULAR', 0, '005');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (6, 'REGIÓN LOS ANDES', 0, '006');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (7, 'REGIÓN LOS LLANOS', 0, '007');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (8, 'REGIÓN NOR–ORIENTAL', 0, '008');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (9, 'REGIÓN ZULIANA', 0, '009');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (10, 'DISTRITO CAPITAL', 1, '001010');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (11, 'MIRANDA', 1, '001011');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (12, 'ARAGUA', 2, '002012');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (13, 'CARABOBO', 2, '002013');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (14, 'COJEDES', 2, '002014');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (15, 'FALCON', 3, '003015');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (16, 'LARA', 3, '003016');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (17, 'PORTUGUESA', 3, '003017');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (18, 'YARACUY', 3, '003018');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (19, 'AMAZONAS', 4, '004019');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (20, 'BOLIVAR', 4, '004020');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (21, 'DELTA AMACURO', 4, '004021');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (22, 'NUEVA ESPARTA', 5, '005022');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (23, 'BARINAS', 6, '006023');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (24, 'MERIDA', 6, '006024');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (25, 'TACHIRA', 6, '006025');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (26, 'TRUJILLO', 6, '006026');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (27, 'APURE', 7, '007027');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (28, 'GUARICO', 7, '007028');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (29, 'ANZOATEGUI', 8, '008029');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (30, 'MONAGAS', 8, '008030');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (31, 'SUCRE', 8, '008031');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (32, 'ZULIA', 9, '009032');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (33, 'Sector Libertador', 10, '001010033');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (34, 'Sector Altos Mirandinos', 11, '001011034');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (35, 'Sector Higuerote', 11, '001011035');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (36, 'Sector Guarenas – Guatire', 11, '001011036');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (37, 'Sector La Guaira', 11, '001011037');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (38, 'Sector Valles del Tuy', 11, '001011038');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (39, 'Sector Baruta', 11, '001011039');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (40, 'Sector Cagua', 12, '002012040');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (41, 'Sector Maracay', 12, '002012041');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (42, 'Unidad La Victoria', 12, '002012042');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (43, 'Unidad Bejuma', 13, '002013043');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (44, 'Unidad Puerto Cabello', 13, '002013044');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (45, 'Unidad San Carlos', 14, '002014045');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (46, 'Sector Coro', 15, '003015046');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (47, 'Sector Punto Fijo', 15, '003015047');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (48, 'Sector Tucacas', 15, '003015048');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (49, 'Unidad Churuguara', 15, '003015049');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (50, 'Sector Carora', 16, '003016050');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (51, 'Sector Quibor', 16, '003016051');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (52, 'Sector de Cabudare', 16, '003016052');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (53, 'Unidad El Tocuyo', 16, '003016053');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (54, 'Sector de Acarigua', 17, '003017054');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (55, 'Unidad Guanare', 17, '003017055');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (56, 'Sector San Felipe', 18, '003018056');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (57, 'Unidad Chivacoa', 18, '003018057');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (58, 'Unidad Nirgua', 18, '003018058');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (59, 'Sector Puerto Ayacucho', 19, '004019059');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (60, 'Sector Puerto Ordaz', 20, '004020060');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (61, 'Sector San Félix', 20, '004020061');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (62, 'Unidad Caicara del Orinoco', 20, '004020062');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (63, 'Unidad del Callao', 20, '004020063');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (64, 'Unidad Upata', 20, '004020064');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (65, 'Unidad de Santa Elena de Uairén', 20, '004020065');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (66, 'Sector Tucupita', 21, '004021066');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (67, 'Sector Barinas', 23, '006023067');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (68, 'Sector Socopó', 23, '006023068');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (69, 'Unidad Sabaneta', 23, '006023069');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (70, 'Sector El Vigía', 24, '006024070');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (71, 'Sector Mérida', 24, '006024071');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (72, 'Sector La Fría', 25, '006025072');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (73, 'Unidad La Grita', 25, '006025073');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (74, 'Sector San Antonio del Táchira', 25, '006025074');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (75, 'Unidad Ureña', 25, '006025075');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (76, 'Sector Valera - Trujillo', 26, '006026076');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (77, 'Unidad Boconó', 26, '006026077');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (78, 'Unidad Trujillo', 26, '006026078');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (79, 'Unidad Guasdualito', 27, '007027079');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (80, 'Sector San Fernando de Apure', 27, '007027080');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (81, 'Sector San Juan de Los Morros', 28, '007028081');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (82, 'Sector Valle de La Pascua', 28, '007028082');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (83, 'Unidad Altagracia de Orituco', 28, '007028083');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (84, 'Sector El Tigre', 29, '008029084');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (85, 'Sector Anaco', 29, '008029085');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (86, 'Sector Maturín', 30, '008030086');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (87, 'Unidad Punta de Mata', 30, '008030087');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (88, 'Sector Carúpano', 31, '008031088');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (89, 'Sector Cumaná', 31, '008031089');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (90, 'Sector Ciudad Ojeda', 32, '009032090');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (91, 'Unidad de Cabimas', 32, '009032091');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (92, 'Unidad de Machiques', 32, '009032092');
INSERT INTO public.t_ubicacion_seniat (id, nombre, idpadre, idserie) VALUES (93, 'Unidad de Santa Bárbara', 32, '009032093');


-- Completed on 2024-04-11 12:22:23 -04

--
-- PostgreSQL database dump complete
--

