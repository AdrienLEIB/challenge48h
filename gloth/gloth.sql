--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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
-- Name: pathology; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.pathology (
    id integer NOT NULL,
    name character varying NOT NULL,
    info character varying NOT NULL,
    has character varying,
    age_min integer NOT NULL,
    age_max integer NOT NULL,
    sex character varying NOT NULL,
    symptoms character varying NOT NULL,
    other_name character varying,
    norm_name character varying NOT NULL,
    rec_tests_string character varying,
    rec_tests bytea NOT NULL,
    created_on timestamp without time zone DEFAULT now(),
    updated_by integer,
    updated_on timestamp without time zone DEFAULT now(),
    user_id integer NOT NULL,
    treatment character varying,
    description character varying,
    icd_10 character varying,
    medic character varying
);


ALTER TABLE public.pathology OWNER TO gloth;

--
-- Name: pathology_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.pathology_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pathology_id_seq OWNER TO gloth;

--
-- Name: pathology_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.pathology_id_seq OWNED BY public.pathology.id;


--
-- Name: pathology_specialty; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.pathology_specialty (
    id integer NOT NULL,
    pathology_id integer,
    specialty_id integer
);


ALTER TABLE public.pathology_specialty OWNER TO gloth;

--
-- Name: pathology_specialty_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.pathology_specialty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pathology_specialty_id_seq OWNER TO gloth;

--
-- Name: pathology_specialty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.pathology_specialty_id_seq OWNED BY public.pathology_specialty.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.roles OWNER TO gloth;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO gloth;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: specialty; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.specialty (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.specialty OWNER TO gloth;

--
-- Name: specialty_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.specialty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialty_id_seq OWNER TO gloth;

--
-- Name: specialty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.specialty_id_seq OWNED BY public.specialty.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(50),
    rpps bigint,
    password character varying(100),
    name character varying(50) NOT NULL,
    forename character varying(50) NOT NULL,
    registered_on timestamp without time zone DEFAULT now(),
    confirmed boolean NOT NULL,
    confirmed_on timestamp without time zone,
    entry_count_patient integer NOT NULL,
    entry_count_pathology integer NOT NULL,
    modify_count_patient integer NOT NULL,
    modify_count_pathology integer NOT NULL,
    phone character varying NOT NULL,
    zip_code character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO gloth;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO gloth;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: gloth
--

CREATE TABLE public.user_roles (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.user_roles OWNER TO gloth;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: gloth
--

CREATE SEQUENCE public.user_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_roles_id_seq OWNER TO gloth;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gloth
--

ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;


--
-- Name: pathology id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology ALTER COLUMN id SET DEFAULT nextval('public.pathology_id_seq'::regclass);


--
-- Name: pathology_specialty id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology_specialty ALTER COLUMN id SET DEFAULT nextval('public.pathology_specialty_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: specialty id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.specialty ALTER COLUMN id SET DEFAULT nextval('public.specialty_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);


--
-- Data for Name: pathology; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.pathology (id, name, info, has, age_min, age_max, sex, symptoms, other_name, norm_name, rec_tests_string, rec_tests, created_on, updated_by, updated_on, user_id, treatment, description, icd_10, medic) FROM stdin;
525	carcinome basocellulaire	Les carcinomes basocellulaires sont les cancers de la peau les plus fréquents.	https://www.has-sante.fr/jcms/c_272312/fr/prise-en-charge-diagnostique-et-therapeutique-du-carcinome-basocellulaire-de-l-adulte	0	120	sex_MF	carcinome basocellulaire, carcinome, perle, perle peau, papule peau, petite papule de quelques millimètres, papule ferme, papule ferme peau, bouton ferme, bouton peau, bouton indolore, papule indolore, bouton translucide, bouton avec vaisseaux, papule avec vaisseaux, 	\N	carcinome basocellulaire	\N	\\x80045d942e	2019-08-23 17:02:51.548929	\N	2019-08-23 17:02:51.548929	7	Traitement chirurgical.	\N	\N	\N
1370	migraine sans aura		\N	0	120	sex_MF	mal de tête, maux de tête, céphalée, céphalées, mal à la tête, céphalée chronique, nausées, nausée, envie de vomir, 	\N	migraine sans aura	\N	\\x80045d942e	2019-11-15 10:29:55.265826	\N	2019-11-15 10:29:55.265826	7		\N	\N	\N
713	gale	La gale ou scabiose est une maladie infectieuse de la peau causée par un parasite de type acarien microscopique, le sarcopte (Sarcoptes scabiei).	\N	0	120	sex_MF	gale, prurit diffus, prurit, démangeaisons diffuses, démangeaisons qui s’aggrave la nuit, démangeaisons qui perturbent le sommeil, prurit à prédominance nocturne, démangeaisons, prurit familial, lésions espaces interdigitaux, lésions entre les doigts, lésions poignets, lésions aisselles, lésions seins, lésions organes génitaux, lésions ventre autour du nombril, sillon scabieux	scabiose	gale	\N	\\x80045d942e	2019-09-02 19:27:19.150477	7	2019-11-23 18:21:15.159653	7	\N	\N	\N	\N
794	hyperplasie bénigne de la prostate	L'hypertrophie bénigne de la prostate aussi appelée hyperplasie bénigne de la prostate (HBP) ou hyperplasie adénomyomateuse de la prostate ou plus communément adénome prostatique est une tumeur bénigne qui se développe aux dépens de la partie crâniale de la prostate. Elle touche les sujets âgés de plus de 50 ans.	\N	19	120	sex_M	Hypertrophie bénigne prostate, envie d’uriner fréquement, fréquente envie d’uriner, envie d’uriner nocturne, envie d’uriner diurne, faiblesse du jet urinaire, jet urinaire faible, effort pour le premier jet urinaire, effort pour urnier, effort pour la miction, miction douloureuse, mictions douloureuses, baisse de force ejaculation, sensation de vessie jamais videe, intermittence du jet, gouttes retardataires, jet par a coups, sang dans les urines, sang urines, urines sanglantes\r\n	hbp, hyperplasie adénomyomateuse de la prostate, adénome prostatique	hypertrophie benigne de la prostate	\N	\\x8004950d000000000000005d948c065572696e655f94612e	2019-09-08 17:28:52.568929	7	2019-11-23 18:01:18.441489	7	\N	\N	\N	\N
1015	mononucléose	La mononucléose infectieuse correspond à la primo-infection symptomatique, généralement bénigne, provoquée par le virus d'Epstein-Barr, qui appartient à la même famille que les virus de l’herpès. Transmise préférentiellement par la salive, on l'appelle « maladie du baiser » ou encore « maladie des amoureux »	\N	0	120	sex_MF	Mononucléose, maladie du baiser, fatigue, épuisement, gonflement ganglions, sensibilité ganglions, fièvre, température élevée, haute température, frissons, frisson, mal de gorge, maux de gorge, gorge douloureuse, douleurs gorge, incapacité avaler, maux de tête, mal à la tête, céphalées, céphalée, migraine, migraines, perte appétit, douleurs musculaires, éruption cutanée, éruptions cutanées, augmentation rate, augmentation volume rate\r\n	maladie du baiser, maladie des amoureux	mononucleose	\N	\\x80045d942e	2019-09-22 13:28:33.877567	\N	2019-09-22 13:28:33.877567	7	La mononucléose infectieuse est une maladie bénigne, mais elle nécessite souvent une longue convalescence du fait de l'asthénie qui persiste de plusieurs semaines à plusieurs mois. Aucun antibiotique n’influence le cours de la maladie. L'intérêt d'un traitement antiviral n'est pas démontré.\r\n\r\nIl n’existe pas de traitement spécifique, mais on peut prendre des antalgiques mis à part l’aspirine (déconseillée dans le cas d’infections virales pour les enfants de moins de 16 ans car elle peut provoquer le syndrome de Reye, affection rare mais souvent mortelle). Pour contrôler la fièvre, qui peut dépasser les 39 °C, et soulager les douleurs, le repos s’impose, mais s’il y a un risque de complications (fièvre persistante, atteinte hépatique) une hospitalisation peut être envisagée.	\N	\N	\N
613	cyphose	La cyphose ou hypercyphose est une exagération de la cyphose thoracique. 	\N	0	120	sex_MF	cyphose, cyphose exagérée, exagération cyphose, exagération cyphose thoracique, cyphose thoracique exagérée, mauvaise position, mauvaise courbure, dos cambré, dos bombé, bosse au dos, mauvaise posture, douleur dos, douleur thoracique, douleur lombaire, douleur dorsale, mal au dos, dos pas droit, ne se tient pas droit, ne se tient pas droite	hypercyphose	cyphose	\N	\\x80045d942e	2019-08-29 06:43:15.487147	7	2019-11-17 09:09:02.991495	7	Kinésithérapie\r\nMusculation\r\nChirurgie\r\nOpération dorsale\r\nPort éventuel d'un corset : pour cela, il faut consulter dans un service spécialisé en orthopédie, service spécialisé dans les études rachidiennes ou dans un service de rééducation.	\N	\N	\N
489	asphyxie	L’asphyxie est un terme médical signifiant l'arrêt plus ou moins long de la circulation d'oxygène dans le corps.	\N	0	120	sex_MF	troubles sensoriels, affaiblissement des capacités visuelles, bourdonnements, sifflements ou acouphènes, troubles de la motricité, raideur musculaire, faiblesse musculaire, troubles psychiques, atteinte du cerveau, perte de connaissance, ivresse anoxique, troubles nerveux, réactions nerveuses retardées, réactions psychomotrices retardées, fourmillement, paralysie, troubles cardio-vasculaires, vasoconstriction, réduction du diamètre des vaisseaux sanguins, constriction des organes, constriction des muscles, déséquilibre acido-basique, hyperglycémie, troubles hormonaux, troubles rénaux, asphyxie, mauvais positionnement du fœtus durant la grossesse, mauvaise position foetus, accouchement prématuré, position bloquant la respiration, développement d'un œdème laryngé, exposition à des produits toxiques, exposition à des vapeurs, exposition à des gaz, ingestion de corps étranger, suffocation, noyade, strangulation, alcool, ivresse, ivre\r\n	\N	asphyxie	\N	\\x80045d942e	2019-08-22 18:24:29.192445	\N	2019-08-22 18:24:29.192445	7	Débloquer les voies respiratoires puis réoxygéner le patient.	\N	\N	\N
715	gangrène sèche	La gangrène sèche survient à la suite de l’obstruction ou de la sclérose d’un ou plusieurs vaisseaux sanguins, généralement une artérite, une embolie ou une thrombose. Elle se caractérise par l’apparition de tissus de couleur sombre, généralement noirs et desséchés	\N	0	120	sex_MF	gangrène, gangrene seche, obstruction vaisseau, sclerose vaisseaux,embolie, artérite, thrombose, membre noir, membre sec, raideur, gonflement, perte de la sensibilité, douleur importante, zone gangreneuse, apparition de cloques, ulcères, peau froide, pâle sur la zone affectée, membre lourd, craquèlement de la peau, état fébrile, perte d'appétit, augmentation du rythme cardiaque, tachycardie, respiration, étourdissement, étourdissements, vertige, vertiges\r\n	\N	gangrene seche	\N	\\x8004950b000000000000005d948c047072695f94612e	2019-09-03 15:07:32.905586	\N	2019-09-03 15:07:32.905586	7	Il existe trois grands principes pour l’enrayer :\r\n\r\nd’abord, la prise d’antibiotiques ralentit l’infection.\r\nensuite, la chirurgie enlève les tissus infectés ou morts, pour arrêter la propagation ; cette étape est aussi très importante et permet généralement d’éviter l’amputation, lorsqu’il s’agit d’un membre ;\r\nenfin, par l’oxygénothérapie hyperbare, l’oxygène pénètre à nouveau dans les tissus, ce qui favorise l'arrêt de la propagation des bactéries.\r\n	\N	\N	\N
722	glaucome à angle ouvert	On parle de glaucome à angle ouvert si on retrouve: \r\nobstacle prétrabéculaire : ICE syndrome, et glaucome néo vasculaire\r\nobstacle trabéculaire : GPAO, corticoïdes, glaucome juvénile\r\nobstacle post-trabéculaire : par hyperpression veineuse (fistule carotido-caverneuse, Sturge-Weber)\r\n\r\n\r\nLe glaucome est une maladie dégénérative du nerf optique qui entraîne une perte progressive de la vision commençant tout d'abord en périphérie et progressant graduellement vers le centre. Cette maladie est souvent associée à une pression intra-oculaire (PIO) élevée qui comprime et endommage les fibres du nerf optique et de la rétine. Dans d'autres cas, malgré une PIO normale, une circulation sanguine inadéquate entraîne la mort (nécrose) des cellules du nerf optique et de la rétine. La perte de vision associée au glaucome est permanente et irréversible. Sans traitement, cette maladie peut mener jusqu'à la cécité.	https://www.has-sante.fr/jcms/c_500229/fr/depistage-et-diagnostic-precoce-du-glaucome-problematique-et-perspectives-en-france	0	120	sex_MF	deux yeux, atteinte symetrique, deux yeux atteints, atteinte des yeux, longtemps asymptotique, pas de symptomes, vision floue, vision brouillée, vue périphérique embrouillée, douleurs oculaires, céphalées, céphalée, mal à la tete, maux de tête, cécité, glaucome, glaucome a angle ouvert\r\n	\N	glaucome a angle ouvert	\N	\\x8004951c000000000000005d94288c054f65696c5f948c0c52c3a96672616374696f6e5f94652e	2019-09-03 16:09:42.550844	\N	2019-09-03 16:09:42.550844	7	Les gouttes ophtalmiques: analogues de prostaglandines, bêta-bloqueurs, agents alpha-adrénergiques, inhibiteurs de l’anhydrase carbonique, myotiques. \r\n\r\nMédicaments par voie orale: inhibiteurs de l’anhydrase carbonique\r\n\r\nTrabéculoplastie	\N	\N	\N
526	mésothéliome	Le mésothéliome est une forme rare et virulente de cancer des surfaces mésothéliales qui affecte le revêtement des poumons (la plèvre), de la cavité abdominale (le péritoine) ou l'enveloppe du cœur (le péricarde).	https://www.has-sante.fr/jcms/c_1650525/fr/guides-du-parcours-de-soins-des-cancers-broncho-pulmonaires-et-mesotheliome-pleural-malin	0	120	sex_MF	douleur à la poitrine, douleur au bas du dos, toux, essoufflement, épanchement pleural, fatigue, perte de poids, fièvre, transpiration, difficulté à avaler, enflure du visage, enflure des bras, voix enrouée, Mésothéliome péritonéal, mésothéliome, douleur à l’abdomen, enflure de l’abdomen,  ascite, nausées, vomissements, constipation, perte de poids, obstruction de l’intestin grêle, obstruction du côlon	cancer de la plèvre, cancer du péricarde, cancer du péritoine	mesotheliome	\N	\\x8004950d000000000000005d948c06696d6167655f94612e	2019-08-23 17:35:21.15025	\N	2019-08-23 17:35:21.15025	7	Chimiothérapie et chirurgie	\N	\N	\N
528	cancer de la thyroïde	Le cancer de la thyroïde est un cancer qui touche l'un des différents types cellulaires composant la thyroïde. Bien qu'il soit l'un des principaux cancers endocriniens, 95 % des nodules thyroïdiens s’avèrent bénins.	https://www.has-sante.fr/jcms/c_969305/fr/ald-n-30-cancer-de-la-thyroide	0	120	sex_MF	apparition progressive, nodule cou, adénopathie latéro-cervicale, adénopathie cou, modification récente d'un goitre thyroïdien, otalgie réflexe persistante, troubles hormonaux, bouffées vaso-motrices cervico-faciale, diarrhée motrice, hypertension artérielle instable, cancer médullaire de la thyroïde,cancer de la thyroïde, hypothyroïdie, hyperthyroïdie, modification de la voix, dysphonie, paralysie de la corde vocale, compression du nerf récurrent	\N	cancer de la thyroide	\N	\\x8004952c000000000000005d94288c044563685f948c0e5363696e7469677261706869655f948c055363616e5f948c0449524d5f94652e	2019-08-23 17:58:10.073527	\N	2019-08-23 17:58:10.073527	7	Radiothérapie, chimiothérapie	\N	\N	\N
542	hepatoblastome	L'hépatoblastome est une tumeur maligne rare du foie, de nature hépatocytaire, qui touche les nourrissons et les enfants.	https://www.has-sante.fr/jcms/c_1005121/fr/ald-n-30-cancer-primitif-du-foie	0	15	sex_MF	perte de poids inexpliquée, perte de poids, perte d’appétit, douleurs à l’abdomen, douleur ventre, nausées, vomissements, hépatoblastome, tumeur foie, cancer foie, cancer du foie, tumeur hépatique, cancer hépatique, fatigue généralisée, fatigue, fatigué, masse foie, masse abdominale, boule foie, masse hépatique, jaunisse, teint jaune, yeux jaunes, selles pâles, urines foncées, masse abdominale, distension abdominale, altération de l'état généra, asthénie, anorexie, puberté précoce 	cancer du foie hepatoblastome, tumeur foie hepatoblastome,	hepatoblastome	\N	\\x80045d942e	2019-08-24 13:56:19.531143	7	2019-10-26 14:43:12.9903	7	La chirurgie, la chimiothérapie néo-adjuvante et la transplantation hépatique sont les principales armes thérapeutiques contre l'hépatoblastome. La présence de métastase au moment du diagnostic est le principal facteur de mauvais pronostic.	\N	\N	\N
550	cancer des poumons	Les expressions cancer du poumon et cancer bronchique désignent au sens strict une tumeur maligne du poumon, et par extension les carcinomes pulmonaires, qui regroupent les tumeurs malignes épithéliales du poumon.	https://www.has-sante.fr/jcms/c_2001613/fr/pertinence-du-depistage-du-cancer-broncho-pulmonaire-en-france-point-de-situation-sur-les-donnees-disponibles-analyse-critique-des-etudes-controlees-randomisees, https://www.has-sante.fr/jcms/c_820058/fr/ald-n-30-cancer-du-poumon-et-mesotheliome-pleural-malin	0	120	sex_MF	Toux qui s’intensifie, toux, toux intense, toux continue, toux du fumeur, tabac, tabagisme, Douleur constante au thorax, douleur qui s’accentue lorsqu’on tousse, douleur qui s’accentue lorsqu’on respire profondément, Respiration sifflante, Essoufflement, Crachats de sang, Voix enrouée durant plus de 3 à 4 semaines, voix enrouée, bronchites à répétition, bronchites, pneumonies à répétition, pneumonies, perte de poids, perte d'appétit, fatigue chronique, maux de tête, mal aux os	cancer bronchique, carcinome pulmonaire	cancer des poumons	\N	\\x80049523000000000000005d94288c06696d6167655f948c0449524d5f948c055363616e5f948c015f946804652e	2019-08-24 15:49:20.570347	\N	2019-08-24 15:49:20.570347	7	Chirurgie, chimiothérapie ou radiothérapie.	\N	\N	\N
559	catalepsie	La catalepsie désigne la suspension complète du mouvement volontaire des muscles dans la position où ils se trouvent. L'attitude qui s'en dégage est celle d'une statue ou d'un mime conservant une position figée en pleine action.	\N	0	120	sex_MF	Corps rigide, membres rigides, catalepsie, rigidité du visage, rigidité du corps, rigidité des membres, pas de contrôle musculaire volontaire, pas de mouvement volontaire, Fixité de la posture, posture fixe, posture bloquée, bloqué, bloquée, crise de catalepsie, patient figé dans une position donnée, Flexibilité cireuse, Ralentissement des fonctions autonomes, battements cardiaques ralentis, respiration imperceptible, pas de respiration, Pâleur donnant l'aspect d'un cadavre, paleur, paleur cadavérique, Diminution de la sensibilité à l'environnement, diminution sensibilité, Absence de réaction aux stimulations, pas de réaction	\N	catalepsie	\N	\\x8004951e000000000000005d94288c0c667265715f6361725f6c6f77948c015f94680268026802652e	2019-08-24 16:52:56.478046	\N	2019-08-24 16:52:56.478046	7	Traitement en fonction de la cause.	\N	\N	\N
863	hypoxie hypoxémique	Hypoxie par baisse de la pression partielle en oxygene.	\N	0	120	sex_MF	Hypoxie hypoxémique, hypoxie, baisse de pression oxygene, nausées, céphalée, céphalées, nausée, envie de vomir, mal au cœur, hyperventilation, tachycardie, troubles du comportement, problemes de comportement, hemorragie, etat de choc, insuffisance cardiaque, cyanose, lésion neurologique	\N	hypoxie hypoxemique	\N	\\x80045d942e	2019-09-14 15:44:02.987658	\N	2019-09-14 15:44:02.987658	7	\N	\N	\N	\N
482	polyarthrite rhumatoïde	La polyarthrite rhumatoïde est une maladie dégénérative inflammatoire chronique, caractérisée par une atteinte articulaire souvent bilatérale et symétrique, évoluant par poussées vers la déformation et la destruction des articulations atteintes.	https://www.has-sante.fr/jcms/c_664454/fr/ald-n-22-polyarthrite-rhumatoide-evolutive-grave, https://www.has-sante.fr/jcms/c_606479/fr/polyarthrite-rhumatoide-diagnostic-et-prise-en-charge-initiale-cette-recommandation-est-suspendue	0	120	sex_MF	douleurs aux articulations, sensibilité articulations, douleurs plus fortes la nuit, douleurs fortes au petit matin, douleur forte après une période de repos prolongé, réveil nocturne, douleur mains, douleurs doigts, douleur hanche, douleur genoux, douleur genou, douleur cou, douleur coude, douleur pied, douleur cheville, douleur chevilles, douleur coudes, douleur hanches,  gonflement genou, gonglement articulations, gonflement hanche, gonflement pied, gonflement cheville, gonflement main, gonflement doigt, gonflement coude, symétrique, articulations chaudes, articulations chaudes, raideur matinale des articulations, fatigue, invalidant, auto immun, inflammation, manque d'appétit, fièvre, difficile d’utiliser les articulations, difficile de bouger les articulations, petites bosses dures, bosses non douloureuses, bosses sous la peau, bosses à l’arrière des chevilles, bosse tendons d’Achille, bosse aux coudes, bosse près des articulations des mains, nodules rhumatoïdes, dépression, chronicité, anémie inflammatoire	arthrite rhumatoïde	polyarthrite rhumatoide	\N	\\x80045d942e	2019-08-22 14:18:04.565583	\N	2019-08-22 14:18:04.565583	7	Infiltrations de corticoïdes\r\nSynoviorthèse isotopique\r\nParfois, chirurgie	\N	\N	\N
897	labyrinthite	La labyrinthite est une affection d'équilibre due à une infection ou inflammation de l'oreille interne. Il y a en ce cas incohérence entre les signaux du labyrinthe et les autres signaux, ce qui donne du vertige. La labyrinthite peut affecter une oreille ou les deux.\r\n	\N	0	120	sex_MF	Labyrinthite, neuronite vestibulaire, vertige fort, vertige, sensation objets bougent, sensation vertige, perte équilibre, perte stabilité, nausées, envie de vomir, nauséeux, nausée, vomissements, vomissement, vomi, palpitations, palpitation, fièvre, haute température, température élevée, convulsions, convulsion, évanouissements, évanouissement, malaise, perte connaissance \r\n	névrite vestibulaire,  neuronite vestibulaire	labyrinthite	\N	\\x80045d942e	2019-09-16 09:44:08.97222	\N	2019-09-16 09:44:08.97222	7	Aucun traitement ne permet la guérison.	\N	\N	\N
1056	ostéopénie	L'ostéopénie est une baisse de la densité de l'os. Il s'agit d'un état physiologique, précurseur de l'ostéoporose. 	\N	0	120	sex_MF	perte de densité os, ostéoporose, ostéopénie, os perd en densité, os peu dense, fracture, fractures, fracture spontanée, fractures spontanées, tassement vertebre, tassement vertebres, fracture col du fémur, fracture fémorale, fracture tete du fémur, fracture tete fémorale, tete du femur cassée, col du fémur cassé	\N	osteopenie	\N	\\x8004951e000000000000005d94288c0a63615f746f745f6c6f77948c097669745f445f6c6f7794652e	2019-09-23 10:07:24.491933	\N	2019-09-23 10:07:24.491933	7	biphosphonates	\N	\N	\N
585	cholangite biliaire primitive	La cholangite biliaire primitive est une maladie chronique, inflammatoire des petites voies biliaires intrahépatiques. 	\N	0	120	sex_MF	asthénie, fatigue, prurit, démangeaisons, bouche seche, yeux secs, gêne en haut de l’abdomen, gene ventre, hyperpigmentation de la peau, accumulation de graisses sous forme de protubérances jaunâtres au niveau de la peau, accumulation de graisses sous forme de protubérances jaunâtres au niveau des paupières, augmentation du volume de l’abdomen due à l’accumulation de liquide, ascite, gonflement des jambes due à l’accumulation de liquide, oedème, ictère, jaunisse, jambes gonflées, gonflement des jambes, abdomen gonflé, boule paupieres, boule peau	cbp,  cirrhose biliaire primitive	cholangite biliaire primitive	\N	\\x8004953e000000000000005d94288c1070686f73706861746173655f68696768948c0d67616d6d615f67745f68696768948c1362696c69727562696e655f6469725f6869676894652e	2019-08-27 19:20:35.63614	\N	2019-08-27 19:20:35.63614	7	L'acide ursodésoxycholique pris en continu, le plus précocement possible, à la dose de 13-15 mg/kg/jour, est le traitement de base de la maladie. Les résultats sont plus discutés sur l'évolution à long terme.	\N	\N	\N
579	cholestase	Une cholestase est une diminution de la sécrétion biliaire pouvant provoquer un ictère 	\N	0	120	sex_MF	cholestase, ictère, couleur jaune de la peau et des téguments, peau jaune, urines foncées, selles décolorées, prurit, démangeaisons, cholestase extra-hépatique, hépatomégalie, augmentation du volume du foie, grosse vésicule biliaire, fièvre, augmentation des phosphatases alcalines, augmentation des gamma-glutamyl transpeptidase , augmentation de la bilirubine conjuguée, carence en vitamine A, carence en vitamines D, carence en vitamines E, carence en vitamines K, diminution du taux de prothrombine 	cholostase	cholestase	\N	\\x80049534000000000000005d94288c0f62696c69727562696e655f6469725f948c0c70686f73706861746173655f948c0449524d5f948c044563685f94652e	2019-08-27 15:54:35.667842	\N	2019-08-27 15:54:35.667842	7	Diagnostiquer une cholestase est une urgence, il ne faut pas attendre l'ictère pour effectuer les examens biologiques notamment devant un prurit ou une fièvre prolongée avec frissons. L'échographie abdominale est un excellent examen de débrouillage. Le traitement doit être effectué en milieu spécialisé, en effet le plateau technique doit regrouper impérativement trois spécialités : un chirurgien hépato-biliaire, un endoscopiste interventionnel et un radiologue interventionnel spécialiste de la radiologie transhépatique.	\N	\N	\N
592	colique néphrétique	La colique néphrétique désigne des douleurs paroxystiques, violentes, spontanées ou provoquées (secousses) de la fosse lombaire allant vers les organes génitaux. Elle requiert une prise en charge immédiate. La douleur ressentie lors d'une colique néphrétique est réputée comme étant l'une des plus vives décrites en médecine.\r\n	\N	0	120	sex_MF	douleur brutale, douleur intense, douleur brutale abdomen, douleur intense abdomen,  nausées, vomissements, ballonements, arret du transit, envie d'uriner, envie frequente d'uriner, polyakiurie, difficultés à uriner, dysurie, douleur vésicale, douleur paroxystique, douleur violente, douleur spontanée, douleur provoquée, colique néphrétique, 	\N	colique nephretique	\N	\\x80049537000000000000005d94288c116372656174696e696e655f736572756d5f948c04746f6d5f948c0449524d5f948c06696d6167655f948c046563685f94652e	2019-08-28 05:40:55.787549	\N	2019-08-28 05:40:55.787549	7	Le but est de faire cesser rapidement les douleurs.\r\n\r\nEn première intention, le kétoprofène est aussi efficace et mieux toléré que la morphine. Seuls le kétoprofène et le diclofénac ont l’autorisation de mise sur le marché dans la colique néphrétique, mais le kétoprofène seul a une voie d’administration intra-veineuse, voie rapide d’action et efficace.\r\nEn cas de contre indication au kétoprofène, on a recours à la morphine.\r\n\r\nLe retour à domicile est préconisé lorsque le calcul a un diamètre inférieur à 10 mm, avec une colique néphrétique simple, avec un anti-inflammatoire non stéroïdien per os pendant 7 jours ou un antalgique de palier 2 pendant la même période.\r\nUne hospitalisation en urologie est nécessaire quand les calculs urétéraux mesurent plus de 10 mm, une probabilité d’expulsion spontanée jugée faible, des douleurs persistantes malgré un traitement bien suivi, la présence d'une insuffisance rénale ou d'un rein unique.	\N	\N	\N
1020	myoclonie	La myoclonie est une contraction musculaire rapide, involontaire, de faible amplitude, d'un ou plusieurs muscles.	\N	0	120	sex_MF	Myoclonie, contraction musculaire incontrôlée, contractions musculaires incontrolées, spasmes musculaires, spasme musculaire, secousses musculaires, secousse musculaire, mouvements musculaires involontaires, mouvement musculaire involontaire\r\n	\N	myoclonie	\N	\\x80045d942e	2019-09-22 13:54:18.558241	\N	2019-09-22 13:54:18.558241	7	\N	\N	\N	\N
1081	presbyacousie	La presbyacousie est un phénomène plus ou moins marqué selon les individus et qui résulte du vieillissement. Elle est définie comme une perte progressive de l'audition, liée à l'âge, bilatérale et symétrique, surtout dans les fréquences élevées.	https://www.has-sante.fr/jcms/c_2833796/fr/reperage-des-deficiences-sensorielles-et-accompagnement-des-personnes-qui-en-sont-atteintes-dans-les-etablissements-pour-personnes-agees-volet-ehpad	20	120	sex_MF	presbyacousie, difficulté à entendre, baisse de l’audition, baisse d’audition, difficulté de communication, difficulté à communiquer, acouphènes, dépression, syndrome dépressif, surdité totale, surdité, mauvaise audition\r\n	\N	presbyacousie	\N	\\x80045d942e	2019-09-23 19:22:28.1678	\N	2019-09-23 19:22:28.1678	7	Appareillage auditif	\N	\N	\N
597	condylome	Une verrue génitale est une infection sexuellement transmissible (IST) extrêmement contagieuse due à certaines variantes du papillomavirus humain (HPV). Ces verrues peuvent se présenter comme des excroissances indolores touchant la peau ou les muqueuses des régions anale et/ou génitale. Leur aspect le plus fréquent les font surnommer crêtes de coq, mais les lésions peuvent parfois être planes et même rester non visibles à l'œil nu.\r\n	\N	14	120	sex_MF	verrue genitale, verrues genitales, condylomes, petites verrues sur les organes génitaux externes, verrue vulve, verrues vulve, verrue pénis, verrues penis, verrue scrotum, verrues scrotum, verrue vagin, verrue col de l'utérus, verrues vagin, verrues col de l'utérus, condylome vagin, condylome penis, condylome col de l'utérus, verrue urètre, verrue anus, verrues uretre, verrues anus, condylome uretre, condylomes anus, verrue bouche, verrues bouche, démangeaisons, prurit, gêne, verrues sur la vulve, verrues sur les parois vaginales,  verrues sur le col utérin, verrues sur le périnée, verrues sur le méat urétral, verrues autour de l’anus, saignements rapports sexuels, saignements sexuels, verrues sur le gland, verrues sur le frein, verrues sur le prépuce\r\n	verrue génitale, condylomata acuminata,  condylomes acuminés	condylome	\N	\\x8004950b000000000000005d948c047465735f94612e	2019-08-28 06:20:40.55153	7	2019-08-28 06:21:04.062222	7	Le traitement est local et peut faire appel :\r\n- à des méthodes physiques : cryothérapie (azote liquide), curetage, laser CO2 ou bien électrocoagulation,\r\n- à l'application de crèmes/lotion : imiquimod (modification de la réponse immunitaire), Podophyllotoxine ou Fluorouracile.	\N	\N	\N
600	conjonctivite virale	douleurs à un oeil , douleur yeux, douleur aux deux yeux, gene oeil, gene yeux, picotement oeil, picotement yeux, sensation de brûlure, sensation d'égratignure, sensation d'abrasion, brulure oeil, brulure yeux, oeil qui brule, yeux qui brulent, secretion qui font une croute, croute, crottes d'oeil,  rougeur de l’œil, rougeur oeil, rougeur yeux, larmoiement réflexe, larmes, larmes reflexe, larmoiement, conjonctivite, conjonctivite virale	La conjonctivite virale est une inflammation de la conjonctive provoquée par un virus.	0	120	sex_MF	douleurs à un oeil , douleur yeux, douleur aux deux yeux, gene oeil, gene yeux, picotement oeil, picotement yeux, sensation de brûlure, sensation d'égratignure, sensation d'abrasion, brulure oeil, brulure yeux, oeil qui brule, yeux qui brulent, secretion qui font une croute, croute, crottes d'oeil,  rougeur de l’œil, rougeur oeil, rougeur yeux, larmoiement réflexe, larmes, larmes reflexe, larmoiement, conjonctivite, conjonctivite allergique	\N	conjonctivite virale	\N	\\x80045d942e	2019-08-28 08:05:31.163687	\N	2019-08-28 08:05:31.163687	7	Le traitement est symptomatique : larmes artificielles. L'évolution doit être favorable en une semaine. Si elle se prolonge, un avis ophtalmologique est conseillé.	\N	\N	\N
605	rosacée	La rosacée, connue aussi sous le nom de couperose, est une maladie cutanée incurable au départ bénigne qui se manifeste par des rougeurs chroniques au niveau du nez, des joues, parfois aussi au niveau du menton et du front. Ces symptômes s'accompagnent d'une sensation de picotement, notamment au niveau des yeux. De petits vaisseaux sanguins, caractéristiques des varicosités sont souvent visibles dans les zones touchées associées à des télangiectasies.	\N	0	120	sex_MF	rougeurs sur le visage, érythème, rougeur visage, rougeurs visage, visage rouge, Peau sèche, peau sensible, brûlure, sensation de brulure, rougit facilement, rougit, joues rouges, nez rouge, front rouge, menton rouge, boufées de chaleur, bouffée de chaleur, bouffées vasomotrices, bouffée vasomotrice, accès de rougeur, crise de rougeur,  rougit émotions, rougit changements de température, rougit après le repas, télangiectasies, couperose, petits boutons rouges, petits boutons solides, papules, boutons remplis de pus, pus, pustules, pustules nez, pustules joue, pustules front, pustules menton, boutons sur le nez, boutons sur les joues, boutons sur le front, boutons sur le menton, yeux secs, yeux rouges, yeux irrités, nez rouge, nez enflé, nez recouvert de nodules, \r\n\r\n	couperose	rosacee	\N	\\x80045d942e	2019-08-29 06:06:09.733257	\N	2019-08-29 06:06:09.733257	7	Il n'existe pas de traitement curatif de cette maladie. Cependant, les traitements actuels permettent d'en améliorer les symptômes.\r\n	\N	\N	\N
737	hallux valgus	L’hallux valgus, souvent accompagné d'un « oignon » (callosité de la peau en regard de la déformation), est une déformation du pied correspondant à la déviation du premier métatarsien en varus et du gros orteil  en valgus.	https://www.has-sante.fr/jcms/c_1763710/fr/avis-n-2014-0014/ac/seesp-du-12-mars-2014-du-college-de-la-haute-autorite-de-sante-relatif-au-referentiel-concernant-la-duree-d-arret-de-travail-dans-le-cas-de-l-osteotomie-pour-hallux-valgus	0	120	sex_MF	hallux valgus, oignon, callosité de la peau en regard de la déformation, déformation du pied, déviation du premier métatarsien en varus, gros orteil  en valgus, gros orteil en dehors, hallux en dehors, metatarsien en dedans, callosité, orteil en dehors, orteil déformé, hallux déformé, 	\N	hallux valgus	\N	\\x8004950d000000000000005d948c06696d6167655f94612e	2019-09-05 15:53:32.166421	\N	2019-09-05 15:53:32.166421	7	Le chirurgien s'attache à rechercher plusieurs éléments qui justifient d'une intervention chirurgicale :\r\n\r\n- la douleur : elle siège au bord interne du pied, en regard de la tête du métatarsien ;\r\n- la bursite : la « bosse » qui fait saillie sous la peau entre en conflit avec les chaussures. La peau devient inflammatoire et parfois une ulcération, voire une collection, peut apparaître ;\r\n- la gêne au chaussage : la « bosse » oblige à porter des chaussures plus larges et sans talon. A l'extrême, certains n'arrivent plus à se chausser, sauf dans des claquettes ou des tongs.\r\n	\N	\N	\N
486	fistule dentaire		\N	0	120	sex_MF	bouton, infection, canal, bouche, dent, douleur dent, carie, orifice brun dent, orifice marron dent, trou marron dent, trou brun dent, croute dent, croute gencive, pus, dent mobile, dent douloureuse, dent qui bouge	\N	fistule dentaire	\N	\\x8004950d000000000000005d948c06696d6167655f94612e	2019-08-22 18:00:30.411801	\N	2019-08-22 18:00:30.411801	7		\N	\N	\N
870	occlusion de l'intestin grêle	Une occlusion intestinale est un arrêt complet du passage des matières et des gaz dans un segment de l'intestin, ici grêle. L'occlusion peut avoir une cause mécanique (obstruction, strangulation), fonctionnelle ou mixte.\r\n	\N	0	120	sex_MF	Occlusion intestinale grêle, occlusion intestinale, crampes abdominales, douleurs abdominales, douleur abdominale, crampe abdominale, mal au ventre, nausées, nausée, envie de vomir, vomissements, vomissement, diarrhée, selles liquides, ballonnements, ballonné, ventre gonflé, arrêt élimination selles et gaz, constipation, fièvre, température élevée, abdomen gonflé	\N	occlusion de l'intestin grele	\N	\\x80049515000000000000005d94288c06696d6167655f948c044e46535f94652e	2019-09-14 16:32:42.498031	\N	2019-09-14 16:32:42.498031	7	Si ça ne se résorbe pas seul, le traitement est chirurgical.	\N	\N	\N
607	crampe	Une crampe est une contraction involontaire douloureuse et temporaire d'un muscle. Les crampes surviennent plus souvent au niveau des fléchisseurs des bras ou des jambes (ex : crampe des gastrocnémiens, des fléchisseurs du pied).	\N	0	120	sex_MF	contraction muscle, contraction involontaire muscle, contraction temporaire involontaire muscle, crampe, crampe jambe, crampe mollet, crampe cuisse, crampe bras, crampe avant bras, crampe cou, contraction douloureuse, muscle douloureux, muscle douloureux nuit, douleur muscle, douleur mollet, douleur bras, 	\N	crampe	\N	\\x80045d942e	2019-08-29 06:16:16.107282	\N	2019-08-29 06:16:16.107282	7	Pour les crampes dues à la chaleur ou à la déshydratation, dans la majorité des cas, celles-ci peuvent être évitées ou neutralisées par un rééquilibrage de l'équilibre osmotique (notamment du sodium), c'est-à-dire une ingestion d'eau salée (une demi-cuillerée à café par litre).\r\n\r\nPour les crampes « essentielles » (idiopathiques), c’est-à-dire sans cause décelées et décelables :\r\n\r\n- il est de coutume d'étendre le muscle concerné, sur un sol froid de préférence (techniques de refroidissement et d'étirement passif) ; l'étirement du mollet, une certaine pression sur la jambe, le fait de marcher ou se mettre debout, un bain ou une douche chaude peuvent souvent aider à mettre fin à la crampe. En cas de crampe du mollet, tirer le gros orteil doucement en arrière et étirer le muscle pour provoquer un soulagement presque immédiat ;\r\n- il est conseillé de pratiquer des exercices d'étirement pendant la journée (par exemple : se tenir debout face à un mur situé à un mètre et se pencher en avant pour faire reposer les mains au mur sans décoller les talons du sol) ;\r\n- de s'hydrater et de s'échauffer avant les efforts (par exemple : pour les sportifs).	\N	\N	\N
608	craniopharyngiome	Le craniopharyngiome est une malformation tissulaire embryonnaire (c'est-à-dire apparue avant la naissance) de la région hypophysaire. Les raisons de cette malformation sont encore inconnues. 	\N	0	120	sex_MF	Déficit hormonal, baisse vue, baisse de la vue, baisse vision, baisse de la vision, Baisse de l'acuité visuelle, Polyurie, uriner plus de 10l/jour, Polydypsie, boire plus de 8l/jour, urine beaucoup, urine trop, boit trop, boit beaucoup, boire trop, boire beaucoup, uriner trop, uriner beaucoup, beaucoup uriner, Troubles du champ visuel, hémianopsie bitemporale, Céphalées importantes à répétition, céphalées importantes, céphalées répétées, maux de tête, maux de tête répétés, Retard de croissance, Retard de puberté, Vomissements répétés, vomissements, petite taille, petit, taille petite	\N	craniopharyngiome	\N	\\x80049519000000000000005d94288c0449524d5f948c0a5572696e655f6869676894652e	2019-08-29 06:20:05.341213	\N	2019-08-29 06:20:05.341213	7	Le traitement d'un craniopharyngiome nouvellement diagnostiqué est essentiellement chirurgical. La décision de la technique opératoire (voie d'abord, exérèse complète ou partielle) dépendra des caractéristiques de la tumeur. La plupart du temps, le craniopharyngiome ne peut pas être enlevé entièrement, de peur de léser les structures environnantes.	\N	\N	\N
621	dengue	La dengue est la plus fréquente et la plus répandue des arboviroses ou infections virales transmises par des arthropodes. Elle est due aux virus de la dengue, de la famille des Flaviviridae, transmis à l'être humain par l'intermédiaire d'un moustique diurne, principalement Aedes aegypti (régions tropicales et subtropicales), puis Aedes albopictus (régions tempérées).	https://www.has-sante.fr/jcms/c_2912616/fr/place-du-vaccin-dengvaxia-dans-la-strategie-de-lutte-contre-la-dengue-dans-les-departements-francais-d-outre-mer-mayotte-et-territoires-francais-d-amerique, https://www.has-sante.fr/jcms/c_2902751/fr/place-du-vaccin-dengvaxia-dans-la-strategie-de-lutte-contre-la-dengue-dans-les-departements-francais-d-outre-mer-l-ile-de-la-reunion	0	120	sex_MF	dengue, grippe « tropicale », fièvre élevée de survenue brutale, douleurs musculaires, douleurs articulaires, maux de tête, nausées, vomissements, fièvre, éruption,saignements de la peau, saignement des muqueuses, saignements cutanéomuqueux, d’hématomes, bleus, bleus sur la peau, pétéchies, petits points rouges à la surface de la peau, saignement de nez, saignement de gencives, vomissements de sang, sang dans les selles, fatigue, piqure du moustique, piqures de moustique\r\n	\N	dengue	\N	\\x80049535000000000000005d94288c046c65755f948c0374705f948c1068656d61746f63726974655f68696768948c0652545043525f948c047365725f94652e	2019-08-29 14:15:21.473697	\N	2019-08-29 14:15:21.473697	7	Aucun traitement curatif spécifique antiviral de la dengue n'est disponible actuellement.\r\n\r\nLa dengue non compliquée peut être traitée à domicile, sous réserve d'une évaluation médicale quotidienne. La prise en charge thérapeutique consiste en de simples mesures symptomatiques\r\n\r\nRepos ;\r\nRéhydratation orale, éventuellement par la prise d'un soluté de réhydratation orale ;\r\nCalmer douleur et fièvre à l'aide de médicaments antalgiques et antipyrétiques à base de paracétamol ;\r\nÉviter la prise d'acide acétylsalicylique (aspirine), formellement contre-indiquée, ainsi que la prise d'anti-inflammatoires non stéroïdiens, car ils majoreraient le risque hémorragique intrinsèque de la maladie.	\N	\N	\N
610	maladie de crohn	La maladie de Crohn est une maladie inflammatoire chronique de l'intestin (MICI) qui peut atteindre toute partie de l'appareil digestif (de la bouche à l'anus) et éventuellement la peau, les articulations et les yeux. De cause inconnue, cette maladie est caractérisée par une inflammation le plus souvent retrouvée au niveau de l'iléon et du côlon, qui serait d'origine multifactorielle, faisant intervenir entre autres une composante génétique et le microbiome.	https://www.has-sante.fr/jcms/c_671094/fr/ald-n-24-maladie-de-crohn	0	120	sex_MF	Crohn, maladie de Crohn, poussées alternant avec des phases de rémission, phases de rémission, rémission, douleur abdominale, douleur abdominale qui s'accentue après les repas, douleur après manger, douleur après repas, douleur abdominale après repas, douleur abdominale après manger,  diarrhées, diarrhée, diarrhées chroniques, diarrhée chronique, fièvre, fatigue persistante, fatigue,  perte de poids, dysphagie, douleur en mangeant, nausées, vomissements, aphtes dans la bouche, aphtes, hypoalbuminémie, calculs rénaux, coliques néphrétiques, spondylarthropathie, érythèmes noueux, atteintes oculaires, uvéite antérieure, épisclérite, diplopie, hypersensibilité à la lumière,\r\npancréatites, thromboses veineuses	crohn	maladie de crohn	\N	\\x8004953e000000000000005d94288c06696d6167655f948c04636f6c5f948c0462696f5f948c046669625f948c0974656d705f68696768948c0c616c62756d696e655f6c6f7794652e	2019-08-29 06:29:28.976479	7	2019-08-29 06:29:44.905994	7	Les causes de la maladie de Crohn restant inconnues, il n’existe aucun traitement permettant d’en guérir. Le traitement médical repose sur la réduction de l'inflammation. Le traitement est basé sur deux principes : le premier consiste à traiter le malade au cours des poussées ; c’est ce que l’on appelle le traitement d’attaque. Le second principe est la prévention des rechutes. C’est le traitement d’entretien qui permet de prolonger au maximum les périodes de rémission de la maladie.	\N	\N	\N
769	hypercalcémie	L'hypercalcémie est un état caractérisé par l'augmentation anormale du taux de calcium dans le plasma, indépendamment des autres constantes biologiques, notamment lorsque le taux de calcium dépasse 2,6 mmol/l de plasma avec un taux de protidémie et d'albuminémie normal.\r\n	\N	0	120	sex_MF	Hypercalcémie, besoin d’uriner, urine frequement, fort besoin d’uriner, polyurie, soif intense, polydypsie, constipation, faiblesse, faiblesse generale de l’organisme, depression, somnolence, confusion, confusions, somnolences, douleurs osseuses, douleur osseuse, douleur aux os, douleurs aux os, calculs rénaux, calcul rénal, formation de cristaux rein, trop de calcium	\N	hypercalcemie	\N	\\x80049512000000000000005d948c0b63615f746f745f6869676894612e	2019-09-08 06:35:54.615818	\N	2019-09-08 06:35:54.615818	7	Injection IV de diphosphonate, mineralocorticoïides et réhydratation	\N	\N	\N
611	cruralgie	La cruralgie ou névralgie crurale est une douleur de la face antérieure du membre inférieur, causée par une irritation ou une compression du nerf fémoral (anciennement nerf crural) ou d'une de ses racines (L3 ou L4).	https://www.has-sante.fr/jcms/c_2961499/fr/prise-en-charge-du-patient-presentant-une-lombalgie-commune	0	120	sex_MF	Douleurs intermittentes, douleur à la face extérieure de la hanche, douleur hanche, douleurs hanche, douleurs face exterieure de la hanche, douleur intermittente hanche, douleurs intermittentes hanche, douleur au niveau de l'aine, douleur sur le devant de la cuisse, douleur antérieure cuisse, douleur Majorée lors des efforts de toux, douleur majorée à la défécation, douleur défécation, douleur toux, douleurs défécation, douleurs toux, douleurs Calmées par le repos, douleur calmée allongée, pas de douleur allongé, douleur Déclenchées par la position assise, douleurs voiture, douleur au testicule, douleur au toucher testicule, gonflement testicule, paresthésies, allodynie, anesthésie	\N	cruralgie	\N	\\x80049515000000000000005d94288c06696d6167655f948c0449524d5f94652e	2019-08-29 06:37:00.207732	\N	2019-08-29 06:37:00.207732	7	Il existe des traitements médicaux et chirurgicaux. Habituellement, le traitement débute par une prise en charge médicale. Il n'y a pas de preuve de supériorité d'un traitement par rapport aux autres.	\N	\N	\N
614	cystite	Une cystite est une inflammation de la vessie. Infection urinaire la plus courante, elle est le plus souvent d'origine bactérienne (colibacilles, naturellement présents dans l'intestin) ; mais peut aussi être due à un agent toxique : traitement anti-cancéreux ou radiothérapie. C'est une infection fréquente chez la femme, car elle possède un urètre court, ce qui augmente le risque d'infection urinaire et que les sécrétions de la prostate des hommes contiennent des substances qui ralentissent la multiplication des bactéries dans l’urètre.	https://www.has-sante.fr/jcms/c_2722827/fr/cystite-aigue-simple-a-risque-de-complication-ou-recidivante-de-la-femme, https://www.has-sante.fr/jcms/c_2722927/fr/femme-enceinte-colonisation-urinaire-et-cystite	0	120	sex_MF	Cystite infectieuse, bactéries intestinales, Cystite radique, Cystite à urine claire, cystite, cystite interstitielle, Cystite à champignon, vaginite à mycoses, Cystite allergène, Cystite de blessure, Cystite d'origine médicamenteuse, brûlures mictionnelles, inflammation de la vessie, inflammation vessie, vessie inflammée, pollakiurie, émission excessivement fréquente d'urine en faible quantité, envie d'uriner, envie d'uriner fréquente, envie d'uriner tout le temps, besoin d'uriner tout le temps, besoin d'uriner fréquent, impériosité urinaire, besoin d'aller uriner dans l'immédiat, tiraillement, douleurs hypogastriques, douleur bassin, hématurie, présence de sang dans l'urine, sang dans les urines, pyurie, présence de pus dans l'urine, pus dans l'urine	\N	cystite	\N	\\x80049513000000000000005d94288c046c65755f948c046261635f94652e	2019-08-29 06:49:57.21777	\N	2019-08-29 06:49:57.21777	7	Il est important de soigner rapidement une cystite, car l'infection peut se compliquer et atteindre le rein et causer une pyélonéphrite. Une pause de l'activité sexuelle est préconisée afin de faciliter au mieux la guérison.\r\nLe traitement de la cystite aiguë non récidivante est simple. Il associe un traitement antibiotique (qui peut être pris en une seule dose, en une seule fois : « traitement minute ») à un anti-inflammatoire et à un antispasmodique. Le traitement antibiotique peut être plus long (trois à cinq jours). Il est impératif de boire au moins deux litres d'eau par jour, pour éliminer au maximum.\r\n\r\nLe traitement de la cystite aiguë non récidivante est simple. Il associe un traitement antibiotique (qui peut être pris en une seule dose, en une seule fois : « traitement minute ») à un anti-inflammatoire et à un antispasmodique. Le traitement antibiotique peut être plus long (trois à cinq jours). Il est impératif de boire au moins deux litres d'eau par jour, pour éliminer au maximum.\r\n\r\n	\N	\N	\N
616	dacryocystite	La dacryocystite est une inflammation du sac lacrymal. on parle de dacryocystite dans le cas d'un dysfonctionnement des voies lacrymales dû à une sténose. On retrouve ce type de pathologie chez le nouveau-né ou bien chez le sujet âgé (au-delà de 60 ans). Chez les personnes âgées, il s'agit d'un vieillissement des voies lacrymales avec une diminution de la perméabilité des canaux qui peut conduire à l'arrêt de l'élimination des larmes. Les larmes finissent par se sédimenter et se surinfecter.	\N	0	120	sex_MF	larmoiement chronique, infection du sac lacrymal, abcès du sac lacrymal, tuméfaction rouge oeil, tuméfaction rouge angle interne de l'oeil, tuméfaction rouge partie interne de l'oeil, tuméfaction douloureuse à l'angle interne de l'œil, pus oeil, pus partie interne de l'oeil, infection oeil, infection interne oeil, infection partie médiale oeil, pus partie médiale oeil\r\n	\N	dacryocystite	\N	\\x80045d942e	2019-08-29 09:20:03.858406	\N	2019-08-29 09:20:03.858406	7	Collyre antiseptique en cure chez les personnes âgées qui se plaignent de larmoiement chronique. Le stade aigu nécessite l'intervention chirurgicale d'un ophtalmologiste accompagné d'un traitement antibiotique par voie orale et locale.	\N	\N	\N
619	dégénérescence maculaire liée à l'âge	La dégénérescence maculaire liée à l'âge (DMLA) ou dégénérescence maculaire sénile est une maladie de la rétine provoquée par une dégénérescence progressive de la macula, partie centrale de la rétine, qui peut apparaître à partir de l'âge de 50 ans, et plus fréquemment à partir de 65 ans, provoquant un affaiblissement important des capacités visuelles, sans toutefois les anéantir. 	https://www.has-sante.fr/jcms/c_1051619/fr/degenerescence-maculaire-liee-a-l-age-prise-en-charge-diagnostique-et-therapeutique	50	120	sex_MF	besoin d'accroître l'intensité lumineuse, besoin de lumiere, besoin de plus de lumiere, besoin de lumiere pour lire, vision floue, vision centrale floue, vision brouillée, vision embrouillée, vision centrale brouillée, vision centrale embrouillée, difficulté à lire, probleme pour lire, problemes pour lire, lecture difficile, mauvaise perception des couleurs, perception altérée des couleurs, distorsion des lignes droites, petite tache sombre au centre du champ visuel, difficulté à reconnaître les visages, hallucinations visuelles	dmla	degenerescence maculaire liee a l'age	\N	\\x80049523000000000000005d94288c054f65696c5f948c05616e67695f948c047465735f948c047465735f94652e	2019-08-29 09:49:23.980186	\N	2019-08-29 09:49:23.980186	7	Arrêt du tabac\r\nPerte de poids  \r\nTraitement laser,...	\N	\N	\N
523	cancer des voies aérodigestives supérieures	Un cancer des voies aérodigestives supérieures  est un cancer localisé au niveau des voies aérodigestives supérieures, ce qui regroupe les sinus, les fosses nasales, le pharynx, la cavité buccale et le larynx.	https://www.has-sante.fr/jcms/c_892164/fr/ald-n-30-cancer-des-voies-aero-digestives-superieures	0	120	sex_MF	Changements inexpliqués dans la voix, enrouement, voix rauque, Augmentation de volume des ganglions, douloureuse, Mal de gorge persistant, déglutition douloureuse, Douleur dans la zone de l’oreille, Respiration difficile, Toux, saignements, Perte de poids inexpliquée, plaie dans la bouche, ulcération infiltrée, ulcération indolore bouche, ulcération persistante bouche, tuméfaction dans la bouche,  douleur langue, trouble de la mobilité linguale, douleur de l'oreille, otalgies réflexe, mobilité dentaire, saignement des gencives, gingivorragie, gêne à la déglutition, dysphagie,  odynophagie, anesthésie dans le territoire du nerf mandibulaire, augmentation de la taille d'un ganglion cervical, gêne respiratoire, 	cancer de la gorge, cancer de la tête et du cou	cancer des voies aerodigestives superieures	\N	\\x80049513000000000000005d94288c046669625f948c0462696f5f94652e	2019-08-23 16:18:56.504274	\N	2019-08-23 16:18:56.504274	7	Chirurgie, radiothérapie ou chimiothérapie	\N	\N	\N
881	onycholyse	Décollement de l'ongle	\N	0	120	sex_MF	Onycholyse, couleur ongle modifiée, ongle blanc, ongle jaune, ongle jaunatre, ongle orange, ongle brun, surinfection ongle, infection ongle, infection ongle levure, infection ongle agent microbien, ongle infecté, infection ongle	\N	onycholyse	\N	\\x80045d942e	2019-09-14 17:06:05.630312	\N	2019-09-14 17:06:05.630312	7	\N	\N	\N	\N
22	diabete de type 1	Le diabète de type 1 apparaît le plus souvent de manière brutale chez l'enfant ou chez le jeune adulte (ou beaucoup plus rarement chez les personnes plus âgées) mais peut parfois aussi être présent depuis la naissance et ne se révéler qu'à l'adolescence.	https://www.has-sante.fr/jcms/c_750168/fr/ald-n8-diabete-de-type-1-chez-l-adulte, https://www.has-sante.fr/jcms/c_750150/fr/ald-n8-diabete-de-type-1-chez-l-enfant-et-l-adolescent	0	120	sex_MF	élimination excessive d'urine, trop d'urine, urine trop, besoin d'uriner la nuit, beaucoup d'urine, gros volume urinaire, besoin d'uriner fréquent, augmentation de la soif et de la faim, fatigue importante, fatigue, perte de poids, vision floue, mauvaise vision, corps cétoniques dans les urines, diabète, diabetique, diabete de type 1	diabète insulino-dépendant, diabète inné, diabète sucré	diabete de type 1	\N	\\x80049514000000000000005d948c0d676c7963656d69635f6869676894612e	2019-06-07 20:54:59.086309	7	2019-08-31 13:32:53.637159	1	Le traitement du diabète de type 1 associe régime et prise d'insuline. C'est le patient diabétique qui ajuste à chaque prise sa dose d'insuline ; son implication et sa connaissance du traitement sont donc importantes.\r\n\r\nCependant un régime alimentaire sain, l’activité physique, des médicaments, un dépistage régulier et le traitement des complications permettent de traiter le diabète et d’éviter ou de retarder les conséquences qu’il peut avoir.	\N	\N	\N
507	autisme asperger	Comme tous les TSA, le syndrome d'Asperger se caractérise par des difficultés significatives dans les interactions sociales, associées à des intérêts spécifiques ou des comportements répétitifs. Il s'en différencie par l'absence de déficit intellectuel et de retard dans l’apparition du langage. Il s'associe souvent à une maladresse physique et une utilisation atypique de la parole, bien qu'elles ne soient pas toujours retenues pour le diagnostic.	https://www.has-sante.fr/jcms/c_2006477/fr/trouble-du-spectre-de-l-autisme-interventions-et-parcours-de-vie-de-l-adulte, https://www.has-sante.fr/jcms/c_468812/fr/trouble-du-spectre-de-l-autisme-signes-d-alerte-reperage-diagnostic-et-evaluation-chez-l-enfant-et-l-adolescent, https://www.has-sante.fr/jcms/c_953959/fr/autisme-et-autres-troubles-envahissants-du-developpement-interventions-educatives-et-therapeutiques-coordonnees-chez-l-enfant-et-l-adolescent, https://www.has-sante.fr/jcms/c_935617/fr/autisme-et-autres-troubles-envahissants-du-developpement	0	120	sex_MF	asperger, syndrome d'asperger, difficulté à faire des contacts visuels, difficulté à comprendre les expressions faciales, difficulté à décoder les expressions émotionnelles, difficulté à interpréter les intentions des autres, difficulté à exprimer ses émotions, difficultés à exprimer son ressenti,  absence de réponse lorsqu’on l’appelle par son nom, préférence à jouer seul, préférence à se retirer dans son monde, incapacité à se faire des amis de son âge, incapacité à jouer à des jeux symboliques, résistance aux câlins, ne veut pas de calins, ne parle pas, perte des mots acquis,  pertedes phrases déjà acquises, incapacité à amorcer ou à soutenir une conversation, parle avec un rythme anormal, parle avec une tonalité anormale, voix chantante, mouvements répétitifs, stéréotypies, dépendance excessive à des routines, dépendance à des rituels, hypersensibilité à la lumière, hyposensibilité à la lumière, hyper sensibilité au son, hyposensibilité aux sons, hypersensibilité au toucher, hyposensibilité au toucher, insensibilité à la douleur, crises de colères, gestes agressifs dirigés contre soi, auto-agressivité, hétéro-agressivité, ne babille pas, ne gazouille pas à l’âge de 12 mois, Ne fait pas de gestes pour communiquer, Ne dit aucun mot à l’âge de 16 mois, Ne dit pas de phrase de deux mots à l’âge de 24 mois, Semble perdre son langage ou des habiletés sociales déjà acquises	syndrôme d'asperger	autisme asperger	\N	\\x80045d942e	2019-08-23 10:29:38.794741	\N	2019-08-23 10:29:38.794741	7	\N	\N	\N	\N
634	dipsomanie	La dipsomanie est un besoin maladif de boire des boissons toxiques, en particulier de l’alcool, lors de crises intermittentes.\r\n	\N	10	120	sex_MF	envie régulière de boire des liquides toxiques, envie irrépressible de boire des liquides toxiques, envie de boire de l'alcool, boit trop d'alcool, envie soudaine de boire de l'alcool, envie irrépressible de boire de l'alcool, crises, crises boire, boit pendant des crises, perte de contrôle pendant les crises, période de tristesse précédant les crises, conscience du problème, conscience du trouble, culpabilité forte après les crises, culpabilité, boire des liquides, boire des liquides toxiques	méthomanie, méthilepsie	dipsomanie	\N	\\x80045d942e	2019-09-01 07:31:27.995748	\N	2019-09-01 07:31:27.995748	7	Le traitement dépend de l'étiologie du syndrome dans lequel la dipsomanie s'inscrit et du diagnostic qui sera posé en consultation après d'éventuels examens physiologiques, en particulier du foie.\r\n\r\nLe traitement symptomatique habituel est le sevrage en suite duquel une psychothérapie peut-être proposée	\N	\N	\N
730	grippe a	La grippe A (H1N1)  est une maladie respiratoire aiguë de l'être humain apparue en 2009. La contamination s'effectue principalement par voie aérienne, c'est-à-dire toux et éternuements. 	\N	0	120	sex_MF	Fièvre brutale, fièvre élevée, fièvreDouleurs musculaires, douleur musculaire, douleurs articulaires, douleur articulaire, fatigue, Fatigue importante, fatigué, mal à la gorge, Douleurs à la gorge, mal de tête, maux de tête, Toux profonde, toux sèche, Congestion, écoulement nasal, Perte d'appétit, Vomissements, vomissement, diarrhées, diarrhée, grippe, grippe H1N1, grippe A	h1n1	grippe a	\N	\\x80049518000000000000005d94288c047269645f948c0974656d705f6869676894652e	2019-09-03 17:23:24.481178	\N	2019-09-03 17:23:24.481178	7	En général, le traitement est symptomatique, analogue à ce qui est pratiqué face aux autres syndromes grippaux et essentiellement à base de paracétamol. Pour les cas plus sévères, des médicaments antiviraux, inhibiteurs de la neuraminidase tels l’oseltamivir ou le zanamivir, sont prescrits. Un vaccin a été développé, et la population invitée à se faire vacciner par des campagnes de prévention.	\N	\N	\N
524	cancer de la langue	Le cancer de la langue désignent toutes les lésions cancéreuses situées au niveau de la langue. 	https://www.has-sante.fr/jcms/c_985212/fr/ald-n-30-cancer-des-voies-aero-digestives-superieures	0	120	sex_MF	cloques langue, apparition de de cloques langue, cloques rougeâtres langue, boutons rouges langue, cloques rouges langue, sang langue, sang bouche, cancer langue, cancer bouche, ulcérations bouche, ulcérations langue, douleurs langue, changement dans la tonalité de la voix, difficultés de déglutition, difficultés pour avaler	\N	cancer de la langue	\N	\\x8004950b000000000000005d948c0462696f5f94612e	2019-08-23 16:25:58.294999	\N	2019-08-23 16:25:58.294999	7	Chirurgie, radiothérapie ou chimiothérapie	\N	\N	\N
636	diverticulite	La diverticulite  est une infection d'un ou de plusieurs diverticules du côlon. Les diverticules sont de petites hernies de la muqueuse intestinale au travers de la paroi musculaire du côlon, le plus souvent localisés sur le sigmoïde, dans lesquelles la stagnation des matières fécales peut favoriser l'infection, selon un mécanisme analogue à celui de l'appendicite. Ces diverticules apparaissent avec l'âge et sont présents en plus ou moins grand nombre chez environ 40 % des personnes de plus de soixante ans.\r\n	https://www.has-sante.fr/jcms/c_2806798/fr/prise-en-charge-medicale-et-chirurgicale-de-la-diverticulite-colique	10	120	sex_MF	douleur intense, douleur soudaine, douleur au bas de l’abdomen, douleur du côté gauche, douleur gauche abdomen, partie gauche de l'abdomen douloureuse, douleur à l'abdomen, sensibilité de l'abdomen, fièvre, nausées, nausée, constipation, diarrhée, vomissement, vomissements, Ballonnement, Sang s’écoulant du rectum, sang dans les selles, sang rectum, sang anus, sang dans l'intestin, Besoin fréquent d’uriner, Douleur en urinant, difficulté à uriner, Sensibilité à l’abdomen en portant une ceinture\r\n	\N	diverticulite	\N	\\x80049515000000000000005d94288c06696d6167655f948c044563685f94652e	2019-09-01 07:42:10.085532	\N	2019-09-01 07:42:10.085532	7	Traitement médical\r\n- Régime sans résidu, bonne hydratation.\r\n- Antibiothérapie active sur les anaérobies et les entérobactéries, mais son efficacité reste discutée.\r\n- Antalgiques, antispasmodiques.\r\nDans les formes simples, l'amélioration des symptômes se fait en un à deux jours.\r\n\r\nTraitement chirurgical\r\nLe but est de prévenir les récidives.	\N	\N	\N
637	dorsalgie	Un mal de dos ou une rachialgie désigne toute douleur siégeant au niveau du rachis ou à proximité de celui-ci, quelles que soient l’origine, la nature et l’intensité de la douleur. Selon le point d'origine de la douleur, on distingue les cervicalgies, les dorsalgies et les lombalgies.	\N	0	120	sex_MF	mal au dos, dos douloureux, mal au cervicales, mal au lombaires, mal aux vertèbres, dos douloureux, cervicales douloureuses, lombaires douloureuses, vertebres douloureuses, dos coincé, douleurs au dos, douleurs aux lombaires, douleur aux lombaires, douleur aux cervicales, douleurs aux cervicales	lombalgie, mal au dos	dorsalgie	\N	\\x80049524000000000000005d94288c0363745f948c06696d6167655f948c0449524d5f948c06696d6167655f94652e	2019-09-01 07:47:30.948465	\N	2019-09-01 07:47:30.948465	7	La plupart des personnes faisant face à un mal de dos pour la première fois voient leur état s’améliorer dans un délai de deux à six semaines sans l’aide d’aucun traitement. La rémission des patients s’effectue d’autant plus vite qu’ils restent actifs et qu’ils reprennent le plus vite possible leurs activités physiques, même si la douleur se fait encore sentir. La douleur peut ne pas disparaître complètement. Un des objectifs des traitements est d’aider le patient à trouver des moyens de contrôler la douleur afin qu’il puisse continuer à exercer ses activités de façon normale.\r\n	\N	\N	\N
873	oedeme de quincke	L'œdème de Quincke est le gonflement rapide de la peau, des muqueuses et des tissus sous-muqueux. En dehors de la forme courante, due à une allergie, il a été observé parmi les effets indésirables de certains médicaments, et notamment les IECA.	\N	0	120	sex_MF	Oedeme de Quincke, gonflement peau, gonflement main, gonflement mains, gonflement pied, gonflement pieds, gonflement œil, gonflement contour yeux, gonflement yeux, gonflement lèvre, gonflement lèvres, lèvres gonflées, levre gonflée, main gonflée, mains gonflées, pied gonflé, pieds gonflés, yeux gonflés, contour yeux gonflés, œil gonflé, gonflement parties génitales, parties génitales gonflées, gonflement partie génitale, partie génitale gonflée, apparition bouton, boutons, plaque de boutons, plaques de boutons, urticaire, plaques rouges, plaque rouge, difficultés respiratoires, respiration difficile, mal à respirer, problèmes respiratoires, irritations, irritations oculaires, irritation des yeux, irritation œil, conjonctivite, douleurs abdominales, mal au ventre, diarrhée, selles liquides, faiblesse organisme, faiblesse\r\n	\N	oedeme de quincke	\N	\\x80045d942e	2019-09-14 16:43:15.767223	\N	2019-09-14 16:43:15.767223	7	L'œdème de Quincke peut être grave car il peut évoluer rapidement vers une obstruction des voies respiratoires due à l'œdème laryngé et vers un état de choc anaphylactique.\r\n\r\nLe traitement de la crise est urgent et nécessite l'association d'adrénaline (en intramusculaire ou perlinguale) et de corticoïde en intramusculaire ou intraveineux. L'administration d'une dose d'adrénaline en sous cutané est recommandée : en concentration 1/1000, 0,01 ml/kg/dose (dose maximale de 0,3 ml/dose); ré-administration si nécessaire après 20 minutes. Un transport médicalisé pour une surveillance hospitalière est nécessaire même en cas de franche amélioration car une réaggravation est possible.	\N	\N	\N
517	cancer de l'endomètre	Le cancer de l'endomètre est un carcinome, principalement un adénocarcinome, de différenciation glandulaire.	https://www.has-sante.fr/jcms/c_1021574/fr/ald-n-30-cancer-de-l-endometre	0	120	sex_F	Cancer de l'endomètre, cancer du corps utérin, carcinome, adénocarcinome, adénocarcinome endométrioïde, carcinome mixte, adénocarcinome séreux, adénocarcinome à cellules claires, adénocarcinome mucineux, carcinome indifférentié, carcinosarcome, carcinome épidermoïde, \r\n saignementes vaginaux anormaux, menstruations anormalement abondantes, menstruations prolongées,  saignements gynécologiques ménopause, femme ménopausée qui saigne, pertes vaginales anormales, pertes blanches, pertes vaginales comme de l’eau, pertes purulentes, crampes bas ventre, douleurs au bas-ventre, douleurs au moment d'uriner, douleur en urinant, douleurs pendant les relations sexuelles, relations sexuelles douloureuses	cancer du corps utérin, adénocarcinome de l'endomètre	cancer de l'endometre	\N	\\x80049513000000000000005d94288c046578615f948c046563685f94652e	2019-08-23 12:47:48.365612	\N	2019-08-23 12:47:48.365612	7	Le traitement d'un cancer relève, le plus souvent, de services spécialisés et expérimentés. Il n'existe pas un traitement unique mais de multiples possibilités de traitement.	\N	\N	\N
1060	photophobie	La photophobie est une sensibilité accrue, voire une intolérance à la lumière. 	\N	0	120	sex_MF	photophobie, sensibilité accrue, intolérance à la lumière, source lumineuse douloureuse, photophobe, mal aux yeux, mal à la tête, sensation visuelle pénible produite par la lumière, mal a la tete soleil, mal a la tete lumiere, mal aux yeux soleil, mal aux yeux lumiere, 	\N	photophobie	\N	\\x80045d942e	2019-09-23 16:35:20.682568	\N	2019-09-23 16:35:20.682568	7	\N	\N	\N	\N
633	diphtérie	La diphtérie est une maladie infectieuse contagieuse due à Corynebacterium diphtheriae ou bacille de Löffler-Klebs, susceptible de produire une toxine touchant d'abord les voies respiratoires supérieures, puis le cœur et le système nerveux périphérique.\r\n\r\nElle débute le plus souvent par une angine à fausses membranes, d'où son nom (diphtera ou « membrane » en grec), pouvant entraîner la mort par suffocation en l'absence de traitement, une complication connue historiquement sous le nom de croup.\r\n	\N	0	120	sex_MF	coryza, fièvre, légère fièvre, gorge rouge, angine, angine à fausses membranes, angine à fausse membrane, amygdales blanches, amygdale blanches, pâle, fatigué, ganglions cervicaux bilatéraux palpables, myocardite, inflammation du foie, hépatite, membranes blanches, membranes grises, membrane blanche, membrane grise\r\n\r\nSpontanément, la fausse membrane s'étend progressivement à la luette et au fond du pharynx. L'extension au larynx provoque le "croup". La toxine entraîne des paralysies de la déglutition (paralysie vélo-palatine), des paralysies oculaires, du diaphragme puis des membres.\r\n	\N	diphterie	\N	\\x8004950b000000000000005d948c0465636f5f94612e	2019-08-31 17:19:19.720024	\N	2019-08-31 17:19:19.720024	7	Le patient est isolé dès la suspicion du diagnostic (éviction scolaire ou du lieu de travail, isolement vis-à-vis des gouttelettes respiratoires). En attendant la confirmation, l'isolement est maintenu jusqu'à ce que deux prélèvements espacés de 24 heures au moins soient négatifs, au moins 24 heures après arrêt de l'antibiothérapie. Tous les objets en contact avec le patient doivent être désinfectés avec un désinfectant classique.\r\n\r\nL'antibiothérapie est débutée immédiatement après la réalisation des prélèvements Leur utilité principale est d'accélérer la disparition du germe chez les malades et d'interrompre la chaîne de transmission.	\N	\N	\N
910	leishmaniose cutanée	La leishmaniose cutanée affecte les téguments. C'est la forme la plus répandue. Elle provoque des lésions ulcératives sur le corps qui apparaissent des semaines ou des mois après l'infestation. Elles guérissent habituellement en quelques mois, laissant des cicatrices particulièrement inesthétiques. La maladie peut passer à la chronicité sous la forme d'une leishmaniose viscérale avec atteinte splénique entraînant une anémie et/ou hépatique. 	\N	0	120	sex_MF	Leishmaniose cutanée, papules rouges, petits boutons saillants rouges, boutons rouges, croutes rouges, cicatrice indélébile, cicatrice bouton, cicatrices boutons, cicatrices papules rouges, boutons visage, bouton visage, boutons insectes, boutons de moustiques, piqures insectes, piqures moustiques\r\n	\N	leishmaniose cutanee	\N	\\x80045d942e	2019-09-16 10:19:29.566706	\N	2019-09-16 10:19:29.566706	7	\N	\N	\N	\N
638	durillon	Un durillon est un net épaississement et durcissement de la couche cornée de la paume de la main ou de la plante du pied.\r\n\r\nLe durillon, comme le cor se développent parfois en profondeur dans le derme avec épaississement d'une bourse séreuse sous le derme. Parfois, l'os sous-jacent présente alors une altération avec un phénomène d'inflammation éventuellement accompagné d'une suppuration de la bourse séreuse située sous le durillon.	https://www.has-sante.fr/jcms/c_272462/fr/le-pied-de-la-personne-agee-approche-medicale-et-prise-en-charge-de-pedicurie-podologie	0	120	sex_MF	epaississement peau, peau epaissie, peau durcie, peau dure, epaississement peau pied, peau pied epaissie, peau pied durcie, peau pied dure, epaississement peau main, peau main epaissie, peau main durcie, peau main dure, couche cornée durcie, couche cornée épaissie, épaississement de la couche cornée, durcissement de la couche cornée, durcissement peau main, durcissement peau pied, peau rugueuse main, peau rugueuse pied	\N	durillon	\N	\\x80045d942e	2019-09-01 07:52:02.225444	\N	2019-09-01 07:52:02.225444	7	Traitement cutrané et examen par le podologue	\N	\N	\N
642	dysgraphie	La dysgraphie est une difficulté à accomplir les gestes particuliers de l'écriture, contrairement à l'agraphie qui est une perte complète de la capacité à écrire. Ces troubles surviennent indépendamment des capacités à lire et ne sont pas liés à un trouble psychologique. La dysgraphie est un handicap de transcription, ce qui signifie que c'est un trouble graphique associé à des gestes graphiques handicapants, au codage orthographique, et au mouvement des doigts lors de l'écriture	\N	0	120	sex_MF	ecrit très mal, problemes d'ecritures, mauvaise écriture, probleme d'orthographe, dysgraphie, trouble de l'écriture, écrit avec des fautes, n'écrit pas, difficulté écriture, écrire est difficile, ecriture difficile, gestes de l'ecriture difficiles	\N	dysgraphie	\N	\\x80045d942e	2019-09-01 08:16:00.368245	\N	2019-09-01 08:16:00.368245	7	Le traitement de la dysgraphie consiste en une rééducation de l'écriture, qui sera à adapter à la fois en fonction du type de dysgraphie présentée par le patient, mais également au patient lui-même.\r\n\r\nLa graphomotricité traite la dysgraphie sous toutes ses formes. Il faut travailler sur la décontraction du geste, la posture, la tenue de l’instrument, la forme des lettres, la motricité fine. Le but n’est pas de changer l’écriture de la personne mais de la réconcilier avec l’écrit en lui faisant trouver ou retrouver le plaisir d’écrire.\r\n	\N	\N	\N
641	dysfonction erectile	L'impuissance sexuelle ou dysfonction érectile consiste, soit dans l'impossibilité durable d'obtenir une érection valable, soit de ne pouvoir la maintenir si elle est obtenue avec une rigidité pénienne suffisante pour l'accomplissement de l'acte sexuel au moment précis de la pénétration. Lorsqu'elle ne consiste que dans une absence de désir sexuel, il est alors question d'aphanisis.	\N	14	120	sex_M	Incapacité à avoir un erection, difficulté à avoir une érection, Érection insuffisamment ferme pour permettre la pénétration, erection insuffisante, probleme d'erection, trouble de l'erection, troubles de l'erection, Incapacité de maintenir une érection après la pénétration, baisse du désir, Disparition inexpliquée du désir sexuel, disparition prolongée du désir sexuel, pas d'erection, erection insuffisante	impuissance sexuelle	dysfonction erectile	\N	\\x8004950b000000000000005d948c04656e725f94612e	2019-09-01 08:11:43.481871	7	2019-09-01 08:12:26.872838	7	La prise en charge des dysfonctions d'origines psychogène peut faire appel à une psychothérapie individuelle ou de couple mais il n'existe pas de réelle évaluation de l'efficacité de ce type de traitement.\r\n\r\nEn revanche la prise en charge des dysfonctions d'origines organiques est possible. \r\n\r\nLes inhibiteurs de la phosphodiestérase 5 sont le sildénafil, le tadalafil ou le vardénafil. Ils ont des résultats tangibles et sont disponibles. L'udénafil, le mirodénafil, l'avanafil et le lodénanafil sont en cours d'expertise. Ces produits ne jouent pas sur la libido. Le sildénafil, chez l'homme sans dysfonction érectile, peut prolonger l'érection avec éjaculation, sans jouer sur la période réfractaire (temps entre deux érections successives).\r\n\r\n	\N	\N	\N
527	cancer de la prostate	Le cancer de la prostate est un cancer fréquent touchant la prostate, une glande de l'appareil reproducteur de l'homme.	https://www.has-sante.fr/jcms/c_1623737/fr/detection-precoce-du-cancer-de-la-prostate,https://www.has-sante.fr/jcms/c_1238318/fr/cancer-de-la-prostate-identification-des-facteurs-de-risque-et-pertinence-d-un-depistage-par-dosage-de-l-antigene-specifique-de-la-prostate-psa-de-populations-d-hommes-a-haut-risque,https://www.has-sante.fr/jcms/c_725257/fr/ald-n-30-cancer-de-la-prostate	20	120	sex_M	Difficultés pour uriner, difficulté à commencer à uriner, difficulté à retenir l'urine, incapacité à uriner, besoin d'uriner fréquemment, besoin d'uriner la nuit, faible débit urinaire, sensation de brûlure, douleur au moment d’uriner, sang dans l’urine, sang dans  le sperme, Douleurs bas du dos, douleur hanches, douleur cuisses,  raideurs au bas du dos, raideur hanches, raideur au haut des cuisses	\N	cancer de la prostate	\N	\\x80049522000000000000005d948c1b62696f70736965206f7374c3a96f2d6dc3a964756c6c616972655f94612e	2019-08-23 17:49:51.243532	7	2019-10-24 08:02:02.423119	7	Chimiothérapie, radiothérapie ou chirurgie	\N	\N	\N
555	cardiomyopathie hypertrophique	Une cardiomyopathie hypertrophique (CMH) est une forme de cardiomyopathie dans laquelle il existe une hypertrophie d'une partie plus ou moins importante du muscle cardiaque, c'est-à-dire, une augmentation globale du poids de ce dernier.	https://www.has-sante.fr/jcms/c_1100272/fr/ald-n5-cardiomyopathie-hypertrophique	0	120	sex_MF	fatigue, fatigue générale, essouflé, pâle, étourdissement, vertige, alaise, évanouissement, cardiomyopathie, essoufflement à l’effort, pâleur, étourdissements, vertiges,  évanouissements,dyspnée d'effort, asthénie, palpitations, douleurs thoraciques insensibles à la trinitrine, cardiopathie ischémique, malaises, syncopes, insuffisance cardiaque, insuffisance cardiaque droite, insuffisance cardiaque gauche, dilatation du ventricule gauche, lipothymies\r\n	cmh	cardiomyopathie hypertrophique	\N	\\x80049529000000000000005d94288c0b4563686f20636f6575725f948c044543475f948c06696d6167655f948c015f946804652e	2019-08-24 16:30:37.762485	\N	2019-08-24 16:30:37.762485	7	La traitement a pour but de diminuer le gradient de pression entre le ventricule gauche et l'aorte, et les symptômes tels que la dyspnée, les douleurs thoraciques et syncopes.\r\n\r\nLe traitement médicamenteux est efficace chez la majorité des patients. Sont utilisés les bêta-bloquants, le vérapamil (un inhibiteur calcique), les diurétiques, des antiarythmiques, voire un traitement anticoagulant en cas d'arythmie cardiaque auriculaire.	\N	\N	\N
807	impétigo croûteux	L'impetigo croûteux est un  impetigo dont les vésicules, une fois rompues, forment des croûtes jaunes. \r\nL'impétigo est une infection cutanée superficielle bactérienne, due à un streptocoque et/ou à un staphylocoque. C'est une pathologie autoinoculable et non immunisante. Contrairement aux croyances populaires, l'impétigo ne surgit pas par suite d'un manque d'hygiène mais sa guérison impose, outre une antibiothérapie (pour les formes dites « simples ») et des antiseptiques, une bonne hygiène.	\N	0	120	sex_MF	Impetigo crouteux, appartition vesicules, vesicules, pourtour inflammatoire, vésiculres rompues, croutes vésitules, impétigo, vésicules qui se rompent, vésicules qui forment des croutes, cloques, infection cutanée, infection cutanée bactérienne, staphylocoque doré, vésicules rouges, vésicules sensibles, vésicules inflammatoires, vésicules douloureuses, vésicules gonflées	\N	impetigo crouteux	\N	\\x80045d942e	2019-09-10 07:15:40.840354	\N	2019-09-10 07:15:40.840354	7	antibiothérapie\r\nantiseptiques\r\nbonne hygiène	\N	\N	\N
644	dyslexie visuelle	La dyslexie visuelle résulterait d'un déficit du système visuel au niveau attentionnel, mais il n'y a pas de consensus. Des difficultés de lecture des mots abstraits et des erreurs de type visuelles (omission, substitution etc) sont observées.	https://www.has-sante.fr/jcms/c_2824177/fr/troubles-dys-comment-mieux-organiser-le-parcours-de-sante	0	120	sex_MF	dyslexie visuelle, dyslexie, déficit du système visuel au niveau attentionnel, difficultés de lecture des mots abstraits, erreurs de type visuelles, omission de mot, omission de lettre, substitution de mot, substitution de lettres, langage tardif, difficulté à apprendre de nouveaux mots, difficulté à construire des phrases, difficulté à reconnaître les lettres, incapacité à faire des rimes, tendance à rencontrer des difficultés pour écrire son prénom, difficulté pour écrire son prénom, mémoire immédiate insuffisante,difficulté à se repérer dans l'espace, difficulté à apprendre à lire, lenteur vis-à-vis de l'écrit, lenteur d'écriture, manque d'attention, soucis de compréhension, difficulté à différencier certains mots proches, difficulté à répondre à plusieurs demandes en même temps, problème pour différencier certaines lettres, difficulté à découper un mot inconnu en plusieurs syllabes, difficuté à épeler, difficulté à prononcer de longs mots,  difficulté pour apprendre une langue étrangère	dyslexie développementale	dyslexie visuelle	\N	\\x80045d942e	2019-09-01 09:13:39.373752	\N	2019-09-01 09:13:39.373752	7	Orthophonie	\N	\N	\N
736	halitose	L'halitose, ou mauvaise haleine, est le fait d'avoir une haleine dont l'odeur est considérée comme incommodante.	\N	0	120	sex_MF	air expiré par la bouche odorant, air expiré par le nez odorant, salive odorante, mauvaise haleine, halitose, plaque dentaire, plaques espaces interdentaires, mauvaise odeur, odeur incommodante, haleine incommodante, haleine génante	mauvaise haleine	halitose	\N	\\x80045d942e	2019-09-03 17:54:11.070191	\N	2019-09-03 17:54:11.070191	7	L'hygiène bucco-dentaire (se brosser les dents avec du dentifrice) reste essentielle, pouvant dans certains cas être complétée par un « grattage » de langue à l'aide d'une brosse à langue ou de la brosse à dents.\r\n\r\nL'emploi de bonbons ou de chewing-gums parfumés permet d'effacer temporairement la mauvaise odeur.\r\n\r\nCertains bains de bouche, à base d'antiseptiques, peuvent avoir une relative efficacité.\r\n\r\nLe laser a aussi son efficacité lors d'halitoses liées à une maladie parodontale.\r\n\r\nLe bicarbonate de sodium (aussi appelé bicarbonate de soude) peut aider à améliorer l'hygiène buccale et à réduire considérablement l'halitose : en ajoutant périodiquement un peu de bicarbonate en poudre sur la brosse à dents en plus du dentifrice (deux fois par semaine), et en complétant par des gargarismes avec de l'eau additionnée de bicarbonate (5 g, soit environ 1 cuillère à café pour un verre d'eau).	\N	\N	\N
738	hallux rigidus	L'hallux rigidus est le nom donné à l'arthrose primitive de la première articulation métatarso-phalangienne, ainsi qu'entre la tête du 1er métatarsien et ses sésamoïdes.	https://www.has-sante.fr/jcms/c_272462/fr/le-pied-de-la-personne-agee-approche-medicale-et-prise-en-charge-de-pedicurie-podologie	0	120	sex_MF	Déformation articulaire, hallux rigidus, déformation de l’articulation métatarso-phalangienne du gros orteil, excroissances osseusses, bosse sur le gros orteil, bosse articulation métatarso-phalangienne, Enraidissement articulaire, perte de mobilité importante, perte de mobilité orteil totale, de l’articulation. \r\n\r\nDouleurs au gros orteil\r\n\r\nLa déformation de l’articulation entraîne également l’apparition de douleurs au niveau du gros orteil. Celles-ci peuvent devenir de plus en plus intenses et provoquer une gêne importante.\r\n	\N	hallux rigidus	\N	\\x8004950d000000000000005d948c06696d6167655f94612e	2019-09-05 16:00:44.608558	\N	2019-09-05 16:00:44.608558	7	Au début de l'atteinte, les traitements médicamenteux peuvent suffire : anti-inflammatoires, antalgiques. Des infiltrations de dérivés cortisonés peuvent être proposés avec des résultats parfois satisfaisants. L'adaptation du chaussage peut aussi être tentée afin de diminuer les conflits avec la peau.\r\n\r\nSinon, le traitement est chirurgical.	\N	\N	\N
648	dyslexie de surface	La dyslexie de surface résulte d'un dysfonctionnement de la voie lexicale. Les mots irréguliers sont lus comme des mots réguliers et sont difficiles à orthographier. Il peut y avoir des erreurs visuelles comme confondre des lettres proches graphiquement « d » et « b ».	https://www.has-sante.fr/jcms/c_2824177/fr/troubles-dys-comment-mieux-organiser-le-parcours-de-sante	0	120	sex_MF	dyslexie, dyslexie de surface, confusion lettres, confusion mots, dysfonctionnement voie lexicale, langage tardif, difficulté à apprendre de nouveaux mots, difficulté à construire des phrases, difficulté à reconnaître les lettres, incapacité à faire des rimes, tendance à rencontrer des difficultés pour écrire son prénom, difficulté pour écrire son prénom, mémoire immédiate insuffisante,difficulté à se repérer dans l'espace, difficulté à apprendre à lire, lenteur vis-à-vis de l'écrit, lenteur d'écriture, manque d'attention, soucis de compréhension, difficulté à différencier certains mots proches, difficulté à répondre à plusieurs demandes en même temps, problème pour différencier certaines lettres, difficulté à découper un mot inconnu en plusieurs syllabes, difficuté à épeler, difficulté à prononcer de longs mots,  difficulté pour apprendre une langue étrangère	\N	dyslexie de surface	\N	\\x80045d942e	2019-09-01 09:16:46.363088	\N	2019-09-01 09:16:46.363088	7	Orthophonie	\N	\N	\N
647	dyslexie phonologique	La dyslexie phonologique se caractérise par une incapacité à utiliser la voie phonologique. Les mots sont difficilement analysés. Ce qui explique les difficultés à lire et orthographier les pseudo mots ainsi qu'à différencier et mémoriser les sons correspondant aux syllabes.	https://www.has-sante.fr/jcms/c_2824177/fr/troubles-dys-comment-mieux-organiser-le-parcours-de-sante	0	120	sex_MF	dyslexie phonologique, dyslexie, incapacité phonologie, mot non analysés, analyse des mots difficile, difficultés à orthographier, langage tardif, difficulté à apprendre de nouveaux mots, difficulté à construire des phrases, difficulté à reconnaître les lettres, incapacité à faire des rimes, tendance à rencontrer des difficultés pour écrire son prénom, difficulté pour écrire son prénom, mémoire immédiate insuffisante,difficulté à se repérer dans l'espace, difficulté à apprendre à lire, lenteur vis-à-vis de l'écrit, lenteur d'écriture, manque d'attention, soucis de compréhension, difficulté à différencier certains mots proches, difficulté à répondre à plusieurs demandes en même temps, problème pour différencier certaines lettres, difficulté à découper un mot inconnu en plusieurs syllabes, difficuté à épeler, difficulté à prononcer de longs mots,  difficulté pour apprendre une langue étrangère	\N	dyslexie phonologique	\N	\\x80045d942e	2019-09-01 09:15:54.614797	\N	2019-09-01 09:15:54.614797	7	Orthophonie	\N	\N	\N
1383	bloc de branche	Un bloc de branche est un trouble de la conduction cardiaque dont le blocage est situé sur une des branches du faisceau de His au niveau des ventricules cardiaques.	\N	0	120	sex_MF	QRS long, QRS supérieur 100 ms, QRS supérieur 120 ms, syncope, lipothymie, hyperkaliémie, flécaine, antidépresseurs tricycliques	\N	bloc de branche	\N	\\x80045d942e	2019-12-05 14:52:31.710482	\N	2019-12-05 14:52:31.710482	7	Traitement étiologique (hyperkaliémie ou médicament de surcharge)\r\nSi sévère, mise en place d'un stimulateur briventriculaire	SIGNES CLINIQUES\r\nToujours asymptomatique qui isolé\r\nSi acompagné de lipothymies/syncopes, signe de gravité (présence s'une cardiopathie ou  d'un BAV paroxystique)	I447 I451	\N
651	dysphasie de production phonologique	La fluence de la parole est conservée mais l’intelligibilité est très mauvaise. L’enfant procède par stratégies d’approches pour produire et associer les bons phonèmes des mots. Son langage automatique est souvent bien meilleur que celui obtenu en situation dirigée (dissociation automatico-volontaire). Il présente un manque du mot et est dyssyntaxique. Alors que dans le syndrome phonologique syntaxique, on a un enfant qui n’emploie pas les morphèmes grammaticaux, ici, l’enfant ne sait pas les agencer dans sa phrase. Il présente également de grosses difficultés dans la chronologie du récit.	https://www.has-sante.fr/jcms/c_271995/fr/l-orthophonie-dans-les-troubles-specifiques-du-developpement-du-langage-oral-chez-l-enfant-de-3-a-6-ans	0	120	sex_MF	Difficulté à trouver ses mots , ne trouve pas ses mots, phrases courtes, style télégraphique, peu de parole, parle peu, ne pose pas de questions, a du mal à exprimer ce qu’il ressent,  a du mal à exprimer ce qu’il veut, a du mal a exprimer ce qu’il pense, incompréhensible, difficultés syntaxiques, mauvaises tournure des phrases, manque de sens, manque de cohérence, ne comprends pas des ordres simples, bonne fluence de parole, bon débit de parole, parole bon débit, haut débit de parole, débit de parole normal, mauvaise intelligibilité, intelligibilité mauvaise, langage automatique, pas de bonne phrase, difficultés chronologiques, probleme de chronologie\r\n	\N	dysphasie de production phonologique	\N	\\x80045d942e	2019-09-01 10:48:16.103236	\N	2019-09-01 10:48:16.103236	7	rééducation orthophonique	\N	\N	\N
872	ochlophobie	L’ochlophobie est une sorte de peur. Elle se manifeste dans les endroits où il y a beaucoup de personnes. Lorsqu'il est question d'ochlophobe, il est question d'une « peur de la foule », à ne pas confondre avec l'agoraphobie ou la claustrophobie. L’ochlophobie est proche de la démophobie, cette dernière englobant la première : on peut vouloir éviter de se mêler aux attroupements sans pour autant ressentir une oppression lorsqu'on y est contraint.	\N	0	120	sex_MF	Ochlophobie, angoisse, accélération du rythme cardiaque, tachycardie, attaque de panique, crise de panique, crise angoisse, peur de mourir, peur mort, anxieux, peur mourir, sentiment danger, sentiment perte du corps, nausées, nausée, envie vomir, vomissement, vomissements, malaise, malaises, peur foule, pression regards autres, pression regard autre, agoraphobie	\N	ochlophobie	\N	\\x80045d942e	2019-09-14 16:40:06.24151	\N	2019-09-14 16:40:06.24151	7	La méthode utilisée le plus souvent pour remédier à une « crise » est d'isoler la personne, sans nécessairement la laisser seule, dans un endroit calme et spacieux, et, au besoin, de la soutenir moralement. Dans le but de la faire se concentrer sur autre chose que la source de son malaise, on peut également lui proposer de la nourriture.	\N	\N	\N
652	syndrome phonologique syntaxique	L'enfant a un langage déficitaire avec de grosses difficultés d'expression et des difficultés de compréhension moindres. Le trouble premier est phonologique : l’enfant est difficilement intelligible et c’est cette phonologie déficiente qui masque les difficultés syntaxiques sous-jacentes. Il souffre donc également d’agrammatisme : son langage est télégraphique, peu ou pas d’utilisation des pronoms (je, tu, il…), les conjonctions de coordination ne sont pas utilisées. Le temps verbal est inapproprié, mais l’enfant conserve une conscience syntaxique : il est capable de distinguer une phrase correcte grammaticalement d’une autre incorrecte. Il n’a pas ou peu de manque de mots, mais son stock lexical est réduit, sans qu’il n’ait de réel problème pour accéder à celui-ci. Il présente également une hypospontanéïté verbale. Une dysgraphie est possible, avec une motricité manuelle généralement déficiente.	https://www.has-sante.fr/jcms/c_271995/fr/l-orthophonie-dans-les-troubles-specifiques-du-developpement-du-langage-oral-chez-l-enfant-de-3-a-6-ans	0	120	sex_MF	Difficulté à trouver ses mots , ne trouve pas ses mots, phrases courtes, style télégraphique, peu de parole, parle peu, ne pose pas de questions, a du mal à exprimer ce qu’il ressent,  a du mal à exprimer ce qu’il veut, a du mal a exprimer ce qu’il pense, incompréhensible, difficultés syntaxiques, mauvaises tournure des phrases, manque de sens, manque de cohérence, ne comprends pas des ordres simples, langage déficitaire, peu de difficultés d'expression, peu de difficultés de compréhension, difficilement intelligible, phonologie deficiente, difficultés syntaxiques, agrammatisme, langage telegraphique, mauvais temps verbal, mauvaise conjugaison, pas de conjonctions, style telegraphique\r\n	\N	syndrome phonologique syntaxique	\N	\\x80045d942e	2019-09-01 10:49:46.451119	\N	2019-09-01 10:49:46.451119	7	orthophonie	\N	\N	\N
549	cancer pancréas	L'adénocarcinome pancréatique est un cancer de la glande pancréatique.	https://www.has-sante.fr/jcms/c_1005133/fr/ald-n-30-cancer-du-pancreas	0	120	sex_MF	fatigue, Douleurs abdominales, douleurs dos, Jaunisse, ictère, teint jaune, yeux jaunes, selles décolorées, selles claires, urines brunes, urines foncées en cas de compression des voies biliaires, tumeur pancréas, tumeur, cancer pancréas, ballonnement, Sensation de ballonnement, impression d’avoir l’estomac plein même après avoir peu mangé, Nausées, vomissements, perte de poids, Perte de poids inexpliquée, Perte d’appétit	adénocarcinome pancréatique	cancer pancres	\N	\\x80049525000000000000005d94288c0763615f68696768948c055363616e5f948c044563685f948c0449524d5f94652e	2019-08-24 15:35:42.426715	7	2019-09-01 11:19:59.135065	7	Chirurgie, chimiothérapie ou radiothérapie	\N	\N	\N
660	dermite de contact	Le terme dermite de contact désigne une réaction cutanée résultant de l'exposition à des substances allergènes (dermite de contact allergique) ou irritantes (dermite d’irritation). La dermite par photosensibilisation se produit lorsque l'allergène ou la substance irritante sont activés par la lumière du soleil.	\N	0	120	sex_MF	allergie, eczema allergique, irritation peau, dermite, reaction cutanée, réaction au toucher, sensibilité au toucher, sensibilité contact, inflammation peau, peau inflammée, exema, eczema, demangeaison, prurit, rougeur peau, rougeur congestive peau, erytheme, eruptions, eruptions cutanées, eruption cutanée, boutons, plaques rouges, peau rouge, plaque rouge, 	eczéma de contact	dermite de contact	\N	\\x80045d942e	2019-09-01 11:23:35.195979	\N	2019-09-01 11:23:35.195979	7	Si l'éruption ne s'améliore pas ou continue à s’étendre après 2 à 3 jours d’auto-médication, ou si les démangeaisons et / ou de la douleur sont sévères, le patient doit consulter un dermatologue ou un autre médecin. Le traitement médical est généralement constitué de lotions, de crèmes ou de médicaments par voie orale.\r\n\r\nLes corticostéroïdes. Un corticoïde médicament similaire à l’hydrocortisone peut être prescrit pour lutter contre l'inflammation dans une zone déterminée. Ce médicament peut être appliqué sur la peau sous forme de crème ou d'onguent. Si la réaction porte sur une zone cutanée relativement importante ou bien se présente sous une forme sévère, un corticostéroïde en comprimé ou sous forme injectable peut être prescrit.\r\nLes antihistaminiques. La prescription d’antihistaminiques peut être ajoutée si les médicaments délivrés sans ordonnance, moins forts, sont insuffisants.\r\n	\N	\N	\N
1367	syndrome de rhinorrhée postérieure 	Ecoulement de sécrétions nasales par la bouche.	\N	0	120	sex_MF	toux chronique, antécédents de sinusite, sensation de rhinorrhée postérieure, raclement de gorge, écoulement nasal, obstruction nasale, troubles de l’odorat, anosmie, tousse, tousse beaucoup, tousse souvent, sinusite, ATCD sinusite, se racle la gorge, trouble de l'odorat, nez bouchez, nez qui coule	\N	syndrome de rhinorrhee posterieure	\N	\\x80045d942e	2019-10-31 21:27:04.157276	\N	2019-10-31 21:27:04.157276	7	\N	\N	\N	\N
675	epidermolyse bulleuse simple	L'épidermolyse bulleuse simple est une classe des épidermolyses bulleuses héréditaires. Elle correspond à un groupe de maladies caractérisées par l’apparition de bulles après une sollicitation mécanique.\r\n\r\nOn regroupe sous le terme d’épidermolyse bulleuse l’ensemble des affections génétiques. Elles se caractérisent par la présence de lésions cutanées ou de bulbes à la jonction derme-épiderme. Elle est observable à partir de la naissance ou au cours de l’enfance. La plupart des bulles se forment sur la lame basale de l’épiderme.	\N	0	120	sex_MF	érosions cutanées localisées, atteinte des ongles, onychomadèse, chute des ongles, perte ongles, dystrophie, déformations des ongles, formation de grains sur la peau, manque de peau, absence de peau, kératodermie plantaire, épaississement de la peau au niveau de la paume des mains, formation de bulles dans la bouche	simplex, ebs	epidermolyse bulleuse simple	\N	\\x80045d942e	2019-09-01 14:45:22.44474	\N	2019-09-01 14:45:22.44474	7	L'activité des enfants doit diminuer les risques de traumatisme et les nouvelles bulles devront être percées.\r\n\r\nLe traitement a pour objectif d’éviter la formation de bulle en protégeant la peau, en évitant les traumatismes et en soignant les blessures. L'habillement se fera en trois couches : Une non adhérente au contact de la peau, une deuxième protection rembourrée  pour la stabilité et la troisième élastique. L'utilisation du chlorure d'aluminium et du cyproheptadine peut réduire la formation de bulles chez certains individus.\r\n\r\nL'utilisation de kératolytique et d'adoucissant de la peau permet de lutter contre l'hyperkératose.\r\n\r\nPlusieurs situations sont à éviter. En effet, la chaleur peut exacerber les cloques et l’infection. Il est nécessaire de ne pas pratiquer d’activités qui traumatisent la peau. En ce qui concerne les pansements, il faut éviter le sparadrap classique	\N	\N	\N
671	endophtalmie	L'endophtalmie est une Inflammation des tissus internes de l'œil.\r\n\r\nElle est une infection de l'ensemble des tuniques oculaires d'origine exogène (par inoculation directe du germe (traumatisme oculaire, chirurgie oculaire voire ulcération cornéenne) ou endogène (à la suite d'un Sepsis, une Bactériémie, ou une endocardite).	\N	0	120	sex_MF	Une douleur croissante en intensité\r\nUne chute de l'acuité visuelle\r\nPhotophobie : une sensibilité extrême à la lumière\r\nAutres symptômes\r\n\r\nPerte du reflet rétinien (reflet rouge)\r\nHypopion : présence de pus dans la chambre antérieure de l’œil (espace entre l'iris et la surface la plus interne de la cornée)\r\nTrouble de l'humeur aqueuse (le liquide contenu dans la chambre antérieure de l’œil)\r\nAugmentation de la pression intraoculaire\r\nRougeur oculaire autour de la cornée\r\nDépôts cellulaires au niveau de la lentille intraoculaire déposée lors d'une intervention chirurgicale\r\nHémorragie rétiniennes,  hyperhémie conjonctivale, accumulation de sang les vaisseaux de la conjonctive, muqueuse qui recouvre l'intérieur des paupières, inflammation intraoculaire dans la chambre antérieure et le vitré, Œdème de la paupière, oedeme de la cornée, Présence de fibrine dans la chambre antérieure de l’œil, Exophtalmie, protrusion du globe oculaire hors de l'orbite, Pétéchies, petites tâches rouges violacées, pétéchies de l'iris, Ptosis, chute de la paupière supérieure, Epiphora, écoulement des larmes sur les joues, Fièvre, nausées, fatigue, taches sur l'iris	\N	endophtalmie	\N	\\x80045d942e	2019-09-01 14:21:42.953625	\N	2019-09-01 14:21:42.953625	7	Injection et antibiotiques	\N	\N	\N
681	escarre	Une escarre est une lésion cutanée d'origine ischémique liée à une compression des tissus mous entre un plan dur et les saillies osseuses.\r\n	https://www.has-sante.fr/jcms/c_271996/fr/prevention-et-traitement-des-escarres-de-l-adulte-et-du-sujet-age	10	120	sex_MF	rougeur, rougeur persistante, patient alité, au lit, escarre, ulcère au décubitus, plaie de lit, oedeme, decoloration, cloque, cloques, necrose, phlyctène, induration de la peau, escarres, trou, compression, lésion, lésion cutanée, induration de la peau	ulcère de décubitus, plaie de lit	escarre	\N	\\x80045d942e	2019-09-01 15:31:53.464544	\N	2019-09-01 15:31:53.464544	7	Chaque escarre est différent (type, stade, localisation, douleur,...), le traitement est difficile et nécessite un personnel formé à la prise en charge des escarres. Il consiste en une mise en décharge totale de la zone touchée, accompagnée de soins locaux attentifs. La prévention doit être accentué pour éviter la formation de nouveaux escarres. La plaie est maintenue en milieu chaud, humide et nettoyé fréquemment, pour favoriser l'activité de cicatrisation naturelle de l’escarre.\r\n\r\nDifférents types de pansements existent en fonction de l'escarre et du patient (hydrocolloïdes, interfaces, hydrogels, hydrocellulaires, hydrofibres / alginates, charbon, films, pansements gras,...)	\N	\N	\N
440	anémie aplasique	L'anémie aplasique désigne une atteinte de la moelle osseuse, où la fabrication des cellules du sang est très diminuée, en raison d'une destruction des cellules précurseurs dans la moelle osseuse. Il en résulte un manque de toutes ces cellules du sang.	https://www.has-sante.fr/jcms/c_778579/fr/ald-n-2-aplasies-medullaires	0	120	sex_MF	teint pâle, fatigue, faiblesse, étourdissements, accélération du rythme cardiaque, niveau bas de globules rouges, niveau bas de plaquettes, niveau bas de globules blancs, infections, rate palpable, gingivites, angines, infections respiratoires, septicémie, hémorragie,  peau facilement contusionnée, saignements anormaux des gencives, saignement du nez, saignement du vagin, saignement du système gastro-intestinal, bleus, contusions, 	anémie aplastique	anemie aplasique	\N	\\x8004950e000000000000005d948c074e46535f6c6f7794612e	2019-08-21 09:27:10.544628	\N	2019-08-21 09:27:10.544628	7	Transfusion de sang\r\nTraitement des complications infectieuses\r\nTraitement des complications hemorragiques.	\N	\N	\N
687	epilepsie	Une crise épileptique est caractérisée par une altération fonctionnelle transitoire au sein d'une population de neurones (soit limitée à une région du cerveau : crise dite « partielle », soit impliquant les deux hémisphères cérébraux de manière simultanée : crise dite « généralisée ») due à une décharge épileptique.	https://www.has-sante.fr/jcms/c_586170/fr/ald-n9-epilepsies-graves	0	120	sex_MF	périodes de perte de conscience, périodes de conscience altérée, perte de conscience, conscience altérée, yeux ouverts, regard fixe, pas de réaction, ne réagit plus, Chute brutale de la personne sans raison apparente, chute, chute brutale, chute soudaine, convulsions, contractions musculaires prolongées, contractions involontaires des bras et des jambes, convulse, perceptions transformées, sens altérés, goût altéré, odorataltéré, respiration bruyante, effrayé, a peur, est effrayé, est apeuré, panique, colère, hallucination olfactive, effet visuel, irritabilité, agitation	crise d'epilepsie	epilepsie	\N	\\x8004950b000000000000005d948c04656e635f94612e	2019-09-01 16:55:57.707011	\N	2019-09-01 16:55:57.707011	7	L'emploi d'un anti-convulsivant est recommandé dès la dixième minute de convulsions, par voie intraveineuse si possible, par voie anorectale sinon. L'état de mal convulsif, c'est-à-dire lorsque la crise se prolonge au-delà de 10 min (ou lorsque trois crises se succèdent), nécessite un transfert en réanimation médicale (urgence médicale car le pronostic vital est en jeu). Un EEG en urgence ainsi qu'un bilan médical devront être effectués, sans retarder la mise en œuvre des méthodes de réanimation et le traitement médicamenteux :\r\n\r\nMaintien d'une bonne fonction respiratoire : mise en place d'une canule de Guedel, ventilation au masque, aspiration des sécrétions bronchiques, intubation et ventilation mécanique au maximum.\r\nSurveillance cardio-vasculaire : scopage cardio-tensionnel avec surveillance du rythme cardiaque, de la pression artérielle, de la saturation sanguine en oxygène.\r\nPose d'une voie veineuse pour équilibration hydro-électrolytique et perfusion des médicaments anti-convulsivants.\r\n	\N	\N	\N
686	extrasystole jonctionnelle	Elles se manifestent sur l'ECG par un complexe QRS prématuré, non précédé d'une onde P (contrairement aux extrasystoles auriculaires). Elles sont de causes proches des extrasystoles auriculaires leur traitement en est semblable.	\N	0	120	sex_MF	extrasystole, repos compensateur, palpitations, sensations de pouls irrégulier, pouls irregulier, sensation de choc dans la poitrine, sensation de pause trop longue avant le battement cardiaque suivant, malaises, douleur thoracique, douleurs thoraciques, malaise, QRS prematuré, QRS trop tot, extrasystole jonctionnelle	\N	extrasystole jonctionnelle	\N	\\x8004950b000000000000005d948c044543475f94612e	2019-09-01 16:23:19.836328	\N	2019-09-01 16:23:19.836328	7	C'est avant tout celui de la cause lorsqu'elle est identifiée. Pour le traitement du trouble du rythme lui-même, il dépend du terrain, de la gêne occasionnée et de l'existence ou non d'une cardiopathie sous-jacente :\r\n\r\nune extrasystolie isolée sur cœur sain et asymptomatique doit faire l'objet d'une simple surveillance, sans traitement ;\r\ndes extrasystoles isolées et symptomatique survenant sur un cœur sain :\r\nrègles hygiéno-diététiques (diminution ou suppression des excitants par exemple), parfois associées à un sédatif de type anxiolytique,\r\nsi cela ne suffit pas, on discute un traitement anti-arythmique : bêta-bloquants, quinidiniques plus rarement ou médicaments de la classe Ic (flécaïnide, cibenzoline ou propafénone), et en dernier ressort, l'amiodarone ;\r\nen cas de maladies cardiovasculaires, on utilise des antiarythmiques (classes Ia ou Ic), plus ou moins associé à un traitement anticoagulant par antivitamines K ou antiagrégant plaquettaire ;\r\nen cas de cardiopathie évoluée avec altération de la fonction contractile du ventricule gauche, l'amiodarone est préconisée.	\N	\N	\N
691	syndrome douloureux régional complexe	Le syndrome douloureux régional complexe (SDRC) est un état pathologique caractérisé par un syndrome associant des douleurs et d'autres symptômes touchant typiquement une extrémité après un traumatisme ou une intervention chirurgicale même minime. Ce syndrome pourrait être dû à des causes neurologiques, notamment une dysfonction des fibres de petit calibre des nerfs périphériques - qui protègent des stimulations douloureuses et thermiques et/ou de grand calibre qui détectent les stimulations tactiles.\r\n	\N	0	120	sex_MF	douleur intense, douleur lancinante, douleur piqûres d’aiguilles, sensation de brûlure dans le bras, sensation de brulure dans la main, sensation de brulure dans la jambe, sensation de brulure dans le pied, gonflement, sensibilité de la peau au toucher, sensibilité de la peau à la chaleur, sensibilité de la peau au froid, changements dans la texture de la peau, peau mince, peau brillante, peau sèche, peau flétrie, changements dans la température de la peau, changements de couleurs de la peau, ongles épais, ongles cassants, augmentation de la sudation, augmentation suivie d’une diminution de la pilosité, raideur, gonflement, détérioration des articulations, spasmes musculaires, faiblesse, atrophie, contractures musculaires, perte de mobilité 	sdrc, algodystrophie, algoneurodystrophie, maladie de sudeck, syndrome de sudeck-leriche, dystrophie sympathique reflexe	syndrome douloureux regional complexe	\N	\\x80049515000000000000005d948c0e5363696e7469677261706869655f94612e	2019-09-01 18:09:10.755019	\N	2019-09-01 18:09:10.755019	7	Il n'existe pas de traitement curatif de cette affection ; seule la calcitonine, une hormone, semblait avoir démontré une certaine efficacité. \r\nLe syndrome douloureux régional complexe est souvent mal diagnostiqué, une scintigraphie osseuse donne la possibilité de diagnostiquer la maladie. Prise très tôt (souvent rare) la silice donne de bons résultats, éviter les blocs et autres thérapies douloureuses et souvent inutiles.\r\n\r\nLe traitement symptomatique quant à lui peut comprendre :\r\n\r\nles médicaments anti-douleurs (paracétamol, isolément sans grande efficacité, voire jusqu'à la morphine) ;\r\nla calcitonine au stade précoce ;\r\nles corticoïdes au stade précoce;\r\nles bisphosphonates ;\r\nles médicaments antiépileptiques (Lyrica ou Neurontin par exemple) ;\r\nla kinésithérapie douce, de 40 à 80 séances, les bains écossais et les techniques de traitement par imagerie mentale et miroir;\r\nla chiropratique dans quelques cas;\r\nl'ostéopathie;\r\nl'ergothérapie;\r\nla stimulation médullaire;\r\nl'électrothérapie par ionisation;\r\nla rééducation sensitive de la douleur.	\N	\N	\N
888	fibrodysplasie ossifiante progressive	La fibrodysplasie ossifiante progressive se caractérise par une ossification progressive des muscles squelettiques et des tendons les rattachant aux os, le plus souvent précédée de poussées inflammatoires.	\N	0	120	sex_MF	fibrodysplasie ossifiante progressive, Maladie de l'homme de pierre, myosite ossifiante progressive, maladie de Münchmeyer, ossification, ossifications, ossification progressive des muscles, ossification des muscles, poussées inflammatoires, poussée inflammatoire, ossification tendon, ossifications muscles, ossifications tendons, inflammation, inflammé, douleur inflammatoire	maladie de l'homme de pierre, myosite ossifiante progressive, maladie de münchmeyer	fibrodysplasie ossifiante progressive	\N	\\x8004950d000000000000005d948c06696d6167655f94612e	2019-09-16 08:56:41.407448	\N	2019-09-16 08:56:41.407448	7	Il n’existe pas de traitement curatif ; la prise en charge reste symptomatique. Les traitements pharmacologiques servent, dans un premier temps, à réduire les douleurs, avec notamment l’administration d’analgésiques, de myorelaxants, et la cryothérapie. De plus, ils servent aussi à réduire l’inflammation avec de fortes doses de corticoïdes, prescrites lors de chaque poussée de la maladie, dès les premières 24 heures (prédnisone 2 mg·kg-1) pendant quatre jours puis diminution progressive sur 10 jours.\r\n	\N	\N	\N
741	hemangiome infantile	Un hémangiome est une tumeur bénigne des cellules qui tapissent les vaisseaux sanguins. C'est une des formes d'angiomes. Lorsqu’il y a hémangiome, ces cellules, appelées cellules endothéliales des vaisseaux se multiplient à un rythme anormalement rapide en formant une masse, associée à une coloration rouge due à la présence importante de sang dans le tissu.	\N	0	120	sex_MF	hémangiome, hémangiome infantile, tumeur bénigne, tumeur non cancéreuse, cancer des cellules qui tapissent les vaisseaux sanguins, tumeur des cellules endothéliales, cancer cellules endotheliales, fraise, angiomes, hémangiome, cellules endothéliales cancereuses, masse cutanée tubéreuse, masse sous-cutané, masse mixte, masse decoloration rouge	hémangiome	hemangiome infantile	\N	\\x80045d942e	2019-09-05 16:33:31.7086	\N	2019-09-05 16:33:31.7086	7	La plupart des hémangiomes ne posent qu'un problème esthétiques et sont résolutifs, ne nécessitant aucune prise en charge médicale. \r\n\r\nLe propranolol, un bêtabloquant, donné en phase de croissance de l'hémangiome permet d'en ralentir l'expansion et de favoriser sa régression.\r\n\r\nL'efficacité du laser reste discutée et semble peut-être meilleure pour les lésions superficielles.	\N	\N	\N
885	dyspnée de kussmaul	La dyspnée de Kussmaul présente quatre temps : inspiration, pause, expiration, pause. Elle est observée classiquement au cours de l'acidose métabolique diabétique	\N	0	120	sex_MF	Problemes de respiration, trouble de la respiration, troubles de la respiration, probleme de respiration, respiration difficile, difficulté à respirer, difficultés à respirer, difficulté à inspirer, difficulté à expirer, inspiration difficile, expiration difficile, probleme pour respirer, respiration douloureuse, dyspnée, dyspnée de Kussmaul, acidose, acidose métabolique, diabétique, 	\N	dyspnee de kussmaul	\N	\\x80045d942e	2019-09-15 07:39:58.11907	\N	2019-09-15 07:39:58.11907	7	L'utilisation d'un oxymètre permet de quantifier l'hypoxie.\r\n Le patient est mis par principe sous inhalation d'oxygène, le débit étant adapté pour avoir entre 93 et 97 % de saturation capillaire ; si l'équipe ne dispose pas d'oxymètre, on utilise des débits normalisés (3 L/min pour un nourrisson, 6 L/min pour un enfant et 9 L/min pour un adulte).	\N	\N	\N
771	hyperéosinophilie	L'éosinophilie (ou hyperéosinophilie) sanguine se définit comme l'augmentation permanente de la valeur de la numération des polynucléaires éosinophiles au-delà d'un seuil généralement admis de 500 cellules par millimètre cube de sang.\r\n	\N	0	120	sex_MF	Hypereosinophilie, prurits, demangeaisons, eruptions cutanées, oedemes sous cutanés, urticaire, érosions muqueuses, respiration sifflante, essoufflements, asthme, toux, rhinite, sinusite, infiltrats, opacités pulmonaires, épanchement pleural, douleurs abdominales, vomissement, vomissements, diarrhée, diarrhées, atteinte de l’appareil digestif, insuffisance cardiaque, valvulopathie, dysfonctionnement des valves cardiaques, cardiomyopathies, dysfonctionnement du muscle cardiaque, epanchement pericardique, myocardite, essoufflement, fatigue, douleur d’estomac, perte de poids, fievre, paresthesie, avc, troubles visuels, arthralgies, myalgies, arthrite, sueurs nocturnes, thrombose veineuse profonde, confusion, coma	\N	hypereosinophilie	\N	\\x8004950f000000000000005d948c08706f6c5f6869676894612e	2019-09-08 06:44:24.52452	\N	2019-09-08 06:44:24.52452	7	Traitement de la cause\r\nCorticothérapie dans les formes sévères et non infectieuses	\N	\N	\N
721	gingivite simple	La gingivite est une inflammation de la gencive, associée ou non à des phénomènes dégénératifs, nécrotiques ou prolifératifs et causée par la plaque bactérienne. La gingivite est une maladie parodontale, c'est-à-dire une maladie touchant le parodonte, les tissus entourant la dent. 	\N	0	120	sex_MF	gencive, inflammation gencive, gingivite, gencive rouge, gencive foncée, gencive lisse, gencive gonflée, gencive qui saigne facilement, gencive qui saigne lors du brossage, gencive qui saigne, poches parodontales, espace qui se forme entre le haut de la gencive et le niveau où elle s'attache à l'os, inflammation parodonte, gencive inflammée	\N	gingivite simple	\N	\\x80045d942e	2019-09-03 15:46:51.374818	\N	2019-09-03 15:46:51.374818	7	Le traitement étiologique ou traitement préventif est, de loin, la meilleure des choses. Il s'agit :\r\n\r\nD'un brossage régulier et efficace des dents. La plaque doit être éliminée, le plus parfaitement possible, à chaque brossage (deux fois par jour, mais en tout cas après chaque repas).\r\nD'un détartrage également régulier. La fréquence est variable selon les individus, en fonction de la vitesse de formation de la plaque dentaire. Une fréquence d'une fois par an est la moyenne habituelle (en même temps que la visite de contrôle).\r\n\r\nUn traitement curatif n'est entrepris que dans les cas où le traitement étiologique se révèle insuffisant, ce qui est rarement le cas quand on est encore au stade de gingivite. Un traitement chirurgical est généralement nécessaire quand on est au stade de parodontite.\r\n\r\nProfondeur de poche trop importante. Dans ce cas, la chirurgie peut devenir nécessaire.\r\nGingivite hypertrophique, généralisée ou localisée (épulis). Dans ce cas, on pratique une gingivectomie, chirurgie simple, avec de bons résultats.\r\nOn peut utiliser comme adjuvants des bains de bouche antiseptiques à la chlorhexidine	\N	\N	\N
705	oedème aigu du poumon	L'œdème aigu du poumon (OAP) est une affection pulmonaire secondaire à l'inondation ou l'accumulation brutale de liquides dans les poumons (alvéoles ou des espaces interstitiels pulmonaires). Cet état est responsable de troubles des échanges gazeux et peut entraîner une insuffisance respiratoire.	\N	0	120	sex_MF	dyspnée, sensation d’inconfort respiratoire, agitation, anxiété, sensation d’étouffement,  toux, pâleur, cyanose, transpiration, gene respiratoire, trouble respiratoire, etouffement, difficulté respiratoire, bleu, pale, tousse, est anxieux, a peur, panique, est agité, respire mal, difficulté à respirer\r\n	\N	oedeme aigu du poumon	\N	\\x80049533000000000000005d94288c0d667265715f6361725f68696768948c044543475f948c0b4563686f20636f6575725f948c06696d6167655f94652e	2019-09-02 17:46:31.243222	\N	2019-09-02 17:46:31.243222	7	Le traitement comprend :\r\n\r\nune oxygénothérapie pour une saturation en oxygène (SaO2) supérieure à 90 % (à adapter aux gaz du sang) : selon le degré de gravité, cela peut aller de la simple mise sous oxygène par lunettes à la ventilation non invasive, la ventilation en pression positive continue (CPAP) ou la ventilation assistée ;\r\nl'utilisation de vasodilatateurs veineux (dérivés nitrés) et / ou artériels selon le niveau de la pression artérielle ;\r\nl'utilisation de diurétiques de l'anse par voie veineuse ;\r\nun traitement anticoagulant (à dose préventive ou curative selon le cas) ;\r\nun cardiotonique pourra être éventuellement administré pour renforcer le travail cardiaque, essentiellement dans les formes graves (choc cardiogénique).\r\n	\N	\N	\N
712	furoncle	Le furoncle est une infection bactérienne profonde d'un follicule pileux provoquant la nécrose périfolliculaire et la suppuration. Il en résulte une induration douloureuse du derme causée par une accumulation de pus et de tissus morts. Au terme de sa maturation, entre 5 et 10 jours, le furoncle s'ouvre et élimine le follicule pileux (bourbillon) formant une ulcération cratériforme.	\N	0	120	sex_MF	furoncle, nodule, boule, nodule douloureux, boule douloureuse, boule chaude, nodule chaud, boule rouge, nodule rouge, nodule de la taille d’un pois, nodule qui grossit, grossit, pus, nodule pus, pointe blanche de pus, anthrax, agglomérat de furoncles, inflammation d’une grande zone de peau, fièvre éventuelle, gonflement des ganglions	\N	furoncle	\N	\\x80045d942e	2019-09-02 19:17:01.17168	\N	2019-09-02 19:17:01.17168	7	La guérison survient en quelques jours laissant une cicatrice atrophique.	\N	\N	\N
1075	mastocytose neurologique	Les mastocytoses neurologiques sont des maladies orphelines consistant en une prolifération de mastocytes dans le système nerveux. 	\N	0	120	sex_MF	Mastocytose neurologique, maux de tête, mal à la tête migraine, migraines, céphalées, céphalée, syncopes, syncopes, vertiges, convulsions, convulsion, anxiété, anxieux, dépression, démence, dépressif, déprime\r\n	\N	mastocytose neurologique	\N	\\x80045d942e	2019-09-23 18:11:55.618561	\N	2019-09-23 18:11:55.618561	7	Le traitement des MS est symptomatique et/ou spécifique. Il est limité dans le cas de mastocytoses très indolentes (ou présentant peu de symptômes). Les traitements symptomatiques visent à diminuer les effets indésirables liés à la production de médiateurs par les mastocytes en excès.\r\n\r\nLes principales molécules utilisées sont des antihistaminiques H1 (souvent efficaces contre le prurit et les érythèmes localisés dits flushs), et des antihistaminiques H2 (contre les troubles gastro-intestinaux). \r\nD’autres molécules, comme les corticostéroïdes, sont employées en cas de symptômes cutanés sévères. \r\nDes anticholinergiques traitent la diarrhée et les migraines. \r\nLe cromoglycate de sodium traite les symptômes respiratoires. \r\nEnfin, les biphosphonates sont efficaces chez les patients présentant de l’ostéoporose. L’adrénaline (et une réanimation) peuvent être nécessaire en cas d'état de choc liés à une dégranulation mastocytaire massive.\r\n	\N	\N	\N
744	hemochromatose	Les hémochromatoses (précisées parfois en génétiques ou primitives) sont un groupe de maladies héréditaires autosomiques, récessives dans l'immense majorité des cas, concernant le métabolisme du fer, et se caractérisant par une surcharge de fer (hémosidérose) dans l'organisme.	https://www.has-sante.fr/jcms/c_592230/fr/ald-n17-hemochromatose	0	120	sex_MF	\r\nHemochromatose, hemochromatose génétique, hémochromatose héréditaire, absorption excessive de fer, accumulation de fer dans l’organisme,  HFE, fatigue, peau brune, peau qui brunit, brunissement de la peau, mélanodermie, aspect grisatre de la peau, atrophie cutanée, peau qui s’affine ichtyose, moins de cheveux, moins de poils, peau grise, probleme de foie, probleme de cœur, probleme de glandes endocrines, cirrhose, cancer du foie, diabete, insuffisance cardiaque\r\n	\N	hemochromatose	\N	\\x80049510000000000000005d948c09617361745f6869676894612e	2019-09-07 15:46:42.735489	\N	2019-09-07 15:46:42.735489	7	Saignée	\N	\N	\N
746	hemophilie	L'hémophilie est une anomalie constitutionnelle de la coagulation sanguine en rapport avec un déficit d’un des facteurs de la coagulation. 	https://www.has-sante.fr/jcms/c_483032/fr/ald-n11-hemophilies-et-affections-constitutionnelles-de-l-hemostase-graves	0	120	sex_MF	\r\nHemophilie, saignements prolongés, blessure, traumatisme, saignement interne, saignement externe, hémorragie, hémorragie interne, hémorragie externe, hémorragie spontanée, hémorragies spontanées, saignements longs, saignements intenses, pas de protéines coagulantes, pas de caillot, hémorragie qui ne s’arrete pas, saignements très longs, saignements qui ne s’arretent pas, maladie génétique, hémarthroses, raideur genou, raideur cheville, raideur chevilles, raideur hanche, raideur hanches, hématomes, traumatismes \r\n	\N	hemophilie	\N	\\x8004951d000000000000005d94288c0a7461756465735f6c6f77948c0874656d5f6869676894652e	2019-09-07 15:51:25.073361	\N	2019-09-07 15:51:25.073361	7	Administration par voie intraveineuse de Facteur VIII ou de Facteur IX	\N	\N	\N
751	hépatite a	L'hépatite A est une hépatite virale, une maladie infectieuse aiguë du foie causée par le virus de l'hépatite A à transmission le plus souvent oro-fécale par des aliments ou de l'eau contaminés.	\N	0	120	sex_MF	Hepatite A, fievre, sueurs, hepatite, sueur fin de journée, perte d’appétit, amaigrissement, perte de poids, manque d’appétit, pas d’appétit, malaise abdominal, malaises abdominaux, malaise abdolinal droit, douleur abdominale droite, jaunisse, peau jaune, cornée jaune, yeux jaune, œil jaune, corps jaune, visage jaune, urine foncée, urine brune, urine noire, syndrome grippal, souleurs musculaires, fatigue, maux de tete, cephalees, cephalee, mal a la tete\r\n	hépatite infectieuse	hepatite a	\N	\\x8004950b000000000000005d948c04646f735f94612e	2019-09-07 16:02:50.836537	\N	2019-09-07 16:02:50.836537	7	Il n'existe pas de traitement spécifique de l'hépatite A. Il est conseillé aux patients de se reposer, d’éviter les aliments gras et l'alcool (qui peuvent être mal tolérés pendant quelques mois au cours de la phase de convalescence et provoquer des rechutes mineures), d’avoir une alimentation équilibrée, et de bien s’hydrater. Environ 15 % des personnes chez qui on a diagnostiqué une hépatite A présentent un ou plusieurs symptômes de rechute pendant une période de 24 mois après avoir contracté la maladie.	\N	\N	\N
1276	dystrophie musculaire	Les dystrophies musculaires sont un groupe de myopathies génétiques héréditaires qui ont en commun de provoquer une faiblesse des muscles de l'organisme	\N	0	120	sex_MF	dystrophie musculaire, faiblesse musculaire, troubles cardiaques, troubles respiratoires, anomalies yeux, malformation cataracte, décifit intellectuel, troubles hormonaux	\N	dystrophie musculaire	\N	\\x80045d942e	2019-09-25 19:34:31.245889	\N	2019-09-25 19:34:31.245889	7	Selon le type	\N	\N	\N
757	hernie inguinale	Une hernie inguinale, est une protrusion pathologique d'une portion de péritoine contenant éventuellement des viscères abdominaux (il s'agit le plus souvent d'une partie de l'intestin grêle, parfois du gros intestin et, dans certains cas, de la vessie) par le canal inguinal (pour la hernie indirecte, qui est la plus fréquente) ou directement par une ouverture des muscles abdominaux (pour la hernie directe), au travers de la paroi abdominale. Elle peut être congénitale ou acquise, et se manifeste par une tuméfaction sous-cutanée de l’aine.	\N	0	120	sex_MF	hernie inguinale, visceres qui traversent la paroi abdominale, hernie abdominale, hernie paroi abdominale, boursouflure aine, aine douloureux, gonflement aine, douleur aine, douleur en se penchant, douleur en portant, douleur port, douleur pousse, douleur en poussant, douleur toux, douleur en toussant, sensation de brulure, brulure, brulures, sensation de brulures, douleurs très fortes, douleurs intenses, nausées, vomissements, absence de selles, pas de selles, occlusion intestinale, ne defeque pas, intestin bouché, nausée\r\n	\N	hernie inguinale	\N	\\x8004950b000000000000005d948c0470616c5f94612e	2019-09-07 16:16:40.763844	\N	2019-09-07 16:16:40.763844	7	Il est dans certains cas conseillé de s'orienter vers la chirurgie, si la hernie devient trop gênante ou trop volumineuse, ou si l'on vit dans des zones sans accès médical d'urgence (pour l'éventuel risque d'étranglement). 	\N	\N	\N
762	hydarthrose	L’hydarthrose est l'accumulation anormale de synovie dans l'articulation par augmentation de sa sécrétion.\r\n\r\nLa pression intra-articulaire est alors augmentée, entraînant des douleurs lors de sa sollicitation.\r\n\r\nElle est souvent localisée au genou (présence du signe du glaçon) et peut évoluer en kyste poplité.	\N	0	120	sex_MF	fibrocartilagineuse, lesion meniscale degenerative, meniscose, osteochondrite, osteochondrose, lesion traumatique, arthropathie, chondromatose, arthropathie nerveuse, epanchement articulaire, inflammation articulation, douleur articulaire, douleur genou, douleur dos, douleur cheville, douleur hanche, douleur main, douleur doigts, douleur poignet, douleur cou, douleur coude, douleur épaule, tuméfaction articulation, gonflement articulation, gonflement genou, gonflement hanche, gonflement cheville, gonflement epaule, gonflement coude, gonflement main, gonflement doigts, donflement cheville, douleur mécanique, enraidissement matinal durable, raideur articulaire \r\n	\N	hydarthrose	\N	\\x8004951c000000000000005d94288c0449524d5f948c06696d6167655f948c04706f6e5f94652e	2019-09-07 16:34:02.498784	7	2019-09-07 16:34:27.452479	7	\N	\N	\N	\N
533	lipome	Tumeur bénigne du tissu gras ou adipeux qui se présente comme une tuméfaction souple ou molle située sous la peau.	\N	0	120	sex_MF	boule molle, boule indolore, boule, boule de graisse, Lipomes sous-cutanés, tumeurs boules de graisse molles sous la peau, lipome, Fibrolipomes, Mésenchymome bénin, Lipoblastome, Lipome pléomorphe, lipomes hétérotopiques, lipomes intramusculaires, lipomes arborescents, fibrolipomes neuraux, lipomes parostéaux, Hibernomes, liposarcome, liposarcome myxoïde, liposarcome pléomorphe	\N	lipome	\N	\\x8004950b000000000000005d948c0462696f5f94612e	2019-08-24 09:16:02.509823	\N	2019-08-24 09:16:02.509823	7	Si nécessaire, chirurgie.	\N	\N	\N
895	pyélonéphrite	La pyélonéphrite aiguë est une infection urinaire d'origine majoritairement bactérienne touchant le parenchyme d'un des reins et le bassinet sous-jacent. Le plus souvent, le germe en cause atteint ce site anatomique en remontant les voies urinaires ; la principale bactérie responsable est Escherichia coli. 	https://www.has-sante.fr/jcms/c_2722914/fr/pyelonephrite-aigue-de-la-femme	0	120	sex_MF	pyelonephrite, infection urinaire, brulures lors miction, brulures en urinant, envie fréquente uriner, pollakiurie, urines malodorantes, pu dans urines, présence pus urines, pyurie, présence sang urines, urines sang, sang urine, hématurie, douleur lombaire, mal bas dos, douleur organes génitaux, organes génitaux douloureux, organe génital douloureux, bas dos douloureux, fièvre, température élevée, polyurie\r\n	\N	pyelonephrite	\N	\\x8004951a000000000000005d94288c044563685f948c046578615f948c047072695f94652e	2019-09-16 09:32:07.695237	\N	2019-09-16 09:32:07.695237	7	Le but du traitement est de guérir l'infection en stérilisant le parenchyme rénal, et d'éviter les complications aiguës, les récidives ainsi que les lésions séquellaires. Une antibiothérapie probabiliste doit être entreprise une fois que les examens bactériologiques (examen cytobactériologique des urines, voire hémoculture) sont recueillis. Le spectre d'activité de cette antibiothérapie initiale est choisi selon la gravité de la pyélonéphrite ; il est préférablement plus large en cas de forme grave. La nature de l'antibiothérapie doit être réévaluée en fonction de l'évolution et des résultats de l'antibiogramme à 48 heures. Ainsi lorsque l'évolution est favorable, l'antibiothérapie peut en général être modifiée pour un traitement à spectre plus étroit, adapté au germe retrouvé.\r\n\r\nEn ce qui concerne l'antibiothérapie initiale, en l'absence de signe de gravité, et qu'il y ait ou non des facteurs de risque de complication, le choix peut se porter sur une céphalosporine de troisième génération (par ordre alphabétique : céfotaxime ou ceftriaxone) ou une fluoroquinolone (par ordre alphabétique : ciprofloxacine, lévofloxacine ou ofloxacine). Cette dernière classe est à éviter en cas de traitement préalable dans les 6 mois précédents par une molécule de la même classe et, si le choix se porte sur une de ces molécules, la voie orale est à priviliégier. Chez la femme enceinte, seule une céphalosporine de troisième génération est à privilégier. Il en est de même chez l'enfant.	\N	\N	\N
915	lepre intermédiaire	Forme de lèpre qui combine des symptômes de la lèpre tuberculoïde et la lèpre lépromateuse.	\N	0	120	sex_MF	Lepre, lésions cutanées, lésion cutanée, plaie peau, plaies peau, plaques douloureuses, plaques dépigmentation, plaques blanches, plaques rouges, excroissances, epaississement peau, peau épaisse, perte de sensation, insensibilité, anesthésie, faiblesse musculaire, paralysie, faible, paralysie mains, paralysie pieds, troubles oculaires, cécité, absence perception lumière, troubles visuels, troubles vision\r\n	\N	lepre intermediaire	\N	\\x80045d942e	2019-09-16 10:32:17.985675	\N	2019-09-16 10:32:17.985675	7	Bien que non mortelle, la lèpre expose à des invalidités sévères et des handicaps permanents si elle n'est pas traitée à temps. Le traitement comporte plusieurs antibiotiques, afin d'éviter de sélectionner des souches résistantes du germe.	\N	\N	\N
758	herpes génital	L'herpès génital est une maladie infectieuse sexuellement transmissible ou indirectement par les doigts ayant été en contact avec une autre partie du corps infectée (bouton de fièvre) causée par le virus Herpes simplex (HSV) de type 1 ou 2.	\N	0	120	sex_MF	herpes génital, sensibilité genitale, démangeaison genitale, demangeaisons genitales, picotement genital, picotements genitaux, prodrome, prodromes, vesicules genitales, vesicultes transparentes, vesicules transparentes genitales, vesicules entree du vagin, vesicules vulve, vesicules fesses, vesicules autour de l’anus, vesicules col de l’uterus, vesicules penis, vesicules scrotum, vesicules cuisses, vesicules uretren miction douloureuse, ulceres vifs, boutons, croutes, croutes vulve, croutes vagin, croutes fesses, croutes cuisses, croutes penis, croutes scrotum, croutes testicules	\N	herpes genital	\N	\\x8004950b000000000000005d948c047365725f94612e	2019-09-07 16:23:23.816605	\N	2019-09-07 16:23:23.816605	7	Les traitements sont de deux types : oral (traitement préventif) ou local (pommade à appliquer, traitement curatif des poussées d'herpès). Il faut traiter le plus tôt possible, c'est-à-dire dès l'apparition des signes annonciateurs d'une poussée d'herpès (démangeaisons, gênes ou irritations), ce qui aiderait à réduire la durée des crises et les douleurs afférentes.\r\n	\N	\N	\N
763	hydrocéphalie communicante	Elle est aussi nommée hydrocéphalie normotensive qui est une dilatation du système ventriculaire en présence d'une pression plus ou moins normale au niveau du liquide céphalorachidien. La dynamique du liquide céphalorachidien est perturbée. Elle peut être secondaire à une hémorragie, elle-même due à une malformation artérioveineuse, à une hémorragie sous-arachnoïdienne, à un traumatisme ou bien être idiopathique.\r\n\r\nL’hydrocéphalie est une anomalie neurologique sévère, définie par l'augmentation du volume des espaces contenant le liquide cérébro-spinal (LCS) : ventricules cérébraux et espace sous-arachnoïdien. Cette dilatation peut être due à une hypersécrétion de LCS, un défaut de résorption, ou une obstruction mécanique des voies de circulation. 	\N	0	120	sex_MF	Hydrocephalie, lethargie, convulsions, vomissement, vomissements, convulstion, strabisme, troubles de la visio, mauvaise vision, probleme de vue, problemes de vue, troubles de l’apprentissage, troubles de l’apprentissage, problemes d’attention difficultés traitement de l’information, incontinence urinaire, demence, troubles moteur, problemes moteurs, deterioration fonctions executives, troubles de la marche, troubles de l’équilibre, troubles urinaires, perturbations cognitives, 	\N	hydrocephalie communicante	\N	\\x8004951b000000000000005d94288c055363616e5f948c0449524d5f948c04706f6e5f94652e	2019-09-07 16:37:55.89827	7	2019-09-07 16:38:07.229884	7	C'est un traitement neurochirurgical consistant en la mise en place d'une dérivation ventriculo-péritonéale (DVP), cette dérivation est interne, entre le système ventriculaire et le péritoine (ou le cœur, plus rarement) où va se drainer l'excès de LCS. Les effets sont inconstants d'un patient à l'autre : la récupération motrice est souvent très satisfaisante si le traitement est précoce (troubles de la marche sans démence si troubles sphinctériens), en cas de bonne réponse à la ponction lombaire évacuatrice et en cas d'hydrocéphalie secondaire (à un traumatisme, une infection, etc.). 	\N	\N	\N
765	hydrocéphalie à pression normale	L'hydrocéphalie à pression normale ou HPN est également connue sous le nom du syndrome d'Adams et Hakim. C'est une forme particulière d'hydrocéphalie chronique de l'adulte.\r\n\r\nC'est une variété d'hydrocéphalie liée à une obstruction basse des voies de circulation du liquide cérébro-spinal (en aval des orifices du quatrième ventricule, en général au niveau des citernes de la base), rencontrée chez le sujet âgé. Elle ne s'accompagne pas d'hypertension intracrânienne, ses symptômes sont d'apparition progressive et insidieuse. Classiquement, elle est considérée comme la conséquence de la résorption du liquide céphalorachidien dans le parenchyme ventriculaire.	\N	0	120	sex_MF	Hydrocephalie, lethargie, convulsions, vomissement, vomissements, convulstion, strabisme, troubles de la visio, mauvaise vision, probleme de vue, problemes de vue, troubles de l’apprentissage, troubles de l’apprentissage, problemes d’attention difficultés traitement de l’information, incontinence urinaire, demence, troubles moteur, problemes moteurs, deterioration fonctions executives, troubles de la marche, troubles de l’équilibre, troubles urinaires, perturbations cognitives, 	\N	hydrocephalie a pression normale	\N	\\x8004951b000000000000005d94288c055363616e5f948c0449524d5f948c04706f6e5f94652e	2019-09-07 16:40:17.21835	\N	2019-09-07 16:40:17.21835	7	Le traitement est neurochirurgical.	\N	\N	\N
775	hyperkaliémie	L'hyperkaliémie est un trouble hydroélectrolytique défini par un excès de potassium dans le plasma sanguin : son diagnostic positif est affirmé par le ionogramme lorsque la kaliémie est supérieure à 5 mmol/L. 	\N	0	120	sex_MF	Hyperkaliémie, irregularité rythme cardiaque, arythmie, fatigue intense, fatigue, fatigue chronique, faiblesse musculaire, sensation de picotements, picotements, picotement, engourdissement, engourdissements, paralysies ephemeres, paralysies, difficultés à repsirer, nausée, nausées, vomissement, vomissements, trop de potassium, \r\n	\N	hyperkaliemie	\N	\\x8004950d000000000000005d948c066b5f6869676894612e	2019-09-08 15:10:38.221296	\N	2019-09-08 15:10:38.221296	7	hémodialyse, régime alimentaire\r\nTraitement médicamenteux : insuline, gluconate de calcium, diurétiques, bicarbonate de sodium\r\n	\N	\N	\N
780	hypermétropie	L'hypermétropie est un trouble de la vision. D'un point de vue optique pur, l'hypermétropie est le contraire de la myopie : quand l'œil est au repos, il donne d'un objet distant une image qui serait focalisée en arrière de la rétine. L’œil hypermétrope est donc un œil dont le système optique n'est pas assez puissant. L'hypermétropie peut être corrigée grâce à des lentilles convergentes prescrites par l'ophtalmologue.	\N	0	120	sex_MF	Hypermétropie, vision floue objets proches, vision floue, trouble de la vision, troubles de la vision, fatigue oculaire, maux de tete, mal a la tete, céphalée, besoin de plisser les yeux, strabisme, brulures yeux, brulures aux yeux, douleurs oculaires, fatigue, fatigue des yeux, yeux fatigués, yeux qui brulent, vision floue, probleme de vision, problemes de vision, hypermétrope	\N	hypermetropie	\N	\\x80045d942e	2019-09-08 16:13:10.56244	\N	2019-09-08 16:13:10.56244	7	Port d'une correction	\N	\N	\N
782	hyperparathyroïdie	L'hyperparathyroïdie est une production anormalement élevée d'hormone parathyroïdienne (PTH) par les glandes parathyroïdes. Celle-ci peut être primaire ou secondaire.\r\n\r\nL'augmentation de PTH entraîne une augmentation du taux de calcium plasmatique. Cette hypercalcémie est due à l'augmentation de la résorption osseuse par les ostéoclastes, la réduction de l'élimination rénale du calcium et l'augmentation de l'absorption intestinale de calcium. L'hypercalcémie chronique peut causer une néphrocalcinose et une insuffisance rénale. La résorption osseuse excessive provoque une ostéomalacie.	\N	0	120	sex_MF	Hyperparathyroidie, calculs rénaux, calculs rnaux récurrents, douleurs abdominales, fatigue, soif importante, nauses, nausée, anxiétén dépréciation neurocognitive, depression, ostéodystrophie osseuse, perte de densité osseuse, douleurs osseuses, insuffisance rénale, fractures, troubles musculo squelettiques, hypercalcémie, trop de PTH, trop d’hormones parathyroidiennes	\N	hyperparathyroidie	\N	\\x8004951e000000000000005d94288c087074685f68696768948c0b63615f746f745f6869676894652e	2019-09-08 16:16:01.383458	\N	2019-09-08 16:16:01.383458	7	Le traitement de l'hyperparathyroïdie primaire consiste au retrait chirurgical de l'adénome, qu'il soit unique ou multiple. Celui de l'hyperparathyroïdie secondaire est celui de la cause (insuffisance rénale).	\N	\N	\N
\.


--
-- Data for Name: pathology_specialty; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.pathology_specialty (id, pathology_id, specialty_id) FROM stdin;
535	525	18
533	523	18
536	526	18
534	524	18
446	440	1
538	528	18
22	22	1
560	550	18
595	585	1
607	597	1
610	600	6
615	605	12
617	607	1
620	610	22
621	611	1
624	614	20
626	616	6
629	619	6
631	621	7
644	634	3
646	636	22
651	641	20
658	648	1
661	651	1
731	721	14
740	730	1
491	482	16
498	489	1
756	746	1
761	751	1
767	757	1
785	775	1
790	780	6
792	782	1
817	807	12
880	870	22
920	910	12
925	915	7
537	527	18
552	542	1
559	549	18
565	555	21
643	633	7
654	644	1
662	652	1
681	671	6
696	686	21
723	713	12
725	715	1
732	722	6
746	736	1
748	738	17
751	741	18
754	744	1
772	762	16
779	769	1
781	771	1
804	794	20
883	873	1
898	888	1
905	895	20
495	486	14
527	517	18
543	533	1
569	559	1
516	507	1
589	579	1
602	592	20
618	608	1
623	613	1
647	637	1
648	638	1
652	642	1
657	647	1
670	660	12
685	675	12
691	681	1
697	687	15
701	691	15
715	705	19
722	712	1
747	737	17
768	758	1
773	763	1
775	765	1
873	863	21
882	872	3
891	881	1
895	885	19
907	897	13
1025	1015	1
1030	1020	1
1066	1056	17
1070	1060	1
1085	1075	1
1091	1081	1
1287	1276	1
1379	1367	13
1383	1370	15
1397	1383	21
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.roles (id, name) FROM stdin;
1	admin
2	expert
3	user
\.


--
-- Data for Name: specialty; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.specialty (id, name) FROM stdin;
3	Psychiatrie
6	Ophtalmologie
7	Maladies infectieuses
8	Gynécologie
12	Dermatologie
1	Medecine générale
13	ORL
14	Dentaire
15	Neurologie
2	Pédiatrie
16	Rhumatologie
17	Orthopédie
18	Oncologie
19	Pneumologie
20	Urologie
21	Cardiologie
22	Gastro entérologie
24	Nephrologie
23	Endocrinologie
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public."user" (id, email, rpps, password, name, forename, registered_on, confirmed, confirmed_on, entry_count_patient, entry_count_pathology, modify_count_patient, modify_count_pathology, phone, zip_code) FROM stdin;
7	dgcbahzkc@hbcazj.com	546775	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Chenu-Tournier	Jeanne	2019-07-22 14:19:58.720106	t	2019-07-22 14:21:09.348953	545	973	15	174	0	0
12	ghbaqzx@vjhzc.com	14567	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Lahmi	Sandra	2019-10-21 20:42:51.051819	t	2019-10-21 20:45:45.552426	31	0	0	0	0	0
17	cacbc@cba.com	565867	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Decure	Alison	2019-10-25 14:19:04.1425	t	2019-10-07 15:29:39	146	0	29	1	0	0
18	cbkacza@gchbazc.com	97633469	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Sentagne	Ornella	2019-10-30 10:06:24.204561	t	2019-10-30 14:06:24	0	0	0	0	0	0
34	gdzha@zfchz.com	65867865	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Bézie	Jules	2019-11-07 09:48:23.56002	t	2019-11-07 09:51:38.844116	0	0	0	0	0	0
3	chbazj@vah.com	8758567	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Sfez	Annie	2019-06-07 20:57:34.334352	t	2019-06-07 20:59:34	42	0	0	0	0	0
36	chajkcbz@gcazi.com	56698686	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Berrebi	Hanna	2019-11-07 21:21:45.107583	t	2019-11-07 21:23:45	0	0	0	0	0	0
37	ajbcezvhbc@czabh.com	34657	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Lamarche	Alice	2019-11-14 18:01:00.36017	t	2019-11-14 19:01:00	0	0	0	0	0	0
4	cakc@vaehjv.com	34567896	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Lahmi	Léa	2019-06-07 20:57:34.514306	t	2019-06-07 20:59:34	0	7	0	0	0	0
5	hoacjk@agih.com	57478	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Lahmi	Emma	2019-06-07 20:57:34.754359	t	2019-06-07 20:59:34	0	0	0	0	0	0
10	paul.monnery@epitech.eu	4587567	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Monnery	Paul	2019-09-28 10:58:00.327641	t	2019-09-28 10:58:23.825234	3	3	0	22	0	0
2	cuhakjc@avzhca.com	46568	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Lahmi	Michael	2019-06-07 20:57:34.034395	t	2019-06-07 20:59:34	30	18	34	19	0	0
11	bckazc@cazjh.com	34576875	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Cartozo	Maxime	2019-10-01 19:05:54.185276	t	2019-10-01 19:08:22.17276	687	0	60	14	0	0
1	hcazjc@gchjq.com	64758	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	admin	admin	2019-06-07 20:57:21.768166	t	2019-06-07 20:59:34	1	14	0	77	0	0
54	haczkz@zcghe.com	5465865	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Steffen	Anne-Laure	2019-12-03 13:38:12.070551	t	2019-06-07 20:59:34	3	0	0	0	0	0
50	fazihc@fxztgh.com	645976	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Sfez	Emma	2019-12-02 17:01:35.683666	t	2019-06-07 20:59:34	0	0	0	0	0	0
53	bjakza@vbak.com	675788	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Cartozo	Florian	2019-12-02 18:33:11.529534	t	2019-06-07 20:59:34	0	0	0	0	0	0
55	fhucazjc@vgahzb.com	2354656	sha256$VcbP3Pq3$b1d613575e49e7457ba8de1d3a31fe190196e07486a07d8abe63c56b85e255b3	Bader 	Monika	2019-12-04 14:54:32.107453	t	2019-06-07 20:59:34	0	0	0	0	0	0
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: gloth
--

COPY public.user_roles (id, user_id, role_id) FROM stdin;
1	1	1
3	3	2
4	4	1
5	5	1
16	11	2
17	7	2
25	12	2
28	18	3
39	34	3
40	36	3
43	37	3
45	17	2
47	10	1
57	53	1
58	54	3
59	55	3
61	50	1
62	2	2
\.


--
-- Name: pathology_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.pathology_id_seq', 1391, true);


--
-- Name: pathology_specialty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.pathology_specialty_id_seq', 1406, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: specialty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.specialty_id_seq', 24, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.user_id_seq', 55, true);


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gloth
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 62, true);


--
-- Name: pathology pathology_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology
    ADD CONSTRAINT pathology_pkey PRIMARY KEY (id);


--
-- Name: pathology_specialty pathology_specialty_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology_specialty
    ADD CONSTRAINT pathology_specialty_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: specialty specialty_name_key; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_name_key UNIQUE (name);


--
-- Name: specialty specialty_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT specialty_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: user user_rpps_key; Type: CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_rpps_key UNIQUE (rpps);


--
-- Name: pathology_specialty pathology_specialty_pathology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology_specialty
    ADD CONSTRAINT pathology_specialty_pathology_id_fkey FOREIGN KEY (pathology_id) REFERENCES public.pathology(id) ON DELETE CASCADE;


--
-- Name: pathology_specialty pathology_specialty_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.pathology_specialty
    ADD CONSTRAINT pathology_specialty_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES public.specialty(id) ON DELETE CASCADE;


--
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gloth
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

