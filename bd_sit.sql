--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-03 16:54:55

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
-- TOC entry 3449 (class 0 OID 0)
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
-- TOC entry 3450 (class 0 OID 0)
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
    secuencial numeric(11,0)
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
-- TOC entry 3451 (class 0 OID 0)
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
-- TOC entry 3452 (class 0 OID 0)
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
    idcodigocomercial numeric(3,0)
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
-- TOC entry 3453 (class 0 OID 0)
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
    idserviciosmasivo bigint
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
-- TOC entry 3241 (class 2604 OID 16471)
-- Name: t_serviciosdoc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_serviciosdoc ALTER COLUMN id SET DEFAULT nextval('public.t_serviciosdoc_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16472)
-- Name: t_serviciosmasivos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_serviciosmasivos ALTER COLUMN id SET DEFAULT nextval('public.t_serviciosmasivos_id_seq'::regclass);


--
-- TOC entry 3422 (class 0 OID 16400)
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


--
-- TOC entry 3423 (class 0 OID 16406)
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
-- TOC entry 3424 (class 0 OID 16409)
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
-- TOC entry 3425 (class 0 OID 16412)
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


--
-- TOC entry 3427 (class 0 OID 16416)
-- Dependencies: 220
-- Data for Name: t_plantillacorreos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_plantillacorreos VALUES (48, '1', '#BCE4FA', '#EAF6FE', '#000000', '#575756', 35);
INSERT INTO public.t_plantillacorreos VALUES (49, '2', '#0d3b81', '#e3e4e5', '#FFFFFF', '#575756', 35);
INSERT INTO public.t_plantillacorreos VALUES (50, '3', '#FFFFFF', '#e3e4e5', '#575756', '#575756', 35);
INSERT INTO public.t_plantillacorreos VALUES (51, '1', '#BCE4FA', '#EAF6FE', '#000000', '#575756', 36);
INSERT INTO public.t_plantillacorreos VALUES (52, '2', '#0d3b81', '#e3e4e5', '#FFFFFF', '#575756', 36);
INSERT INTO public.t_plantillacorreos VALUES (53, '3', '#FFFFFF', '#e3e4e5', '#575756', '#575756', 36);
INSERT INTO public.t_plantillacorreos VALUES (54, '1', '#BCE4FA', '#EAF6FE', '#000000', '#575756', 37);
INSERT INTO public.t_plantillacorreos VALUES (55, '2', '#0d3b81', '#e3e4e5', '#FFFFFF', '#575756', 37);
INSERT INTO public.t_plantillacorreos VALUES (56, '3', '#FFFFFF', '#e3e4e5', '#575756', '#575756', 37);


--
-- TOC entry 3430 (class 0 OID 16421)
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


--
-- TOC entry 3431 (class 0 OID 16428)
-- Dependencies: 224
-- Data for Name: t_registros; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_registros VALUES (143, '00-00000001', 1, 35, 'gKVOV9tPK', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 10:43:30', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (144, '00-00000002', 1, 35, 'bO8hMHll2', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 11:01:46', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (145, '00-00000003', 1, 35, 'Uz0KJWA6O', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 11:18:47', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (146, '00-00000004', 1, 35, '49jLIemvF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 11:19:25', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (147, '00-00000005', 1, 35, 'xjY6hmvoK', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 11:26:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (148, '00-00000006', 1, 35, 'CDqrcEpvz', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-05-16 12:43:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (149, '00-00000007', 1, 35, '4YTh4bU7q', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:16:32', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (150, '00-00000008', 1, 35, 'bgjlV49bO', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:16:52', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (151, '00-00000009', 2, 35, 'ppi7Bf4Tp', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:17:25', 6650.1, 1, NULL, '00-00000008', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (152, '00-00000010', 1, 35, 'QSxjcADsQ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:17:49', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (153, '00-00000011', 3, 35, 's4SBpZhsl', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:18:03', 6650.1, 1, NULL, '00-00000010', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (154, '00-00000001', 1, 37, 'RjRHnxcg4', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:10', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (155, '00-00000002', 1, 37, '5WUkjCzKH', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:13', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (156, '00-00000003', 1, 37, 'Q5aDqz4RJ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:14', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (157, '00-00000004', 1, 37, 'yfEiF0OyO', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:18', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (158, '00-00000005', 1, 37, 'OvPWnZJav', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:19', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (159, '00-00000006', 1, 37, 'nqyen9xub', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:19', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (160, '00-00000007', 2, 37, 'vsOQELLwi', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:24:36', 6650.1, 1, NULL, '00-00000006', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (161, '00-00000008', 1, 37, 'sGzHPtzo8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:33:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (162, '00-00000009', 1, 37, 'EPyuaGhef', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:33:52', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (163, '00-00000001', 1, 36, 'WECAPxuNy', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:00', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (164, '00-00000002', 1, 36, 'H7NBnU2fp', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:01', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (165, '00-00000003', 1, 36, '0A4qMylTN', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:01', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (166, '00-00000004', 1, 36, 'JlDpxKRMM', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:01', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (167, '00-00000005', 1, 36, 'bltaQ5h9y', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:02', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (168, '00-00000006', 1, 36, '735ePMrbM', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:02', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (169, '00-00000007', 2, 36, 'bLBq8Uvem', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:15', 6650.1, 1, NULL, '00-00000006', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (170, '00-00000008', 1, 36, 'BWUZIj7JE', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:20', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (171, '00-00000009', 1, 36, '0a0lffygD', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:21', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (172, '00-00000010', 1, 36, 'yBeUewnvf', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:21', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (173, '00-00000011', 1, 36, 'RHaupfZ4X', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:21', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (174, '00-00000012', 1, 36, 'Ii3FyMXd1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (175, '00-00000013', 1, 36, 'R32ERRvau', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (176, '00-00000014', 1, 36, 'QaPKZiBWy', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (177, '00-00000015', 1, 36, 'TAkRWvhcd', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (178, '00-00000016', 1, 36, 'Xt9nx03jV', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (179, '00-00000017', 1, 36, 'suwHN1daT', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:22', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (180, '00-00000018', 1, 36, '4zS0bgZj8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:23', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (181, '00-00000019', 1, 36, 'qZGiyUrtk', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:23', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (182, '00-00000020', 3, 36, 'rmzlKIf93', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-01 19:34:35', 6650.1, 1, NULL, '00-00000019', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (183, '00-00000012', 1, 35, '9bGdd2rIo', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:46:57', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (184, '00-00000013', 1, 35, 'aMuaoBehv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:46:59', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (185, '00-00000014', 1, 35, 'RvtrVGbAh', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:46:59', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (186, '00-00000015', 1, 35, 'RgO0xqfEF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:00', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (187, '00-00000016', 1, 35, 'jlZMvM4wm', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:00', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (188, '00-00000017', 1, 35, 'WNDviQhqU', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:00', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (189, '00-00000018', 1, 35, 'VrzwJ1oVG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:01', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (190, '00-00000010', 1, 37, 'XkSMxhNaZ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:32', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (191, '00-00000011', 1, 37, 'kHXv78Dcn', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:34', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (192, '00-00000012', 1, 37, 'eTYvol2Mb', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:34', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (193, '00-00000013', 1, 37, 'Cxg3dWAHZ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:34', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (194, '00-00000014', 2, 37, 'tdaZDHUcw', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:47:46', 6650.1, 1, NULL, '00-00000013', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (195, '00-00000021', 1, 36, 'VUMk53tEd', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:48:57', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (196, '00-00000022', 1, 36, 'fCP6uJ1pv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:48:58', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (197, '00-00000023', 1, 36, 'vhFXM4o5q', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:48:58', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (198, '00-00000024', 1, 36, '2dnCHHraG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:48:58', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (199, '00-00000025', 3, 36, '7AIgCUKf1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:09', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (200, '00-00000026', 3, 36, 'R5M7NqlWG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:10', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (201, '00-00000027', 3, 36, 'Jg2rSOJA5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:10', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (202, '00-00000028', 3, 36, 'CDpbWdnbG', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:10', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (203, '00-00000029', 3, 36, 'dGRzSDMl5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:10', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (204, '00-00000030', 3, 36, 'yW5PH0yV0', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-02 07:49:10', 6650.1, 1, NULL, '00-00000024', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (205, '00-00000019', 1, 35, 'SqXGdDGtp', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 17:24:29', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (206, '00-00000020', 1, 35, 'ck6CfJQCZ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 17:24:37', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '00000001', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 1);
INSERT INTO public.t_registros VALUES (207, '00-00000021', 1, 35, 'Gpm3xGGtj', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 17:24:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '00000002', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 2);
INSERT INTO public.t_registros VALUES (208, '00-00000022', 2, 35, '2XFidrv6B', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 17:24:53', 6650.1, 1, NULL, '00-00000021', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 16/05/2023.', 0);
INSERT INTO public.t_registros VALUES (209, '00-00000015', 1, 37, 'dhOnf9f3Y', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:48', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (210, '00-00000016', 1, 37, 'V8s5pBfAv', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:49', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (211, '00-00000017', 1, 37, 'EZwvxgnyM', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:49', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (212, '00-00000018', 1, 37, 'I3umTu05q', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (213, '00-00000019', 1, 37, 'zqZUeQD1h', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (214, '00-00000020', 1, 37, 'FPz18SvNL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (215, '00-00000021', 1, 37, 'apVezVKv1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (216, '00-00000022', 1, 37, '2lTPIa2yl', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (217, '00-00000023', 1, 37, '3B87lUKRj', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:50', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (218, '00-00000024', 1, 37, '3TQDd9CHd', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (219, '00-00000025', 1, 37, 'xiXIa0EYF', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (220, '00-00000026', 1, 37, 'K5UM8kpBa', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (221, '00-00000027', 1, 37, 'XhyFZXEHH', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (222, '00-00000028', 1, 37, 'Q9Q2IBGEd', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (223, '00-00000029', 1, 37, 'ASrVNgOJX', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:51', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (224, '00-00000030', 1, 37, 'GqgLb743j', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:52', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (225, '00-00000031', 1, 37, 'niYumvU7O', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:17:52', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (226, '00-00000032', 2, 37, 'Jr8tw01L8', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:11', 6650.1, 1, NULL, '00-00000031', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00002000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (227, '00-00000031', 1, 36, 'LuInBMpIZ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:37', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (228, '00-00000032', 1, 36, '0aPDE9s4O', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:37', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (229, '00-00000033', 1, 36, 'HI86qbPM9', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:37', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (230, '00-00000034', 1, 36, 'UZGAU5CQq', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:37', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (231, '00-00000035', 1, 36, 'KUpYdjcve', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (232, '00-00000036', 1, 36, 'BGgE2SjiU', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (233, '00-00000037', 1, 36, 'Bw55G2WFE', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (234, '00-00000038', 1, 36, '4Z8a6IDFm', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (235, '00-00000039', 1, 36, 's7AbMIGo5', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:38', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (236, '00-00000040', 1, 36, 'NJF3FrQxL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (237, '00-00000041', 1, 36, '1GDtbB48p', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (238, '00-00000042', 1, 36, 'XNTUbx7Ca', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (239, '00-00000043', 1, 36, 'YsdEvuauP', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (240, '00-00000044', 1, 36, 'n095jtdu1', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (241, '00-00000045', 1, 36, 'EBa0eubyX', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:39', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (242, '00-00000046', 1, 36, 'HITFFLYx9', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:40', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (243, '00-00000047', 1, 36, 'p95JaOKh6', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:40', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (244, '00-00000048', 1, 36, '8jF7xHu53', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:40', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (245, '00-00000049', 1, 36, 'EGu65xLp4', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:40', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (246, '00-00000050', 1, 36, '4PwVjVDwt', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:40', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (247, '00-00000051', 1, 36, 'kCFmpYmkQ', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:41', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (248, '00-00000052', 1, 36, 'nSxDUxLin', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:41', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (249, '00-00000053', 1, 36, 'fqTw2j4UL', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:41', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);
INSERT INTO public.t_registros VALUES (250, '00-00000054', 1, 36, 'Le5OUifj3', '11222333', 'Jesus Ramos', 'Cumana Estado Sucre, Venezuela', '+5804125558877', 'belizarioja@gmail.com', 6978.5, 7034.73, 16, 328.4, 52.54, 0, 0, 0, NULL, NULL, NULL, 3, 123.15, 3.69, '2023-06-29 20:18:41', 6650.1, 1, NULL, '', NULL, 1, 'cum00123', '', 0, 'ESTE DOCUMENTO SE EMITE BAJO LA PROVIDENCIA ADMINISTRATIVA Nro. SNAT/2014/0032 DE FECHA 31/07/2014. Imprenta TECNOLOGIAS Y DESARROLLOS DIGITALES, C.A. RIF J-503000902, Autorizada según Providencia Administrativa Nro. SENIAT/INTI/007 de fecha 09/11/2022. Desde Nro. de Control 00-00000001 Hasta Nro. 00-00004000 de fecha 01/06/2023.', 0);


--
-- TOC entry 3433 (class 0 OID 16436)
-- Dependencies: 226
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_roles VALUES (1, 'Administrador');
INSERT INTO public.t_roles VALUES (4, 'Fiscal');
INSERT INTO public.t_roles VALUES (3, 'Emisor');
INSERT INTO public.t_roles VALUES (2, 'Máster');
INSERT INTO public.t_roles VALUES (5, 'Facturador');


--
-- TOC entry 3434 (class 0 OID 16439)
-- Dependencies: 227
-- Data for Name: t_serviciosdoc; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_serviciosdoc VALUES (5, 35, 0, 22);
INSERT INTO public.t_serviciosdoc VALUES (7, 37, 0, 32);
INSERT INTO public.t_serviciosdoc VALUES (6, 36, 0, 54);


--
-- TOC entry 3436 (class 0 OID 16443)
-- Dependencies: 229
-- Data for Name: t_serviciosmasivos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_serviciosmasivos VALUES (35, 'J-00364445-5', 'Laser Airlines', 'Caracas, Venezuela', 'email@laser.com', '0501 5273700', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMzUiLCJyaWYiOiJKLTAwMzY0NDQ1LTUiLCJyYXpvbnNvY2lhbCI6Ikxhc2VyIEFpcmxpbmVzIiwiZGlyZWNjaW9uIjoiQ2FyYWNhcywgVmVuZXp1ZWxhIiwiZW1haWwiOiJlbWFpbEBsYXNlci5jb20iLCJ0ZWxlZm9ubyI6IjA1MDEgNTI3MzcwMCIsImVudmlvY29ycmVvIjoiMSIsInZhbGlkYXJpbnRlcm5vIjoiMCJ9LCJpYXQiOjE2ODQyNDM3NDV9.-3AmyAZCjKzg_QCqQHLJ6C4hQ-BifD0s13Ci3henYho', 1, 1, 0, 'https://www.laserairlines.com', NULL, '3', 0, 15);
INSERT INTO public.t_serviciosmasivos VALUES (36, 'J-30468971-3', 'Digitel', 'Caracas, Venezuela', 'correo@digitel.com', '04123444835', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMzYiLCJyaWYiOiJKLTMwNDY4OTcxLTMiLCJyYXpvbnNvY2lhbCI6IkRpZ2l0ZWwiLCJkaXJlY2Npb24iOiJDYXJhY2FzLCBWZW5lenVlbGEiLCJlbWFpbCI6ImNvcnJlb0BkaWdpdGVsLmNvbSIsInRlbGVmb25vIjoiMDQxMjM0NDQ4MzUifSwiaWF0IjoxNjg0MjQ2NTQ3fQ.eME3RkuvtHqw-1UdlgA7xxuLXd5XntV3De2m52wazB4', 1, 1, 0, 'https://www.digitel.com.ve/', NULL, '3', 0, NULL);
INSERT INTO public.t_serviciosmasivos VALUES (37, 'J-30240664-1', 'Intercable', 'Caracas, Venezuela', 'email@inter.com.ve', '05004683700', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMzciLCJyaWYiOiJKLTMwMjQwNjY0LTEiLCJyYXpvbnNvY2lhbCI6IkludGVyY2FibGUiLCJkaXJlY2Npb24iOiJDYXJhY2FzLCBWZW5lenVlbGEiLCJlbWFpbCI6ImVtYWlsQGludGVyLmNvbS52ZSIsInRlbGVmb25vIjoiMDUwMDQ2ODM3MDAifSwiaWF0IjoxNjg0MjQ3MDQ5fQ.aKVmKvjm4pmfkdgLPTtUCNlVcvrd3ktUtMbfZ9TY7kA', 1, 1, 0, 'https://www.inter.com.ve/', NULL, '3', 0, NULL);


--
-- TOC entry 3438 (class 0 OID 16451)
-- Dependencies: 231
-- Data for Name: t_tipocedulacliente; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipocedulacliente VALUES (1, 'Cédula de Identidad', 'CI');
INSERT INTO public.t_tipocedulacliente VALUES (2, 'Pasaporte', 'PasP.');
INSERT INTO public.t_tipocedulacliente VALUES (3, 'Registro de Información Fiscal', 'RIF');


--
-- TOC entry 3439 (class 0 OID 16454)
-- Dependencies: 232
-- Data for Name: t_tipodocumentos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tipodocumentos VALUES (1, 'Factura');
INSERT INTO public.t_tipodocumentos VALUES (4, 'Orden de entrega o Guía de despacho');
INSERT INTO public.t_tipodocumentos VALUES (2, 'Nota de débito');
INSERT INTO public.t_tipodocumentos VALUES (3, 'Nota de crédito');


--
-- TOC entry 3441 (class 0 OID 16458)
-- Dependencies: 234
-- Data for Name: t_tranzascorrelativo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_tranzascorrelativo VALUES (12, 35, 19, '2023-05-16 10:43:19', 2000, '123456-00', '2023-05-16', 1, '1', '2000', 22);
INSERT INTO public.t_tranzascorrelativo VALUES (13, 37, 19, '2023-06-01 19:23:39', 2000, '12345678', '2023-06-01', 1, '1', '2000', 32);
INSERT INTO public.t_tranzascorrelativo VALUES (14, 36, 19, '2023-06-01 19:23:54', 4000, '12345678', '2023-06-01', 1, '1', '4000', 54);


--
-- TOC entry 3443 (class 0 OID 16464)
-- Dependencies: 236
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.t_usuarios VALUES (6, 'fiscal1', 'e10adc3949ba59abbe56e057f20f883e', 'SENIAT Fiscal', 4, NULL, 1, NULL);
INSERT INTO public.t_usuarios VALUES (2, 'seniat1', 'e10adc3949ba59abbe56e057f20f883e', 'SENIAT', 2, NULL, 1, NULL);
INSERT INTO public.t_usuarios VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'SIT', 1, NULL, 1, NULL);
INSERT INTO public.t_usuarios VALUES (19, 'facturasit', 'e10adc3949ba59abbe56e057f20f883e', 'Facturar SIT', 5, NULL, 1, NULL);
INSERT INTO public.t_usuarios VALUES (22, 'laseruser', 'e10adc3949ba59abbe56e057f20f883e', 'Laser Airlines', 3, NULL, 1, 35);


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 214
-- Name: t_bitacoras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_bitacoras_id_seq', 2627, true);


--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 219
-- Name: t_formasdepago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_formasdepago_id_seq', 326, true);


--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 221
-- Name: t_plantillacorreos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_plantillacorreos_id_seq', 56, true);


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 222
-- Name: t_registro_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_registro_detalles_id_seq', 705, true);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 225
-- Name: t_registros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_registros_id_seq', 250, true);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 228
-- Name: t_serviciosdoc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_serviciosdoc_id_seq', 7, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 230
-- Name: t_serviciosmasivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_serviciosmasivos_id_seq', 37, true);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 233
-- Name: t_tranzascorrelativo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_tranzascorrelativo_id_seq', 14, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 235
-- Name: t_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.t_usuarios_id_seq', 22, true);


--
-- TOC entry 3267 (class 2606 OID 16474)
-- Name: t_serviciosdoc pk_t_serviciosdoc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_serviciosdoc
    ADD CONSTRAINT pk_t_serviciosdoc PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 16476)
-- Name: t_codigoscomercial t_codigoscomercial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_codigoscomercial
    ADD CONSTRAINT t_codigoscomercial_pkey PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 16478)
-- Name: t_eventos t_eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_eventos
    ADD CONSTRAINT t_eventos_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 16480)
-- Name: t_formasdepago t_formasdepago_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_formasdepago
    ADD CONSTRAINT t_formasdepago_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 16482)
-- Name: t_plantillacorreos t_plantillacorreos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_plantillacorreos
    ADD CONSTRAINT t_plantillacorreos_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 16484)
-- Name: t_registro_detalles t_registro_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_registro_detalles
    ADD CONSTRAINT t_registro_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 16486)
-- Name: t_registros t_registros_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_registros
    ADD CONSTRAINT t_registros_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 16488)
-- Name: t_roles t_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT t_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 16490)
-- Name: t_serviciosmasivos t_serviciosmasivos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_serviciosmasivos
    ADD CONSTRAINT t_serviciosmasivos_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 16492)
-- Name: t_tipocedulacliente t_tipocedulacliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_tipocedulacliente
    ADD CONSTRAINT t_tipocedulacliente_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 16494)
-- Name: t_tipodocumentos t_tipodocumentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_tipodocumentos
    ADD CONSTRAINT t_tipodocumentos_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 16496)
-- Name: t_tranzascorrelativo t_tranzascorrelativo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_tranzascorrelativo
    ADD CONSTRAINT t_tranzascorrelativo_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 16498)
-- Name: t_usuarios t_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT t_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 1259 OID 16499)
-- Name: t-registros_fecha; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "t-registros_fecha" ON public.t_registros USING btree (fecha);


--
-- TOC entry 3259 (class 1259 OID 16500)
-- Name: t_registros_doc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX t_registros_doc ON public.t_registros USING btree (numerodocumento);


--
-- TOC entry 3260 (class 1259 OID 16501)
-- Name: t_registros_estatus; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX t_registros_estatus ON public.t_registros USING btree (estatus);


--
-- TOC entry 3263 (class 1259 OID 16502)
-- Name: t_registros_serv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX t_registros_serv ON public.t_registros USING btree (idserviciosmasivo);


--
-- TOC entry 3278 (class 2606 OID 16503)
-- Name: t_usuarios t_usuario_rol_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT t_usuario_rol_fk FOREIGN KEY (idrol) REFERENCES public.t_roles(id) NOT VALID;


-- Completed on 2023-07-03 16:54:55

--
-- PostgreSQL database dump complete
--

