--
-- PostgreSQL database dump
--

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-17 19:10:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 16440)
-- Name: a_pour_commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_pour_commande (
    id_produit integer NOT NULL,
    id_commande integer NOT NULL
);


ALTER TABLE public.a_pour_commande OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16447)
-- Name: a_pour_createur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_pour_createur (
    id_createur integer NOT NULL,
    id_produit integer NOT NULL
);


ALTER TABLE public.a_pour_createur OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16454)
-- Name: a_pour_fournisseur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_pour_fournisseur (
    id_fourn integer NOT NULL,
    id_produit integer NOT NULL
);


ALTER TABLE public.a_pour_fournisseur OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16461)
-- Name: a_pour_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_pour_type (
    id_type integer NOT NULL,
    id_produit integer NOT NULL
);


ALTER TABLE public.a_pour_type OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16469)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id_client integer NOT NULL,
    nickname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16468)
-- Name: clients_id_client_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_client_seq OWNER TO postgres;

--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 223
-- Name: clients_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_client_seq OWNED BY public.clients.id_client;


--
-- TOC entry 226 (class 1259 OID 16480)
-- Name: commandes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commandes (
    id_commande integer NOT NULL,
    date_commande timestamp without time zone NOT NULL,
    id_client integer NOT NULL,
    montant integer NOT NULL
);


ALTER TABLE public.commandes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16479)
-- Name: commandes_id_commande_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commandes_id_commande_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commandes_id_commande_seq OWNER TO postgres;

--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 225
-- Name: commandes_id_commande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commandes_id_commande_seq OWNED BY public.commandes.id_commande;


--
-- TOC entry 228 (class 1259 OID 16491)
-- Name: commentaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commentaire (
    id_commentaire integer NOT NULL,
    commentaire_jeu character varying(255) DEFAULT NULL::character varying,
    commentaire_site character varying(255) DEFAULT NULL::character varying,
    code_commentaire integer
);


ALTER TABLE public.commentaire OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16490)
-- Name: commentaire_id_commentaire_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commentaire_id_commentaire_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commentaire_id_commentaire_seq OWNER TO postgres;

--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 227
-- Name: commentaire_id_commentaire_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.commentaire_id_commentaire_seq OWNED BY public.commentaire.id_commentaire;


--
-- TOC entry 230 (class 1259 OID 16501)
-- Name: createurs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.createurs (
    id_createur integer NOT NULL,
    nom_createur character varying(255) NOT NULL
);


ALTER TABLE public.createurs OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16500)
-- Name: createurs_id_createur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.createurs_id_createur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.createurs_id_createur_seq OWNER TO postgres;

--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 229
-- Name: createurs_id_createur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.createurs_id_createur_seq OWNED BY public.createurs.id_createur;


--
-- TOC entry 232 (class 1259 OID 16510)
-- Name: fournisseurs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fournisseurs (
    id_fourn integer NOT NULL,
    nom_fourn character varying(255) NOT NULL,
    telephone_num_fourn character varying(255) NOT NULL,
    email_fourn character varying(255) NOT NULL,
    ville_fourn character varying(255) NOT NULL,
    adresse_fourn character varying(255) NOT NULL,
    url_fourn character varying(255) NOT NULL,
    img_fourn character varying(255) NOT NULL
);


ALTER TABLE public.fournisseurs OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16509)
-- Name: fournisseurs_id_fourn_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fournisseurs_id_fourn_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fournisseurs_id_fourn_seq OWNER TO postgres;

--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 231
-- Name: fournisseurs_id_fourn_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fournisseurs_id_fourn_seq OWNED BY public.fournisseurs.id_fourn;


--
-- TOC entry 234 (class 1259 OID 16525)
-- Name: produits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produits (
    id_produit integer NOT NULL,
    nom_produit character varying(255) NOT NULL,
    code_type_produit integer NOT NULL,
    prix_produit real NOT NULL,
    restriction_age character varying(255) NOT NULL,
    date_sortie character varying(255) NOT NULL,
    code_fourn integer NOT NULL,
    code_createur integer NOT NULL,
    img character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    video character varying(255) NOT NULL,
    code_commentaire integer NOT NULL,
    grid_placement character varying(255) DEFAULT NULL::character varying,
    link_telechargement character varying(255) NOT NULL,
    code_visuel integer
);


ALTER TABLE public.produits OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16524)
-- Name: produits_id_produit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produits_id_produit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produits_id_produit_seq OWNER TO postgres;

--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 233
-- Name: produits_id_produit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produits_id_produit_seq OWNED BY public.produits.id_produit;


--
-- TOC entry 236 (class 1259 OID 16548)
-- Name: type_produit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_produit (
    id_type integer NOT NULL,
    nom character varying(255) NOT NULL
);


ALTER TABLE public.type_produit OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16547)
-- Name: type_produit_id_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_produit_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_produit_id_type_seq OWNER TO postgres;

--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 235
-- Name: type_produit_id_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_produit_id_type_seq OWNED BY public.type_produit.id_type;


--
-- TOC entry 238 (class 1259 OID 16557)
-- Name: visuel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visuel (
    id integer NOT NULL,
    jeu character varying(255) NOT NULL,
    highlight character varying(255) NOT NULL,
    icon character varying(255) NOT NULL,
    video character varying(255) NOT NULL,
    img_1 character varying(255) NOT NULL,
    img_2 character varying(255) NOT NULL,
    img_3 character varying(255) NOT NULL,
    img_4 character varying(255) NOT NULL,
    img_5 character varying(255) NOT NULL,
    actualite_1 character varying(255) NOT NULL,
    actualite_2 character varying(255) NOT NULL,
    actualite_3 character varying(255) NOT NULL
);


ALTER TABLE public.visuel OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16556)
-- Name: visuel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visuel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visuel_id_seq OWNER TO postgres;

--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 237
-- Name: visuel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visuel_id_seq OWNED BY public.visuel.id;


--
-- TOC entry 4907 (class 2604 OID 16472)
-- Name: clients id_client; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id_client SET DEFAULT nextval('public.clients_id_client_seq'::regclass);


--
-- TOC entry 4908 (class 2604 OID 16483)
-- Name: commandes id_commande; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commandes ALTER COLUMN id_commande SET DEFAULT nextval('public.commandes_id_commande_seq'::regclass);


--
-- TOC entry 4909 (class 2604 OID 16494)
-- Name: commentaire id_commentaire; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire ALTER COLUMN id_commentaire SET DEFAULT nextval('public.commentaire_id_commentaire_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 16504)
-- Name: createurs id_createur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.createurs ALTER COLUMN id_createur SET DEFAULT nextval('public.createurs_id_createur_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 16513)
-- Name: fournisseurs id_fourn; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fournisseurs ALTER COLUMN id_fourn SET DEFAULT nextval('public.fournisseurs_id_fourn_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 16528)
-- Name: produits id_produit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produits ALTER COLUMN id_produit SET DEFAULT nextval('public.produits_id_produit_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 16551)
-- Name: type_produit id_type; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_produit ALTER COLUMN id_type SET DEFAULT nextval('public.type_produit_id_type_seq'::regclass);


--
-- TOC entry 4917 (class 2604 OID 16560)
-- Name: visuel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visuel ALTER COLUMN id SET DEFAULT nextval('public.visuel_id_seq'::regclass);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id_client, nickname, email, password) FROM stdin;
28	CeL9Db	azikvlad6@gmail.com	$2a$10$enn2MDj2pYoJ3chi9seQu.lRONcboeKlB/xwOL/5xrpeXaDUrRCMW
\.


--
-- Data for Name: createurs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.createurs (id_createur, nom_createur) FROM stdin;
1	4A Games
2	Techland
3	CD PROJEKT RED
4	Avalanche Software
5	Tuxedo Labs
6	FromSoftware Inc
7	CAPCOM Co
8	Ironwood Studios
\.


--
-- Data for Name: fournisseurs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fournisseurs (id_fourn, nom_fourn, telephone_num_fourn, email_fourn, ville_fourn, adresse_fourn, url_fourn, img_fourn) FROM stdin;
2	Steam	161043464	steam-contact@steamsupport.fr	Houilles	66 Rue Camille Pelletan	https://store.steampowered.com/	https://www.svgrepo.com/show/452107/steam.svg
1	Ubisoft	148185000	ubisoft-contact@ubisupport.fr	Paris	126 rue de Lagny	https://www.ubisoft.com/fr-fr/	https://www.svgrepo.com/show/349548/uplay.svg
3	GOG	262185512	gog-contact@steamsupport.fr	Nice	74 rue JAGIELLOŃSKA	https://www.gog.com/	https://www.svgrepo.com/show/341859/gog-com.svg
\.


--
-- Data for Name: produits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produits (id_produit, nom_produit, code_type_produit, prix_produit, restriction_age, date_sortie, code_fourn, code_createur, img, url, video, code_commentaire, grid_placement, link_telechargement, code_visuel) FROM stdin;
1	Metro Exodus	2	39.99	PEGI 18	14 fevrier 2019	2	1	https://i.imgur.com/JYOyUcg.jpg	index.jsp?id=1	https://i.imgur.com/6vtMMao.mp4	6446	left_side_main	https://drive.google.com/file/d/1GDpXMlR6ecE3LOOZMWUWMHHyneEznnCF/view?usp=drive	1
2	Dying Light	2	29.99	PEGI 18	21 avril 2016	2	2	https://i.imgur.com/JdSedE6.jpg	index.jsp?id=2	https://i.imgur.com/4EsyNVw.mp4	2461	middle_side_main	https://drive.google.com/file/d/1KAKKEQvU2yUgwOP8hwFw5oufrSM20vaW/view?usp=drive	2
3	Cyberpunk 2077	2	59.99	PEGI 18	10 decembre 2020	2	3	https://i.imgur.com/8mDtamD.jpg	index.jsp?id=3	https://i.imgur.com/NLQ1Ze7.mp4	6592	right_side_main	https://drive.google.com/file/d/1XXz9g6sZdwjpZW8PhTvB2brs9y8XN_TB/view?usp=drive	3
4	Hogwarz Legacy	4	69.99	PEGI 12	10 fevrier 2023	2	4	https://i.imgur.com/VXoBlMA.jpg	index.jsp?id=4	https://i.imgur.com/l3qwtp4.mp4	1436	sous_left_side_main	https://drive.google.com/file/d/1stJYNb8K2H5ZE6kSptDYTExM3lyuOcSs/view?usp=drive	4
5	Teardown	3	29.99	PEGI 7	21 avril 2022	2	5	https://i.imgur.com/81JjhR5.jpg	index.jsp?id=5	https://i.imgur.com/CSQIVEf.mp4	9501	sous_middle_side_main	https://drive.google.com/file/d/1QqyRs8Madgxl-E26ETmfFfgBBBhQ8YVx/view?usp=drive	5
6	Elden Ring	1	59.99	PEGI 16	25 fevrier 2022	2	6	https://i.imgur.com/dW3aT1V.jpg	index.jsp?id=6	https://i.imgur.com/rS1df8G.mp4	8812	sous_right_side_main	https://drive.google.com/file/d/1DE35vD-irCLJDmSXs8CbvEWjEklOAUGZ/view?usp=drive	6
7	Dragons Dogma 2	15	65	PEGI 18	22 mars 2024	3	3	https://i.imgur.com/ximMDTg.jpeg	index.jsp?id=7	https://i.imgur.com/ejD92iP.mp4	5123	\N	https://drive.google.com/file/d/1R8NCl5EbuDb-sNL0tIPANlgGujhORUk6/view?usp=drive	7
8	Pacific Drive	3	34.99	PEGI 3	22 fevrier 2024	3	8	https://i.imgur.com/BMaB2Ke.jpeg	index.jsp?id=8	https://i.imgur.com/ILWnmmj.mp4	4951	\N	https://drive.google.com/file/d/1jRuf3cUSE4fKavocrBNurUMZEQYuUWmg/view?usp=drive	8
\.


--
-- Data for Name: type_produit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_produit (id_type, nom) FROM stdin;
1	RPG
2	Action
3	Simulation
4	Avanture
5	Fps
6	Survival
7	Stratégie
8	Sport
9	Rythme
10	Party–Games
11	Jeux de cartes
12	Monopoly
13	Reflexion
14	Fighting
15	MMO
16	Platformer
17	Rogue-like
18	Sandbox
\.


--
-- Data for Name: visuel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visuel (id, jeu, highlight, icon, video, img_1, img_2, img_3, img_4, img_5, actualite_1, actualite_2, actualite_3) FROM stdin;
1	metro_exodus	https://i.imgur.com/bQo5tlx.jpeg	https://i.imgur.com/leUqr1b.jpeg	https://i.imgur.com/snrK7r3.mp4	https://i.imgur.com/nZ3VhZg.jpeg	https://i.imgur.com/8tiAFfK.jpeg	https://i.imgur.com/Bifup5X.jpeg	https://i.imgur.com/z8nY6yC.jpeg	https://i.imgur.com/NIrwU7K.jpeg	https://i.imgur.com/rr3QDiy.jpeg	https://i.imgur.com/USIxXRU.jpeg	https://i.imgur.com/yI1Pe7R.jpeg
2	dying_light	https://i.imgur.com/aTDuhGH.jpeg	https://i.imgur.com/nNxRepI.jpeg	https://i.imgur.com/aBpm2lN.mp4	https://i.imgur.com/r7yraDR.jpeg	https://i.imgur.com/Nci3JM3.jpeg	https://i.imgur.com/m6e6YSQ.jpeg	https://i.imgur.com/qGnMckm.jpeg	https://i.imgur.com/DKwJfFU.jpeg	https://i.imgur.com/oJ8dc7K.jpeg	https://i.imgur.com/IZAEndS.jpeg	https://i.imgur.com/i3NKmpY.jpeg
3	cyberpunk	https://i.imgur.com/AX9uzxY.jpeg	https://i.imgur.com/9PmyR1s.jpeg	https://i.imgur.com/O5L1gVA.mp4	https://i.imgur.com/KsQfz7z.jpeg	https://i.imgur.com/2fEZtJ7.jpeg	https://i.imgur.com/f5itY3t.jpeg	https://i.imgur.com/KhFkxV8.jpeg	https://i.imgur.com/qTcVo9o.jpeg	https://i.imgur.com/nxoCOhP.jpeg	https://i.imgur.com/iSEfexs.jpeg	https://i.imgur.com/BKSHn95.jpeg
4	hogwarz_legacy	https://i.imgur.com/Jfn27Ns.jpeg	https://i.imgur.com/WjY67sL.jpeg	https://i.imgur.com/oQhu45c.mp4	https://i.imgur.com/rDXCzni.jpeg	https://i.imgur.com/3TOEjW5.jpeg	https://i.imgur.com/yamBWHU.jpeg	https://i.imgur.com/yX0vpLC.jpeg	https://i.imgur.com/Bg5mps5.jpeg	https://i.imgur.com/zG6SS5F.jpeg	https://i.imgur.com/8bSzqk5.jpeg	https://i.imgur.com/r0ZsX61.jpeg
5	teardown	https://i.imgur.com/ctLjeBU.jpeg	https://i.imgur.com/4yGaiWx.jpeg	https://i.imgur.com/BMrDry0.mp4	https://i.imgur.com/CMcJJR6.jpeg	https://i.imgur.com/qOex0Am.jpeg	https://i.imgur.com/mqRdUHF.jpeg	https://i.imgur.com/EwcqtvA.jpeg	https://i.imgur.com/eXJ2sHl.jpeg	https://i.imgur.com/NAQBIA1.jpeg	https://i.imgur.com/yPx7Gpz.jpeg	https://i.imgur.com/91zpZWN.jpeg
6	elden_ring	https://i.imgur.com/bS96Zku.jpeg	https://i.imgur.com/1mzPbD4.jpeg	https://i.imgur.com/JoE72hw.mp4	https://i.imgur.com/36z2NjW.jpeg	https://i.imgur.com/InudMot.jpeg	https://i.imgur.com/5ff7qT1.jpeg	https://i.imgur.com/SfGp3Id.jpeg	https://i.imgur.com/TCadWQI.jpeg	https://i.imgur.com/GIpnLth.jpeg	https://i.imgur.com/26tRVPA.jpeg	https://i.imgur.com/pe6TaKQ.jpeg
8	pacific_drive	https://i.imgur.com/sWo7yYR.jpeg	https://i.imgur.com/eWNCoyS.jpeg	https://i.imgur.com/lSuuq5C.mp4	https://i.imgur.com/9CVTrhp.jpeg	https://i.imgur.com/hkl0lJr.jpeg	https://i.imgur.com/uzydK16.jpeg	https://i.imgur.com/zSAkMID.jpeg	https://i.imgur.com/js5M2s7.jpeg	https://i.imgur.com/ULjlS5T.jpeg	https://i.imgur.com/dgPrPt5.jpeg	https://i.imgur.com/agHLNZo.jpeg
7	Dragons Dogma 2	https://i.imgur.com/RkYb4Br.jpeg	https://i.imgur.com/eZLAmKQ.jpeg	https://i.imgur.com/ejD92iP.mp4	https://i.imgur.com/9wuqcpp.jpeg	https://i.imgur.com/W9MhZIL.jpeg	https://i.imgur.com/bOMN4dq.jpeg	https://i.imgur.com/jVdsXtk.jpeg	https://i.imgur.com/53PFrPU.jpeg	https://i.imgur.com/RAmXDne.jpeg	https://i.imgur.com/0HUfd7s.jpeg	https://i.imgur.com/T5GPk0Q.jpeg
\.


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 223
-- Name: clients_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_client_seq', 28, true);


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 225
-- Name: commandes_id_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commandes_id_commande_seq', 1, true);


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 227
-- Name: commentaire_id_commentaire_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commentaire_id_commentaire_seq', 1, false);


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 229
-- Name: createurs_id_createur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.createurs_id_createur_seq', 8, true);


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 231
-- Name: fournisseurs_id_fourn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fournisseurs_id_fourn_seq', 3, true);


--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 233
-- Name: produits_id_produit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produits_id_produit_seq', 9, true);


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 235
-- Name: type_produit_id_type_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_produit_id_type_seq', 18, true);


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 237
-- Name: visuel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visuel_id_seq', 8, true);


--
-- Constraints
--

ALTER TABLE ONLY public.a_pour_commande
    ADD CONSTRAINT a_pour_commande_pkey PRIMARY KEY (id_produit, id_commande);

ALTER TABLE ONLY public.a_pour_createur
    ADD CONSTRAINT a_pour_createur_pkey PRIMARY KEY (id_createur, id_produit);

ALTER TABLE ONLY public.a_pour_fournisseur
    ADD CONSTRAINT a_pour_fournisseur_pkey PRIMARY KEY (id_fourn, id_produit);

ALTER TABLE ONLY public.a_pour_type
    ADD CONSTRAINT a_pour_type_pkey PRIMARY KEY (id_type, id_produit);

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id_client);

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_pkey PRIMARY KEY (id_commande);

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_pkey PRIMARY KEY (id_commentaire);

ALTER TABLE ONLY public.createurs
    ADD CONSTRAINT createurs_pkey PRIMARY KEY (id_createur);

ALTER TABLE ONLY public.fournisseurs
    ADD CONSTRAINT fournisseurs_pkey PRIMARY KEY (id_fourn);

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT produits_pkey PRIMARY KEY (id_produit);

ALTER TABLE ONLY public.type_produit
    ADD CONSTRAINT type_produit_pkey PRIMARY KEY (id_type);

ALTER TABLE ONLY public.visuel
    ADD CONSTRAINT visuel_pkey PRIMARY KEY (id);

--
-- Foreign Keys
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT fk_client FOREIGN KEY (id_client) REFERENCES public.clients(id_client);

ALTER TABLE ONLY public.a_pour_commande
    ADD CONSTRAINT fk_comm FOREIGN KEY (id_commande) REFERENCES public.commandes(id_commande);

ALTER TABLE ONLY public.a_pour_commande
    ADD CONSTRAINT fk_prod FOREIGN KEY (id_produit) REFERENCES public.produits(id_produit);

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT fk_code_visuel FOREIGN KEY (code_visuel) REFERENCES public.visuel(id);

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT fk2ry3cetkga9yl6llslnxxxul3 FOREIGN KEY (code_type_produit) REFERENCES public.type_produit(id_type);

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT fk464hvnnjnwwsfs3211g5xg1s0 FOREIGN KEY (code_createur) REFERENCES public.createurs(id_createur);

ALTER TABLE ONLY public.produits
    ADD CONSTRAINT fkkm76okrehg05qqq4tcv3s2lt2 FOREIGN KEY (code_fourn) REFERENCES public.fournisseurs(id_fourn);

--
-- PostgreSQL database dump complete
--
