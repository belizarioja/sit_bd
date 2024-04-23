--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2024-01-10 17:17:41

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
-- TOC entry 214 (class 1259 OID 16399)
-- Name: t_bitacoras_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_bitacoras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: t_bitacoras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_bitacoras (
    id integer DEFAULT nextval('public.t_bitacoras_id_seq'::regclass) NOT NULL,
    idusuario bigint NOT NULL,
    observacion character varying(500),
    fecha timestamp without time zone,
    ip character varying(50),
    idevento numeric(2,0)
);


--
-- TOC entry 216 (class 1259 OID 16406)
-- Name: t_codigoscomercial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_codigoscomercial (
    id numeric(3,0) NOT NULL,
    codigocomercial character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 16409)
-- Name: t_eventos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_eventos (
    id numeric(2,0) NOT NULL,
    evento character varying(100) NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16412)
-- Name: t_formasdepago; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_formasdepago (
    id bigint NOT NULL,
    forma character varying(100) NOT NULL,
    valor double precision,
    idregistro bigint
);


--
-- TOC entry 219 (class 1259 OID 16415)
-- Name: t_formasdepago_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_formasdepago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 34242423445654646
    CACHE 1;


--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 219
-- Name: t_formasdepago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_formasdepago_id_seq OWNED BY public.t_formasdepago.id;


--
-- TOC entry 220 (class 1259 OID 16416)
-- Name: t_plantillacorreos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_plantillacorreos (
    id numeric(9,0) NOT NULL,
    banner character varying(20) NOT NULL,
    colorfondo1 character varying(20),
    colorfondo2 character varying(20),
    colorfuente1 character varying(20),
    colorfuente2 character varying(20),
    idserviciosmasivo bigint
);


--
-- TOC entry 221 (class 1259 OID 16419)
-- Name: t_plantillacorreos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_plantillacorreos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 221
-- Name: t_plantillacorreos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_plantillacorreos_id_seq OWNED BY public.t_plantillacorreos.id;


--
-- TOC entry 222 (class 1259 OID 16420)
-- Name: t_registro_detalles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_registro_detalles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 223 (class 1259 OID 16421)
-- Name: t_registro_detalles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_registro_detalles (
    id bigint DEFAULT nextval('public.t_registro_detalles_id_seq'::regclass) NOT NULL,
    idregistro bigint NOT NULL,
    codigo character varying(50),
    descripcion character varying(100) NOT NULL,
    precio double precision NOT NULL,
    cantidad double precision NOT NULL,
    tasa double precision NOT NULL,
    monto double precision NOT NULL,
    exento boolean,
    descuento double precision DEFAULT 0 NOT NULL,
    comentario character varying(2000)
);


--
-- TOC entry 224 (class 1259 OID 16428)
-- Name: t_registros; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_registros (
    id bigint NOT NULL,
    numerodocumento character varying(50) NOT NULL,
    idtipodocumento numeric(2,0) NOT NULL,
    idserviciosmasivo numeric(9,0) NOT NULL,
    trackingid character varying(50) NOT NULL,
    cedulacliente character varying(50) NOT NULL,
    nombrecliente character varying(100) NOT NULL,
    direccioncliente character varying(500),
    telefonocliente character varying(50),
    emailcliente character varying(500),
    subtotal double precision NOT NULL,
    total double precision NOT NULL,
    tasag double precision NOT NULL,
    baseg double precision NOT NULL,
    impuestog double precision NOT NULL,
    tasar double precision,
    baser double precision,
    impuestor double precision,
    tasaa double precision,
    basea double precision,
    mpuestoa double precision,
    tasaigtf double precision,
    baseigtf double precision,
    impuestoigtf double precision,
    fecha timestamp without time zone NOT NULL,
    exento double precision,
    estatus numeric(2,0),
    observacion character varying(500),
    relacionado character varying(50),
    fechaanulado timestamp without time zone,
    idtipocedulacliente numeric(2,0) DEFAULT 1 NOT NULL,
    sucursal character varying(100),
    numerointerno character varying(100),
    estatuscorreo numeric(2,0) DEFAULT 0,
    piedepagina character varying(1000),
    secuencial numeric(11,0),
    tasacambio double precision DEFAULT 0
);


--
-- TOC entry 225 (class 1259 OID 16435)
-- Name: t_registros_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_registros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 225
-- Name: t_registros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_registros_id_seq OWNED BY public.t_registros.id;


--
-- TOC entry 226 (class 1259 OID 16436)
-- Name: t_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_roles (
    id numeric(2,0) NOT NULL,
    rol character varying(50) NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 16439)
-- Name: t_serviciosdoc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_serviciosdoc (
    id bigint NOT NULL,
    idserviciosmasivo numeric(9,0),
    identificador numeric(2,0),
    corelativo numeric(10,0)
);


--
-- TOC entry 228 (class 1259 OID 16442)
-- Name: t_serviciosdoc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_serviciosdoc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 228
-- Name: t_serviciosdoc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_serviciosdoc_id_seq OWNED BY public.t_serviciosdoc.id;


--
-- TOC entry 229 (class 1259 OID 16443)
-- Name: t_serviciosmasivos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_serviciosmasivos (
    id bigint NOT NULL,
    rif character varying(50) NOT NULL,
    razonsocial character varying(100) NOT NULL,
    direccion character varying(500),
    email character varying(50),
    telefono character varying(50),
    tokenservicios character varying(2000),
    estatus numeric(2,0),
    enviocorreo numeric(2,0) DEFAULT 0,
    asignados numeric(11,0),
    sitioweb character varying(100),
    textoemail character varying(1000),
    banner character varying(20),
    validarinterno numeric(2,0) DEFAULT 0,
    idcodigocomercial numeric(3,0),
    emailbcc character varying(100)
);


--
-- TOC entry 230 (class 1259 OID 16450)
-- Name: t_serviciosmasivos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_serviciosmasivos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 230
-- Name: t_serviciosmasivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.t_serviciosmasivos_id_seq OWNED BY public.t_serviciosmasivos.id;


--
-- TOC entry 231 (class 1259 OID 16451)
-- Name: t_tipocedulacliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_tipocedulacliente (
    id numeric(2,0) NOT NULL,
    tipocedulacliente character varying(50) NOT NULL,
    abrev character varying(50) NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 16454)
-- Name: t_tipodocumentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_tipodocumentos (
    id numeric(2,0) NOT NULL,
    tipodocumento character varying(50) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 16457)
-- Name: t_tranzascorrelativo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_tranzascorrelativo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


--
-- TOC entry 234 (class 1259 OID 16458)
-- Name: t_tranzascorrelativo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_tranzascorrelativo (
    id bigint DEFAULT nextval('public.t_tranzascorrelativo_id_seq'::regclass) NOT NULL,
    idserviciosmasivo bigint NOT NULL,
    idusuario bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    cantidad numeric(11,0) NOT NULL,
    soportefactura character varying(50),
    fechaproduccion date,
    estatus numeric(2,0),
    inicia character varying(100),
    termina character varying(100),
    utilizado numeric(11,0) DEFAULT 0
);


--
-- TOC entry 235 (class 1259 OID 16463)
-- Name: t_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.t_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


--
-- TOC entry 236 (class 1259 OID 16464)
-- Name: t_usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t_usuarios (
    id bigint DEFAULT nextval('public.t_usuarios_id_seq'::regclass) NOT NULL,
    usuario character varying(50) NOT NULL,
    clave character varying(50) NOT NULL,
    nombre character varying(100) NOT NULL,
    idrol numeric(2,0) NOT NULL,
    feultacceso time without time zone,
    estatus numeric(2,0) NOT NULL,
    idserviciosmasivo bigint,
    emailbcc character varying(100)
);


--
-- TOC entry 3234 (class 2604 OID 16468)
-- Name: t_formasdepago id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_formasdepago ALTER COLUMN id SET DEFAULT nextval('public.t_formasdepago_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 16469)
-- Name: t_plantillacorreos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_plantillacorreos ALTER COLUMN id SET DEFAULT nextval('public.t_plantillacorreos_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16470)
-- Name: t_registros id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_registros ALTER COLUMN id SET DEFAULT nextval('public.t_registros_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16471)
-- Name: t_serviciosdoc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_serviciosdoc ALTER COLUMN id SET DEFAULT nextval('public.t_serviciosdoc_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 16472)
-- Name: t_serviciosmasivos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_serviciosmasivos ALTER COLUMN id SET DEFAULT nextval('public.t_serviciosmasivos_id_seq'::regclass);


--
-- TOC entry 3423 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: t_bitacoras; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_bitacoras VALUES (2608, 1, 'Acceso al sistema con éxito', '2023-05-16 10:37:05', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2609, 1, 'Acceso al sistema con éxito', '2023-05-16 14:13:47', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2610, 1, ' desde el 2023-05-16 hasta el 2023-05-16', '2023-05-16 14:14:04', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2611, 1, ' desde el 2023-05-16 hasta el 2023-05-16', '2023-05-16 14:32:25', '190.97.238.70', 3);
INSERT INTO public.t_bitacoras VALUES (2612, 1, ' desde el 2023-05-16 hasta el 2023-05-16', '2023-05-16 14:32:43', '190.97.238.70', 3);
INSERT INTO public.t_bitacoras VALUES (2613, 22, 'Acceso al sistema con éxito', '2023-05-16 14:35:54', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2614, 22, ' desde el 2023-05-16 hasta el 2023-05-16', '2023-05-16 14:35:55', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2615, 1, 'Acceso al sistema con éxito', '2023-05-16 14:36:50', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2616, 1, 'Acceso al sistema con éxito', '2023-05-23 20:27:05', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2617, 1, 'Acceso al sistema con éxito', '2023-05-23 21:59:03', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2618, 1, ' desde el 2023-05-23 hasta el 2023-05-23', '2023-05-23 22:07:35', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2619, 1, ' desde el 2023-05-04 hasta el 2023-05-23', '2023-05-23 22:07:39', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2620, 1, 'Acceso al sistema con éxito', '2023-06-01 19:00:27', '190.97.238.75', 1);
INSERT INTO public.t_bitacoras VALUES (2621, 1, ' desde el 2023-06-01 hasta el 2023-06-01', '2023-06-01 19:18:08', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2622, 1, 'Acceso al sistema con éxito', '2023-06-02 07:30:16', '190.97.238.70', 1);
INSERT INTO public.t_bitacoras VALUES (2623, 1, 'Acceso al sistema con éxito', '2023-06-02 12:53:02', '190.97.238.75', 1);
INSERT INTO public.t_bitacoras VALUES (2624, 1, 'Acceso al sistema con éxito', '2023-06-29 17:08:09', '190.97.238.76', 1);
INSERT INTO public.t_bitacoras VALUES (2625, 1, 'Acceso al sistema con éxito', '2023-06-29 20:17:12', '190.97.238.74', 1);
INSERT INTO public.t_bitacoras VALUES (2626, 1, ' desde el 2023-06-29 hasta el 2023-06-29', '2023-06-29 20:18:57', '190.97.238.76', 3);
INSERT INTO public.t_bitacoras VALUES (2627, 1, ', cliente emisor Intercable J-30240664-1 desde el 2023-06-29 hasta el 2023-06-29', '2023-06-29 20:19:29', '190.97.238.76', 3);
INSERT INTO public.t_bitacoras VALUES (2628, 1, 'Acceso al sistema con éxito', '2023-09-25 18:32:46', '190.97.238.72', 1);
INSERT INTO public.t_bitacoras VALUES (2629, 1, ' desde el 2023-09-25 hasta el 2023-09-25', '2023-09-25 18:32:56', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2630, 1, ' desde el 2023-09-25 hasta el 2023-09-25', '2023-09-25 18:34:51', '190.97.238.73', 4);
INSERT INTO public.t_bitacoras VALUES (2631, 1, ' desde el 2023-09-25 hasta el 2023-09-25', '2023-09-25 18:34:51', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2632, 1, 'Acceso al sistema con éxito', '2023-09-29 11:16:04', '190.97.238.66', 1);
INSERT INTO public.t_bitacoras VALUES (2633, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 12:31:17', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2634, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 12:39:58', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2667, 1, 'Acceso al sistema con éxito', '2023-09-29 16:26:39', '190.97.238.66', 1);
INSERT INTO public.t_bitacoras VALUES (2668, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 16:26:47', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2669, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 16:45:33', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2670, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 16:55:20', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2671, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 16:55:57', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2672, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 16:56:06', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2673, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 16:56:14', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2674, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 17:00:05', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2675, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 17:00:11', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2676, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 17:01:15', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2677, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 17:25:43', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2678, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 17:40:54', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2679, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 17:43:34', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2680, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 17:45:24', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2681, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 17:46:23', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2682, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - 0.126 segs.', '2023-09-29 17:49:36', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2683, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.148 segs.', '2023-09-29 17:49:49', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2684, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.169 segs.', '2023-09-29 17:50:06', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2685, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 17:50:55', '190.97.238.66', 4);
INSERT INTO public.t_bitacoras VALUES (2686, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.044 segs.', '2023-09-29 17:50:58', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2687, 1, ' desde el 2023-09-29 hasta el 2023-09-29', '2023-09-29 17:54:45', '190.97.238.66', 4);
INSERT INTO public.t_bitacoras VALUES (2688, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.087 segs.', '2023-09-29 17:57:43', '190.97.238.66', 4);
INSERT INTO public.t_bitacoras VALUES (2689, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.125 segs.', '2023-09-29 17:58:37', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2690, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración NaN segs.', '2023-09-29 17:58:39', '190.97.238.66', 7);
INSERT INTO public.t_bitacoras VALUES (2691, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.122 segs.', '2023-09-29 18:06:39', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2692, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.076 segs.', '2023-09-29 18:06:42', '190.97.238.66', 7);
INSERT INTO public.t_bitacoras VALUES (2693, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.023 segs.', '2023-09-29 18:06:57', '190.97.238.66', 4);
INSERT INTO public.t_bitacoras VALUES (2694, 1, 'Acceso al sistema con éxito', '2023-09-29 18:08:18', '190.97.238.72', 1);
INSERT INTO public.t_bitacoras VALUES (2695, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.023 segs.', '2023-09-29 18:08:26', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2696, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.069 segs.', '2023-09-29 18:08:35', '190.97.238.72', 4);
INSERT INTO public.t_bitacoras VALUES (2697, 1, 'Acceso al sistema con éxito', '2023-09-29 18:44:41', '190.97.238.72', 1);
INSERT INTO public.t_bitacoras VALUES (2698, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.106 segs.', '2023-09-29 18:45:30', '190.97.238.72', 4);
INSERT INTO public.t_bitacoras VALUES (2699, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.047 segs.', '2023-09-29 18:45:33', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2700, 1, ' desde el 2023-09-01 hasta el 2023-09-29 - Duración 0.053 segs.', '2023-09-29 18:45:37', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2701, 1, ', Factura desde el 2023-09-01 hasta el 2023-09-29 - Duración 0.046 segs.', '2023-09-29 18:45:45', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2702, 1, ', Factura, tipo de impuesto Exento desde el 2023-09-01 hasta el 2023-09-29 - Duración 0.042 segs.', '2023-09-29 18:45:50', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2703, 1, ', Factura, tipo de impuesto Impuesto IVA desde el 2023-09-01 hasta el 2023-09-29 - Duración 0.041 segs.', '2023-09-29 18:45:52', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2704, 1, ', Factura, tipo de impuesto Todos desde el 2023-09-01 hasta el 2023-09-29 - Duración 0.044 segs.', '2023-09-29 18:45:54', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2705, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.104 segs.', '2023-09-29 18:46:57', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2706, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.02 segs.', '2023-09-29 18:46:59', '190.97.238.72', 4);
INSERT INTO public.t_bitacoras VALUES (2707, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.039 segs.', '2023-09-29 18:47:01', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2708, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.037 segs.', '2023-09-29 18:47:08', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2709, 1, ', Guía de despacho desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.027 segs.', '2023-09-29 18:47:12', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2710, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.11 segs.', '2023-09-29 18:50:06', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2711, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.086 segs.', '2023-09-29 18:50:18', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2712, 1, ' desde el 2023-09-29 hasta el 2023-09-29 - Duración 0.041 segs.', '2023-09-29 18:50:47', '190.97.238.66', 3);
INSERT INTO public.t_bitacoras VALUES (2713, 1, 'Acceso al sistema con éxito', '2023-10-05 17:34:16', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2714, 1, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.118 segs.', '2023-10-05 17:34:38', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2715, 1, ' desde el 2023-10-01 hasta el 2023-10-05 - Duración 0.013 segs.', '2023-10-05 17:34:41', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2716, 1, ' desde el 2023-09-01 hasta el 2023-10-05 - Duración 0.039 segs.', '2023-10-05 17:34:46', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2717, 1, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.104 segs.', '2023-10-05 17:36:24', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2718, 1, ' desde el 2023-09-01 hasta el 2023-10-05 - Duración 0.04 segs.', '2023-10-05 17:36:30', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2719, 1, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.236 segs.', '2023-10-05 18:03:24', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2720, 1, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.186 segs.', '2023-10-05 18:04:24', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2721, 1, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.118 segs.', '2023-10-05 18:04:33', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2722, 1, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.118 segs.', '2023-10-05 18:04:53', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2723, 1, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.189 segs.', '2023-10-05 18:05:16', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2724, 1, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.096 segs.', '2023-10-05 18:05:29', '190.97.238.72', 4);
INSERT INTO public.t_bitacoras VALUES (2725, 1, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.111 segs.', '2023-10-05 18:05:42', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2726, 1, 'Acceso al sistema con éxito', '2023-10-05 18:12:48', '190.97.238.72', 1);
INSERT INTO public.t_bitacoras VALUES (2727, 22, 'Acceso al sistema con éxito', '2023-10-05 18:13:11', '190.97.238.72', 1);
INSERT INTO public.t_bitacoras VALUES (2728, 22, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.182 segs.', '2023-10-05 18:13:11', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2729, 22, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.02 segs.', '2023-10-05 18:13:17', '190.97.238.72', 4);
INSERT INTO public.t_bitacoras VALUES (2730, 22, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.1 segs.', '2023-10-05 18:13:19', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2731, 22, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.092 segs.', '2023-10-05 18:13:32', '190.97.238.72', 4);
INSERT INTO public.t_bitacoras VALUES (2732, 22, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.101 segs.', '2023-10-05 18:15:04', '190.97.238.72', 4);
INSERT INTO public.t_bitacoras VALUES (2733, 22, ' desde el 2023-10-05 hasta el 2023-10-05 - Duración 0.054 segs.', '2023-10-05 18:15:06', '190.97.238.72', 4);
INSERT INTO public.t_bitacoras VALUES (2734, 1, 'Acceso al sistema con éxito', '2023-10-12 10:09:36', '190.97.238.72', 1);
INSERT INTO public.t_bitacoras VALUES (2735, 1, 'Acceso al sistema con éxito', '2023-10-12 10:09:36', '190.97.238.72', 1);
INSERT INTO public.t_bitacoras VALUES (2736, 1, ' desde el 2023-10-12 hasta el 2023-10-12 - Duración 0.126 segs.', '2023-10-12 12:30:03', '190.75.6.12', 3);
INSERT INTO public.t_bitacoras VALUES (2737, 1, 'Acceso al sistema con éxito', '2023-10-24 12:26:38', '190.97.238.75', 1);
INSERT INTO public.t_bitacoras VALUES (2738, 1, ' desde el 2023-10-24 hasta el 2023-10-24 - Duración 0.105 segs.', '2023-10-24 12:38:25', '190.97.238.70', 3);
INSERT INTO public.t_bitacoras VALUES (2739, 1, 'Acceso al sistema con éxito', '2023-11-26 14:29:01', '190.97.238.72', 1);
INSERT INTO public.t_bitacoras VALUES (2740, 1, ' desde el 2023-11-26 hasta el 2023-11-26 - Duración 0.185 segs.', '2023-11-26 14:44:07', '190.97.238.71', 3);
INSERT INTO public.t_bitacoras VALUES (2741, 1, ' desde el 2023-11-26 hasta el 2023-11-26 - Duración 0.104 segs.', '2023-11-26 14:45:46', '190.97.238.71', 3);
INSERT INTO public.t_bitacoras VALUES (2742, 1, ' desde el 2023-11-26 hasta el 2023-11-26 - Duración 0.126 segs.', '2023-11-26 14:55:57', '190.97.238.72', 3);
INSERT INTO public.t_bitacoras VALUES (2743, 1, 'Acceso al sistema con éxito', '2023-11-27 13:26:28', '190.153.123.136', 1);
INSERT INTO public.t_bitacoras VALUES (2744, 1, 'Acceso al sistema con éxito', '2023-11-27 16:49:37', '190.153.123.136', 1);
INSERT INTO public.t_bitacoras VALUES (2745, 22, 'Acceso al sistema con éxito', '2023-11-27 16:57:30', '190.153.123.136', 1);
INSERT INTO public.t_bitacoras VALUES (2746, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.09 segs.', '2023-11-27 16:57:31', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2747, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.109 segs.', '2023-11-27 17:01:52', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2748, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.129 segs.', '2023-11-27 17:02:04', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2749, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.094 segs.', '2023-11-27 17:02:32', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2750, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.037 segs.', '2023-11-27 17:02:34', '190.153.123.136', 4);
INSERT INTO public.t_bitacoras VALUES (2751, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.122 segs.', '2023-11-27 17:05:35', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2752, 22, ' desde el 2023-08-01 hasta el 2023-11-27 - Duración 0.143 segs.', '2023-11-27 17:05:41', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2753, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.116 segs.', '2023-11-27 17:06:22', '190.153.123.136', 4);
INSERT INTO public.t_bitacoras VALUES (2754, 1, 'Acceso al sistema con éxito', '2023-11-27 17:07:08', '190.153.123.136', 1);
INSERT INTO public.t_bitacoras VALUES (2755, 22, 'Acceso al sistema con éxito', '2023-11-27 17:08:40', '190.153.123.136', 1);
INSERT INTO public.t_bitacoras VALUES (2756, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.104 segs.', '2023-11-27 17:08:40', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2757, 22, 'Acceso al sistema con éxito', '2023-11-27 17:10:04', '190.153.123.136', 1);
INSERT INTO public.t_bitacoras VALUES (2758, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.051 segs.', '2023-11-27 17:10:09', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2759, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.016 segs.', '2023-11-27 17:10:12', '190.153.123.136', 4);
INSERT INTO public.t_bitacoras VALUES (2760, 22, 'Acceso al sistema con éxito', '2023-11-27 18:57:39', '190.153.123.136', 1);
INSERT INTO public.t_bitacoras VALUES (2761, 22, ' desde el 2023-11-27 hasta el 2023-11-27 - Duración 0.051 segs.', '2023-11-27 18:57:44', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2762, 1, 'Acceso al sistema con éxito', '2023-11-27 18:58:09', '190.153.123.136', 1);
INSERT INTO public.t_bitacoras VALUES (2763, 1, 'Acceso al sistema con éxito', '2023-11-28 16:21:04', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2764, 1, 'Acceso al sistema con éxito', '2023-11-28 20:40:54', '190.97.238.72', 1);
INSERT INTO public.t_bitacoras VALUES (2765, 1, 'Acceso al sistema con éxito', '2023-11-29 20:17:01', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2766, 1, ' desde el 2023-11-29 hasta el 2023-11-29', '2023-11-29 20:17:14', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2767, 1, ' desde el 2023-11-03 hasta el 2023-11-29', '2023-11-29 20:17:26', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2768, 1, ' desde el 2023-11-02 hasta el 2023-11-29', '2023-11-29 20:17:28', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2769, 1, ' desde el 2023-11-01 hasta el 2023-11-29', '2023-11-29 20:17:30', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2770, 1, ' desde el 2023-10-01 hasta el 2023-11-29', '2023-11-29 20:17:41', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2771, 1, ' desde el 2023-09-01 hasta el 2023-11-29', '2023-11-29 20:17:47', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2772, 1, ' desde el 2023-11-29 hasta el 2023-11-29', '2023-11-29 20:18:15', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2773, 1, ' desde el 2023-11-01 hasta el 2023-11-29', '2023-11-29 20:18:22', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2774, 1, ' desde el Invalid date hasta el 2023-11-29', '2023-11-29 20:18:28', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2775, 1, ' desde el Invalid date hasta el 2023-11-29', '2023-11-29 20:18:28', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2776, 1, ' desde el 2023-11-01 hasta el 2023-11-29', '2023-11-29 20:18:34', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2777, 1, ' desde el 2023-11-29 hasta el 2023-11-29', '2023-11-29 20:23:26', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2778, 1, ' desde el 2023-11-01 hasta el 2023-11-29', '2023-11-29 20:23:29', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2779, 1, 'Acceso al sistema con éxito', '2023-11-29 20:23:43', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2780, 22, 'Acceso al sistema con éxito', '2023-11-29 20:24:13', '190.97.238.73', 1);
INSERT INTO public.t_bitacoras VALUES (2781, 22, ' desde el 2023-11-29 hasta el 2023-11-29', '2023-11-29 20:24:17', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2782, 22, ' desde el 2023-11-01 hasta el 2023-11-29', '2023-11-29 20:24:22', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2783, 22, ' desde el 2023-11-29 hasta el 2023-11-29', '2023-11-29 20:31:46', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2784, 22, ' desde el 2023-11-01 hasta el 2023-11-29', '2023-11-29 20:31:51', '190.97.238.73', 3);
INSERT INTO public.t_bitacoras VALUES (2785, 1, 'Acceso al sistema con éxito', '2023-11-29 20:48:02', '190.97.238.71', 1);
INSERT INTO public.t_bitacoras VALUES (2786, 1, 'Acceso al sistema con éxito', '2023-11-29 20:48:48', '190.97.238.71', 1);
INSERT INTO public.t_bitacoras VALUES (2787, 1, 'Acceso al sistema con éxito', '2023-11-29 21:41:55', '190.153.123.136', 1);
INSERT INTO public.t_bitacoras VALUES (2788, 1, ' desde el 2023-11-29 hasta el 2023-11-29', '2023-11-29 21:42:05', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2789, 1, ' desde el 2023-11-29 hasta el 2023-11-29', '2023-11-29 21:43:55', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2790, 1, ' desde el 2023-11-01 hasta el 2023-11-29', '2023-11-29 21:44:03', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2791, 1, ' desde el 2023-11-29 hasta el 2023-11-29', '2023-11-29 21:45:02', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2792, 1, ' desde el 2023-11-01 hasta el 2023-11-29', '2023-11-29 21:45:08', '190.153.123.136', 3);
INSERT INTO public.t_bitacoras VALUES (2793, 1, ' desde el 2023/11/01 hasta el 2023-11-29', '2023-11-29 21:45:30', '190.153.123.136', 7);
INSERT INTO public.t_bitacoras VALUES (2794, 1, ' desde el 2024-01-06 hasta el 2024-01-06', '2024-01-06 13:10:43', '190.97.238.70', 3);
INSERT INTO public.t_bitacoras VALUES (2795, 1, 'Acceso al sistema con éxito', '2024-01-06 13:10:49', '190.97.238.70', 1);
INSERT INTO public.t_bitacoras VALUES (2796, 1, ' desde el 2024-01-06 hasta el 2024-01-06', '2024-01-06 13:10:56', '190.97.238.70', 3);
INSERT INTO public.t_bitacoras VALUES (2797, 1, ' desde el 2023-12-01 hasta el 2024-01-06', '2024-01-06 13:11:02', '190.97.238.70', 3);
INSERT INTO public.t_bitacoras VALUES (2798, 1, ' desde el 2023-11-01 hasta el 2024-01-06', '2024-01-06 13:11:06', '190.97.238.70', 3);
INSERT INTO public.t_bitacoras VALUES (2799, 1, ' desde el 2024-01-01 hasta el 2024-01-06', '2024-01-06 13:11:26', '190.97.238.70', 3);
INSERT INTO public.t_bitacoras VALUES (2800, 1, 'Acceso al sistema con éxito', '2024-01-06 13:16:43', '190.97.238.68', 1);
INSERT INTO public.t_bitacoras VALUES (2801, 1, ' desde el 2024-01-06 hasta el 2024-01-06', '2024-01-06 13:16:49', '190.97.238.68', 3);
INSERT INTO public.t_bitacoras VALUES (2802, 1, 'Acceso al sistema con éxito', '2024-01-07 19:17:37', '190.97.238.70', 1);
INSERT INTO public.t_bitacoras VALUES (2803, 1, 'Acceso al sistema con éxito', '2024-01-08 19:30:34', '190.203.235.209', 1);
INSERT INTO public.t_bitacoras VALUES (2804, 1, 'Acceso al sistema con éxito', '2024-01-08 19:33:59', '190.203.235.209', 1);
INSERT INTO public.t_bitacoras VALUES (2805, 1, 'Acceso al sistema con éxito', '2024-01-08 19:34:25', '190.203.235.209', 1);
INSERT INTO public.t_bitacoras VALUES (2806, 1, 'Acceso al sistema con éxito', '2024-01-08 19:44:02', '190.153.123.136', 1);


--
-- TOC entry 3424 (class 0 OID 16406)
-- Dependencies: 216
-- Data for Name: t_codigoscomercial; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_codigoscomercial VALUES (1, '3710', 'Reciclamiento de Desperdicios y Desechos Metálicos');
INSERT INTO public.t_codigoscomercial VALUES (2, '3720', 'Reciclamiento de Desperdicios y Desechos No Metálicos');
INSERT INTO public.t_codigoscomercial VALUES (3, '4010', 'Generación, Captación y Disptribución de Energía Eléctrica');
INSERT INTO public.t_codigoscomercial VALUES (4, '4020', 'Fabricación de Gas; Distribución de Combustibles Gaseosos por Tuberías');
INSERT INTO public.t_codigoscomercial VALUES (5, '4100', 'Captación, Depuración y Distribución de Agua');
INSERT INTO public.t_codigoscomercial VALUES (6, '5139', 'Venta al por Mayor de otros enseres domésticos');
INSERT INTO public.t_codigoscomercial VALUES (7, '5149', 'Venta al por Mayor de otros Productos Intermedios, Desperdicios y Desechos');
INSERT INTO public.t_codigoscomercial VALUES (8, '5233', 'Venta al por Mayor de Aparatos, Artículos y equipos de Uso Doméstico');
INSERT INTO public.t_codigoscomercial VALUES (9, '5239', 'Venta al por Menor de otros Productos en Almacenes Especializados');
INSERT INTO public.t_codigoscomercial VALUES (10, '5259', 'Otros Tipos de Venta al por Menor No Realizada en Almacenes');
INSERT INTO public.t_codigoscomercial VALUES (11, '6420', 'Telecomunicaciones');
INSERT INTO public.t_codigoscomercial VALUES (12, '7010', 'Actividades Inmobiliarias Realizadas con Bienes Propios o Arrendados');
INSERT INTO public.t_codigoscomercial VALUES (13, '7111', 'Alquiler de Equipo de Trasporte por Vía Terrestre');
INSERT INTO public.t_codigoscomercial VALUES (14, '7112', 'Alquiler de Equipo de Trasporte por Vía Acuática');
INSERT INTO public.t_codigoscomercial VALUES (15, '7113', 'Alquiler de Equipo de Trasporte por Vía Aérea');
INSERT INTO public.t_codigoscomercial VALUES (18, '7240', 'Actividades Relacionadas con Bases de Datos');
INSERT INTO public.t_codigoscomercial VALUES (19, '7413', 'Investigación de Mercados y Realización de Encuestas de Opinión Pública');
INSERT INTO public.t_codigoscomercial VALUES (20, '7430', 'Publicidad');
INSERT INTO public.t_codigoscomercial VALUES (21, '7499', 'Otras Actividades Empresariales No Clasificadas Previamente');
INSERT INTO public.t_codigoscomercial VALUES (22, '9000', 'Eliminación de Desperdicios y Aguas Residuales, Saneamiento y Actividades Similares');
INSERT INTO public.t_codigoscomercial VALUES (16, '7123', 'Alquiler de Maquinaria y Equipos de Oficina (Incluso Computadoras');
INSERT INTO public.t_codigoscomercial VALUES (17, '7230', 'Procesamiento de Datos');


--
-- TOC entry 3425 (class 0 OID 16409)
-- Dependencies: 217
-- Data for Name: t_eventos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_eventos VALUES (1, 'Acceso');
INSERT INTO public.t_eventos VALUES (2, 'Consulta en Indicadores Principales');
INSERT INTO public.t_eventos VALUES (3, 'Consulta en Reportes');
INSERT INTO public.t_eventos VALUES (4, 'Consulta en Anulaciones');
INSERT INTO public.t_eventos VALUES (5, 'Consulta en Bitácoras');
INSERT INTO public.t_eventos VALUES (6, 'Exportar en Indicadores Principales');
INSERT INTO public.t_eventos VALUES (7, 'Exportar en Reportes');
INSERT INTO public.t_eventos VALUES (8, 'Exportar en Anulaciones');
INSERT INTO public.t_eventos VALUES (9, 'Exportar en Bitácoras');


--
-- TOC entry 3426 (class 0 OID 16412)
-- Dependencies: 218
-- Data for Name: t_formasdepago; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_formasdepago VALUES (1, 'Tranferencia', 2345.07, 88);
INSERT INTO public.t_formasdepago VALUES (2, 'Efectivo', 2345.07, 88);
INSERT INTO public.t_formasdepago VALUES (3, 'Tranferencia', 2345.07, 89);
INSERT INTO public.t_formasdepago VALUES (4, 'Efectivo', 234.07, 89);
INSERT INTO public.t_formasdepago VALUES (5, 'Tranferencia', 2345.07, 90);
INSERT INTO public.t_formasdepago VALUES (6, 'Efectivo', 234.07, 90);
INSERT INTO public.t_formasdepago VALUES (7, 'Tranferencia', 2345.07, 91);
INSERT INTO public.t_formasdepago VALUES (8, 'Efectivo', 234.07, 91);
INSERT INTO public.t_formasdepago VALUES (9, 'Tranferencia', 2345.07, 92);
INSERT INTO public.t_formasdepago VALUES (10, 'Efectivo', 234.07, 92);
INSERT INTO public.t_formasdepago VALUES (11, 'Tranferencia', 2345.07, 93);
INSERT INTO public.t_formasdepago VALUES (12, 'Efectivo', 2345.07, 93);
INSERT INTO public.t_formasdepago VALUES (13, 'Tranferencia', 2345.07, 94);
INSERT INTO public.t_formasdepago VALUES (14, 'Efectivo', 2345.07, 94);
INSERT INTO public.t_formasdepago VALUES (15, 'Tranferencia', 2345.07, 95);
INSERT INTO public.t_formasdepago VALUES (16, 'Efectivo', 25.07, 95);
INSERT INTO public.t_formasdepago VALUES (17, 'Tranferencia', 2345.07, 96);
INSERT INTO public.t_formasdepago VALUES (18, 'Efectivo', 25.07, 96);
INSERT INTO public.t_formasdepago VALUES (19, 'Tranferencia', 2345.07, 97);
INSERT INTO public.t_formasdepago VALUES (20, 'Efectivo', 25.07, 97);
INSERT INTO public.t_formasdepago VALUES (21, 'Tranferencia', 2345.07, 98);
INSERT INTO public.t_formasdepago VALUES (22, 'Efectivo', 25.07, 98);
INSERT INTO public.t_formasdepago VALUES (23, 'Tranferencia', 2345.07, 99);
INSERT INTO public.t_formasdepago VALUES (24, 'Efectivo', 2345.07, 99);
INSERT INTO public.t_formasdepago VALUES (25, 'Tranferencia', 2345.07, 100);
INSERT INTO public.t_formasdepago VALUES (26, 'Efectivo', 2345.07, 100);
INSERT INTO public.t_formasdepago VALUES (27, 'Tranferencia', 2345.07, 101);
INSERT INTO public.t_formasdepago VALUES (28, 'Efectivo', 2345.07, 101);
INSERT INTO public.t_formasdepago VALUES (29, 'Tranferencia', 2345.07, 102);
INSERT INTO public.t_formasdepago VALUES (30, 'Efectivo', 2345.07, 102);
INSERT INTO public.t_formasdepago VALUES (31, 'Tranferencia', 2345.07, 103);
INSERT INTO public.t_formasdepago VALUES (32, 'Efectivo', 2345.07, 103);
INSERT INTO public.t_formasdepago VALUES (33, 'Tranferencia', 2345.07, 104);
INSERT INTO public.t_formasdepago VALUES (34, 'Efectivo', 2345.07, 104);
INSERT INTO public.t_formasdepago VALUES (35, 'Tranferencia', 2345.07, 105);
INSERT INTO public.t_formasdepago VALUES (36, 'Efectivo', 2345.07, 105);
INSERT INTO public.t_formasdepago VALUES (37, 'Tranferencia', 2345.07, 106);
INSERT INTO public.t_formasdepago VALUES (38, 'Efectivo', 2345.07, 106);
INSERT INTO public.t_formasdepago VALUES (39, 'Tranferencia', 2345.07, 107);
INSERT INTO public.t_formasdepago VALUES (40, 'Efectivo', 2345.07, 107);
INSERT INTO public.t_formasdepago VALUES (41, 'Tranferencia', 2345.07, 108);
INSERT INTO public.t_formasdepago VALUES (42, 'Efectivo', 2345.07, 108);
INSERT INTO public.t_formasdepago VALUES (43, 'Tranferencia', 2345.07, 109);
INSERT INTO public.t_formasdepago VALUES (44, 'Efectivo', 2345.07, 109);
INSERT INTO public.t_formasdepago VALUES (45, 'Tranferencia', 2345.07, 110);
INSERT INTO public.t_formasdepago VALUES (46, 'Efectivo', 2345.07, 110);
INSERT INTO public.t_formasdepago VALUES (47, 'Tranferencia', 2345.07, 111);
INSERT INTO public.t_formasdepago VALUES (48, 'Efectivo', 2345.07, 111);
INSERT INTO public.t_formasdepago VALUES (49, 'Tranferencia', 2345.07, 112);
INSERT INTO public.t_formasdepago VALUES (50, 'Efectivo', 2345.07, 112);
INSERT INTO public.t_formasdepago VALUES (51, 'Tranferencia', 2345.07, 113);
INSERT INTO public.t_formasdepago VALUES (52, 'Efectivo', 2345.07, 113);
INSERT INTO public.t_formasdepago VALUES (53, 'Tranferencia', 2345.07, 114);
INSERT INTO public.t_formasdepago VALUES (54, 'Efectivo', 2345.07, 114);
INSERT INTO public.t_formasdepago VALUES (55, 'Tranferencia', 2345.07, 115);
INSERT INTO public.t_formasdepago VALUES (56, 'Efectivo', 2345.07, 115);
INSERT INTO public.t_formasdepago VALUES (57, 'Tranferencia', 2345.07, 116);
INSERT INTO public.t_formasdepago VALUES (58, 'Efectivo', 2345.07, 116);
INSERT INTO public.t_formasdepago VALUES (59, 'Tranferencia', 2345.07, 117);
INSERT INTO public.t_formasdepago VALUES (60, 'Efectivo', 2345.07, 117);
INSERT INTO public.t_formasdepago VALUES (61, 'Tranferencia', 2345.07, 118);
INSERT INTO public.t_formasdepago VALUES (62, 'Efectivo', 2345.07, 118);
INSERT INTO public.t_formasdepago VALUES (63, 'Tranferencia', 2345.07, 119);
INSERT INTO public.t_formasdepago VALUES (64, 'Efectivo', 2345.07, 119);
INSERT INTO public.t_formasdepago VALUES (65, 'Tranferencia', 2345.07, 120);
INSERT INTO public.t_formasdepago VALUES (66, 'Efectivo', 2345.07, 120);
INSERT INTO public.t_formasdepago VALUES (67, 'Tranferencia', 2345.07, 121);
INSERT INTO public.t_formasdepago VALUES (68, 'Efectivo', 2345.07, 121);
INSERT INTO public.t_formasdepago VALUES (69, 'Tranferencia', 2345.07, 122);
INSERT INTO public.t_formasdepago VALUES (70, 'Efectivo', 2345.07, 122);
INSERT INTO public.t_formasdepago VALUES (71, 'Tranferencia', 2345.07, 123);
INSERT INTO public.t_formasdepago VALUES (72, 'Efectivo', 2345.07, 123);
INSERT INTO public.t_formasdepago VALUES (73, 'Tranferencia', 2345.07, 124);
INSERT INTO public.t_formasdepago VALUES (74, 'Efectivo', 2345.07, 124);
INSERT INTO public.t_formasdepago VALUES (75, 'Tranferencia', 2345.07, 125);
INSERT INTO public.t_formasdepago VALUES (76, 'Efectivo', 2345.07, 125);
INSERT INTO public.t_formasdepago VALUES (77, 'Tranferencia', 2345.07, 126);
INSERT INTO public.t_formasdepago VALUES (78, 'Efectivo', 2345.07, 126);
INSERT INTO public.t_formasdepago VALUES (79, 'Tranferencia', 2345.07, 127);
INSERT INTO public.t_formasdepago VALUES (80, 'Efectivo', 2345.07, 127);
INSERT INTO public.t_formasdepago VALUES (81, 'Tranferencia', 2345.07, 128);
INSERT INTO public.t_formasdepago VALUES (82, 'Efectivo', 2345.07, 128);
INSERT INTO public.t_formasdepago VALUES (83, 'Tranferencia', 2345.07, 129);
INSERT INTO public.t_formasdepago VALUES (84, 'Efectivo', 2345.07, 129);
INSERT INTO public.t_formasdepago VALUES (85, 'Tranferencia', 2345.07, 130);
INSERT INTO public.t_formasdepago VALUES (86, 'Efectivo', 2345.07, 130);
INSERT INTO public.t_formasdepago VALUES (87, 'Tranferencia', 2345.07, 131);
INSERT INTO public.t_formasdepago VALUES (88, 'Efectivo', 2345.07, 131);
INSERT INTO public.t_formasdepago VALUES (89, 'Tranferencia', 2345.07, 132);
INSERT INTO public.t_formasdepago VALUES (90, 'Efectivo', 2345.07, 132);
INSERT INTO public.t_formasdepago VALUES (91, 'Tranferencia', 2345.07, 133);
INSERT INTO public.t_formasdepago VALUES (92, 'Efectivo', 2345.07, 133);
INSERT INTO public.t_formasdepago VALUES (93, 'Tranferencia', 2345.07, 134);
INSERT INTO public.t_formasdepago VALUES (94, 'Efectivo', 2345.07, 134);
INSERT INTO public.t_formasdepago VALUES (95, 'Tranferencia', 2345.07, 135);
INSERT INTO public.t_formasdepago VALUES (96, 'Efectivo', 2345.07, 135);
INSERT INTO public.t_formasdepago VALUES (97, 'Tranferencia', 2345.07, 136);
INSERT INTO public.t_formasdepago VALUES (98, 'Efectivo', 2345.07, 136);
INSERT INTO public.t_formasdepago VALUES (99, 'Tranferencia', 2345.07, 137);
INSERT INTO public.t_formasdepago VALUES (100, 'Efectivo', 2345.07, 137);
INSERT INTO public.t_formasdepago VALUES (101, 'Tranferencia', 2345.07, 138);
INSERT INTO public.t_formasdepago VALUES (102, 'Efectivo', 2345.07, 138);
INSERT INTO public.t_formasdepago VALUES (103, 'Tranferencia', 2345.07, 139);
INSERT INTO public.t_formasdepago VALUES (104, 'Efectivo', 2345.07, 139);
INSERT INTO public.t_formasdepago VALUES (105, 'Tranferencia', 2345.07, 140);
INSERT INTO public.t_formasdepago VALUES (106, 'Efectivo', 2345.07, 140);
INSERT INTO public.t_formasdepago VALUES (107, 'Tranferencia', 2345.07, 141);
INSERT INTO public.t_formasdepago VALUES (108, 'Efectivo', 2345.07, 141);
INSERT INTO public.t_formasdepago VALUES (109, 'Tranferencia', 2345.07, 142);
INSERT INTO public.t_formasdepago VALUES (110, 'Efectivo', 2345.07, 142);
INSERT INTO public.t_formasdepago VALUES (111, 'Tranferencia', 2926.04, 143);
INSERT INTO public.t_formasdepago VALUES (112, 'Divisa', 4105, 143);
INSERT INTO public.t_formasdepago VALUES (113, 'Tranferencia', 2926.04, 144);
INSERT INTO public.t_formasdepago VALUES (114, 'Divisa', 4105, 144);
INSERT INTO public.t_formasdepago VALUES (115, 'Tranferencia', 2926.04, 145);
INSERT INTO public.t_formasdepago VALUES (116, 'Divisa', 4105, 145);
INSERT INTO public.t_formasdepago VALUES (117, 'Tranferencia', 2926.04, 146);
INSERT INTO public.t_formasdepago VALUES (118, 'Divisa', 4105, 146);
INSERT INTO public.t_formasdepago VALUES (119, 'Tranferencia', 2926.04, 147);
INSERT INTO public.t_formasdepago VALUES (120, 'Divisa', 4105, 147);
INSERT INTO public.t_formasdepago VALUES (121, 'Tranferencia', 2926.04, 148);
INSERT INTO public.t_formasdepago VALUES (122, 'Divisa', 4105, 148);
INSERT INTO public.t_formasdepago VALUES (123, 'Tranferencia', 2926.04, 149);
INSERT INTO public.t_formasdepago VALUES (124, 'Divisa', 4105, 149);
INSERT INTO public.t_formasdepago VALUES (125, 'Tranferencia', 2926.04, 150);
INSERT INTO public.t_formasdepago VALUES (126, 'Divisa', 4105, 150);
INSERT INTO public.t_formasdepago VALUES (127, 'Tranferencia', 2926.04, 151);
INSERT INTO public.t_formasdepago VALUES (128, 'Divisa', 4105, 151);
INSERT INTO public.t_formasdepago VALUES (129, 'Tranferencia', 2926.04, 152);
INSERT INTO public.t_formasdepago VALUES (130, 'Divisa', 4105, 152);
INSERT INTO public.t_formasdepago VALUES (131, 'Tranferencia', 2926.04, 153);
INSERT INTO public.t_formasdepago VALUES (132, 'Divisa', 4105, 153);
INSERT INTO public.t_formasdepago VALUES (133, 'Tranferencia', 2926.04, 154);
INSERT INTO public.t_formasdepago VALUES (134, 'Divisa', 4105, 154);
INSERT INTO public.t_formasdepago VALUES (135, 'Tranferencia', 2926.04, 155);
INSERT INTO public.t_formasdepago VALUES (136, 'Divisa', 4105, 155);
INSERT INTO public.t_formasdepago VALUES (137, 'Tranferencia', 2926.04, 156);
INSERT INTO public.t_formasdepago VALUES (138, 'Divisa', 4105, 156);
INSERT INTO public.t_formasdepago VALUES (139, 'Tranferencia', 2926.04, 157);
INSERT INTO public.t_formasdepago VALUES (140, 'Divisa', 4105, 157);
INSERT INTO public.t_formasdepago VALUES (141, 'Tranferencia', 2926.04, 158);
INSERT INTO public.t_formasdepago VALUES (142, 'Divisa', 4105, 158);
INSERT INTO public.t_formasdepago VALUES (143, 'Tranferencia', 2926.04, 159);
INSERT INTO public.t_formasdepago VALUES (144, 'Divisa', 4105, 159);
INSERT INTO public.t_formasdepago VALUES (145, 'Tranferencia', 2926.04, 160);
INSERT INTO public.t_formasdepago VALUES (146, 'Divisa', 4105, 160);
INSERT INTO public.t_formasdepago VALUES (147, 'Tranferencia', 2926.04, 161);
INSERT INTO public.t_formasdepago VALUES (148, 'Divisa', 4105, 161);
INSERT INTO public.t_formasdepago VALUES (149, 'Tranferencia', 2926.04, 162);
INSERT INTO public.t_formasdepago VALUES (150, 'Divisa', 4105, 162);
INSERT INTO public.t_formasdepago VALUES (151, 'Tranferencia', 2926.04, 163);
INSERT INTO public.t_formasdepago VALUES (152, 'Divisa', 4105, 163);
INSERT INTO public.t_formasdepago VALUES (153, 'Tranferencia', 2926.04, 164);
INSERT INTO public.t_formasdepago VALUES (154, 'Divisa', 4105, 164);
INSERT INTO public.t_formasdepago VALUES (155, 'Tranferencia', 2926.04, 165);
INSERT INTO public.t_formasdepago VALUES (156, 'Divisa', 4105, 165);
INSERT INTO public.t_formasdepago VALUES (157, 'Tranferencia', 2926.04, 166);
INSERT INTO public.t_formasdepago VALUES (158, 'Divisa', 4105, 166);
INSERT INTO public.t_formasdepago VALUES (159, 'Tranferencia', 2926.04, 167);
INSERT INTO public.t_formasdepago VALUES (160, 'Divisa', 4105, 167);
INSERT INTO public.t_formasdepago VALUES (161, 'Tranferencia', 2926.04, 168);
INSERT INTO public.t_formasdepago VALUES (162, 'Divisa', 4105, 168);
INSERT INTO public.t_formasdepago VALUES (163, 'Tranferencia', 2926.04, 169);
INSERT INTO public.t_formasdepago VALUES (164, 'Divisa', 4105, 169);
INSERT INTO public.t_formasdepago VALUES (165, 'Tranferencia', 2926.04, 170);
INSERT INTO public.t_formasdepago VALUES (166, 'Divisa', 4105, 170);
INSERT INTO public.t_formasdepago VALUES (167, 'Tranferencia', 2926.04, 171);
INSERT INTO public.t_formasdepago VALUES (168, 'Divisa', 4105, 171);
INSERT INTO public.t_formasdepago VALUES (169, 'Tranferencia', 2926.04, 172);
INSERT INTO public.t_formasdepago VALUES (170, 'Divisa', 4105, 172);
INSERT INTO public.t_formasdepago VALUES (171, 'Tranferencia', 2926.04, 173);
INSERT INTO public.t_formasdepago VALUES (172, 'Divisa', 4105, 173);
INSERT INTO public.t_formasdepago VALUES (173, 'Tranferencia', 2926.04, 174);
INSERT INTO public.t_formasdepago VALUES (174, 'Divisa', 4105, 174);
INSERT INTO public.t_formasdepago VALUES (175, 'Tranferencia', 2926.04, 175);
INSERT INTO public.t_formasdepago VALUES (176, 'Divisa', 4105, 175);
INSERT INTO public.t_formasdepago VALUES (177, 'Tranferencia', 2926.04, 176);
INSERT INTO public.t_formasdepago VALUES (178, 'Divisa', 4105, 176);
INSERT INTO public.t_formasdepago VALUES (179, 'Tranferencia', 2926.04, 177);
INSERT INTO public.t_formasdepago VALUES (180, 'Divisa', 4105, 177);
INSERT INTO public.t_formasdepago VALUES (181, 'Tranferencia', 2926.04, 178);
INSERT INTO public.t_formasdepago VALUES (182, 'Divisa', 4105, 178);
INSERT INTO public.t_formasdepago VALUES (183, 'Tranferencia', 2926.04, 179);
INSERT INTO public.t_formasdepago VALUES (184, 'Divisa', 4105, 179);
INSERT INTO public.t_formasdepago VALUES (185, 'Tranferencia', 2926.04, 180);
INSERT INTO public.t_formasdepago VALUES (186, 'Divisa', 4105, 180);
INSERT INTO public.t_formasdepago VALUES (187, 'Tranferencia', 2926.04, 181);
INSERT INTO public.t_formasdepago VALUES (188, 'Divisa', 4105, 181);
INSERT INTO public.t_formasdepago VALUES (189, 'Tranferencia', 2926.04, 182);
INSERT INTO public.t_formasdepago VALUES (190, 'Divisa', 4105, 182);
INSERT INTO public.t_formasdepago VALUES (191, 'Tranferencia', 2926.04, 183);
INSERT INTO public.t_formasdepago VALUES (192, 'Divisa', 4105, 183);
INSERT INTO public.t_formasdepago VALUES (193, 'Tranferencia', 2926.04, 184);
INSERT INTO public.t_formasdepago VALUES (194, 'Divisa', 4105, 184);
INSERT INTO public.t_formasdepago VALUES (195, 'Tranferencia', 2926.04, 185);
INSERT INTO public.t_formasdepago VALUES (196, 'Divisa', 4105, 185);
INSERT INTO public.t_formasdepago VALUES (197, 'Tranferencia', 2926.04, 186);
INSERT INTO public.t_formasdepago VALUES (198, 'Divisa', 4105, 186);
INSERT INTO public.t_formasdepago VALUES (199, 'Tranferencia', 2926.04, 187);
INSERT INTO public.t_formasdepago VALUES (200, 'Divisa', 4105, 187);
INSERT INTO public.t_formasdepago VALUES (201, 'Tranferencia', 2926.04, 188);
INSERT INTO public.t_formasdepago VALUES (202, 'Divisa', 4105, 188);
INSERT INTO public.t_formasdepago VALUES (203, 'Tranferencia', 2926.04, 189);
INSERT INTO public.t_formasdepago VALUES (204, 'Divisa', 4105, 189);
INSERT INTO public.t_formasdepago VALUES (205, 'Tranferencia', 2926.04, 190);
INSERT INTO public.t_formasdepago VALUES (206, 'Divisa', 4105, 190);
INSERT INTO public.t_formasdepago VALUES (207, 'Tranferencia', 2926.04, 191);
INSERT INTO public.t_formasdepago VALUES (208, 'Divisa', 4105, 191);
INSERT INTO public.t_formasdepago VALUES (209, 'Tranferencia', 2926.04, 192);
INSERT INTO public.t_formasdepago VALUES (210, 'Divisa', 4105, 192);
INSERT INTO public.t_formasdepago VALUES (211, 'Tranferencia', 2926.04, 193);
INSERT INTO public.t_formasdepago VALUES (212, 'Divisa', 4105, 193);
INSERT INTO public.t_formasdepago VALUES (213, 'Tranferencia', 2926.04, 194);
INSERT INTO public.t_formasdepago VALUES (214, 'Divisa', 4105, 194);
INSERT INTO public.t_formasdepago VALUES (215, 'Tranferencia', 2926.04, 195);
INSERT INTO public.t_formasdepago VALUES (216, 'Divisa', 4105, 195);
INSERT INTO public.t_formasdepago VALUES (217, 'Tranferencia', 2926.04, 196);
INSERT INTO public.t_formasdepago VALUES (218, 'Divisa', 4105, 196);
INSERT INTO public.t_formasdepago VALUES (219, 'Tranferencia', 2926.04, 197);
INSERT INTO public.t_formasdepago VALUES (220, 'Divisa', 4105, 197);
INSERT INTO public.t_formasdepago VALUES (221, 'Tranferencia', 2926.04, 198);
INSERT INTO public.t_formasdepago VALUES (222, 'Divisa', 4105, 198);
INSERT INTO public.t_formasdepago VALUES (223, 'Tranferencia', 2926.04, 199);
INSERT INTO public.t_formasdepago VALUES (224, 'Divisa', 4105, 199);
INSERT INTO public.t_formasdepago VALUES (225, 'Tranferencia', 2926.04, 200);
INSERT INTO public.t_formasdepago VALUES (226, 'Divisa', 4105, 200);
INSERT INTO public.t_formasdepago VALUES (227, 'Tranferencia', 2926.04, 201);
INSERT INTO public.t_formasdepago VALUES (228, 'Divisa', 4105, 201);
INSERT INTO public.t_formasdepago VALUES (229, 'Tranferencia', 2926.04, 202);
INSERT INTO public.t_formasdepago VALUES (230, 'Divisa', 4105, 202);
INSERT INTO public.t_formasdepago VALUES (231, 'Tranferencia', 2926.04, 203);
INSERT INTO public.t_formasdepago VALUES (232, 'Divisa', 4105, 203);
INSERT INTO public.t_formasdepago VALUES (233, 'Tranferencia', 2926.04, 204);
INSERT INTO public.t_formasdepago VALUES (234, 'Divisa', 4105, 204);
INSERT INTO public.t_formasdepago VALUES (235, 'Tranferencia', 2926.04, 205);
INSERT INTO public.t_formasdepago VALUES (236, 'Divisa', 4105, 205);
INSERT INTO public.t_formasdepago VALUES (237, 'Tranferencia', 2926.04, 206);
INSERT INTO public.t_formasdepago VALUES (238, 'Divisa', 4105, 206);
INSERT INTO public.t_formasdepago VALUES (239, 'Tranferencia', 2926.04, 207);
INSERT INTO public.t_formasdepago VALUES (240, 'Divisa', 4105, 207);
INSERT INTO public.t_formasdepago VALUES (241, 'Tranferencia', 2926.04, 208);
INSERT INTO public.t_formasdepago VALUES (242, 'Divisa', 4105, 208);
INSERT INTO public.t_formasdepago VALUES (243, 'Tranferencia', 2926.04, 209);
INSERT INTO public.t_formasdepago VALUES (244, 'Divisa', 4105, 209);
INSERT INTO public.t_formasdepago VALUES (245, 'Tranferencia', 2926.04, 210);
INSERT INTO public.t_formasdepago VALUES (246, 'Divisa', 4105, 210);
INSERT INTO public.t_formasdepago VALUES (247, 'Tranferencia', 2926.04, 211);
INSERT INTO public.t_formasdepago VALUES (248, 'Divisa', 4105, 211);
INSERT INTO public.t_formasdepago VALUES (249, 'Tranferencia', 2926.04, 212);
INSERT INTO public.t_formasdepago VALUES (250, 'Divisa', 4105, 212);
INSERT INTO public.t_formasdepago VALUES (251, 'Tranferencia', 2926.04, 213);
INSERT INTO public.t_formasdepago VALUES (252, 'Divisa', 4105, 213);
INSERT INTO public.t_formasdepago VALUES (253, 'Tranferencia', 2926.04, 214);
INSERT INTO public.t_formasdepago VALUES (254, 'Divisa', 4105, 214);
INSERT INTO public.t_formasdepago VALUES (255, 'Tranferencia', 2926.04, 215);
INSERT INTO public.t_formasdepago VALUES (256, 'Divisa', 4105, 215);
INSERT INTO public.t_formasdepago VALUES (257, 'Tranferencia', 2926.04, 216);
INSERT INTO public.t_formasdepago VALUES (258, 'Divisa', 4105, 216);
INSERT INTO public.t_formasdepago VALUES (259, 'Tranferencia', 2926.04, 217);
INSERT INTO public.t_formasdepago VALUES (260, 'Divisa', 4105, 217);
INSERT INTO public.t_formasdepago VALUES (261, 'Tranferencia', 2926.04, 218);
INSERT INTO public.t_formasdepago VALUES (262, 'Divisa', 4105, 218);
INSERT INTO public.t_formasdepago VALUES (263, 'Tranferencia', 2926.04, 219);
INSERT INTO public.t_formasdepago VALUES (264, 'Divisa', 4105, 219);
INSERT INTO public.t_formasdepago VALUES (265, 'Tranferencia', 2926.04, 220);
INSERT INTO public.t_formasdepago VALUES (266, 'Divisa', 4105, 220);
INSERT INTO public.t_formasdepago VALUES (267, 'Tranferencia', 2926.04, 221);
INSERT INTO public.t_formasdepago VALUES (268, 'Divisa', 4105, 221);
INSERT INTO public.t_formasdepago VALUES (269, 'Tranferencia', 2926.04, 222);
INSERT INTO public.t_formasdepago VALUES (270, 'Divisa', 4105, 222);
INSERT INTO public.t_formasdepago VALUES (271, 'Tranferencia', 2926.04, 223);
INSERT INTO public.t_formasdepago VALUES (272, 'Divisa', 4105, 223);
INSERT INTO public.t_formasdepago VALUES (273, 'Tranferencia', 2926.04, 224);
INSERT INTO public.t_formasdepago VALUES (274, 'Divisa', 4105, 224);
INSERT INTO public.t_formasdepago VALUES (275, 'Tranferencia', 2926.04, 225);
INSERT INTO public.t_formasdepago VALUES (276, 'Divisa', 4105, 225);
INSERT INTO public.t_formasdepago VALUES (277, 'Tranferencia', 2926.04, 226);
INSERT INTO public.t_formasdepago VALUES (278, 'Divisa', 4105, 226);
INSERT INTO public.t_formasdepago VALUES (279, 'Tranferencia', 2926.04, 227);
INSERT INTO public.t_formasdepago VALUES (280, 'Divisa', 4105, 227);
INSERT INTO public.t_formasdepago VALUES (281, 'Tranferencia', 2926.04, 228);
INSERT INTO public.t_formasdepago VALUES (282, 'Divisa', 4105, 228);
INSERT INTO public.t_formasdepago VALUES (283, 'Tranferencia', 2926.04, 229);
INSERT INTO public.t_formasdepago VALUES (284, 'Divisa', 4105, 229);
INSERT INTO public.t_formasdepago VALUES (285, 'Tranferencia', 2926.04, 230);
INSERT INTO public.t_formasdepago VALUES (286, 'Divisa', 4105, 230);
INSERT INTO public.t_formasdepago VALUES (287, 'Tranferencia', 2926.04, 231);
INSERT INTO public.t_formasdepago VALUES (288, 'Divisa', 4105, 231);
INSERT INTO public.t_formasdepago VALUES (289, 'Tranferencia', 2926.04, 232);
INSERT INTO public.t_formasdepago VALUES (290, 'Divisa', 4105, 232);
INSERT INTO public.t_formasdepago VALUES (291, 'Tranferencia', 2926.04, 233);
INSERT INTO public.t_formasdepago VALUES (292, 'Divisa', 4105, 233);
INSERT INTO public.t_formasdepago VALUES (293, 'Tranferencia', 2926.04, 234);
INSERT INTO public.t_formasdepago VALUES (294, 'Divisa', 4105, 234);
INSERT INTO public.t_formasdepago VALUES (295, 'Tranferencia', 2926.04, 235);
INSERT INTO public.t_formasdepago VALUES (296, 'Divisa', 4105, 235);
INSERT INTO public.t_formasdepago VALUES (297, 'Tranferencia', 2926.04, 236);
INSERT INTO public.t_formasdepago VALUES (298, 'Divisa', 4105, 236);
INSERT INTO public.t_formasdepago VALUES (299, 'Tranferencia', 2926.04, 237);
INSERT INTO public.t_formasdepago VALUES (300, 'Divisa', 4105, 237);
INSERT INTO public.t_formasdepago VALUES (301, 'Tranferencia', 2926.04, 238);
INSERT INTO public.t_formasdepago VALUES (302, 'Divisa', 4105, 238);
INSERT INTO public.t_formasdepago VALUES (303, 'Tranferencia', 2926.04, 239);
INSERT INTO public.t_formasdepago VALUES (304, 'Divisa', 4105, 239);
INSERT INTO public.t_formasdepago VALUES (305, 'Tranferencia', 2926.04, 240);
INSERT INTO public.t_formasdepago VALUES (306, 'Divisa', 4105, 240);
INSERT INTO public.t_formasdepago VALUES (307, 'Tranferencia', 2926.04, 241);
INSERT INTO public.t_formasdepago VALUES (308, 'Divisa', 4105, 241);
INSERT INTO public.t_formasdepago VALUES (309, 'Tranferencia', 2926.04, 242);
INSERT INTO public.t_formasdepago VALUES (310, 'Divisa', 4105, 242);
INSERT INTO public.t_formasdepago VALUES (311, 'Tranferencia', 2926.04, 243);
INSERT INTO public.t_formasdepago VALUES (312, 'Divisa', 4105, 243);
INSERT INTO public.t_formasdepago VALUES (313, 'Tranferencia', 2926.04, 244);
INSERT INTO public.t_formasdepago VALUES (314, 'Divisa', 4105, 244);
INSERT INTO public.t_formasdepago VALUES (315, 'Tranferencia', 2926.04, 245);
INSERT INTO public.t_formasdepago VALUES (316, 'Divisa', 4105, 245);
INSERT INTO public.t_formasdepago VALUES (317, 'Tranferencia', 2926.04, 246);
INSERT INTO public.t_formasdepago VALUES (318, 'Divisa', 4105, 246);
INSERT INTO public.t_formasdepago VALUES (319, 'Tranferencia', 2926.04, 247);
INSERT INTO public.t_formasdepago VALUES (320, 'Divisa', 4105, 247);
INSERT INTO public.t_formasdepago VALUES (321, 'Tranferencia', 2926.04, 248);
INSERT INTO public.t_formasdepago VALUES (322, 'Divisa', 4105, 248);
INSERT INTO public.t_formasdepago VALUES (323, 'Tranferencia', 2926.04, 249);
INSERT INTO public.t_formasdepago VALUES (324, 'Divisa', 4105, 249);
INSERT INTO public.t_formasdepago VALUES (325, 'Tranferencia', 2926.04, 250);
INSERT INTO public.t_formasdepago VALUES (326, 'Divisa', 4105, 250);
INSERT INTO public.t_formasdepago VALUES (327, 'Tranferencia', 2926.04, 251);
INSERT INTO public.t_formasdepago VALUES (328, 'Divisa', 4105, 251);
INSERT INTO public.t_formasdepago VALUES (329, 'Tranferencia', 2926.04, 252);
INSERT INTO public.t_formasdepago VALUES (330, 'Divisa', 4105, 252);
INSERT INTO public.t_formasdepago VALUES (331, 'Tranferencia', 2926.04, 253);
INSERT INTO public.t_formasdepago VALUES (332, 'Divisa', 4105, 253);
INSERT INTO public.t_formasdepago VALUES (333, 'Tranferencia', 2926.04, 254);
INSERT INTO public.t_formasdepago VALUES (334, 'Efectivo', 4105, 254);
INSERT INTO public.t_formasdepago VALUES (335, 'Tranferencia', 2926.04, 255);
INSERT INTO public.t_formasdepago VALUES (336, 'Efectivo', 4105, 255);
INSERT INTO public.t_formasdepago VALUES (337, 'Tranferencia', 2926.04, 256);
INSERT INTO public.t_formasdepago VALUES (338, 'Efectivo', 4105, 256);
INSERT INTO public.t_formasdepago VALUES (339, 'Tranferencia', 2926.04, 257);
INSERT INTO public.t_formasdepago VALUES (340, 'Efectivo', 4105, 257);
INSERT INTO public.t_formasdepago VALUES (341, 'Tranferencia', 2926.04, 258);
INSERT INTO public.t_formasdepago VALUES (342, 'Efectivo', 4105, 258);
INSERT INTO public.t_formasdepago VALUES (343, 'Tranferencia', 2926.04, 259);
INSERT INTO public.t_formasdepago VALUES (344, 'Efectivo', 4105, 259);
INSERT INTO public.t_formasdepago VALUES (345, 'Tranferencia', 2926.04, 260);
INSERT INTO public.t_formasdepago VALUES (346, 'Efectivo', 4105, 260);
INSERT INTO public.t_formasdepago VALUES (347, 'Tranferencia', 2926.04, 261);
INSERT INTO public.t_formasdepago VALUES (348, 'Efectivo', 4105, 261);
INSERT INTO public.t_formasdepago VALUES (349, 'Tranferencia', 2926.04, 262);
INSERT INTO public.t_formasdepago VALUES (350, 'Efectivo', 4105, 262);
INSERT INTO public.t_formasdepago VALUES (351, 'Tranferencia', 2926.04, 263);
INSERT INTO public.t_formasdepago VALUES (352, 'Efectivo', 4105, 263);
INSERT INTO public.t_formasdepago VALUES (353, 'Tranferencia', 2926.04, 264);
INSERT INTO public.t_formasdepago VALUES (354, 'Efectivo', 4105, 264);
INSERT INTO public.t_formasdepago VALUES (355, 'Tranferencia', 2926.04, 265);
INSERT INTO public.t_formasdepago VALUES (356, 'Efectivo', 4105, 265);
INSERT INTO public.t_formasdepago VALUES (357, 'Tranferencia', 2926.04, 266);
INSERT INTO public.t_formasdepago VALUES (358, 'Efectivo', 4105, 266);
INSERT INTO public.t_formasdepago VALUES (359, 'Tranferencia', 2926.04, 267);
INSERT INTO public.t_formasdepago VALUES (360, 'Efectivo', 4105, 267);
INSERT INTO public.t_formasdepago VALUES (361, 'Tranferencia', 2926.04, 268);
INSERT INTO public.t_formasdepago VALUES (362, 'Efectivo', 4105, 268);
INSERT INTO public.t_formasdepago VALUES (363, 'Tranferencia', 2926.04, 269);
INSERT INTO public.t_formasdepago VALUES (364, 'Efectivo', 4105, 269);
INSERT INTO public.t_formasdepago VALUES (365, 'Tranferencia', 2926.04, 270);
INSERT INTO public.t_formasdepago VALUES (366, 'Efectivo', 4105, 270);
INSERT INTO public.t_formasdepago VALUES (367, 'Tranferencia', 2926.04, 271);
INSERT INTO public.t_formasdepago VALUES (368, 'Efectivo', 4105, 271);
INSERT INTO public.t_formasdepago VALUES (369, 'Tranferencia', 2926.04, 272);
INSERT INTO public.t_formasdepago VALUES (370, 'Efectivo', 4105, 272);
INSERT INTO public.t_formasdepago VALUES (371, 'Tranferencia', 2926.04, 273);
INSERT INTO public.t_formasdepago VALUES (372, 'Efectivo', 4105, 273);
INSERT INTO public.t_formasdepago VALUES (373, 'Tranferencia', 2926.04, 274);
INSERT INTO public.t_formasdepago VALUES (374, 'Efectivo', 4105, 274);
INSERT INTO public.t_formasdepago VALUES (375, 'Tranferencia', 2926.04, 275);
INSERT INTO public.t_formasdepago VALUES (376, 'Efectivo', 4105, 275);
INSERT INTO public.t_formasdepago VALUES (377, 'Tranferencia', 2926.04, 276);
INSERT INTO public.t_formasdepago VALUES (378, 'Efectivo', 4105, 276);
INSERT INTO public.t_formasdepago VALUES (379, 'Tranferencia', 2926.04, 277);
INSERT INTO public.t_formasdepago VALUES (380, 'Efectivo', 4105, 277);
INSERT INTO public.t_formasdepago VALUES (381, 'Tranferencia', 2926.04, 278);
INSERT INTO public.t_formasdepago VALUES (382, 'Efectivo', 4105, 278);
INSERT INTO public.t_formasdepago VALUES (383, 'Tranferencia', 2926.04, 279);
INSERT INTO public.t_formasdepago VALUES (384, 'Efectivo', 4105, 279);
INSERT INTO public.t_formasdepago VALUES (385, 'Tranferencia', 2926.04, 280);
INSERT INTO public.t_formasdepago VALUES (386, 'Efectivo', 4105, 280);
INSERT INTO public.t_formasdepago VALUES (387, 'Tranferencia', 2926.04, 281);
INSERT INTO public.t_formasdepago VALUES (388, 'Efectivo', 4105, 281);
INSERT INTO public.t_formasdepago VALUES (389, 'Tranferencia', 2926.04, 282);
INSERT INTO public.t_formasdepago VALUES (390, 'Efectivo', 4105, 282);
INSERT INTO public.t_formasdepago VALUES (391, 'Tranferencia', 2926.04, 283);
INSERT INTO public.t_formasdepago VALUES (392, 'Efectivo', 4105, 283);
INSERT INTO public.t_formasdepago VALUES (393, 'Tranferencia', 2926.04, 284);
INSERT INTO public.t_formasdepago VALUES (394, 'Efectivo', 4105, 284);
INSERT INTO public.t_formasdepago VALUES (395, 'Tranferencia', 2926.04, 285);
INSERT INTO public.t_formasdepago VALUES (396, 'Efectivo', 4105, 285);
INSERT INTO public.t_formasdepago VALUES (397, 'Tranferencia', 2926.04, 286);
INSERT INTO public.t_formasdepago VALUES (398, 'Efectivo', 4105, 286);
INSERT INTO public.t_formasdepago VALUES (399, 'Tranferencia', 2926.04, 287);
INSERT INTO public.t_formasdepago VALUES (400, 'Efectivo', 4105, 287);
INSERT INTO public.t_formasdepago VALUES (401, 'Tranferencia', 2926.04, 288);
INSERT INTO public.t_formasdepago VALUES (402, 'Efectivo', 4105, 288);
INSERT INTO public.t_formasdepago VALUES (403, 'Tranferencia', 2926.04, 289);
INSERT INTO public.t_formasdepago VALUES (404, 'Efectivo', 4105, 289);
INSERT INTO public.t_formasdepago VALUES (405, 'Tranferencia', 2926.04, 290);
INSERT INTO public.t_formasdepago VALUES (406, 'Efectivo', 4105, 290);
INSERT INTO public.t_formasdepago VALUES (407, 'Tranferencia', 2926.04, 291);
INSERT INTO public.t_formasdepago VALUES (408, 'Efectivo', 4105, 291);
INSERT INTO public.t_formasdepago VALUES (409, 'Tranferencia', 2926.04, 292);
INSERT INTO public.t_formasdepago VALUES (410, 'Efectivo', 4105, 292);
INSERT INTO public.t_formasdepago VALUES (411, 'Tranferencia', 2926.04, 293);
INSERT INTO public.t_formasdepago VALUES (412, 'Efectivo', 4105, 293);
INSERT INTO public.t_formasdepago VALUES (413, 'Tranferencia', 2926.04, 294);
INSERT INTO public.t_formasdepago VALUES (414, 'Efectivo', 4105, 294);
INSERT INTO public.t_formasdepago VALUES (415, 'Tranferencia', 2926.04, 295);
INSERT INTO public.t_formasdepago VALUES (416, 'Efectivo', 4105, 295);
INSERT INTO public.t_formasdepago VALUES (417, 'Tranferencia', 2926.04, 296);
INSERT INTO public.t_formasdepago VALUES (418, 'Efectivo', 4105, 296);
INSERT INTO public.t_formasdepago VALUES (419, 'Tranferencia', 2926.04, 297);
INSERT INTO public.t_formasdepago VALUES (420, 'Efectivo', 4105, 297);
INSERT INTO public.t_formasdepago VALUES (421, 'Tranferencia', 2926.04, 298);
INSERT INTO public.t_formasdepago VALUES (422, 'Efectivo', 4105, 298);
INSERT INTO public.t_formasdepago VALUES (423, 'Tranferencia', 2926.04, 299);
INSERT INTO public.t_formasdepago VALUES (424, 'Efectivo', 4105, 299);
INSERT INTO public.t_formasdepago VALUES (425, 'Tranferencia', 2926.04, 300);
INSERT INTO public.t_formasdepago VALUES (426, 'Efectivo', 4105, 300);
INSERT INTO public.t_formasdepago VALUES (427, 'Tranferencia', 2926.04, 301);
INSERT INTO public.t_formasdepago VALUES (428, 'Efectivo', 4105, 301);
INSERT INTO public.t_formasdepago VALUES (429, 'Tranferencia', 2926.04, 302);
INSERT INTO public.t_formasdepago VALUES (430, 'Efectivo', 4105, 302);
INSERT INTO public.t_formasdepago VALUES (431, 'Tranferencia', 2926.04, 303);
INSERT INTO public.t_formasdepago VALUES (432, 'Efectivo', 4105, 303);
INSERT INTO public.t_formasdepago VALUES (433, 'Tranferencia', 2926.04, 304);
INSERT INTO public.t_formasdepago VALUES (434, 'Efectivo', 4105, 304);
INSERT INTO public.t_formasdepago VALUES (435, 'Tranferencia', 2926.04, 305);
INSERT INTO public.t_formasdepago VALUES (436, 'Efectivo', 4105, 305);
INSERT INTO public.t_formasdepago VALUES (437, 'Tranferencia', 2926.04, 306);
INSERT INTO public.t_formasdepago VALUES (438, 'Efectivo', 4105, 306);
INSERT INTO public.t_formasdepago VALUES (439, 'Tranferencia', 2926.04, 307);
INSERT INTO public.t_formasdepago VALUES (440, 'Efectivo', 4105, 307);
INSERT INTO public.t_formasdepago VALUES (441, 'Tranferencia', 2926.04, 308);
INSERT INTO public.t_formasdepago VALUES (442, 'Efectivo', 4105, 308);
INSERT INTO public.t_formasdepago VALUES (443, 'Tranferencia', 2926.04, 309);
INSERT INTO public.t_formasdepago VALUES (444, 'Efectivo', 4105, 309);
INSERT INTO public.t_formasdepago VALUES (445, 'Tranferencia', 2926.04, 310);
INSERT INTO public.t_formasdepago VALUES (446, 'Efectivo', 4105, 310);
INSERT INTO public.t_formasdepago VALUES (447, 'Tranferencia', 2926.04, 311);
INSERT INTO public.t_formasdepago VALUES (448, 'Efectivo', 4105, 311);
INSERT INTO public.t_formasdepago VALUES (449, 'Tranferencia', 2926.04, 312);
INSERT INTO public.t_formasdepago VALUES (450, 'Efectivo', 4105, 312);
INSERT INTO public.t_formasdepago VALUES (451, 'Tranferencia', 2926.04, 313);
INSERT INTO public.t_formasdepago VALUES (452, 'Efectivo', 4105, 313);
INSERT INTO public.t_formasdepago VALUES (453, 'Tranferencia', 2926.04, 314);
INSERT INTO public.t_formasdepago VALUES (454, 'Efectivo', 4105, 314);
INSERT INTO public.t_formasdepago VALUES (455, 'Tranferencia', 2926.04, 315);
INSERT INTO public.t_formasdepago VALUES (456, 'Efectivo', 4105, 315);
INSERT INTO public.t_formasdepago VALUES (457, 'Tranferencia', 2926.04, 316);
INSERT INTO public.t_formasdepago VALUES (458, 'Efectivo', 4105, 316);
INSERT INTO public.t_formasdepago VALUES (459, 'Tranferencia', 2926.04, 317);
INSERT INTO public.t_formasdepago VALUES (460, 'Efectivo', 4105, 317);
INSERT INTO public.t_formasdepago VALUES (461, 'Tranferencia', 2926.04, 318);
INSERT INTO public.t_formasdepago VALUES (462, 'Efectivo', 4105, 318);
INSERT INTO public.t_formasdepago VALUES (463, 'Tranferencia', 2926.04, 319);
INSERT INTO public.t_formasdepago VALUES (464, 'Efectivo', 4105, 319);
INSERT INTO public.t_formasdepago VALUES (465, 'Tranferencia', 2926.04, 320);
INSERT INTO public.t_formasdepago VALUES (466, 'Efectivo', 4105, 320);
INSERT INTO public.t_formasdepago VALUES (467, 'Tranferencia', 2926.04, 321);
INSERT INTO public.t_formasdepago VALUES (468, 'Efectivo', 4105, 321);
INSERT INTO public.t_formasdepago VALUES (469, 'Tranferencia', 2926.04, 322);
INSERT INTO public.t_formasdepago VALUES (470, 'Efectivo', 4105, 322);
INSERT INTO public.t_formasdepago VALUES (471, 'Tranferencia', 2926.04, 323);
INSERT INTO public.t_formasdepago VALUES (472, 'Efectivo', 4105, 323);
INSERT INTO public.t_formasdepago VALUES (473, 'Tranferencia', 2926.04, 324);
INSERT INTO public.t_formasdepago VALUES (474, 'Efectivo', 4105, 324);
INSERT INTO public.t_formasdepago VALUES (475, 'Tranferencia', 2926.04, 325);
INSERT INTO public.t_formasdepago VALUES (476, 'Efectivo', 4105, 325);
INSERT INTO public.t_formasdepago VALUES (477, 'Tranferencia', 2926.04, 326);
INSERT INTO public.t_formasdepago VALUES (478, 'Efectivo', 4105, 326);
INSERT INTO public.t_formasdepago VALUES (479, 'Tranferencia', 2926.04, 327);
INSERT INTO public.t_formasdepago VALUES (480, 'Efectivo', 4105, 327);
INSERT INTO public.t_formasdepago VALUES (481, 'Tranferencia', 2926.04, 328);
INSERT INTO public.t_formasdepago VALUES (482, 'Efectivo', 4105, 328);
INSERT INTO public.t_formasdepago VALUES (483, 'Tranferencia', 2926.04, 329);
INSERT INTO public.t_formasdepago VALUES (484, 'Efectivo', 4105, 329);
INSERT INTO public.t_formasdepago VALUES (485, 'Tranferencia', 2926.04, 330);
INSERT INTO public.t_formasdepago VALUES (486, 'Efectivo', 4105, 330);
INSERT INTO public.t_formasdepago VALUES (487, 'Tranferencia', 2926.04, 331);
INSERT INTO public.t_formasdepago VALUES (488, 'Efectivo', 4105, 331);
INSERT INTO public.t_formasdepago VALUES (489, 'Tranferencia', 2926.04, 332);
INSERT INTO public.t_formasdepago VALUES (490, 'Efectivo', 4105, 332);
INSERT INTO public.t_formasdepago VALUES (491, 'Tranferencia', 2926.04, 333);
INSERT INTO public.t_formasdepago VALUES (492, 'Efectivo', 4105, 333);
INSERT INTO public.t_formasdepago VALUES (493, 'Tranferencia', 2926.04, 334);
INSERT INTO public.t_formasdepago VALUES (494, 'Efectivo', 4105, 334);
INSERT INTO public.t_formasdepago VALUES (495, 'Tranferencia', 2926.04, 335);
INSERT INTO public.t_formasdepago VALUES (496, 'Efectivo', 4105, 335);
INSERT INTO public.t_formasdepago VALUES (497, 'Tranferencia', 2926.04, 336);
INSERT INTO public.t_formasdepago VALUES (498, 'Efectivo', 4105, 336);
INSERT INTO public.t_formasdepago VALUES (499, 'Tranferencia', 2926.04, 337);
INSERT INTO public.t_formasdepago VALUES (500, 'Efectivo', 4105, 337);
INSERT INTO public.t_formasdepago VALUES (501, 'Tranferencia', 2926.04, 338);
INSERT INTO public.t_formasdepago VALUES (502, 'Efectivo', 4105, 338);
INSERT INTO public.t_formasdepago VALUES (503, 'Tranferencia', 2926.04, 339);
INSERT INTO public.t_formasdepago VALUES (504, 'Efectivo', 4105, 339);
INSERT INTO public.t_formasdepago VALUES (505, 'Tranferencia', 2926.04, 340);
INSERT INTO public.t_formasdepago VALUES (506, 'Efectivo', 4105, 340);
INSERT INTO public.t_formasdepago VALUES (507, 'Tranferencia', 2926.04, 341);
INSERT INTO public.t_formasdepago VALUES (508, 'Efectivo', 4105, 341);
INSERT INTO public.t_formasdepago VALUES (509, 'Tranferencia', 2926.04, 342);
INSERT INTO public.t_formasdepago VALUES (510, 'Efectivo', 4105, 342);
INSERT INTO public.t_formasdepago VALUES (511, 'Tranferencia', 2926.04, 343);
INSERT INTO public.t_formasdepago VALUES (512, 'Efectivo', 4105, 343);
INSERT INTO public.t_formasdepago VALUES (513, 'Tranferencia', 2926.04, 344);
INSERT INTO public.t_formasdepago VALUES (514, 'Efectivo', 4105, 344);
INSERT INTO public.t_formasdepago VALUES (515, 'Tranferencia', 2926.04, 345);
INSERT INTO public.t_formasdepago VALUES (516, 'Efectivo', 4105, 345);
INSERT INTO public.t_formasdepago VALUES (517, 'Tranferencia', 2926.04, 346);
INSERT INTO public.t_formasdepago VALUES (518, 'Efectivo', 4105, 346);
INSERT INTO public.t_formasdepago VALUES (519, 'Tranferencia', 2926.04, 347);
INSERT INTO public.t_formasdepago VALUES (520, 'Efectivo', 4105, 347);
INSERT INTO public.t_formasdepago VALUES (521, 'Tranferencia', 2926.04, 348);
INSERT INTO public.t_formasdepago VALUES (522, 'Efectivo', 4105, 348);
INSERT INTO public.t_formasdepago VALUES (523, 'Tranferencia', 2926.04, 349);
INSERT INTO public.t_formasdepago VALUES (524, 'Efectivo', 4105, 349);
INSERT INTO public.t_formasdepago VALUES (525, 'Tranferencia', 2926.04, 350);
INSERT INTO public.t_formasdepago VALUES (526, 'Efectivo', 4105, 350);
INSERT INTO public.t_formasdepago VALUES (527, 'Tranferencia', 2926.04, 351);
INSERT INTO public.t_formasdepago VALUES (528, 'Efectivo', 4105, 351);
INSERT INTO public.t_formasdepago VALUES (529, 'Tranferencia', 2926.04, 352);
INSERT INTO public.t_formasdepago VALUES (530, 'Efectivo', 4105, 352);
INSERT INTO public.t_formasdepago VALUES (531, 'Tranferencia', 2926.04, 353);
INSERT INTO public.t_formasdepago VALUES (532, 'Efectivo', 4105, 353);
INSERT INTO public.t_formasdepago VALUES (533, 'Tranferencia', 2926.04, 354);
INSERT INTO public.t_formasdepago VALUES (534, 'Efectivo', 4105, 354);
INSERT INTO public.t_formasdepago VALUES (535, 'Tranferencia', 2926.04, 355);
INSERT INTO public.t_formasdepago VALUES (536, 'Efectivo', 4105, 355);
INSERT INTO public.t_formasdepago VALUES (537, 'Tranferencia', 2926.04, 356);
INSERT INTO public.t_formasdepago VALUES (538, 'Efectivo', 4105, 356);
INSERT INTO public.t_formasdepago VALUES (539, 'Tranferencia', 2926.04, 357);
INSERT INTO public.t_formasdepago VALUES (540, 'Efectivo', 4105, 357);
INSERT INTO public.t_formasdepago VALUES (541, 'Tranferencia', 2926.04, 358);
INSERT INTO public.t_formasdepago VALUES (542, 'Efectivo', 4105, 358);
INSERT INTO public.t_formasdepago VALUES (543, 'Tranferencia', 2926.04, 359);
INSERT INTO public.t_formasdepago VALUES (544, 'Efectivo', 4105, 359);
INSERT INTO public.t_formasdepago VALUES (545, 'Tranferencia', 2926.04, 360);
INSERT INTO public.t_formasdepago VALUES (546, 'Efectivo', 4105, 360);
INSERT INTO public.t_formasdepago VALUES (547, 'Tranferencia', 2926.04, 361);
INSERT INTO public.t_formasdepago VALUES (548, 'Efectivo', 4105, 361);
INSERT INTO public.t_formasdepago VALUES (549, 'Tranferencia', 2926.04, 362);
INSERT INTO public.t_formasdepago VALUES (550, 'Efectivo', 4105, 362);
INSERT INTO public.t_formasdepago VALUES (551, 'Tranferencia', 2926.04, 363);
INSERT INTO public.t_formasdepago VALUES (552, 'Efectivo', 4105, 363);
INSERT INTO public.t_formasdepago VALUES (553, 'Tranferencia', 2926.04, 364);
INSERT INTO public.t_formasdepago VALUES (554, 'Efectivo', 4105, 364);
INSERT INTO public.t_formasdepago VALUES (555, 'Tranferencia', 2926.04, 365);
INSERT INTO public.t_formasdepago VALUES (556, 'Efectivo', 4105, 365);
INSERT INTO public.t_formasdepago VALUES (557, 'Tranferencia', 2926.04, 366);
INSERT INTO public.t_formasdepago VALUES (558, 'Efectivo', 4105, 366);
INSERT INTO public.t_formasdepago VALUES (559, 'Tranferencia', 2926.04, 367);
INSERT INTO public.t_formasdepago VALUES (560, 'Efectivo', 4105, 367);
INSERT INTO public.t_formasdepago VALUES (561, 'Tranferencia', 2926.04, 368);
INSERT INTO public.t_formasdepago VALUES (562, 'Efectivo', 4105, 368);
INSERT INTO public.t_formasdepago VALUES (563, 'Tranferencia', 2926.04, 369);
INSERT INTO public.t_formasdepago VALUES (564, 'Efectivo', 4105, 369);
INSERT INTO public.t_formasdepago VALUES (565, 'Tranferencia', 2926.04, 370);
INSERT INTO public.t_formasdepago VALUES (566, 'Efectivo', 4105, 370);
INSERT INTO public.t_formasdepago VALUES (567, 'Tranferencia', 2926.04, 371);
INSERT INTO public.t_formasdepago VALUES (568, 'Efectivo', 4105, 371);
INSERT INTO public.t_formasdepago VALUES (569, 'Tranferencia', 2926.04, 372);
INSERT INTO public.t_formasdepago VALUES (570, 'Efectivo', 4105, 372);
INSERT INTO public.t_formasdepago VALUES (571, 'Tranferencia', 2926.04, 373);
INSERT INTO public.t_formasdepago VALUES (572, 'Efectivo', 4105, 373);
INSERT INTO public.t_formasdepago VALUES (573, 'Tranferencia', 2926.04, 374);
INSERT INTO public.t_formasdepago VALUES (574, 'Efectivo', 4105, 374);
INSERT INTO public.t_formasdepago VALUES (575, 'Tranferencia', 2926.04, 375);
INSERT INTO public.t_formasdepago VALUES (576, 'Efectivo', 4105, 375);
INSERT INTO public.t_formasdepago VALUES (577, 'Tranferencia', 2926.04, 376);
INSERT INTO public.t_formasdepago VALUES (578, 'Efectivo', 4105, 376);
INSERT INTO public.t_formasdepago VALUES (579, 'Tranferencia', 2926.04, 377);
INSERT INTO public.t_formasdepago VALUES (580, 'Efectivo', 4105, 377);
INSERT INTO public.t_formasdepago VALUES (581, 'Tranferencia', 2926.04, 378);
INSERT INTO public.t_formasdepago VALUES (582, 'Efectivo', 4105, 378);
INSERT INTO public.t_formasdepago VALUES (583, 'Tranferencia', 2926.04, 379);
INSERT INTO public.t_formasdepago VALUES (584, 'Efectivo', 4105, 379);
INSERT INTO public.t_formasdepago VALUES (585, 'Tranferencia', 2926.04, 380);
INSERT INTO public.t_formasdepago VALUES (586, 'Efectivo', 4105, 380);
INSERT INTO public.t_formasdepago VALUES (587, 'Tranferencia', 2926.04, 381);
INSERT INTO public.t_formasdepago VALUES (588, 'Efectivo', 4105, 381);
INSERT INTO public.t_formasdepago VALUES (589, 'Tranferencia', 2926.04, 382);
INSERT INTO public.t_formasdepago VALUES (590, 'Efectivo', 4105, 382);
INSERT INTO public.t_formasdepago VALUES (591, 'Tranferencia', 2926.04, 383);
INSERT INTO public.t_formasdepago VALUES (592, 'Efectivo', 4105, 383);
INSERT INTO public.t_formasdepago VALUES (593, 'Tranferencia', 2926.04, 384);
INSERT INTO public.t_formasdepago VALUES (594, 'Efectivo', 4105, 384);
INSERT INTO public.t_formasdepago VALUES (595, 'Tranferencia', 2926.04, 385);
INSERT INTO public.t_formasdepago VALUES (596, 'Efectivo', 4105, 385);
INSERT INTO public.t_formasdepago VALUES (597, 'Tranferencia', 2926.04, 386);
INSERT INTO public.t_formasdepago VALUES (598, 'Efectivo', 4105, 386);
INSERT INTO public.t_formasdepago VALUES (599, 'Tranferencia', 2926.04, 387);
INSERT INTO public.t_formasdepago VALUES (600, 'Efectivo', 4105, 387);
INSERT INTO public.t_formasdepago VALUES (601, 'Tranferencia', 2926.04, 388);
INSERT INTO public.t_formasdepago VALUES (602, 'Efectivo', 4105, 388);
INSERT INTO public.t_formasdepago VALUES (603, 'Tranferencia', 2926.04, 389);
INSERT INTO public.t_formasdepago VALUES (604, 'Efectivo', 4105, 389);
INSERT INTO public.t_formasdepago VALUES (605, 'Tranferencia', 2926.04, 390);
INSERT INTO public.t_formasdepago VALUES (606, 'Efectivo', 4105, 390);
INSERT INTO public.t_formasdepago VALUES (607, 'Tranferencia', 2926.04, 391);
INSERT INTO public.t_formasdepago VALUES (608, 'Efectivo', 4105, 391);
INSERT INTO public.t_formasdepago VALUES (609, 'Tranferencia', 2926.04, 392);
INSERT INTO public.t_formasdepago VALUES (610, 'Efectivo', 4105, 392);
INSERT INTO public.t_formasdepago VALUES (611, 'Tranferencia', 2926.04, 393);
INSERT INTO public.t_formasdepago VALUES (612, 'Efectivo', 4105, 393);
INSERT INTO public.t_formasdepago VALUES (613, 'Tranferencia', 2926.04, 394);
INSERT INTO public.t_formasdepago VALUES (614, 'Efectivo', 4105, 394);
INSERT INTO public.t_formasdepago VALUES (615, 'Tranferencia', 2926.04, 395);
INSERT INTO public.t_formasdepago VALUES (616, 'Efectivo', 4105, 395);
INSERT INTO public.t_formasdepago VALUES (617, 'Tranferencia', 2926.04, 396);
INSERT INTO public.t_formasdepago VALUES (618, 'Efectivo', 4105, 396);
INSERT INTO public.t_formasdepago VALUES (619, 'Tranferencia', 2926.04, 397);
INSERT INTO public.t_formasdepago VALUES (620, 'Efectivo', 4105, 397);
INSERT INTO public.t_formasdepago VALUES (621, 'Tranferencia', 2926.04, 398);
INSERT INTO public.t_formasdepago VALUES (622, 'Efectivo', 4105, 398);
INSERT INTO public.t_formasdepago VALUES (623, 'Tranferencia', 2926.04, 399);
INSERT INTO public.t_formasdepago VALUES (624, 'Efectivo', 4105, 399);
INSERT INTO public.t_formasdepago VALUES (625, 'Tranferencia', 2926.04, 400);
INSERT INTO public.t_formasdepago VALUES (626, 'Efectivo', 4105, 400);
INSERT INTO public.t_formasdepago VALUES (627, 'Tranferencia', 2926.04, 401);
INSERT INTO public.t_formasdepago VALUES (628, 'Efectivo', 4105, 401);
INSERT INTO public.t_formasdepago VALUES (629, 'Tranferencia', 2926.04, 402);
INSERT INTO public.t_formasdepago VALUES (630, 'Efectivo', 4105, 402);
INSERT INTO public.t_formasdepago VALUES (631, 'Tranferencia', 2926.04, 403);
INSERT INTO public.t_formasdepago VALUES (632, 'Efectivo', 4105, 403);
INSERT INTO public.t_formasdepago VALUES (633, 'Tranferencia', 2926.04, 404);
INSERT INTO public.t_formasdepago VALUES (634, 'Efectivo', 4105, 404);
INSERT INTO public.t_formasdepago VALUES (635, 'Tranferencia', 2926.04, 405);
INSERT INTO public.t_formasdepago VALUES (636, 'Efectivo', 4105, 405);
INSERT INTO public.t_formasdepago VALUES (637, 'Tranferencia', 2926.04, 406);
INSERT INTO public.t_formasdepago VALUES (638, 'Efectivo', 4105, 406);
INSERT INTO public.t_formasdepago VALUES (639, 'Tranferencia', 2926.04, 407);
INSERT INTO public.t_formasdepago VALUES (640, 'Efectivo', 4105, 407);
INSERT INTO public.t_formasdepago VALUES (641, 'Tranferencia', 2926.04, 408);
INSERT INTO public.t_formasdepago VALUES (642, 'Efectivo', 4105, 408);
INSERT INTO public.t_formasdepago VALUES (643, 'Tranferencia', 2926.04, 409);
INSERT INTO public.t_formasdepago VALUES (644, 'Efectivo', 4105, 409);
INSERT INTO public.t_formasdepago VALUES (645, 'Tranferencia', 2926.04, 410);
INSERT INTO public.t_formasdepago VALUES (646, 'Efectivo', 4105, 410);
INSERT INTO public.t_formasdepago VALUES (647, 'Tranferencia', 2926.04, 411);
INSERT INTO public.t_formasdepago VALUES (648, 'Efectivo', 4105, 411);
INSERT INTO public.t_formasdepago VALUES (649, 'Tranferencia', 2926.04, 412);
INSERT INTO public.t_formasdepago VALUES (650, 'Efectivo', 4105, 412);
INSERT INTO public.t_formasdepago VALUES (651, 'Tranferencia', 2926.04, 413);
INSERT INTO public.t_formasdepago VALUES (652, 'Efectivo', 4105, 413);
INSERT INTO public.t_formasdepago VALUES (653, 'Tranferencia', 2926.04, 414);
INSERT INTO public.t_formasdepago VALUES (654, 'Efectivo', 4105, 414);
INSERT INTO public.t_formasdepago VALUES (655, 'Tranferencia', 2926.04, 415);
INSERT INTO public.t_formasdepago VALUES (656, 'Efectivo', 4105, 415);
INSERT INTO public.t_formasdepago VALUES (657, 'Tranferencia', 2926.04, 416);
INSERT INTO public.t_formasdepago VALUES (658, 'Efectivo', 4105, 416);
INSERT INTO public.t_formasdepago VALUES (659, 'Tranferencia', 2926.04, 417);
INSERT INTO public.t_formasdepago VALUES (660, 'Efectivo', 4105, 417);
INSERT INTO public.t_formasdepago VALUES (661, 'Tranferencia', 2926.04, 418);
INSERT INTO public.t_formasdepago VALUES (662, 'Efectivo', 4105, 418);
INSERT INTO public.t_formasdepago VALUES (663, 'Tranferencia', 2926.04, 419);
INSERT INTO public.t_formasdepago VALUES (664, 'Efectivo', 4105, 419);
INSERT INTO public.t_formasdepago VALUES (665, 'Tranferencia', 2926.04, 420);
INSERT INTO public.t_formasdepago VALUES (666, 'Efectivo', 4105, 420);
INSERT INTO public.t_formasdepago VALUES (667, 'Tranferencia', 2926.04, 421);
INSERT INTO public.t_formasdepago VALUES (668, 'Efectivo', 4105, 421);
INSERT INTO public.t_formasdepago VALUES (669, 'Tranferencia', 2926.04, 422);
INSERT INTO public.t_formasdepago VALUES (670, 'Efectivo', 4105, 422);
INSERT INTO public.t_formasdepago VALUES (671, 'Tranferencia', 2926.04, 423);
INSERT INTO public.t_formasdepago VALUES (672, 'Efectivo', 4105, 423);
INSERT INTO public.t_formasdepago VALUES (673, 'Tranferencia', 2926.04, 424);
INSERT INTO public.t_formasdepago VALUES (674, 'Efectivo', 4105, 424);
INSERT INTO public.t_formasdepago VALUES (675, 'Tranferencia', 2926.04, 425);
INSERT INTO public.t_formasdepago VALUES (676, 'Efectivo', 4105, 425);
INSERT INTO public.t_formasdepago VALUES (677, 'Tranferencia', 2926.04, 426);
INSERT INTO public.t_formasdepago VALUES (678, 'Efectivo', 4105, 426);
INSERT INTO public.t_formasdepago VALUES (679, 'Tranferencia', 2926.04, 427);
INSERT INTO public.t_formasdepago VALUES (680, 'Efectivo', 4105, 427);
INSERT INTO public.t_formasdepago VALUES (681, 'Tranferencia', 2926.04, 428);
INSERT INTO public.t_formasdepago VALUES (682, 'Efectivo', 4105, 428);
INSERT INTO public.t_formasdepago VALUES (683, 'Tranferencia', 2926.04, 429);
INSERT INTO public.t_formasdepago VALUES (684, 'Efectivo', 4105, 429);
INSERT INTO public.t_formasdepago VALUES (685, 'Tranferencia', 2926.04, 430);
INSERT INTO public.t_formasdepago VALUES (686, 'Efectivo', 4105, 430);
INSERT INTO public.t_formasdepago VALUES (687, 'Tranferencia', 2926.04, 431);
INSERT INTO public.t_formasdepago VALUES (688, 'Efectivo', 4105, 431);
INSERT INTO public.t_formasdepago VALUES (689, 'Tranferencia', 2926.04, 432);
INSERT INTO public.t_formasdepago VALUES (690, 'Efectivo', 4105, 432);
INSERT INTO public.t_formasdepago VALUES (691, 'Tranferencia', 2926.04, 433);
INSERT INTO public.t_formasdepago VALUES (692, 'Efectivo', 4105, 433);
INSERT INTO public.t_formasdepago VALUES (693, 'Tranferencia', 2926.04, 434);
INSERT INTO public.t_formasdepago VALUES (694, 'Efectivo', 4105, 434);
INSERT INTO public.t_formasdepago VALUES (695, 'Tranferencia', 2926.04, 435);
INSERT INTO public.t_formasdepago VALUES (696, 'Efectivo', 4105, 435);
INSERT INTO public.t_formasdepago VALUES (697, 'Tranferencia', 2926.04, 436);
INSERT INTO public.t_formasdepago VALUES (698, 'Efectivo', 4105, 436);
INSERT INTO public.t_formasdepago VALUES (699, 'Tranferencia', 2926.04, 437);
INSERT INTO public.t_formasdepago VALUES (700, 'Efectivo', 4105, 437);
INSERT INTO public.t_formasdepago VALUES (701, 'Tranferencia', 2926.04, 438);
INSERT INTO public.t_formasdepago VALUES (702, 'Efectivo', 4105, 438);
INSERT INTO public.t_formasdepago VALUES (703, 'Tranferencia', 2926.04, 439);
INSERT INTO public.t_formasdepago VALUES (704, 'Efectivo', 4105, 439);
INSERT INTO public.t_formasdepago VALUES (705, 'Tranferencia', 2926.04, 440);
INSERT INTO public.t_formasdepago VALUES (706, 'Efectivo', 4105, 440);
INSERT INTO public.t_formasdepago VALUES (707, 'Tranferencia', 2926.04, 441);
INSERT INTO public.t_formasdepago VALUES (708, 'Efectivo', 4105, 441);
INSERT INTO public.t_formasdepago VALUES (709, 'Tranferencia', 2926.04, 442);
INSERT INTO public.t_formasdepago VALUES (710, 'Efectivo', 4105, 442);
INSERT INTO public.t_formasdepago VALUES (711, 'Tranferencia', 2926.04, 443);
INSERT INTO public.t_formasdepago VALUES (712, 'Efectivo', 4105, 443);
INSERT INTO public.t_formasdepago VALUES (713, 'Tranferencia', 2926.04, 444);
INSERT INTO public.t_formasdepago VALUES (714, 'Efectivo', 4105, 444);
INSERT INTO public.t_formasdepago VALUES (715, 'Tranferencia', 2926.04, 445);
INSERT INTO public.t_formasdepago VALUES (716, 'Efectivo', 4105, 445);
INSERT INTO public.t_formasdepago VALUES (717, 'Tranferencia', 2926.04, 446);
INSERT INTO public.t_formasdepago VALUES (718, 'Efectivo', 4105, 446);
INSERT INTO public.t_formasdepago VALUES (719, 'Tranferencia', 2926.04, 447);
INSERT INTO public.t_formasdepago VALUES (720, 'Efectivo', 4105, 447);
INSERT INTO public.t_formasdepago VALUES (721, 'Tranferencia', 2926.04, 448);
INSERT INTO public.t_formasdepago VALUES (722, 'Efectivo', 4105, 448);
INSERT INTO public.t_formasdepago VALUES (723, 'Tranferencia', 2926.04, 449);
INSERT INTO public.t_formasdepago VALUES (724, 'Efectivo', 4105, 449);
INSERT INTO public.t_formasdepago VALUES (725, 'Tranferencia', 2926.04, 450);
INSERT INTO public.t_formasdepago VALUES (726, 'Efectivo', 4105, 450);
INSERT INTO public.t_formasdepago VALUES (727, 'Tranferencia', 2926.04, 451);
INSERT INTO public.t_formasdepago VALUES (728, 'Efectivo', 4105, 451);
INSERT INTO public.t_formasdepago VALUES (729, 'Tranferencia', 2926.04, 452);
INSERT INTO public.t_formasdepago VALUES (730, 'Efectivo', 4105, 452);
INSERT INTO public.t_formasdepago VALUES (731, 'Tranferencia', 2926.04, 453);
INSERT INTO public.t_formasdepago VALUES (732, 'Efectivo', 4105, 453);
INSERT INTO public.t_formasdepago VALUES (733, 'Tranferencia', 2926.04, 454);
INSERT INTO public.t_formasdepago VALUES (734, 'Efectivo', 4105, 454);
INSERT INTO public.t_formasdepago VALUES (735, 'Tranferencia', 2926.04, 455);
INSERT INTO public.t_formasdepago VALUES (736, 'Efectivo', 4105, 455);
INSERT INTO public.t_formasdepago VALUES (737, 'Tranferencia', 2926.04, 456);
INSERT INTO public.t_formasdepago VALUES (738, 'Efectivo', 4105, 456);
INSERT INTO public.t_formasdepago VALUES (739, 'Tranferencia', 2926.04, 457);
INSERT INTO public.t_formasdepago VALUES (740, 'Efectivo', 4105, 457);
INSERT INTO public.t_formasdepago VALUES (741, 'Tranferencia', 2926.04, 458);
INSERT INTO public.t_formasdepago VALUES (742, 'Efectivo', 4105, 458);
INSERT INTO public.t_formasdepago VALUES (743, 'Tranferencia', 2926.04, 459);
INSERT INTO public.t_formasdepago VALUES (744, 'Efectivo', 4105, 459);
INSERT INTO public.t_formasdepago VALUES (745, 'Tranferencia', 2926.04, 460);
INSERT INTO public.t_formasdepago VALUES (746, 'Efectivo', 4105, 460);
INSERT INTO public.t_formasdepago VALUES (747, 'Tranferencia', 2926.04, 461);
INSERT INTO public.t_formasdepago VALUES (748, 'Efectivo', 4105, 461);
INSERT INTO public.t_formasdepago VALUES (749, 'Tranferencia', 2926.04, 462);
INSERT INTO public.t_formasdepago VALUES (750, 'Efectivo', 4105, 462);
INSERT INTO public.t_formasdepago VALUES (751, 'Tranferencia', 2926.04, 463);
INSERT INTO public.t_formasdepago VALUES (752, 'Efectivo', 4105, 463);
INSERT INTO public.t_formasdepago VALUES (753, 'Tranferencia', 2926.04, 464);
INSERT INTO public.t_formasdepago VALUES (754, 'Efectivo', 4105, 464);
INSERT INTO public.t_formasdepago VALUES (755, 'Tranferencia', 2926.04, 465);
INSERT INTO public.t_formasdepago VALUES (756, 'Efectivo', 4105, 465);
INSERT INTO public.t_formasdepago VALUES (757, 'Tranferencia', 2926.04, 466);
INSERT INTO public.t_formasdepago VALUES (758, 'Efectivo', 4105, 466);
INSERT INTO public.t_formasdepago VALUES (759, 'Tranferencia', 2926.04, 467);
INSERT INTO public.t_formasdepago VALUES (760, 'Efectivo', 4105, 467);
INSERT INTO public.t_formasdepago VALUES (761, 'Tranferencia', 2926.04, 468);
INSERT INTO public.t_formasdepago VALUES (762, 'Efectivo', 4105, 468);
INSERT INTO public.t_formasdepago VALUES (763, 'Tranferencia', 2926.04, 469);
INSERT INTO public.t_formasdepago VALUES (764, 'Efectivo', 4105, 469);
INSERT INTO public.t_formasdepago VALUES (765, 'Tranferencia', 2926.04, 470);
INSERT INTO public.t_formasdepago VALUES (766, 'Efectivo', 4105, 470);
INSERT INTO public.t_formasdepago VALUES (767, 'Tranferencia', 2926.04, 471);
INSERT INTO public.t_formasdepago VALUES (768, 'Efectivo', 4105, 471);
INSERT INTO public.t_formasdepago VALUES (769, 'Tranferencia', 2926.04, 472);
INSERT INTO public.t_formasdepago VALUES (770, 'Efectivo', 4105, 472);
INSERT INTO public.t_formasdepago VALUES (771, 'Tranferencia', 2926.04, 473);
INSERT INTO public.t_formasdepago VALUES (772, 'Efectivo', 4105, 473);
INSERT INTO public.t_formasdepago VALUES (773, 'Tranferencia', 2926.04, 474);
INSERT INTO public.t_formasdepago VALUES (774, 'Efectivo', 4105, 474);
INSERT INTO public.t_formasdepago VALUES (775, 'Tranferencia', 2926.04, 475);
INSERT INTO public.t_formasdepago VALUES (776, 'Efectivo', 4105, 475);
INSERT INTO public.t_formasdepago VALUES (777, 'Tranferencia', 2926.04, 476);
INSERT INTO public.t_formasdepago VALUES (778, 'Efectivo', 4105, 476);
INSERT INTO public.t_formasdepago VALUES (779, 'Tranferencia', 2926.04, 477);
INSERT INTO public.t_formasdepago VALUES (780, 'Efectivo', 4105, 477);
INSERT INTO public.t_formasdepago VALUES (781, 'Tranferencia', 2926.04, 478);
INSERT INTO public.t_formasdepago VALUES (782, 'Efectivo', 4105, 478);
INSERT INTO public.t_formasdepago VALUES (783, 'Tranferencia', 2926.04, 479);
INSERT INTO public.t_formasdepago VALUES (784, 'Efectivo', 4105, 479);
INSERT INTO public.t_formasdepago VALUES (785, 'Tranferencia', 2926.04, 480);
INSERT INTO public.t_formasdepago VALUES (786, 'Efectivo', 4105, 480);
INSERT INTO public.t_formasdepago VALUES (787, 'Tranferencia', 2926.04, 481);
INSERT INTO public.t_formasdepago VALUES (788, 'Efectivo', 4105, 481);
INSERT INTO public.t_formasdepago VALUES (789, 'Tranferencia', 2926.04, 482);
INSERT INTO public.t_formasdepago VALUES (790, 'Efectivo', 4105, 482);
INSERT INTO public.t_formasdepago VALUES (791, 'Tranferencia', 2926.04, 483);
INSERT INTO public.t_formasdepago VALUES (792, 'Efectivo', 4105, 483);
INSERT INTO public.t_formasdepago VALUES (793, 'Tranferencia', 2926.04, 484);
INSERT INTO public.t_formasdepago VALUES (794, 'Efectivo', 4105, 484);
INSERT INTO public.t_formasdepago VALUES (795, 'Tranferencia', 2926.04, 485);
INSERT INTO public.t_formasdepago VALUES (796, 'Efectivo', 4105, 485);
INSERT INTO public.t_formasdepago VALUES (797, 'Tranferencia', 2926.04, 486);
INSERT INTO public.t_formasdepago VALUES (798, 'Efectivo', 4105, 486);
INSERT INTO public.t_formasdepago VALUES (799, 'Tranferencia', 2926.04, 487);
INSERT INTO public.t_formasdepago VALUES (800, 'Efectivo', 4105, 487);
INSERT INTO public.t_formasdepago VALUES (801, 'Tranferencia', 2926.04, 488);
INSERT INTO public.t_formasdepago VALUES (802, 'Efectivo', 4105, 488);
INSERT INTO public.t_formasdepago VALUES (803, 'Tranferencia', 2926.04, 489);
INSERT INTO public.t_formasdepago VALUES (804, 'Efectivo', 4105, 489);
INSERT INTO public.t_formasdepago VALUES (805, 'Tranferencia', 2926.04, 490);
INSERT INTO public.t_formasdepago VALUES (806, 'Efectivo', 4105, 490);
INSERT INTO public.t_formasdepago VALUES (807, 'Tranferencia', 2926.04, 491);
INSERT INTO public.t_formasdepago VALUES (808, 'Efectivo', 4105, 491);
INSERT INTO public.t_formasdepago VALUES (809, 'Tranferencia', 2926.04, 492);
INSERT INTO public.t_formasdepago VALUES (810, 'Efectivo', 4105, 492);
INSERT INTO public.t_formasdepago VALUES (811, 'Tranferencia', 2926.04, 493);
INSERT INTO public.t_formasdepago VALUES (812, 'Efectivo', 4105, 493);
INSERT INTO public.t_formasdepago VALUES (813, 'Tranferencia', 2926.04, 494);
INSERT INTO public.t_formasdepago VALUES (814, 'Efectivo', 4105, 494);
INSERT INTO public.t_formasdepago VALUES (815, 'Tranferencia', 2926.04, 495);
INSERT INTO public.t_formasdepago VALUES (816, 'Efectivo', 4105, 495);
INSERT INTO public.t_formasdepago VALUES (817, 'Tranferencia', 2926.04, 496);
INSERT INTO public.t_formasdepago VALUES (818, 'Efectivo', 4105, 496);
INSERT INTO public.t_formasdepago VALUES (819, 'Tranferencia', 2926.04, 497);
INSERT INTO public.t_formasdepago VALUES (820, 'Efectivo', 4105, 497);
INSERT INTO public.t_formasdepago VALUES (821, 'Tranferencia', 2926.04, 498);
INSERT INTO public.t_formasdepago VALUES (822, 'Efectivo', 4105, 498);
INSERT INTO public.t_formasdepago VALUES (823, 'Tranferencia', 2926.04, 499);
INSERT INTO public.t_formasdepago VALUES (824, 'Efectivo', 4105, 499);
INSERT INTO public.t_formasdepago VALUES (825, 'Tranferencia', 2926.04, 500);
INSERT INTO public.t_formasdepago VALUES (826, 'Efectivo', 4105, 500);
INSERT INTO public.t_formasdepago VALUES (827, 'Tranferencia', 2926.04, 501);
INSERT INTO public.t_formasdepago VALUES (828, 'Efectivo', 4105, 501);
INSERT INTO public.t_formasdepago VALUES (829, 'Tranferencia', 2926.04, 502);
INSERT INTO public.t_formasdepago VALUES (830, 'Efectivo', 4105, 502);
INSERT INTO public.t_formasdepago VALUES (831, 'Tranferencia', 2926.04, 503);
INSERT INTO public.t_formasdepago VALUES (832, 'Efectivo', 4105, 503);
INSERT INTO public.t_formasdepago VALUES (833, 'Tranferencia', 2926.04, 504);
INSERT INTO public.t_formasdepago VALUES (834, 'Efectivo', 4105, 504);
INSERT INTO public.t_formasdepago VALUES (835, 'Tranferencia', 2926.04, 505);
INSERT INTO public.t_formasdepago VALUES (836, 'Efectivo', 4105, 505);
INSERT INTO public.t_formasdepago VALUES (837, 'Tranferencia', 2926.04, 506);
INSERT INTO public.t_formasdepago VALUES (838, 'Efectivo', 4105, 506);
INSERT INTO public.t_formasdepago VALUES (839, 'Tranferencia', 2926.04, 507);
INSERT INTO public.t_formasdepago VALUES (840, 'Efectivo', 4105, 507);
INSERT INTO public.t_formasdepago VALUES (841, 'Tranferencia', 2926.04, 508);
INSERT INTO public.t_formasdepago VALUES (842, 'Efectivo', 4105, 508);
INSERT INTO public.t_formasdepago VALUES (843, 'Tranferencia', 2926.04, 509);
INSERT INTO public.t_formasdepago VALUES (844, 'Efectivo', 4105, 509);
INSERT INTO public.t_formasdepago VALUES (845, 'Tranferencia', 2926.04, 510);
INSERT INTO public.t_formasdepago VALUES (846, 'Efectivo', 4105, 510);
INSERT INTO public.t_formasdepago VALUES (847, 'Tranferencia', 2926.04, 511);
INSERT INTO public.t_formasdepago VALUES (848, 'Efectivo', 4105, 511);
INSERT INTO public.t_formasdepago VALUES (849, 'Tranferencia', 2926.04, 512);
INSERT INTO public.t_formasdepago VALUES (850, 'Efectivo', 4105, 512);
INSERT INTO public.t_formasdepago VALUES (851, 'Tranferencia', 2926.04, 513);
INSERT INTO public.t_formasdepago VALUES (852, 'Efectivo', 4105, 513);
INSERT INTO public.t_formasdepago VALUES (853, 'Tranferencia', 2926.04, 514);
INSERT INTO public.t_formasdepago VALUES (854, 'Efectivo', 4105, 514);
INSERT INTO public.t_formasdepago VALUES (855, 'Tranferencia', 2926.04, 515);
INSERT INTO public.t_formasdepago VALUES (856, 'Efectivo', 4105, 515);
INSERT INTO public.t_formasdepago VALUES (857, 'Tranferencia', 2926.04, 516);
INSERT INTO public.t_formasdepago VALUES (858, 'Efectivo', 4105, 516);
INSERT INTO public.t_formasdepago VALUES (859, 'Tranferencia', 2926.04, 517);
INSERT INTO public.t_formasdepago VALUES (860, 'Efectivo', 4105, 517);
INSERT INTO public.t_formasdepago VALUES (861, 'Tranferencia', 2926.04, 518);
INSERT INTO public.t_formasdepago VALUES (862, 'Efectivo', 4105, 518);
INSERT INTO public.t_formasdepago VALUES (863, 'Tranferencia', 2926.04, 519);
INSERT INTO public.t_formasdepago VALUES (864, 'Efectivo', 4105, 519);
INSERT INTO public.t_formasdepago VALUES (865, 'Tranferencia', 2926.04, 520);
INSERT INTO public.t_formasdepago VALUES (866, 'Efectivo', 4105, 520);
INSERT INTO public.t_formasdepago VALUES (867, 'Tranferencia', 2926.04, 521);
INSERT INTO public.t_formasdepago VALUES (868, 'Efectivo', 4105, 521);
INSERT INTO public.t_formasdepago VALUES (869, 'Tranferencia', 2926.04, 522);
INSERT INTO public.t_formasdepago VALUES (870, 'Efectivo', 4105, 522);
INSERT INTO public.t_formasdepago VALUES (871, 'Tranferencia', 2926.04, 523);
INSERT INTO public.t_formasdepago VALUES (872, 'Efectivo', 4105, 523);
INSERT INTO public.t_formasdepago VALUES (873, 'Tranferencia', 2926.04, 524);
INSERT INTO public.t_formasdepago VALUES (874, 'Efectivo', 4105, 524);
INSERT INTO public.t_formasdepago VALUES (875, 'Tranferencia', 2926.04, 525);
INSERT INTO public.t_formasdepago VALUES (876, 'Efectivo', 4105, 525);
INSERT INTO public.t_formasdepago VALUES (877, 'Tranferencia', 2926.04, 526);
INSERT INTO public.t_formasdepago VALUES (878, 'Efectivo', 4105, 526);
INSERT INTO public.t_formasdepago VALUES (879, 'Tranferencia', 2926.04, 527);
INSERT INTO public.t_formasdepago VALUES (880, 'Efectivo', 4105, 527);
INSERT INTO public.t_formasdepago VALUES (881, 'Tranferencia', 2926.04, 528);
INSERT INTO public.t_formasdepago VALUES (882, 'Efectivo', 4105, 528);
INSERT INTO public.t_formasdepago VALUES (883, 'Tranferencia', 2926.04, 529);
INSERT INTO public.t_formasdepago VALUES (884, 'Efectivo', 4105, 529);
INSERT INTO public.t_formasdepago VALUES (885, 'Tranferencia', 2926.04, 530);
INSERT INTO public.t_formasdepago VALUES (886, 'Efectivo', 4105, 530);
INSERT INTO public.t_formasdepago VALUES (887, 'Tranferencia', 2926.04, 531);
INSERT INTO public.t_formasdepago VALUES (888, 'Efectivo', 4105, 531);
INSERT INTO public.t_formasdepago VALUES (889, 'Tranferencia', 2926.04, 532);
INSERT INTO public.t_formasdepago VALUES (890, 'Efectivo', 4105, 532);
INSERT INTO public.t_formasdepago VALUES (891, 'Tranferencia', 2926.04, 533);
INSERT INTO public.t_formasdepago VALUES (892, 'Efectivo', 4105, 533);
INSERT INTO public.t_formasdepago VALUES (893, 'Tranferencia', 2926.04, 534);
INSERT INTO public.t_formasdepago VALUES (894, 'Efectivo', 4105, 534);
INSERT INTO public.t_formasdepago VALUES (895, 'Tranferencia', 2926.04, 535);
INSERT INTO public.t_formasdepago VALUES (896, 'Efectivo', 4105, 535);
INSERT INTO public.t_formasdepago VALUES (897, 'Tranferencia', 2926.04, 536);
INSERT INTO public.t_formasdepago VALUES (898, 'Efectivo', 4105, 536);
INSERT INTO public.t_formasdepago VALUES (899, 'Tranferencia', 2926.04, 537);
INSERT INTO public.t_formasdepago VALUES (900, 'Efectivo', 4105, 537);
INSERT INTO public.t_formasdepago VALUES (901, 'Tranferencia', 2926.04, 538);
INSERT INTO public.t_formasdepago VALUES (902, 'Efectivo', 4105, 538);
INSERT INTO public.t_formasdepago VALUES (903, 'Tranferencia', 2926.04, 539);
INSERT INTO public.t_formasdepago VALUES (904, 'Efectivo', 4105, 539);
INSERT INTO public.t_formasdepago VALUES (905, 'Tranferencia', 2926.04, 540);
INSERT INTO public.t_formasdepago VALUES (906, 'Efectivo', 4105, 540);
INSERT INTO public.t_formasdepago VALUES (907, 'Tranferencia', 2926.04, 541);
INSERT INTO public.t_formasdepago VALUES (908, 'Efectivo', 4105, 541);
INSERT INTO public.t_formasdepago VALUES (909, 'Tranferencia', 2926.04, 542);
INSERT INTO public.t_formasdepago VALUES (910, 'Efectivo', 4105, 542);
INSERT INTO public.t_formasdepago VALUES (911, 'Tranferencia', 2926.04, 543);
INSERT INTO public.t_formasdepago VALUES (912, 'Efectivo', 4105, 543);
INSERT INTO public.t_formasdepago VALUES (913, 'Tranferencia', 2926.04, 544);
INSERT INTO public.t_formasdepago VALUES (914, 'Efectivo', 4105, 544);
INSERT INTO public.t_formasdepago VALUES (915, 'Tranferencia', 2926.04, 545);
INSERT INTO public.t_formasdepago VALUES (916, 'Efectivo', 4105, 545);
INSERT INTO public.t_formasdepago VALUES (917, 'Tranferencia', 2926.04, 546);
INSERT INTO public.t_formasdepago VALUES (918, 'Efectivo', 4105, 546);
INSERT INTO public.t_formasdepago VALUES (919, 'Tranferencia', 2926.04, 547);
INSERT INTO public.t_formasdepago VALUES (920, 'Efectivo', 4105, 547);
INSERT INTO public.t_formasdepago VALUES (921, 'Tranferencia', 2926.04, 548);
INSERT INTO public.t_formasdepago VALUES (922, 'Efectivo', 4105, 548);
INSERT INTO public.t_formasdepago VALUES (923, 'Tranferencia', 2926.04, 549);
INSERT INTO public.t_formasdepago VALUES (924, 'Efectivo', 4105, 549);
INSERT INTO public.t_formasdepago VALUES (925, 'Tranferencia', 2926.04, 550);
INSERT INTO public.t_formasdepago VALUES (926, 'Efectivo', 4105, 550);
INSERT INTO public.t_formasdepago VALUES (927, 'Tranferencia', 2926.04, 551);
INSERT INTO public.t_formasdepago VALUES (928, 'Efectivo', 4105, 551);
INSERT INTO public.t_formasdepago VALUES (929, 'Tranferencia', 2926.04, 552);
INSERT INTO public.t_formasdepago VALUES (930, 'Efectivo', 4105, 552);
INSERT INTO public.t_formasdepago VALUES (931, 'Tranferencia', 2926.04, 553);
INSERT INTO public.t_formasdepago VALUES (932, 'Efectivo', 4105, 553);
INSERT INTO public.t_formasdepago VALUES (933, 'Tranferencia', 2926.04, 554);
INSERT INTO public.t_formasdepago VALUES (934, 'Efectivo', 4105, 554);
INSERT INTO public.t_formasdepago VALUES (935, 'Tranferencia', 2926.04, 555);
INSERT INTO public.t_formasdepago VALUES (936, 'Efectivo', 4105, 555);
INSERT INTO public.t_formasdepago VALUES (937, 'Tranferencia', 2926.04, 556);
INSERT INTO public.t_formasdepago VALUES (938, 'Efectivo', 4105, 556);
INSERT INTO public.t_formasdepago VALUES (939, 'Tranferencia', 2926.04, 557);
INSERT INTO public.t_formasdepago VALUES (940, 'Efectivo', 4105, 557);


--
-- TOC entry 3428 (class 0 OID 16416)
-- Dependencies: 220
-- Data for Name: t_plantillacorreos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_plantillacorreos VALUES (48, '1', '#F3C492', '#EAF6FE', '#000000', '#575756', 35);
INSERT INTO public.t_plantillacorreos VALUES (51, '1', '#F3C492', '#EAF6FE', '#000000', '#575756', 36);
INSERT INTO public.t_plantillacorreos VALUES (54, '1', '#F3C492', '#EAF6FE', '#000000', '#575756', 37);
INSERT INTO public.t_plantillacorreos VALUES (57, '1', '#F3C492', '#EAF6FE', '#000000', '#575756', 38);
INSERT INTO public.t_plantillacorreos VALUES (60, '1', '#F3C492', '#EAF6FE', '#000000', '#575756', 39);
INSERT INTO public.t_plantillacorreos VALUES (63, '1', '#F3C492', '#EAF6FE', '#000000', '#575756', 40);


--
-- TOC entry 3431 (class 0 OID 16421)
-- Dependencies: 223
-- Data for Name: t_registro_detalles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_registro_detalles VALUES (382, 143, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (383, 143, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (384, 143, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (385, 144, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (386, 144, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (387, 144, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (388, 145, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (389, 145, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (390, 145, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (391, 146, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (392, 146, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (393, 146, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (394, 147, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (395, 147, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (396, 147, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (397, 148, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (398, 148, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (399, 148, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (400, 149, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (401, 149, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (402, 149, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (403, 150, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (404, 150, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (405, 150, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (406, 151, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (407, 151, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (408, 151, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (409, 152, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (410, 152, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (411, 152, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (412, 153, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (413, 153, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (414, 153, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (415, 154, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (416, 154, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (417, 154, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (418, 155, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (419, 155, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (420, 155, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (421, 156, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (422, 156, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (423, 156, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (424, 157, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (425, 157, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (426, 157, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (427, 158, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (428, 158, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (429, 158, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (430, 159, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (431, 159, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (432, 159, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (433, 160, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (434, 160, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (435, 160, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (436, 161, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (437, 161, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (438, 161, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (439, 162, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (440, 162, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (441, 162, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (442, 163, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (443, 163, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (444, 163, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (445, 164, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (446, 164, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (447, 164, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (448, 165, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (449, 165, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (450, 165, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (451, 166, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (452, 166, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (453, 166, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (454, 167, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (455, 167, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (456, 167, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (457, 168, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (458, 168, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (459, 168, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (460, 169, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (461, 169, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (462, 169, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (463, 170, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (464, 170, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (465, 170, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (466, 171, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (467, 171, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (468, 171, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (469, 172, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (470, 172, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (471, 172, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (472, 173, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (473, 173, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (474, 173, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (475, 174, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (476, 174, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (477, 174, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (478, 175, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (479, 175, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (480, 175, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (481, 176, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (482, 176, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (483, 176, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (484, 177, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (485, 177, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (486, 177, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (487, 178, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (488, 178, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (489, 178, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (490, 179, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (491, 179, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (492, 179, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (493, 180, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (494, 180, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (495, 180, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (496, 181, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (497, 181, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (498, 181, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (499, 182, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (500, 182, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (501, 182, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (502, 183, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (503, 183, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (504, 183, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (505, 184, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (506, 184, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (507, 184, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (508, 185, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (509, 185, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (510, 185, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (511, 186, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (512, 186, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (513, 186, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (514, 187, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (515, 187, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (516, 187, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (517, 188, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (518, 188, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (519, 188, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (520, 189, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (521, 189, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (522, 189, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (523, 190, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (524, 190, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (525, 190, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (526, 191, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (527, 191, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (528, 191, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (529, 192, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (530, 192, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (531, 192, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (532, 193, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (533, 193, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (534, 193, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (535, 194, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (536, 194, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (537, 194, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (538, 195, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (539, 195, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (540, 195, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (541, 196, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (542, 196, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (543, 196, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (544, 197, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (545, 197, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (546, 197, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (547, 198, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (548, 198, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (549, 198, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (550, 199, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (551, 199, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (552, 199, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (553, 200, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (554, 200, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (555, 200, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (556, 201, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (557, 201, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (558, 201, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (559, 202, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (560, 202, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (561, 202, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (562, 203, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (563, 203, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (564, 203, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (565, 204, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (566, 204, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (567, 204, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (568, 205, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (569, 205, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (570, 205, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (571, 206, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (572, 206, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (573, 206, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (574, 207, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (575, 207, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (576, 207, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (577, 208, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (578, 208, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (579, 208, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (580, 209, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (581, 209, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (582, 209, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (583, 210, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (584, 210, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (585, 210, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (586, 211, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (587, 211, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (588, 211, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (589, 212, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (590, 212, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (591, 212, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (592, 213, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (593, 213, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (594, 213, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (595, 214, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (596, 214, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (597, 214, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (598, 215, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (599, 215, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (600, 215, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (601, 216, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (602, 216, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (603, 216, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (604, 217, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (605, 217, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (606, 217, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (607, 218, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (608, 218, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (609, 218, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (610, 219, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (611, 219, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (612, 219, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (613, 220, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (614, 220, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (615, 220, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (616, 221, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (617, 221, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (618, 221, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (619, 222, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (620, 222, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (621, 222, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (622, 223, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (623, 223, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (624, 223, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (625, 224, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (626, 224, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (627, 224, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (628, 225, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (629, 225, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (630, 225, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (631, 226, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (632, 226, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (633, 226, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (634, 227, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (635, 227, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (636, 227, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (637, 228, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (638, 228, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (639, 228, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (640, 229, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (641, 229, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (642, 229, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (643, 230, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (644, 230, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (645, 230, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (646, 231, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (647, 231, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (648, 231, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (649, 232, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (650, 232, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (651, 232, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (652, 233, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (653, 233, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (654, 233, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (655, 234, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (656, 234, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (657, 234, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (658, 235, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (659, 235, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (660, 235, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (661, 236, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (662, 236, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (663, 236, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (664, 237, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (665, 237, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (666, 237, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (667, 238, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (668, 238, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (669, 238, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (670, 239, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (671, 239, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (672, 239, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (673, 240, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (674, 240, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (675, 240, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (676, 241, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (677, 241, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (678, 241, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (679, 242, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (680, 242, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (681, 242, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (682, 243, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (683, 243, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (684, 243, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (685, 244, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (686, 244, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (687, 244, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (688, 245, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (689, 245, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (690, 245, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (691, 246, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (692, 246, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (693, 246, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (694, 247, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (695, 247, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (696, 247, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (697, 248, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (698, 248, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (699, 248, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (700, 249, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (701, 249, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (702, 249, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (703, 250, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (704, 250, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (705, 250, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (706, 251, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (707, 251, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (708, 251, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (709, 252, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (710, 252, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (711, 252, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (712, 253, '9309', 'LIC CLUF', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (713, 253, '9309', 'LIC CLUF', 410.5, 1, 0, 410.5, true, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (714, 253, '9309', 'LIC CLUF', 164.2, 2, 16, 328.4, false, 0, 'Com - Servicio de Cluf MES DICIEMBRE 2023');
INSERT INTO public.t_registro_detalles VALUES (715, 254, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (716, 254, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (717, 254, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (718, 255, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (719, 255, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (720, 255, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (721, 256, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (722, 256, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (778, 275, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (723, 256, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (724, 257, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (725, 257, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (726, 257, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (727, 258, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (728, 258, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (729, 258, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (730, 259, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (731, 259, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (732, 259, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (733, 260, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (734, 260, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (735, 260, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (736, 261, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (737, 261, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (738, 261, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (739, 262, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (740, 262, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (741, 262, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (742, 263, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (743, 263, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (744, 263, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (745, 264, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (746, 264, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (747, 264, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (748, 265, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (749, 265, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (750, 265, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (751, 266, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (752, 266, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (753, 266, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (754, 267, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (755, 267, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (756, 267, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (757, 268, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (758, 268, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (759, 268, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (760, 269, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (761, 269, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (762, 269, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (763, 270, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (764, 270, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (765, 270, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (766, 271, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (767, 271, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (768, 271, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (769, 272, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (770, 272, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (771, 272, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (772, 273, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (773, 273, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (774, 273, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (775, 274, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (776, 274, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (777, 274, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (779, 275, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (780, 275, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (781, 276, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (782, 276, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (783, 276, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (784, 277, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (785, 277, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (786, 277, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (787, 278, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (788, 278, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (789, 278, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (790, 279, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (791, 279, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (792, 279, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (793, 280, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (794, 280, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (795, 280, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (796, 281, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (797, 281, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (798, 281, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (799, 282, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (800, 282, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (801, 282, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (802, 283, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (803, 283, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (804, 283, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (805, 284, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (806, 284, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (807, 284, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (808, 285, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (809, 285, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (810, 285, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (811, 286, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (812, 286, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (813, 286, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (814, 287, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (815, 287, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (816, 287, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (817, 288, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (818, 288, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (819, 288, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (820, 289, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (821, 289, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (822, 289, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (823, 290, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (824, 290, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (825, 290, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (826, 291, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (827, 291, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (828, 291, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (829, 292, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (830, 292, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (831, 292, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (832, 293, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (833, 293, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (834, 293, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (835, 294, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (836, 294, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (837, 294, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (838, 295, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (839, 295, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (840, 295, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (841, 296, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (842, 296, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (843, 296, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (844, 297, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (845, 297, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (846, 297, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (847, 298, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (848, 298, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (849, 298, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (850, 299, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (851, 299, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (852, 299, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (853, 300, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (854, 300, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (855, 300, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (856, 301, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (857, 301, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (858, 301, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (859, 302, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (860, 302, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (861, 302, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (862, 303, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (863, 303, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (864, 303, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (865, 304, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (866, 304, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (867, 304, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (868, 305, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (869, 305, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (870, 305, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (871, 306, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (872, 306, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (873, 306, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (874, 307, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (875, 307, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (876, 307, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (877, 308, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (878, 308, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (879, 308, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (880, 309, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (881, 309, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (882, 309, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (883, 310, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (884, 310, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (885, 310, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (886, 311, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (887, 311, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (888, 311, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (889, 312, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (890, 312, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (891, 312, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (892, 313, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (893, 313, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (894, 313, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (895, 314, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (896, 314, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (897, 314, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (898, 315, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (899, 315, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (900, 315, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (901, 316, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (902, 316, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (903, 316, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (904, 317, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (905, 317, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (906, 317, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (907, 318, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (908, 318, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (909, 318, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (910, 319, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (911, 319, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (912, 319, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (913, 320, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (914, 320, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (915, 320, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (916, 321, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (917, 321, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (918, 321, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (919, 322, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (920, 322, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (921, 322, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (922, 323, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (923, 323, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (924, 323, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (925, 324, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (926, 324, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (927, 324, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (928, 325, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (929, 325, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (930, 325, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (931, 326, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (932, 326, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (933, 326, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (934, 327, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (935, 327, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (936, 327, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (937, 328, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (938, 328, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (939, 328, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (940, 329, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (941, 329, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (942, 329, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (943, 330, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (944, 330, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (945, 330, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (946, 331, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (947, 331, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (948, 331, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (949, 332, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (950, 332, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (951, 332, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (952, 333, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (953, 333, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (954, 333, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (955, 334, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (956, 334, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (957, 334, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (958, 335, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (959, 335, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (960, 335, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (961, 336, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (962, 336, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (963, 336, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (964, 337, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (965, 337, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (966, 337, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (967, 338, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (968, 338, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (969, 338, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (970, 339, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (971, 339, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (972, 339, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (973, 340, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (974, 340, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (975, 340, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (976, 341, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (977, 341, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (978, 341, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (979, 342, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (980, 342, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (981, 342, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (982, 343, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (983, 343, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (984, 343, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (985, 344, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (986, 344, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (987, 344, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (988, 345, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (989, 345, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (990, 345, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (991, 346, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (992, 346, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (993, 346, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (994, 347, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (995, 347, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (996, 347, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (997, 348, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (998, 348, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (999, 348, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1000, 349, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1001, 349, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1002, 349, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1003, 350, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1004, 350, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1005, 350, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1006, 351, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1007, 351, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1008, 351, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1009, 352, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1010, 352, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1011, 352, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1012, 353, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1013, 353, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1014, 353, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1015, 354, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1016, 354, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1017, 354, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1018, 355, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1019, 355, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1020, 355, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1021, 356, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1022, 356, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1023, 356, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1024, 357, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1025, 357, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1026, 357, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1027, 358, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1028, 358, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1029, 358, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1030, 359, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1031, 359, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1032, 359, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1033, 360, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1034, 360, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1035, 360, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1036, 361, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1037, 361, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1038, 361, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1039, 362, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1040, 362, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1041, 362, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1042, 363, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1043, 363, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1044, 363, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1045, 364, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1046, 364, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1047, 364, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1048, 365, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1049, 365, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1050, 365, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1051, 366, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1052, 366, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1053, 366, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1054, 367, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1055, 367, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1056, 367, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1057, 368, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1058, 368, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1059, 368, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1060, 369, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1061, 369, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1062, 369, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1063, 370, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1064, 370, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1065, 370, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1066, 371, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1067, 371, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1068, 371, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1069, 372, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1070, 372, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1071, 372, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1072, 373, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1073, 373, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1074, 373, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1075, 374, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1076, 374, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1077, 374, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1078, 375, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1079, 375, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1080, 375, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1081, 376, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1082, 376, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1083, 376, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1084, 377, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1085, 377, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1086, 377, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1087, 378, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1088, 378, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1089, 378, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1090, 379, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1091, 379, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1092, 379, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1093, 380, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1094, 380, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1095, 380, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1096, 381, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1097, 381, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1098, 381, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1099, 382, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1100, 382, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1101, 382, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1102, 383, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1103, 383, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1104, 383, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1105, 384, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1106, 384, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1107, 384, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1108, 385, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1109, 385, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1110, 385, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1111, 386, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1112, 386, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1113, 386, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1114, 387, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1115, 387, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1116, 387, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1117, 388, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1118, 388, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1119, 388, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1120, 389, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1121, 389, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1122, 389, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1123, 390, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1124, 390, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1125, 390, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1126, 391, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1127, 391, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1128, 391, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1129, 392, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1130, 392, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1131, 392, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1132, 393, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1133, 393, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1134, 393, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1135, 394, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1136, 394, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1137, 394, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1138, 395, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1139, 395, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1140, 395, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1141, 396, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1142, 396, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1143, 396, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1144, 397, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1145, 397, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1146, 397, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1147, 398, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1148, 398, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1149, 398, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1150, 399, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1151, 399, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1152, 399, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1153, 400, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1154, 400, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1155, 400, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1156, 401, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1157, 401, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1158, 401, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1159, 402, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1160, 402, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1161, 402, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1162, 403, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1163, 403, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1164, 403, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1165, 404, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1166, 404, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1167, 404, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1168, 405, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1169, 405, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1170, 405, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1171, 406, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1172, 406, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1173, 406, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1174, 407, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1175, 407, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1176, 407, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1177, 408, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1178, 408, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1179, 408, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1180, 409, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1181, 409, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1182, 409, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1183, 410, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1184, 410, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1185, 410, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1186, 411, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1187, 411, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1188, 411, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1189, 412, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1190, 412, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1191, 412, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1192, 413, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1193, 413, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1194, 413, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1195, 414, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1196, 414, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1197, 414, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1198, 415, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1199, 415, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1200, 415, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1201, 416, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1202, 416, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1203, 416, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1204, 417, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1205, 417, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1206, 417, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1207, 418, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1208, 418, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1209, 418, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1210, 419, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1211, 419, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1212, 419, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1213, 420, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1214, 420, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1215, 420, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1216, 421, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1217, 421, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1218, 421, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1219, 422, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1220, 422, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1221, 422, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1222, 423, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1223, 423, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1224, 423, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1225, 424, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1226, 424, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1227, 424, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1228, 425, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1229, 425, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1230, 425, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1231, 426, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1232, 426, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1233, 426, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1234, 427, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1235, 427, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1236, 427, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1237, 428, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1238, 428, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1239, 428, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1240, 429, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1241, 429, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1242, 429, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1243, 430, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1244, 430, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1245, 430, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1246, 431, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1247, 431, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1248, 431, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1249, 432, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1250, 432, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1251, 432, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1252, 433, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1253, 433, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1254, 433, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1255, 434, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1256, 434, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1257, 434, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1258, 435, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1259, 435, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1260, 435, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1261, 436, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1262, 436, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1263, 436, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1264, 437, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1265, 437, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1266, 437, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1267, 438, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1268, 438, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1269, 438, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1270, 439, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1271, 439, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1272, 439, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1273, 440, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1274, 440, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1275, 440, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1276, 441, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1277, 441, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1278, 441, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1279, 442, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1280, 442, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1281, 442, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1282, 443, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1283, 443, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1284, 443, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1285, 444, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1286, 444, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1287, 444, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1288, 445, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1289, 445, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1290, 445, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1291, 446, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1292, 446, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1293, 446, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1294, 447, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1295, 447, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1296, 447, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1297, 448, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1298, 448, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1299, 448, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1300, 449, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1301, 449, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1302, 449, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1303, 450, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1304, 450, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1305, 450, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1306, 451, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1307, 451, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1308, 451, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1309, 452, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1310, 452, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1311, 452, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1312, 453, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1313, 453, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1314, 453, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1315, 454, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1316, 454, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1317, 454, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1318, 455, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1319, 455, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1320, 455, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1321, 456, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1322, 456, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1323, 456, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1324, 457, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1325, 457, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1326, 457, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1327, 458, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1328, 458, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1329, 458, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1330, 459, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1331, 459, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1332, 459, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1333, 460, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1334, 460, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1335, 460, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1336, 461, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1337, 461, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1338, 461, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1339, 462, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1340, 462, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1341, 462, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1342, 463, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1343, 463, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1344, 463, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1345, 464, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1346, 464, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1347, 464, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1348, 465, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1349, 465, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1350, 465, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1351, 466, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1352, 466, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1353, 466, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1354, 467, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1355, 467, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1356, 467, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1357, 468, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1358, 468, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1359, 468, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1360, 469, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1361, 469, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1362, 469, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1363, 470, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1364, 470, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1365, 470, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1366, 471, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1367, 471, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1368, 471, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1369, 472, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1370, 472, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1371, 472, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1372, 473, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1373, 473, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1374, 473, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1375, 474, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1376, 474, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1377, 474, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1378, 475, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1379, 475, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1380, 475, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1381, 476, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1382, 476, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1383, 476, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1384, 477, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1385, 477, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1386, 477, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1387, 478, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1388, 478, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1389, 478, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1390, 479, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1391, 479, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1392, 479, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1393, 480, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1394, 480, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1395, 480, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1396, 481, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1397, 481, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1398, 481, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1399, 482, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1400, 482, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1401, 482, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1402, 483, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1403, 483, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1404, 483, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1405, 484, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1406, 484, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1407, 484, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1408, 485, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1409, 485, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1410, 485, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1411, 486, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1412, 486, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1413, 486, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1414, 487, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1415, 487, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1416, 487, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1417, 488, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1418, 488, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1419, 488, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1420, 489, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1421, 489, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1422, 489, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1423, 490, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1424, 490, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1425, 490, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1426, 491, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1427, 491, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1428, 491, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1429, 492, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1430, 492, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1431, 492, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1432, 493, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1433, 493, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1434, 493, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1435, 494, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1436, 494, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1437, 494, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1438, 495, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1439, 495, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1440, 495, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1441, 496, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1442, 496, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1443, 496, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1444, 497, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1445, 497, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1446, 497, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1447, 498, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1448, 498, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1449, 498, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1450, 499, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1451, 499, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1452, 499, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1453, 500, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1454, 500, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1455, 500, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1456, 501, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1457, 501, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1458, 501, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1459, 502, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1460, 502, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1461, 502, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1462, 503, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1463, 503, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1464, 503, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1465, 504, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1466, 504, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1467, 504, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1468, 505, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1469, 505, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1470, 505, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1471, 506, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1472, 506, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1473, 506, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1474, 507, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1475, 507, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1476, 507, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1477, 508, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1478, 508, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1479, 508, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1480, 509, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1481, 509, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1482, 509, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1483, 510, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1484, 510, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1485, 510, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1486, 511, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1487, 511, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1488, 511, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1489, 512, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1490, 512, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1491, 512, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1492, 513, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1493, 513, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1494, 513, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1495, 514, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1496, 514, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1497, 514, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1498, 515, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1499, 515, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1500, 515, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1501, 516, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1502, 516, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1503, 516, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1504, 517, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1505, 517, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1506, 517, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1507, 518, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1508, 518, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1509, 518, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1510, 519, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1511, 519, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1512, 519, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1513, 520, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1514, 520, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1515, 520, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1516, 521, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1517, 521, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1518, 521, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1519, 522, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1520, 522, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1521, 522, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1522, 523, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1523, 523, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1524, 523, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1525, 524, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1526, 524, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1527, 524, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1528, 525, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1529, 525, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1530, 525, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1531, 526, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1532, 526, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1533, 526, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1534, 527, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1535, 527, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1536, 527, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1537, 528, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1538, 528, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1539, 528, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1540, 529, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1541, 529, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1542, 529, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1543, 530, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1544, 530, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1545, 530, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1546, 531, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1547, 531, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1548, 531, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1549, 532, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1550, 532, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1551, 532, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1552, 533, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1553, 533, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1554, 533, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1555, 534, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1556, 534, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1557, 534, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1558, 535, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1559, 535, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1560, 535, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1561, 536, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1562, 536, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1563, 536, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1564, 537, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1565, 537, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1566, 537, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1567, 538, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1568, 538, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1569, 538, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1570, 539, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1571, 539, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1572, 539, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1573, 540, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1574, 540, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1575, 540, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1576, 541, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1577, 541, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1578, 541, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1579, 542, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1580, 542, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1581, 542, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1582, 543, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1583, 543, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1584, 543, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1585, 544, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1586, 544, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1587, 544, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1588, 545, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1589, 545, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1590, 545, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1591, 546, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1592, 546, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1593, 546, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1594, 547, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1595, 547, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1596, 547, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1597, 548, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1598, 548, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1599, 548, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1600, 549, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1601, 549, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1602, 549, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1603, 550, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1604, 550, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1605, 550, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1606, 551, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1607, 551, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1608, 551, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1609, 552, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1610, 552, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1611, 552, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1612, 553, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1613, 553, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1614, 553, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1615, 554, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1616, 554, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1617, 554, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1618, 555, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1619, 555, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1620, 555, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1621, 556, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1622, 556, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1623, 556, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');
INSERT INTO public.t_registro_detalles VALUES (1624, 557, '9309', 'Producto de prueba 1', 3119.8, 2, 0, 6239.6, true, 0, '');
INSERT INTO public.t_registro_detalles VALUES (1625, 557, '9309', 'Producto de prueba 2', 410.5, 1, 0, 410.5, true, 0, 'Comentario Producto de prueba 2');
INSERT INTO public.t_registro_detalles VALUES (1626, 557, '9309', 'Producto de prueba 3', 164.2, 2, 16, 328.4, false, 0, 'Comentario Producto de prueba 3');


--
-- TOC entry 3432 (class 0 OID 16428)
-- Dependencies: 224
-- Data for Name: t_registros; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_registros VALUES (143, '00-00000001', 1, 35, 'gKVOV9tPK', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 10:43:30', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (144, '00-00000002', 1, 35, 'bO8hMHll2', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 11:01:46', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (145, '00-00000003', 1, 35, 'Uz0KJWA6O', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 11:18:47', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (146, '00-00000004', 1, 35, '49jLIemvF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 11:19:25', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (147, '00-00000005', 1, 35, 'xjY6hmvoK', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 11:26:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (148, '00-00000006', 1, 35, 'CDqrcEpvz', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 12:43:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (149, '00-00000007', 1, 35, '4YTh4bU7q', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:16:32', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (150, '00-00000008', 1, 35, 'bgjlV49bO', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:16:52', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (151, '00-00000009', 2, 35, 'ppi7Bf4Tp', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:17:25', 6650.1, 1, NULL, '00-00000008', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (152, '00-00000010', 1, 35, 'QSxjcADsQ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:17:49', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (153, '00-00000011', 3, 35, 's4SBpZhsl', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:18:03', 6650.1, 1, NULL, '00-00000010', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (154, '00-00000001', 1, 37, 'RjRHnxcg4', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:10', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (155, '00-00000002', 1, 37, '5WUkjCzKH', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:13', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (156, '00-00000003', 1, 37, 'Q5aDqz4RJ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:14', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (157, '00-00000004', 1, 37, 'yfEiF0OyO', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:18', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (158, '00-00000005', 1, 37, 'OvPWnZJav', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:19', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (159, '00-00000006', 1, 37, 'nqyen9xub', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:19', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (160, '00-00000007', 2, 37, 'vsOQELLwi', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:36', 6650.1, 1, NULL, '00-00000006', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (161, '00-00000008', 1, 37, 'sGzHPtzo8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:33:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (162, '00-00000009', 1, 37, 'EPyuaGhef', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:33:52', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (163, '00-00000001', 1, 36, 'WECAPxuNy', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:00', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (164, '00-00000002', 1, 36, 'H7NBnU2fp', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:01', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (165, '00-00000003', 1, 36, '0A4qMylTN', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:01', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (166, '00-00000004', 1, 36, 'JlDpxKRMM', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:01', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (167, '00-00000005', 1, 36, 'bltaQ5h9y', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:02', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (168, '00-00000006', 1, 36, '735ePMrbM', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:02', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (169, '00-00000007', 2, 36, 'bLBq8Uvem', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:15', 6650.1, 1, NULL, '00-00000006', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (170, '00-00000008', 1, 36, 'BWUZIj7JE', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:20', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (171, '00-00000009', 1, 36, '0a0lffygD', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:21', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (172, '00-00000010', 1, 36, 'yBeUewnvf', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:21', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (173, '00-00000011', 1, 36, 'RHaupfZ4X', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:21', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (174, '00-00000012', 1, 36, 'Ii3FyMXd1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (175, '00-00000013', 1, 36, 'R32ERRvau', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (176, '00-00000014', 1, 36, 'QaPKZiBWy', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (177, '00-00000015', 1, 36, 'TAkRWvhcd', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (178, '00-00000016', 1, 36, 'Xt9nx03jV', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (179, '00-00000017', 1, 36, 'suwHN1daT', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (180, '00-00000018', 1, 36, '4zS0bgZj8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:23', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (181, '00-00000019', 1, 36, 'qZGiyUrtk', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:23', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (182, '00-00000020', 3, 36, 'rmzlKIf93', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:35', 6650.1, 1, NULL, '00-00000019', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (183, '00-00000012', 1, 35, '9bGdd2rIo', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:46:57', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (184, '00-00000013', 1, 35, 'aMuaoBehv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:46:59', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (185, '00-00000014', 1, 35, 'RvtrVGbAh', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:46:59', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (186, '00-00000015', 1, 35, 'RgO0xqfEF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:00', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (187, '00-00000016', 1, 35, 'jlZMvM4wm', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:00', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (188, '00-00000017', 1, 35, 'WNDviQhqU', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:00', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (189, '00-00000018', 1, 35, 'VrzwJ1oVG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:01', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (190, '00-00000010', 1, 37, 'XkSMxhNaZ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:32', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (191, '00-00000011', 1, 37, 'kHXv78Dcn', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:34', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (192, '00-00000012', 1, 37, 'eTYvol2Mb', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:34', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (193, '00-00000013', 1, 37, 'Cxg3dWAHZ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:34', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (194, '00-00000014', 2, 37, 'tdaZDHUcw', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:46', 6650.1, 1, NULL, '00-00000013', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (195, '00-00000021', 1, 36, 'VUMk53tEd', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:48:57', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (196, '00-00000022', 1, 36, 'fCP6uJ1pv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:48:58', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (197, '00-00000023', 1, 36, 'vhFXM4o5q', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:48:58', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (198, '00-00000024', 1, 36, '2dnCHHraG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:48:58', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (199, '00-00000025', 3, 36, '7AIgCUKf1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:09', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (200, '00-00000026', 3, 36, 'R5M7NqlWG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:10', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (201, '00-00000027', 3, 36, 'Jg2rSOJA5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:10', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (202, '00-00000028', 3, 36, 'CDpbWdnbG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:10', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (203, '00-00000029', 3, 36, 'dGRzSDMl5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:10', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (204, '00-00000030', 3, 36, 'yW5PH0yV0', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:10', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (205, '00-00000019', 1, 35, 'SqXGdDGtp', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 17:24:29', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (206, '00-00000020', 1, 35, 'ck6CfJQCZ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 17:24:37', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '00000001', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 1, 0);
INSERT INTO public.t_registros VALUES (207, '00-00000021', 1, 35, 'Gpm3xGGtj', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 17:24:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '00000002', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 2, 0);
INSERT INTO public.t_registros VALUES (208, '00-00000022', 2, 35, '2XFidrv6B', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 17:24:53', 6650.1, 1, NULL, '00-00000021', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (209, '00-00000015', 1, 37, 'dhOnf9f3Y', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:48', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (210, '00-00000016', 1, 37, 'V8s5pBfAv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:49', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (211, '00-00000017', 1, 37, 'EZwvxgnyM', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:49', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (212, '00-00000018', 1, 37, 'I3umTu05q', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (213, '00-00000019', 1, 37, 'zqZUeQD1h', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (214, '00-00000020', 1, 37, 'FPz18SvNL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (215, '00-00000021', 1, 37, 'apVezVKv1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (216, '00-00000022', 1, 37, '2lTPIa2yl', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (217, '00-00000023', 1, 37, '3B87lUKRj', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (218, '00-00000024', 1, 37, '3TQDd9CHd', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (219, '00-00000025', 1, 37, 'xiXIa0EYF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (220, '00-00000026', 1, 37, 'K5UM8kpBa', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (221, '00-00000027', 1, 37, 'XhyFZXEHH', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (222, '00-00000028', 1, 37, 'Q9Q2IBGEd', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (223, '00-00000029', 1, 37, 'ASrVNgOJX', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (224, '00-00000030', 1, 37, 'GqgLb743j', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:52', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (225, '00-00000031', 1, 37, 'niYumvU7O', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:52', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (226, '00-00000032', 2, 37, 'Jr8tw01L8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:11', 6650.1, 1, NULL, '00-00000031', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (227, '00-00000031', 1, 36, 'LuInBMpIZ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:37', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (228, '00-00000032', 1, 36, '0aPDE9s4O', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:37', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (229, '00-00000033', 1, 36, 'HI86qbPM9', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:37', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (230, '00-00000034', 1, 36, 'UZGAU5CQq', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:37', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (231, '00-00000035', 1, 36, 'KUpYdjcve', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (232, '00-00000036', 1, 36, 'BGgE2SjiU', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (233, '00-00000037', 1, 36, 'Bw55G2WFE', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (234, '00-00000038', 1, 36, '4Z8a6IDFm', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (235, '00-00000039', 1, 36, 's7AbMIGo5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (236, '00-00000040', 1, 36, 'NJF3FrQxL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (237, '00-00000041', 1, 36, '1GDtbB48p', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (238, '00-00000042', 1, 36, 'XNTUbx7Ca', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (239, '00-00000043', 1, 36, 'YsdEvuauP', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (240, '00-00000044', 1, 36, 'n095jtdu1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (241, '00-00000045', 1, 36, 'EBa0eubyX', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (242, '00-00000046', 1, 36, 'HITFFLYx9', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:40', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (243, '00-00000047', 1, 36, 'p95JaOKh6', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:40', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (244, '00-00000048', 1, 36, '8jF7xHu53', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:40', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (245, '00-00000049', 1, 36, 'EGu65xLp4', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:40', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (246, '00-00000050', 1, 36, '4PwVjVDwt', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:40', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (247, '00-00000051', 1, 36, 'kCFmpYmkQ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:41', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (248, '00-00000052', 1, 36, 'nSxDUxLin', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:41', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (249, '00-00000053', 1, 36, 'fqTw2j4UL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:41', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (251, '00-00000023', 1, 35, 'NLLCQEuK2', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 11:17:04', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (252, '00-00000024', 1, 35, 'MsqV2qqCF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 11:18:41', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (253, '00-00000025', 1, 35, 'fdEcvYica', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 11:20:15', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (254, '00-00000026', 1, 35, 'H79YziUUZ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 12:09:42', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (255, '00-00000027', 1, 35, 'w7Zs0J5g8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 12:16:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000003', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 3, 0);
INSERT INTO public.t_registros VALUES (256, '00-00000028', 1, 35, 'vVC3SAzFk', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 12:18:03', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000004', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 4, 0);
INSERT INTO public.t_registros VALUES (257, '00-00000029', 2, 35, 'P3OY3WBaN', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 12:19:56', 6650.1, 1, 'Observación de prueba', '00-00000028', NULL, 1, 'cum00123', '', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (258, '00-00000030', 1, 35, 'Et8XDfrV5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 16:34:11', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (259, '00-00000031', 1, 35, 'ekYAzPRVg', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 16:43:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000005', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 5, 0);
INSERT INTO public.t_registros VALUES (260, '00-00000032', 1, 35, 'rm67t58jy', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 16:44:43', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000006', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 6, 0);
INSERT INTO public.t_registros VALUES (261, '00-00000033', 2, 35, '5xdTa579e', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 16:44:59', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (262, '00-00000033', 1, 37, 'l5jn1fdYw', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 17:17:20', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (270, '00-00000034', 1, 35, 'TgpJMc9D1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 19:09:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000007', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 7, 0);
INSERT INTO public.t_registros VALUES (271, '00-00000035', 1, 35, 'HkmGkbA6i', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 19:16:35', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000008', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 8, 0);
INSERT INTO public.t_registros VALUES (272, '00-00000036', 1, 35, 'Ms5CQAVtH', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 19:17:30', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000009', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 9, 0);
INSERT INTO public.t_registros VALUES (273, '00-00000037', 1, 35, 's7gh5O8Ie', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 19:20:12', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000010', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 10, 0);
INSERT INTO public.t_registros VALUES (274, '00-00000038', 1, 35, 'T62gethGS', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 19:24:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000011', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 11, 0);
INSERT INTO public.t_registros VALUES (264, '00-00000056', 1, 36, 'UKgG7CwVC', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 17:25:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000001', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 1, 0);
INSERT INTO public.t_registros VALUES (265, '00-00000057', 1, 36, 'hzTG5jOlG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 17:25:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000002', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 2, 0);
INSERT INTO public.t_registros VALUES (266, '00-00000058', 1, 36, '269ZHtSYO', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 17:25:08', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000003', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 3, 0);
INSERT INTO public.t_registros VALUES (267, '00-00000059', 4, 36, 'WuLuIOJkj', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 17:25:23', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (268, '00-00000060', 2, 36, 'hZ2g992Ic', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 17:25:32', 6650.1, 1, 'Observación de prueba', '00-00000058', NULL, 1, 'cum00123', '', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (269, '00-00000061', 3, 36, '3MqWRsiJs', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 18:50:37', 6650.1, 1, 'Observación de prueba', '00-00000058', NULL, 1, 'cum00123', '00000001', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 1, 0);
INSERT INTO public.t_registros VALUES (275, '00-00000039', 1, 35, 'CDvXCw4n8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:01:58', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000012', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 12, 0);
INSERT INTO public.t_registros VALUES (276, '00-00000040', 1, 35, 'WngjErVg9', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000013', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 13, 0);
INSERT INTO public.t_registros VALUES (277, '00-00000041', 1, 35, 'uKosE9blD', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000014', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 14, 0);
INSERT INTO public.t_registros VALUES (278, '00-00000042', 1, 35, 'iLstTAl5D', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000015', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 15, 0);
INSERT INTO public.t_registros VALUES (279, '00-00000043', 1, 35, 'UjKMjlgb1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000016', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 16, 0);
INSERT INTO public.t_registros VALUES (280, '00-00000044', 1, 35, 'zkTIC9fQc', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000017', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 17, 0);
INSERT INTO public.t_registros VALUES (281, '00-00000045', 1, 35, '1410ryrYA', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000018', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 18, 0);
INSERT INTO public.t_registros VALUES (282, '00-00000046', 1, 35, 'cJdMRsuHF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000019', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 19, 0);
INSERT INTO public.t_registros VALUES (283, '00-00000047', 1, 35, '8aEmrkysa', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000020', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 20, 0);
INSERT INTO public.t_registros VALUES (284, '00-00000048', 1, 35, '6Z22fM8Cn', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000021', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 21, 0);
INSERT INTO public.t_registros VALUES (285, '00-00000049', 1, 35, 'ZLSGtshWL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:43', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000022', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 22, 0);
INSERT INTO public.t_registros VALUES (286, '00-00000050', 1, 35, 'MlVTP1YL4', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:43', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000023', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 23, 0);
INSERT INTO public.t_registros VALUES (287, '00-00000051', 1, 35, 'Lxchmf1JL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:43', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000024', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 24, 0);
INSERT INTO public.t_registros VALUES (288, '00-00000052', 1, 35, 'ADrxZTWkD', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:43', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000025', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 25, 0);
INSERT INTO public.t_registros VALUES (289, '00-00000053', 1, 35, 'Ug5VCEoAb', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:43', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000026', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 26, 0);
INSERT INTO public.t_registros VALUES (291, '00-00000055', 1, 35, '9lyrMbZU9', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000028', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 28, 0);
INSERT INTO public.t_registros VALUES (292, '00-00000056', 1, 35, 'h17xdzzdg', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000029', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 29, 0);
INSERT INTO public.t_registros VALUES (293, '00-00000057', 1, 35, '5KVYHBUG5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000030', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 30, 0);
INSERT INTO public.t_registros VALUES (294, '00-00000058', 1, 35, 'PEq8gXQTq', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000031', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 31, 0);
INSERT INTO public.t_registros VALUES (295, '00-00000059', 1, 35, '9VxKs9Gfp', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000032', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 32, 0);
INSERT INTO public.t_registros VALUES (296, '00-00000060', 1, 35, 'DjJ8EhTXt', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000033', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 33, 0);
INSERT INTO public.t_registros VALUES (302, '00-00000066', 1, 35, 'l7AQ0UAfk', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000039', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 39, 0);
INSERT INTO public.t_registros VALUES (303, '00-00000067', 1, 35, 'vzhB4kGVn', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000040', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 40, 0);
INSERT INTO public.t_registros VALUES (304, '00-00000068', 1, 35, 'g4L7XpqdN', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000041', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 41, 0);
INSERT INTO public.t_registros VALUES (305, '00-00000069', 1, 35, 'qOBEC9EpW', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000042', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 42, 0);
INSERT INTO public.t_registros VALUES (306, '00-00000070', 1, 35, 'vdnQFVIKf', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000043', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 43, 0);
INSERT INTO public.t_registros VALUES (307, '00-00000071', 1, 35, '4XCSvPOUn', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000044', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 44, 0);
INSERT INTO public.t_registros VALUES (298, '00-00000062', 1, 35, 'dIFOuDqh3', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000035', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 35, 0);
INSERT INTO public.t_registros VALUES (299, '00-00000063', 1, 35, 'hRm8MWrkv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000036', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 36, 0);
INSERT INTO public.t_registros VALUES (300, '00-00000064', 1, 35, '9ooP14EHu', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000037', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 37, 0);
INSERT INTO public.t_registros VALUES (301, '00-00000065', 1, 35, 'eTxkRb8xR', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000038', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 38, 0);
INSERT INTO public.t_registros VALUES (308, '00-00000072', 1, 35, 'YIjD9XCcB', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000045', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 45, 0);
INSERT INTO public.t_registros VALUES (309, '00-00000073', 1, 35, 'GKNQ76OhN', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000046', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 46, 0);
INSERT INTO public.t_registros VALUES (310, '00-00000074', 1, 35, 'V9qx5bBFP', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000047', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 47, 0);
INSERT INTO public.t_registros VALUES (311, '00-00000075', 1, 35, '6eXi5udp3', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000048', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 48, 0);
INSERT INTO public.t_registros VALUES (313, '00-00000077', 1, 35, 'tIdJVKT5C', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000050', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 50, 0);
INSERT INTO public.t_registros VALUES (314, '00-00000078', 1, 35, 'BaKKjQ0GW', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000051', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 51, 0);
INSERT INTO public.t_registros VALUES (315, '00-00000079', 1, 35, 'iprACTRqf', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000052', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 52, 0);
INSERT INTO public.t_registros VALUES (316, '00-00000080', 1, 35, 'VTnPaTCZw', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000053', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 53, 0);
INSERT INTO public.t_registros VALUES (317, '00-00000081', 1, 35, 'zN1zc2zbc', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000054', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 54, 0);
INSERT INTO public.t_registros VALUES (318, '00-00000082', 1, 35, 'lfNNpnAnW', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000055', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 55, 0);
INSERT INTO public.t_registros VALUES (325, '00-00000089', 1, 35, 'P2zbyFvas', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000062', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 62, 0);
INSERT INTO public.t_registros VALUES (326, '00-00000090', 1, 35, 'QXEj9lRYi', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000063', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 63, 0);
INSERT INTO public.t_registros VALUES (327, '00-00000091', 1, 35, '1TasNwg4R', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000064', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 64, 0);
INSERT INTO public.t_registros VALUES (328, '00-00000092', 1, 35, 'VbvZ36C0N', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000065', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 65, 0);
INSERT INTO public.t_registros VALUES (329, '00-00000093', 1, 35, 'RSnG1QMiA', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000066', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 66, 0);
INSERT INTO public.t_registros VALUES (320, '00-00000084', 1, 35, '63Sbj5shy', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000057', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 57, 0);
INSERT INTO public.t_registros VALUES (321, '00-00000085', 1, 35, 'QGtq2WcqS', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000058', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 58, 0);
INSERT INTO public.t_registros VALUES (323, '00-00000087', 1, 35, 'UyTcA6jy4', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000060', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 60, 0);
INSERT INTO public.t_registros VALUES (324, '00-00000088', 1, 35, '7M1NcvhEN', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000061', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 61, 0);
INSERT INTO public.t_registros VALUES (322, '00-00000086', 1, 35, 'eHVLQ384g', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000059', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 59, 0);
INSERT INTO public.t_registros VALUES (330, '00-00000094', 1, 35, 'BfRqmlEzR', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000067', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 67, 0);
INSERT INTO public.t_registros VALUES (331, '00-00000095', 1, 35, 'NsCaHWUwI', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000068', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 68, 0);
INSERT INTO public.t_registros VALUES (332, '00-00000096', 1, 35, 'G1btmyGc3', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000069', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 69, 0);
INSERT INTO public.t_registros VALUES (333, '00-00000097', 1, 35, '2cg4aWyc2', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:46', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000070', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 70, 0);
INSERT INTO public.t_registros VALUES (334, '00-00000098', 1, 35, 'SExk58HoA', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:47', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000071', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 71, 0);
INSERT INTO public.t_registros VALUES (335, '00-00000099', 1, 35, 'w5pdIQyw7', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:47', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000072', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 72, 0);
INSERT INTO public.t_registros VALUES (336, '00-00000100', 1, 35, '8YtO9M8IV', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:47', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000073', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 73, 0);
INSERT INTO public.t_registros VALUES (337, '00-00000101', 1, 35, 'ERzzQG36y', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:47', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000074', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 74, 0);
INSERT INTO public.t_registros VALUES (338, '00-00000102', 1, 35, 'H0MGuxWXU', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:47', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000075', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 75, 0);
INSERT INTO public.t_registros VALUES (339, '00-00000103', 1, 35, 'T4gOoJR2G', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:47', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000076', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 76, 0);
INSERT INTO public.t_registros VALUES (340, '00-00000104', 1, 35, '6strI9Pi2', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000077', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 77, 0);
INSERT INTO public.t_registros VALUES (341, '00-00000105', 1, 35, 'UwETdFCsa', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000078', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 78, 0);
INSERT INTO public.t_registros VALUES (342, '00-00000106', 1, 35, 'FGijA0rFO', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000079', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 79, 0);
INSERT INTO public.t_registros VALUES (343, '00-00000107', 1, 35, 'xlQVujvtb', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000080', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 80, 0);
INSERT INTO public.t_registros VALUES (344, '00-00000108', 1, 35, 'Np3DFxGAO', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000081', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 81, 0);
INSERT INTO public.t_registros VALUES (345, '00-00000109', 1, 35, 'xk4xT40mv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000082', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 82, 0);
INSERT INTO public.t_registros VALUES (346, '00-00000110', 1, 35, 'P0nEVIjZT', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000083', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 83, 0);
INSERT INTO public.t_registros VALUES (347, '00-00000111', 1, 35, 'JKKOdpSbR', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000084', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 84, 0);
INSERT INTO public.t_registros VALUES (348, '00-00000112', 1, 35, 'yFAhAajHS', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000085', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 85, 0);
INSERT INTO public.t_registros VALUES (349, '00-00000113', 1, 35, 'oeIhpXpYu', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000086', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 86, 0);
INSERT INTO public.t_registros VALUES (350, '00-00000114', 1, 35, 'xBDJFTJIN', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000087', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 87, 0);
INSERT INTO public.t_registros VALUES (351, '00-00000115', 1, 35, '5IgO3ELpk', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000088', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 88, 0);
INSERT INTO public.t_registros VALUES (352, '00-00000116', 1, 35, 'N6VeDnFju', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000089', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 89, 0);
INSERT INTO public.t_registros VALUES (353, '00-00000117', 1, 35, 'Ovsx3a0ii', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000090', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 90, 0);
INSERT INTO public.t_registros VALUES (354, '00-00000118', 1, 35, 'hdoLfJrYy', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000091', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 91, 0);
INSERT INTO public.t_registros VALUES (355, '00-00000119', 1, 35, 'o6zyBxniS', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000092', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 92, 0);
INSERT INTO public.t_registros VALUES (356, '00-00000120', 1, 35, 'uluJZRRf2', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:48', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000093', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 93, 0);
INSERT INTO public.t_registros VALUES (357, '00-00000121', 1, 35, 'SDeuruUPk', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:49', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000094', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 94, 0);
INSERT INTO public.t_registros VALUES (358, '00-00000122', 1, 35, 'L9Wc4nXUp', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:49', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000095', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 95, 0);
INSERT INTO public.t_registros VALUES (359, '00-00000123', 1, 35, 'iPdL0SqJd', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000096', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 96, 0);
INSERT INTO public.t_registros VALUES (360, '00-00000124', 1, 35, '7Go9xhf3j', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000097', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 97, 0);
INSERT INTO public.t_registros VALUES (361, '00-00000125', 1, 35, '9s16JECbc', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000098', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 98, 0);
INSERT INTO public.t_registros VALUES (362, '00-00000126', 1, 35, 'OIPDabN6C', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000099', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 99, 0);
INSERT INTO public.t_registros VALUES (363, '00-00000127', 1, 35, 'LP4Ff7WdB', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000100', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 100, 0);
INSERT INTO public.t_registros VALUES (364, '00-00000128', 1, 35, 'INLj63pk8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000101', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 101, 0);
INSERT INTO public.t_registros VALUES (365, '00-00000129', 1, 35, 'gbMPT4B4c', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000102', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 102, 0);
INSERT INTO public.t_registros VALUES (366, '00-00000130', 1, 35, 'bi1BQp2xa', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000103', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 103, 0);
INSERT INTO public.t_registros VALUES (367, '00-00000131', 1, 35, '8gQ2fA3WW', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000104', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 104, 0);
INSERT INTO public.t_registros VALUES (368, '00-00000132', 1, 35, 'VIKbSpjVF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000105', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 105, 0);
INSERT INTO public.t_registros VALUES (369, '00-00000133', 1, 35, 'i1kS7W8BP', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000106', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 106, 0);
INSERT INTO public.t_registros VALUES (370, '00-00000134', 1, 35, 'I8ILxbpLe', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000107', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 107, 0);
INSERT INTO public.t_registros VALUES (371, '00-00000135', 1, 35, 'tnTq9QH2w', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000108', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 108, 0);
INSERT INTO public.t_registros VALUES (372, '00-00000136', 1, 35, '0FDznlQqF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000109', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 109, 0);
INSERT INTO public.t_registros VALUES (373, '00-00000137', 1, 35, 'aSPYuKnI0', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000110', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 110, 0);
INSERT INTO public.t_registros VALUES (374, '00-00000138', 1, 35, 'IZWZVKZLY', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000111', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 111, 0);
INSERT INTO public.t_registros VALUES (375, '00-00000139', 1, 35, 'kKnXDj5PB', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000112', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 112, 0);
INSERT INTO public.t_registros VALUES (376, '00-00000140', 1, 35, '2ocXI3rmk', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:52', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000113', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 113, 0);
INSERT INTO public.t_registros VALUES (377, '00-00000141', 1, 35, 'ehqeYWkG6', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:52', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000114', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 114, 0);
INSERT INTO public.t_registros VALUES (378, '00-00000142', 1, 35, 'XqmGb7f8e', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:53', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000115', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 115, 0);
INSERT INTO public.t_registros VALUES (379, '00-00000143', 1, 35, 'SbdNf8VzM', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000116', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 116, 0);
INSERT INTO public.t_registros VALUES (380, '00-00000144', 1, 35, 'OBKHHQF9I', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000117', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 117, 0);
INSERT INTO public.t_registros VALUES (381, '00-00000145', 1, 35, 'HObKJFfes', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000118', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 118, 0);
INSERT INTO public.t_registros VALUES (383, '00-00000147', 1, 35, 'EXoc6Lf7K', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000120', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 120, 0);
INSERT INTO public.t_registros VALUES (384, '00-00000148', 1, 35, '4jqZPoV59', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000121', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 121, 0);
INSERT INTO public.t_registros VALUES (382, '00-00000146', 1, 35, '4nN1RBQUT', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:54', 6650.1, 2, 'Se anula factura', '', '2023-10-05 18:05:12', 1, 'cum00123', '00000119', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 119, 0);
INSERT INTO public.t_registros VALUES (389, '00-00000066', 1, 36, 'QrDzT90jK', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000008', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 8, 0);
INSERT INTO public.t_registros VALUES (390, '00-00000067', 1, 36, 'xCu1uBcOi', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000009', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 9, 0);
INSERT INTO public.t_registros VALUES (391, '00-00000068', 1, 36, '7DlZ5aESN', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000010', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 10, 0);
INSERT INTO public.t_registros VALUES (392, '00-00000069', 1, 36, 'lmNIYylfc', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000011', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 11, 0);
INSERT INTO public.t_registros VALUES (393, '00-00000070', 1, 36, '7i4VuCM5L', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000012', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 12, 0);
INSERT INTO public.t_registros VALUES (394, '00-00000071', 1, 36, 'pCBIC6eNW', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000013', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 13, 0);
INSERT INTO public.t_registros VALUES (386, '00-00000063', 1, 36, 'ejbzaPlL4', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000005', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 5, 0);
INSERT INTO public.t_registros VALUES (387, '00-00000064', 1, 36, '3r26aYKYD', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000006', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 6, 0);
INSERT INTO public.t_registros VALUES (388, '00-00000065', 1, 36, '7oyjHpm9i', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000007', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 7, 0);
INSERT INTO public.t_registros VALUES (395, '00-00000149', 1, 35, 'Rj93UJm6F', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000122', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 122, 0);
INSERT INTO public.t_registros VALUES (396, '00-00000150', 1, 35, 'jiUC3asm3', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000123', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 123, 0);
INSERT INTO public.t_registros VALUES (397, '00-00000151', 1, 35, 'qD0jxYE04', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000124', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 124, 0);
INSERT INTO public.t_registros VALUES (398, '00-00000152', 1, 35, '76pri65kv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000125', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 125, 0);
INSERT INTO public.t_registros VALUES (399, '00-00000153', 1, 35, 'qNOV6tUOW', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000126', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 126, 0);
INSERT INTO public.t_registros VALUES (400, '00-00000154', 1, 35, 'nJjeBNpYw', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000127', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 127, 0);
INSERT INTO public.t_registros VALUES (401, '00-00000155', 1, 35, 'mbTSiinKn', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000128', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 128, 0);
INSERT INTO public.t_registros VALUES (402, '00-00000156', 1, 35, 'MPBjztzyj', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000129', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 129, 0);
INSERT INTO public.t_registros VALUES (403, '00-00000157', 1, 35, '9WMZ7M6Cf', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000130', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 130, 0);
INSERT INTO public.t_registros VALUES (404, '00-00000158', 1, 35, 'fd8sOJbWJ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000131', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 131, 0);
INSERT INTO public.t_registros VALUES (405, '00-00000034', 1, 37, 'NWxOjq9aq', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:07:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000001', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 1, 0);
INSERT INTO public.t_registros VALUES (406, '00-00000035', 1, 37, 'otuD85h0m', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:07:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000002', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 2, 0);
INSERT INTO public.t_registros VALUES (407, '00-00000036', 1, 37, 'W9TYuZUiS', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:07:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000003', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 3, 0);
INSERT INTO public.t_registros VALUES (408, '00-00000037', 1, 37, 'SQCHQq8cJ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:07:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000004', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 4, 0);
INSERT INTO public.t_registros VALUES (409, '00-00000038', 1, 37, 'QNOkj3lqE', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:07:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000005', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 5, 0);
INSERT INTO public.t_registros VALUES (410, '00-00000039', 1, 37, 'fapPqLQs7', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:07:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000006', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 6, 0);
INSERT INTO public.t_registros VALUES (411, '00-00000040', 1, 37, 'SlEaMjwtk', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:07:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000007', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 7, 0);
INSERT INTO public.t_registros VALUES (412, '00-00000041', 1, 37, 'jncJQq53w', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:07:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000008', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 8, 0);
INSERT INTO public.t_registros VALUES (413, '00-00000042', 1, 37, 'zZxOrpzHv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:07:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000009', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 9, 0);
INSERT INTO public.t_registros VALUES (414, '00-00000043', 1, 37, 'P1l6DZvxB', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:07:07', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000010', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 10, 0);
INSERT INTO public.t_registros VALUES (415, '00-00000044', 1, 37, 'o98b3VS6t', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:21:16', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000011', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 11, 0);
INSERT INTO public.t_registros VALUES (416, '00-00000045', 1, 37, 'AMgcmfM6C', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:21:16', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000012', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 12, 0);
INSERT INTO public.t_registros VALUES (417, '00-00000046', 1, 37, 'eqF27d88H', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:21:17', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000013', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 13, 0);
INSERT INTO public.t_registros VALUES (418, '00-00000047', 1, 37, 'xdZPPRm4m', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:21:17', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000014', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 14, 0);
INSERT INTO public.t_registros VALUES (419, '00-00000048', 1, 37, 'xMIoIXR2w', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:21:17', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000015', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 15, 0);
INSERT INTO public.t_registros VALUES (420, '00-00000049', 1, 37, 'Hr0tiEsuR', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:21:17', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000016', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 16, 0);
INSERT INTO public.t_registros VALUES (421, '00-00000050', 1, 37, 'KCZKM2JwP', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:21:17', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000017', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 17, 0);
INSERT INTO public.t_registros VALUES (422, '00-00000051', 1, 37, 'cDTcpE7pD', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:21:17', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000018', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 18, 0);
INSERT INTO public.t_registros VALUES (423, '00-00000052', 1, 37, 'wsXYD5Zfk', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:21:17', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000019', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 19, 0);
INSERT INTO public.t_registros VALUES (424, '00-00000053', 1, 37, '961KeMOqy', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:21:17', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000020', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 20, 0);
INSERT INTO public.t_registros VALUES (425, '00-00000001', 1, 38, '1i3RISKgf', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:27:00', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000001', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 1, 0);
INSERT INTO public.t_registros VALUES (426, '00-00000002', 1, 38, '8VvOKdjx9', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:43', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000002', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 2, 0);
INSERT INTO public.t_registros VALUES (427, '00-00000003', 1, 38, 'nzK2CGVmS', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000003', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 3, 0);
INSERT INTO public.t_registros VALUES (428, '00-00000004', 1, 38, 'cGWzEYJxe', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000004', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 4, 0);
INSERT INTO public.t_registros VALUES (429, '00-00000005', 1, 38, 'HZcqBdNjg', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000005', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 5, 0);
INSERT INTO public.t_registros VALUES (430, '00-00000006', 1, 38, 'oKlaQZxOL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000006', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 6, 0);
INSERT INTO public.t_registros VALUES (431, '00-00000007', 1, 38, '2JzuN7yV8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000007', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 7, 0);
INSERT INTO public.t_registros VALUES (432, '00-00000008', 1, 38, 'uByYMdOpn', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000008', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 8, 0);
INSERT INTO public.t_registros VALUES (433, '00-00000009', 1, 38, 'gkqAGJk6m', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000009', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 9, 0);
INSERT INTO public.t_registros VALUES (434, '00-00000010', 1, 38, 'SO1UrO6n7', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:50', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000010', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 10, 0);
INSERT INTO public.t_registros VALUES (435, '00-00000011', 1, 38, 'GojWEhBZ9', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000011', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 11, 0);
INSERT INTO public.t_registros VALUES (436, '00-00000012', 1, 38, '91J5QETCD', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000012', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 12, 0);
INSERT INTO public.t_registros VALUES (437, '00-00000013', 1, 38, 'kOFBMyb5m', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000013', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 13, 0);
INSERT INTO public.t_registros VALUES (438, '00-00000014', 1, 38, '2zf3UXC9B', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000014', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 14, 0);
INSERT INTO public.t_registros VALUES (439, '00-00000015', 1, 38, 'HBHDoQsP0', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000015', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 15, 0);
INSERT INTO public.t_registros VALUES (440, '00-00000016', 1, 38, 'nvDEMZ7bi', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000016', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 16, 0);
INSERT INTO public.t_registros VALUES (441, '00-00000017', 1, 38, 'vUjWfug9Z', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000017', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 17, 0);
INSERT INTO public.t_registros VALUES (442, '00-00000018', 1, 38, 'I21Ks4cC5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000018', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 18, 0);
INSERT INTO public.t_registros VALUES (443, '00-00000019', 1, 38, 'eXUU3jRkr', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000019', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 19, 0);
INSERT INTO public.t_registros VALUES (444, '00-00000020', 1, 38, 's6dhczy9w', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000020', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 20, 0);
INSERT INTO public.t_registros VALUES (445, '00-00000021', 1, 38, 'zMb2D0s9I', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000021', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 21, 0);
INSERT INTO public.t_registros VALUES (446, '00-00000022', 1, 38, 'rkC4uaUa5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:54', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000022', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 22, 0);
INSERT INTO public.t_registros VALUES (447, '00-00000023', 1, 38, 'TiEbWjn9F', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:56', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000023', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 23, 0);
INSERT INTO public.t_registros VALUES (448, '00-00000024', 1, 38, 'DWfUOpEG4', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:56', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000024', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 24, 0);
INSERT INTO public.t_registros VALUES (449, '00-00000025', 1, 38, 'Ea9U4r9aS', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:56', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000025', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 25, 0);
INSERT INTO public.t_registros VALUES (450, '00-00000026', 1, 38, 'UrUZEZvo1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:56', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000026', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 26, 0);
INSERT INTO public.t_registros VALUES (451, '00-00000027', 1, 38, '2RSTxZazY', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:56', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000027', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 27, 0);
INSERT INTO public.t_registros VALUES (452, '00-00000028', 1, 38, 'SeZ2hKoXv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:56', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000028', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 28, 0);
INSERT INTO public.t_registros VALUES (453, '00-00000029', 1, 38, 'SsezJwg6a', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:56', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000029', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 29, 0);
INSERT INTO public.t_registros VALUES (454, '00-00000030', 1, 38, 'ZsItA47XV', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:56', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000030', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 30, 0);
INSERT INTO public.t_registros VALUES (455, '00-00000031', 1, 38, 'w4TKkCAYG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:56', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000031', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 31, 0);
INSERT INTO public.t_registros VALUES (456, '00-00000032', 1, 38, '744MWIp2O', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:28:56', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000032', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 32, 0);
INSERT INTO public.t_registros VALUES (457, '00-00000033', 2, 38, 'orTc0HQqP', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:29:57', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '00000001', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 1, 0);
INSERT INTO public.t_registros VALUES (458, '00-00000034', 2, 38, '2LgGaljx2', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:29:57', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '00000002', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 2, 0);
INSERT INTO public.t_registros VALUES (459, '00-00000035', 2, 38, 'ZJhH5V2kB', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:29:57', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '00000003', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 3, 0);
INSERT INTO public.t_registros VALUES (460, '00-00000036', 2, 38, 'p3QQ6RPt5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:29:57', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '00000004', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 4, 0);
INSERT INTO public.t_registros VALUES (461, '00-00000037', 2, 38, 'vzdzN4KzC', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:29:57', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '00000005', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 5, 0);
INSERT INTO public.t_registros VALUES (462, '00-00000038', 2, 38, '9mivnfRN7', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:29:57', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '00000006', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 6, 0);
INSERT INTO public.t_registros VALUES (463, '00-00000039', 2, 38, 'nkV3OSX46', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:29:57', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '00000007', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 7, 0);
INSERT INTO public.t_registros VALUES (464, '00-00000040', 2, 38, 'hZgNAPL2J', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:29:57', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '00000008', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 8, 0);
INSERT INTO public.t_registros VALUES (465, '00-00000041', 2, 38, 'myuvyNzFr', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:29:57', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '00000009', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 9, 0);
INSERT INTO public.t_registros VALUES (466, '00-00000042', 2, 38, 'kIMhDFzuT', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:29:57', 6650.1, 1, 'Observación de prueba', '00-00000032', NULL, 1, 'cum00123', '00000010', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 10, 0);
INSERT INTO public.t_registros VALUES (467, '00-00000001', 1, 39, 'BZgQ7O0bg', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-24 12:31:32', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002500 de fecha 24/10/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (468, '00-00000043', 1, 38, 'dAReAjXWm', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-26 14:45:37', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000033', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 33, 0);
INSERT INTO public.t_registros VALUES (469, '00-00000044', 1, 38, 'HCy4NIDsS', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-26 14:45:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000034', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 34, 0);
INSERT INTO public.t_registros VALUES (470, '00-00000045', 1, 38, '4UFRlEo9d', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-26 14:45:41', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000035', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 35, 0);
INSERT INTO public.t_registros VALUES (471, '00-00000046', 1, 38, 'CLsPaDJjh', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-26 14:45:42', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000036', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 36, 0);
INSERT INTO public.t_registros VALUES (472, '00-00000047', 1, 38, 'yryzxXymW', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-26 14:45:42', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000037', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 37, 0);
INSERT INTO public.t_registros VALUES (473, '00-00000048', 1, 38, '6UpEKfbxo', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-26 14:45:42', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000038', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 38, 0);
INSERT INTO public.t_registros VALUES (474, '00-00000049', 1, 38, 'akEjy25cr', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-26 14:45:42', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000039', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 39, 0);
INSERT INTO public.t_registros VALUES (475, '00-00000050', 1, 38, 'DrCLxvEJj', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-26 14:45:42', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000040', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 40, 0);
INSERT INTO public.t_registros VALUES (476, '00-00000051', 1, 38, 'RrajNRSAx', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-26 14:45:42', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000041', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 41, 0);
INSERT INTO public.t_registros VALUES (477, '00-00000052', 1, 38, 'prAqsGycp', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-26 14:45:42', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000042', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 42, 0);
INSERT INTO public.t_registros VALUES (478, '00-00000053', 1, 38, 'KzgaJCBYz', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:32:58', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000043', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 43, 0);
INSERT INTO public.t_registros VALUES (480, '00-00000055', 1, 38, '34smku5cI', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:02', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000045', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 45, 0);
INSERT INTO public.t_registros VALUES (481, '00-00000056', 1, 38, 'AWlU9NMol', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:02', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000046', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 46, 0);
INSERT INTO public.t_registros VALUES (482, '00-00000057', 1, 38, 'VHZqt3r2k', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:02', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000047', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 47, 0);
INSERT INTO public.t_registros VALUES (491, '00-00000066', 1, 38, 'npf28jGPH', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000056', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 56, 0);
INSERT INTO public.t_registros VALUES (492, '00-00000067', 1, 38, 'ACBzH1rY1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000057', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 57, 0);
INSERT INTO public.t_registros VALUES (493, '00-00000068', 1, 38, '5iI2Qw4Z6', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000058', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 58, 0);
INSERT INTO public.t_registros VALUES (484, '00-00000059', 1, 38, 'lYr2OjOPx', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:02', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000049', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 49, 0);
INSERT INTO public.t_registros VALUES (485, '00-00000060', 1, 38, 'LSxcfnbqL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:02', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000050', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 50, 0);
INSERT INTO public.t_registros VALUES (486, '00-00000061', 1, 38, 'WoiwVxduI', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:02', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000051', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 51, 0);
INSERT INTO public.t_registros VALUES (487, '00-00000062', 1, 38, 'wfe3E8Xm5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:02', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000052', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 52, 0);
INSERT INTO public.t_registros VALUES (488, '00-00000063', 1, 38, 'X6xlti0hm', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000053', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 53, 0);
INSERT INTO public.t_registros VALUES (489, '00-00000064', 1, 38, 'Ntkl0QpQF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000054', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 54, 0);
INSERT INTO public.t_registros VALUES (490, '00-00000065', 1, 38, '22vI0X9HG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000055', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 55, 0);
INSERT INTO public.t_registros VALUES (494, '00-00000069', 1, 38, 'c13oXjEbB', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000059', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 59, 0);
INSERT INTO public.t_registros VALUES (495, '00-00000070', 1, 38, 'mxAM7nX85', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000060', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 60, 0);
INSERT INTO public.t_registros VALUES (496, '00-00000071', 1, 38, '3g5CC4R8J', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000061', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 61, 0);
INSERT INTO public.t_registros VALUES (497, '00-00000072', 1, 38, '1VkExXTG7', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000062', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 62, 0);
INSERT INTO public.t_registros VALUES (498, '00-00000073', 2, 38, 'yJXQblF4J', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:37', 6650.1, 1, 'Observación de prueba', '00-00000072', NULL, 1, 'cum00123', '00000011', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 11, 0);
INSERT INTO public.t_registros VALUES (499, '00-00000074', 2, 38, '12jh55AnK', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:37', 6650.1, 1, 'Observación de prueba', '00-00000072', NULL, 1, 'cum00123', '00000012', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 12, 0);
INSERT INTO public.t_registros VALUES (500, '00-00000075', 2, 38, 'WyPhZyLLL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:37', 6650.1, 1, 'Observación de prueba', '00-00000072', NULL, 1, 'cum00123', '00000013', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 13, 0);
INSERT INTO public.t_registros VALUES (502, '00-00000077', 2, 38, 'Vu4o1Xn84', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:37', 6650.1, 1, 'Observación de prueba', '00-00000072', NULL, 1, 'cum00123', '00000015', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 15, 0);
INSERT INTO public.t_registros VALUES (503, '00-00000078', 2, 38, 'F6Clefbzt', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:37', 6650.1, 1, 'Observación de prueba', '00-00000072', NULL, 1, 'cum00123', '00000016', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 16, 0);
INSERT INTO public.t_registros VALUES (504, '00-00000079', 2, 38, 'RN2No8lid', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:37', 6650.1, 1, 'Observación de prueba', '00-00000072', NULL, 1, 'cum00123', '00000017', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 17, 0);
INSERT INTO public.t_registros VALUES (514, '00-00000089', 3, 38, 'mtJvK10BP', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:53', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000007', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 7, 0);
INSERT INTO public.t_registros VALUES (515, '00-00000090', 3, 38, '2i8HJtRip', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:53', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000008', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 8, 0);
INSERT INTO public.t_registros VALUES (506, '00-00000081', 2, 38, 'm8Ijh5E2n', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:37', 6650.1, 1, 'Observación de prueba', '00-00000072', NULL, 1, 'cum00123', '00000019', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 19, 0);
INSERT INTO public.t_registros VALUES (507, '00-00000082', 2, 38, 'NjNjlMakM', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:37', 6650.1, 1, 'Observación de prueba', '00-00000072', NULL, 1, 'cum00123', '00000020', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 20, 0);
INSERT INTO public.t_registros VALUES (508, '00-00000083', 3, 38, 'vtYLHHHan', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:53', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000001', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 1, 0);
INSERT INTO public.t_registros VALUES (509, '00-00000084', 3, 38, 'sbr9RMymG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:53', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000002', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 2, 0);
INSERT INTO public.t_registros VALUES (510, '00-00000085', 3, 38, 'TC0qaCNDv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:53', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000003', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 3, 0);
INSERT INTO public.t_registros VALUES (512, '00-00000087', 3, 38, 'AZyVWWzsc', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:53', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000005', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 5, 0);
INSERT INTO public.t_registros VALUES (513, '00-00000088', 3, 38, 'czBSr3qL4', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:53', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000006', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 6, 0);
INSERT INTO public.t_registros VALUES (511, '00-00000086', 3, 38, 'mjBF1N14S', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:53', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000004', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 4, 0);
INSERT INTO public.t_registros VALUES (516, '00-00000091', 3, 38, '4fjxyW8Hq', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:53', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000009', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 9, 0);
INSERT INTO public.t_registros VALUES (517, '00-00000092', 3, 38, '9rXf6elCK', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:53', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000010', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 10, 0);
INSERT INTO public.t_registros VALUES (518, '00-00000159', 1, 35, 'N313nB92a', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 17:08:22', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000132', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 132, 0);
INSERT INTO public.t_registros VALUES (519, '00-00000160', 1, 35, 'du5YcDxI9', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 17:08:26', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000133', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 133, 0);
INSERT INTO public.t_registros VALUES (520, '00-00000161', 1, 35, 'zdbVxyzYO', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 17:08:26', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000134', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 134, 0);
INSERT INTO public.t_registros VALUES (521, '00-00000162', 1, 35, 'yhZfioxv8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 17:08:26', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000135', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 135, 0);
INSERT INTO public.t_registros VALUES (522, '00-00000163', 1, 35, '4RBZIkt8i', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 17:08:26', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000136', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 136, 0);
INSERT INTO public.t_registros VALUES (523, '00-00000164', 1, 35, 'otX5s1qvq', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 17:08:26', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000137', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 137, 0);
INSERT INTO public.t_registros VALUES (524, '00-00000165', 1, 35, 'SNAypTrsV', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 17:08:26', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000138', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 138, 0);
INSERT INTO public.t_registros VALUES (525, '00-00000166', 1, 35, 'O73T4WKbt', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 17:08:26', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000139', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 139, 0);
INSERT INTO public.t_registros VALUES (526, '00-00000167', 1, 35, 'iaJJI7mvV', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 17:08:26', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000140', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 140, 0);
INSERT INTO public.t_registros VALUES (527, '00-00000168', 1, 35, 'UnjgKglJl', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 17:08:26', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000141', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 141, 0);
INSERT INTO public.t_registros VALUES (528, '00-00000072', 1, 36, 'llyihiuCK', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 18:58:43', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000014', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 14, 0);
INSERT INTO public.t_registros VALUES (529, '00-00000073', 1, 36, 'AbyKDKAzB', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 19:00:12', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000015', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 15, 0);
INSERT INTO public.t_registros VALUES (530, '00-00000074', 1, 36, 'QPeAsG5hN', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 19:02:13', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000016', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 16, 0);
INSERT INTO public.t_registros VALUES (531, '00-00000075', 1, 36, 'Ap4kMPoxl', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 19:04:51', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000017', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 17, 0);
INSERT INTO public.t_registros VALUES (312, '00-00000076', 1, 35, 'gjE5gSiJa', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000049', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 49, 0);
INSERT INTO public.t_registros VALUES (501, '00-00000076', 2, 38, 'DZe7uzAfC', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:37', 6650.1, 1, 'Observación de prueba', '00-00000072', NULL, 1, 'cum00123', '00000014', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 14, 0);
INSERT INTO public.t_registros VALUES (532, '00-00000076', 1, 36, 'bor0gkxym', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 19:24:32', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000018', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 18, 0);
INSERT INTO public.t_registros VALUES (533, '00-00000077', 1, 36, 'i4OSWcTEc', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 20:29:37', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000019', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 19, 0);
INSERT INTO public.t_registros VALUES (534, '00-00000078', 1, 36, 'Y9HNHSwaK', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 20:31:57', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000020', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 20, 0);
INSERT INTO public.t_registros VALUES (535, '00-00000079', 1, 36, 'uSHJpFGRk', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 20:45:33', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000021', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 21, 0);
INSERT INTO public.t_registros VALUES (505, '00-00000080', 2, 38, 'fJuBD1pWp', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:37', 6650.1, 1, 'Observación de prueba', '00-00000072', NULL, 1, 'cum00123', '00000018', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 18, 0);
INSERT INTO public.t_registros VALUES (536, '00-00000080', 1, 36, 'r6dvMouiI', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 20:52:59', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000022', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 22, 0);
INSERT INTO public.t_registros VALUES (537, '00-00000081', 1, 36, '32Gk86efS', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 20:57:01', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000023', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 23, 0);
INSERT INTO public.t_registros VALUES (538, '00-00000082', 1, 36, 'qb4LY2Mh7', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 20:58:24', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000024', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 24, 0);
INSERT INTO public.t_registros VALUES (319, '00-00000083', 1, 35, 'vvQO5FB0P', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:45', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000056', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 56, 0);
INSERT INTO public.t_registros VALUES (539, '00-00000083', 2, 36, 'qvhWFceQM', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 21:05:18', 6650.1, 1, 'Observación de prueba', '00-00000082', NULL, 1, 'cum00123', '00000001', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 1, 0);
INSERT INTO public.t_registros VALUES (540, '00-00000084', 3, 36, '1IjLVr1Ka', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 21:10:26', 6650.1, 1, 'Observación de prueba', '00-00000083', NULL, 1, 'cum00123', '00000002', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 2, 0);
INSERT INTO public.t_registros VALUES (541, '00-00000085', 2, 36, 'xKMqBG6hK', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 21:14:56', 6650.1, 1, 'Observación de prueba', '00-00000084', NULL, 1, 'cum00123', '00000002', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 2, 0);
INSERT INTO public.t_registros VALUES (542, '00-00000086', 1, 36, 'vxqe6VatO', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 21:16:53', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000025', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 25, 0);
INSERT INTO public.t_registros VALUES (543, '00-00000087', 1, 36, 'AoQrUj9HP', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 21:18:35', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000026', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 26, 0);
INSERT INTO public.t_registros VALUES (544, '00-00000088', 1, 36, 'nn2mjIM54', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-28 16:27:29', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000027', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 27, 0);
INSERT INTO public.t_registros VALUES (250, '00-00000054', 1, 36, 'Le5OUifj3', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:41', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 1, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (290, '00-00000054', 1, 35, 'xPM4VBTQ6', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000027', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 27, 0);
INSERT INTO public.t_registros VALUES (479, '00-00000054', 1, 38, 'iLYUUI3B5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:02', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000044', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 44, 0);
INSERT INTO public.t_registros VALUES (545, '00-00000054', 1, 37, 'FrSiE6MKf', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-28 20:43:20', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000021', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 21, 0);
INSERT INTO public.t_registros VALUES (263, '00-00000055', 1, 36, 'LxLx2kGrZ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-09-29 17:23:00', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta NOVUS DESARROLLO DIGITAL, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0, 0);
INSERT INTO public.t_registros VALUES (546, '00-00000055', 1, 37, 'X0TO8Tiku', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-28 22:24:04', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000022', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 22, 0);
INSERT INTO public.t_registros VALUES (547, '00-00000056', 1, 37, 'CItcjD8hB', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-28 22:40:29', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000023', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 23, 0);
INSERT INTO public.t_registros VALUES (548, '00-00000057', 1, 37, 'PbwwGSZFx', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-28 22:53:35', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000024', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 24, 0);
INSERT INTO public.t_registros VALUES (483, '00-00000058', 1, 38, '3o2AtnPkX', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-27 14:33:02', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000048', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 48, 0);
INSERT INTO public.t_registros VALUES (549, '00-00000058', 1, 37, 'JAD90kQ1c', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-28 22:55:17', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000025', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 25, 0);
INSERT INTO public.t_registros VALUES (550, '00-00000059', 1, 37, 'gagEVhvtf', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-28 22:56:29', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000026', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 26, 0);
INSERT INTO public.t_registros VALUES (551, '00-00000060', 1, 37, 'sxYEe73bY', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-28 23:00:24', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000027', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 27, 0);
INSERT INTO public.t_registros VALUES (297, '00-00000061', 1, 35, '14IKUqwTd', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-05 18:02:44', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000034', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 34, 0);
INSERT INTO public.t_registros VALUES (552, '00-00000061', 1, 37, 'F0ff8FDac', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-11-28 23:02:24', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000028', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 28, 0);
INSERT INTO public.t_registros VALUES (553, '00-00000093', 1, 38, 'bXuKOMdT4', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2024-01-06 13:12:11', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000063', 0, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00020000 de fecha 12/10/2023.', 63, 0);
INSERT INTO public.t_registros VALUES (385, '00-00000062', 1, 36, 'MiafB1ZDr', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-10-12 12:06:37', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000004', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/008 de fecha 02/10/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 4, 0);
INSERT INTO public.t_registros VALUES (554, '00-00000062', 1, 37, 'kZKvGKkij', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2024-01-07 19:19:06', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000029', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 29, 0);
INSERT INTO public.t_registros VALUES (555, '00-00000063', 1, 37, 'fSZSNcgCO', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2024-01-07 19:24:20', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000030', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 30, 0);
INSERT INTO public.t_registros VALUES (556, '00-00000064', 1, 37, '5Zi5HpLk7', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2024-01-07 19:32:35', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000031', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 31, 0);
INSERT INTO public.t_registros VALUES (557, '00-00000065', 1, 37, '1OeMPd1nS', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2024-01-07 19:52:19', 6650.1, 1, 'Observación de prueba', '', NULL, 1, 'cum00123', '00000032', 1, 'Este documento se emite bajo la providencia administrativa Nro. SNAT/2014/0032 de fecha 31/07/2014. Imprenta SMART INNOVACIONES TECNOLOGICAS, C.A. RIF J-50375790-6, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/011 de fecha 10/11/2023. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 32, 0);


--
-- TOC entry 3434 (class 0 OID 16436)
-- Dependencies: 226
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_roles VALUES (1, 'Administrador');
INSERT INTO public.t_roles VALUES (4, 'Fiscal');
INSERT INTO public.t_roles VALUES (3, 'Emisor');
INSERT INTO public.t_roles VALUES (2, 'Máster');
INSERT INTO public.t_roles VALUES (5, 'Facturador');


--
-- TOC entry 3435 (class 0 OID 16439)
-- Dependencies: 227
-- Data for Name: t_serviciosdoc; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_serviciosdoc VALUES (9, 39, 0, 1);
INSERT INTO public.t_serviciosdoc VALUES (6, 36, 0, 88);
INSERT INTO public.t_serviciosdoc VALUES (8, 38, 0, 93);
INSERT INTO public.t_serviciosdoc VALUES (7, 37, 0, 65);
INSERT INTO public.t_serviciosdoc VALUES (10, 40, 0, 0);
INSERT INTO public.t_serviciosdoc VALUES (5, 35, 0, 168);


--
-- TOC entry 3437 (class 0 OID 16443)
-- Dependencies: 229
-- Data for Name: t_serviciosmasivos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_serviciosmasivos VALUES (37, 'J-30240664-1', 'Intercable', 'Caracas, Venezuela', 'email@inter.com.ve', '05004683700', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMzciLCJyaWYiOiJKLTMwMjQwNjY0LTEiLCJyYXpvbnNvY2lhbCI6IkludGVyY2FibGUiLCJkaXJlY2Npb24iOiJDYXJhY2FzLCBWZW5lenVlbGEiLCJlbWFpbCI6ImVtYWlsQGludGVyLmNvbS52ZSIsInRlbGVmb25vIjoiMDUwMDQ2ODM3MDAiLCJlbnZpb2NvcnJlbyI6IjEiLCJ2YWxpZGFyaW50ZXJubyI6IjIifSwiaWF0IjoxNjk2MDIzMTg5fQ.3J1f60VAnHQ2bs7nJDSEpy_640rcamOhFfu3eza2X80', 1, 1, 0, 'https://www.inter.com.ve/', NULL, '1', 2, 18, NULL);
INSERT INTO public.t_serviciosmasivos VALUES (38, 'J-00124134-5', 'CANTV', 'Caracas, Venezuela', 'info@cantv.com', '0581234455', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMzgiLCJyaWYiOiJKLTAwMTI0MTM0LTUiLCJyYXpvbnNvY2lhbCI6IkNBTlRWIiwiZGlyZWNjaW9uIjoiQ2FyYWNhcywgVmVuZXp1ZWxhIiwiZW1haWwiOiJpbmZvQGNhbnR2LmNvbSIsInRlbGVmb25vIjoiMDU4MTIzNDQ1NSIsImVudmlvY29ycmVvIjoiMSIsInZhbGlkYXJpbnRlcm5vIjoiMiJ9LCJpYXQiOjE2OTcxMjc4NTl9.YA2zrjFPbIvr0DqXHLbx8B42IskEGXcevzPtKDsVVAU', 1, 1, 0, 'www.cantv.com', NULL, '1', 2, 11, NULL);
INSERT INTO public.t_serviciosmasivos VALUES (39, 'J-0000000-2', 'Prueba Sit', 'Curazao', 'bbb@gmail.com', '34567890', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMzkiLCJyaWYiOiJKLTAwMDAwMDAtMiIsInJhem9uc29jaWFsIjoiUHJ1ZWJhIFNpdCIsImRpcmVjY2lvbiI6IkN1cmF6YW8iLCJlbWFpbCI6ImJiYkBnbWFpbC5jb20iLCJ0ZWxlZm9ubyI6IjM0NTY3ODkwIn0sImlhdCI6MTY5ODE2NDk1MX0.UaYkghadjin-EGpQ5mddNSPSNd29j4NjujQvJam-icQ', 1, 0, 0, '', NULL, '1', 0, NULL, NULL);
INSERT INTO public.t_serviciosmasivos VALUES (40, 'J-44444444-6', 'prueba local', 'cumana', 'correo@mail.com', '123456', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNDAiLCJyaWYiOiJKLTQ0NDQ0NDQ0LTYiLCJyYXpvbnNvY2lhbCI6InBydWViYSBsb2NhbCIsImRpcmVjY2lvbiI6ImN1bWFuYSIsImVtYWlsIjoiY29ycmVvQG1haWwuY29tIiwidGVsZWZvbm8iOiIxMjM0NTYifSwiaWF0IjoxNzA0NzU2OTM1fQ.gic_ozOG34ds6STeMjQKXT1wxzDxqpnl0N98AokPL1s', 1, 1, 0, 'www.ggggg.com', NULL, '1', 0, NULL, NULL);
INSERT INTO public.t_serviciosmasivos VALUES (35, 'J-00364445-5', 'Laser Airlines', 'Caracas, Venezuela', 'email@laser.com', '0501 5273700', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMzUiLCJyaWYiOiJKLTAwMzY0NDQ1LTUiLCJyYXpvbnNvY2lhbCI6Ikxhc2VyIEFpcmxpbmVzIiwiZGlyZWNjaW9uIjoiQ2FyYWNhcywgVmVuZXp1ZWxhIiwiZW1haWwiOiJlbWFpbEBsYXNlci5jb20iLCJ0ZWxlZm9ubyI6IjA1MDEgNTI3MzcwMCIsImVudmlvY29ycmVvIjoiMSIsInZhbGlkYXJpbnRlcm5vIjoiMiJ9LCJpYXQiOjE2OTYwMjMxNjN9.5MdPTsvzldd2zSJOEZesq2jr-cncXDOq6voaQmejgG8', 1, 1, 0, 'https://www.laserairlines.com', NULL, '1', 2, 11, NULL);
INSERT INTO public.t_serviciosmasivos VALUES (36, 'J-30468971-3', 'Digitel', 'Caracas, Venezuela', 'correo@digitel.com', '04123444835', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMzYiLCJyaWYiOiJKLTMwNDY4OTcxLTMiLCJyYXpvbnNvY2lhbCI6IkRpZ2l0ZWwiLCJkaXJlY2Npb24iOiJDYXJhY2FzLCBWZW5lenVlbGEiLCJlbWFpbCI6ImNvcnJlb0BkaWdpdGVsLmNvbSIsInRlbGVmb25vIjoiMDQxMjM0NDQ4MzUiLCJlbnZpb2NvcnJlbyI6IjEiLCJ2YWxpZGFyaW50ZXJubyI6IjIifSwiaWF0IjoxNjk2MDIzMTc0fQ.Z0V2wuXWsRAJ2dR95iSZpl3OQ5nFDvjQYaBp9MT6NdE', 1, 1, 0, 'https://www.digitel.com.ve/', NULL, '1', 2, 11, NULL);


--
-- TOC entry 3439 (class 0 OID 16451)
-- Dependencies: 231
-- Data for Name: t_tipocedulacliente; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipocedulacliente VALUES (1, 'Cédula de Identidad', 'CI');
INSERT INTO public.t_tipocedulacliente VALUES (2, 'Pasaporte', 'PasP.');
INSERT INTO public.t_tipocedulacliente VALUES (3, 'Registro de Información Fiscal', 'RIF');


--
-- TOC entry 3440 (class 0 OID 16454)
-- Dependencies: 232
-- Data for Name: t_tipodocumentos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipodocumentos VALUES (1, 'Factura');
INSERT INTO public.t_tipodocumentos VALUES (2, 'Nota de débito');
INSERT INTO public.t_tipodocumentos VALUES (3, 'Nota de crédito');
INSERT INTO public.t_tipodocumentos VALUES (4, 'Orden de entrega');
INSERT INTO public.t_tipodocumentos VALUES (5, 'Guía de despacho');


--
-- TOC entry 3442 (class 0 OID 16458)
-- Dependencies: 234
-- Data for Name: t_tranzascorrelativo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tranzascorrelativo VALUES (16, 39, 19, '2023-10-24 12:31:15', 2500, '34534534', '2023-10-24', 1, '1', '2500', 1);
INSERT INTO public.t_tranzascorrelativo VALUES (12, 35, 19, '2023-05-16 10:43:19', 2000, '123456-00', '2023-05-16', 1, '1', '2000', 168);
INSERT INTO public.t_tranzascorrelativo VALUES (14, 36, 19, '2023-06-01 19:23:54', 4000, '12345678', '2023-06-01', 1, '1', '4000', 88);
INSERT INTO public.t_tranzascorrelativo VALUES (15, 38, 19, '2023-10-12 12:26:31', 20000, '00-25252858', '2023-10-12', 1, '1', '20000', 93);
INSERT INTO public.t_tranzascorrelativo VALUES (13, 37, 19, '2023-06-01 19:23:39', 2000, '12345678', '2023-06-01', 1, '1', '2000', 65);


--
-- TOC entry 3444 (class 0 OID 16464)
-- Dependencies: 236
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_usuarios VALUES (6, 'fiscal1', 'e10adc3949ba59abbe56e057f20f883e', 'SENIAT Fiscal', 4, NULL, 1, NULL, NULL);
INSERT INTO public.t_usuarios VALUES (2, 'seniat1', 'e10adc3949ba59abbe56e057f20f883e', 'SENIAT', 2, NULL, 1, NULL, NULL);
INSERT INTO public.t_usuarios VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'SIT', 1, NULL, 1, NULL, NULL);
INSERT INTO public.t_usuarios VALUES (19, 'facturasit', 'e10adc3949ba59abbe56e057f20f883e', 'Facturar SIT', 5, NULL, 1, NULL, NULL);
INSERT INTO public.t_usuarios VALUES (22, 'laseruser', 'e10adc3949ba59abbe56e057f20f883e', 'Laser Airlines', 3, NULL, 1, 35, NULL);


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 214
-- Name: t_bitacoras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_bitacoras_id_seq', 2806, true);


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 219
-- Name: t_formasdepago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_formasdepago_id_seq', 940, true);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 221
-- Name: t_plantillacorreos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_plantillacorreos_id_seq', 63, true);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 222
-- Name: t_registro_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_registro_detalles_id_seq', 1626, true);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 225
-- Name: t_registros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_registros_id_seq', 557, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 228
-- Name: t_serviciosdoc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_serviciosdoc_id_seq', 10, true);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 230
-- Name: t_serviciosmasivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_serviciosmasivos_id_seq', 40, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 233
-- Name: t_tranzascorrelativo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_tranzascorrelativo_id_seq', 16, true);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 235
-- Name: t_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_usuarios_id_seq', 22, true);


--
-- TOC entry 3268 (class 2606 OID 16474)
-- Name: t_serviciosdoc pk_t_serviciosdoc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_serviciosdoc
    ADD CONSTRAINT pk_t_serviciosdoc PRIMARY KEY (id);


--
-- TOC entry 3250 (class 2606 OID 16476)
-- Name: t_codigoscomercial t_codigoscomercial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_codigoscomercial
    ADD CONSTRAINT t_codigoscomercial_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 16478)
-- Name: t_eventos t_eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_eventos
    ADD CONSTRAINT t_eventos_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 16480)
-- Name: t_formasdepago t_formasdepago_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_formasdepago
    ADD CONSTRAINT t_formasdepago_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 16482)
-- Name: t_plantillacorreos t_plantillacorreos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_plantillacorreos
    ADD CONSTRAINT t_plantillacorreos_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 16484)
-- Name: t_registro_detalles t_registro_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_registro_detalles
    ADD CONSTRAINT t_registro_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 16486)
-- Name: t_registros t_registros_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_registros
    ADD CONSTRAINT t_registros_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 16488)
-- Name: t_roles t_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT t_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 16490)
-- Name: t_serviciosmasivos t_serviciosmasivos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_serviciosmasivos
    ADD CONSTRAINT t_serviciosmasivos_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 16492)
-- Name: t_tipocedulacliente t_tipocedulacliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_tipocedulacliente
    ADD CONSTRAINT t_tipocedulacliente_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 16494)
-- Name: t_tipodocumentos t_tipodocumentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_tipodocumentos
    ADD CONSTRAINT t_tipodocumentos_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 16496)
-- Name: t_tranzascorrelativo t_tranzascorrelativo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_tranzascorrelativo
    ADD CONSTRAINT t_tranzascorrelativo_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 16498)
-- Name: t_usuarios t_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT t_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 1259 OID 16499)
-- Name: t-registros_fecha; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "t-registros_fecha" ON public.t_registros USING btree (fecha);


--
-- TOC entry 3260 (class 1259 OID 16500)
-- Name: t_registros_doc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX t_registros_doc ON public.t_registros USING btree (numerodocumento);


--
-- TOC entry 3261 (class 1259 OID 16501)
-- Name: t_registros_estatus; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX t_registros_estatus ON public.t_registros USING btree (estatus);


--
-- TOC entry 3264 (class 1259 OID 16502)
-- Name: t_registros_serv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX t_registros_serv ON public.t_registros USING btree (idserviciosmasivo);


--
-- TOC entry 3279 (class 2606 OID 16503)
-- Name: t_usuarios t_usuario_rol_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT t_usuario_rol_fk FOREIGN KEY (idrol) REFERENCES public.t_roles(id) NOT VALID;


-- Completed on 2024-01-10 17:17:42

--
-- PostgreSQL database dump complete
--

