--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE alembic_version OWNER TO ivolejon;

--
-- Name: all_currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: ivolejon
--

CREATE SEQUENCE all_currencies_id_seq
    START WITH 259
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE all_currencies_id_seq OWNER TO ivolejon;

--
-- Name: all_currencies; Type: TABLE; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE TABLE all_currencies (
    id integer DEFAULT nextval('all_currencies_id_seq'::regclass) NOT NULL,
    country character varying(255),
    currency character varying(255),
    code text
);


ALTER TABLE all_currencies OWNER TO ivolejon;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: ivolejon
--

CREATE SEQUENCE blog_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_posts_id_seq OWNER TO ivolejon;

--
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE TABLE blog_posts (
    id integer DEFAULT nextval('blog_posts_id_seq'::regclass) NOT NULL,
    name character varying(400),
    content text,
    created_on timestamp without time zone,
    ingress text,
    featured boolean,
    publish boolean,
    post_type character varying(255)
);


ALTER TABLE blog_posts OWNER TO ivolejon;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE TABLE cache (
    id integer NOT NULL,
    project_id integer,
    cache text,
    created_on timestamp(6) without time zone,
    long_id character varying(120)
);


ALTER TABLE cache OWNER TO ivolejon;

--
-- Name: cache_id_seq; Type: SEQUENCE; Schema: public; Owner: ivolejon
--

CREATE SEQUENCE cache_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cache_id_seq OWNER TO ivolejon;

--
-- Name: cache_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ivolejon
--

ALTER SEQUENCE cache_id_seq OWNED BY cache.id;


--
-- Name: country_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: ivolejon
--

CREATE SEQUENCE country_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE country_codes_id_seq OWNER TO ivolejon;

--
-- Name: country_codes; Type: TABLE; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE TABLE country_codes (
    id integer DEFAULT nextval('country_codes_id_seq'::regclass) NOT NULL,
    country character varying(255),
    code text
);


ALTER TABLE country_codes OWNER TO ivolejon;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: ivolejon
--

CREATE SEQUENCE payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payments_id_seq OWNER TO ivolejon;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE TABLE payments (
    id integer DEFAULT nextval('payments_id_seq'::regclass) NOT NULL,
    date timestamp without time zone,
    name text,
    amount double precision,
    task_id integer,
    project_id integer
);


ALTER TABLE payments OWNER TO ivolejon;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: ivolejon
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO ivolejon;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE TABLE projects (
    id integer DEFAULT nextval('projects_id_seq'::regclass) NOT NULL,
    long_id character varying(255),
    name character varying(255),
    created_on timestamp without time zone,
    user_id integer,
    project_start timestamp without time zone,
    kind text,
    cache text
);


ALTER TABLE projects OWNER TO ivolejon;

--
-- Name: supported_currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: ivolejon
--

CREATE SEQUENCE supported_currencies_id_seq
    START WITH 168
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supported_currencies_id_seq OWNER TO ivolejon;

--
-- Name: supported_currencies; Type: TABLE; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE TABLE supported_currencies (
    id integer DEFAULT nextval('supported_currencies_id_seq'::regclass) NOT NULL,
    currency character varying(255),
    code text
);


ALTER TABLE supported_currencies OWNER TO ivolejon;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: ivolejon
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_id_seq OWNER TO ivolejon;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE TABLE tasks (
    id integer DEFAULT nextval('tasks_id_seq'::regclass) NOT NULL,
    long_id character varying(255),
    created_on timestamp without time zone,
    project_id integer,
    name character varying(255),
    currency_from text,
    currency_to text,
    direction character varying(255),
    donor character varying(500),
    quote double precision,
    receiver character varying(500)
);


ALTER TABLE tasks OWNER TO ivolejon;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ivolejon
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO ivolejon;

--
-- Name: users; Type: TABLE; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    first_name character varying(64),
    last_name character varying(64),
    email character varying(120),
    password character varying(120),
    long_id character varying(120),
    registered_on timestamp without time zone,
    confirmed boolean,
    confirmed_on timestamp without time zone,
    role character varying(64)
);


ALTER TABLE users OWNER TO ivolejon;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ivolejon
--

ALTER TABLE ONLY cache ALTER COLUMN id SET DEFAULT nextval('cache_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: ivolejon
--

INSERT INTO alembic_version VALUES ('76de06f6d884');


--
-- Data for Name: all_currencies; Type: TABLE DATA; Schema: public; Owner: ivolejon
--

INSERT INTO all_currencies VALUES (1, 'Afghanistan', 'Afghan afghani', 'AFN');
INSERT INTO all_currencies VALUES (2, 'Akrotiri and Dhekelia (UK)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (3, 'Aland Islands (Finland)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (4, 'Albania', 'Albanian lek', 'ALL');
INSERT INTO all_currencies VALUES (5, 'Algeria', 'Algerian dinar', 'DZD');
INSERT INTO all_currencies VALUES (6, 'American Samoa (USA)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (7, 'Andorra', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (8, 'Angola', 'Angolan kwanza', 'AOA');
INSERT INTO all_currencies VALUES (9, 'Anguilla (UK)', 'East Caribbean dollar', 'XCD');
INSERT INTO all_currencies VALUES (10, 'Antigua and Barbuda', 'East Caribbean dollar', 'XCD');
INSERT INTO all_currencies VALUES (11, 'Argentina', 'Argentine peso', 'ARS');
INSERT INTO all_currencies VALUES (12, 'Armenia', 'Armenian dram', 'AMD');
INSERT INTO all_currencies VALUES (13, 'Aruba (Netherlands)', 'Aruban florin', 'AWG');
INSERT INTO all_currencies VALUES (14, 'Ascension Island (UK)', 'Saint Helena pound', 'SHP');
INSERT INTO all_currencies VALUES (15, 'Australia', 'Australian dollar', 'AUD');
INSERT INTO all_currencies VALUES (16, 'Austria', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (17, 'Azerbaijan', 'Azerbaijani manat', 'AZN');
INSERT INTO all_currencies VALUES (18, 'Bahamas', 'Bahamian dollar', 'BSD');
INSERT INTO all_currencies VALUES (19, 'Bahrain', 'Bahraini dinar', 'BHD');
INSERT INTO all_currencies VALUES (20, 'Bangladesh', 'Bangladeshi taka', 'BDT');
INSERT INTO all_currencies VALUES (21, 'Barbados', 'Barbadian dollar', 'BBD');
INSERT INTO all_currencies VALUES (22, 'Belarus', 'Belarusian ruble', 'BYN');
INSERT INTO all_currencies VALUES (23, 'Belgium', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (24, 'Belize', 'Belize dollar', 'BZD');
INSERT INTO all_currencies VALUES (25, 'Benin', 'West African CFA franc', 'XOF');
INSERT INTO all_currencies VALUES (26, 'Bermuda (UK)', 'Bermudian dollar', 'BMD');
INSERT INTO all_currencies VALUES (27, 'Bhutan', 'Bhutanese ngultrum', 'BTN');
INSERT INTO all_currencies VALUES (28, 'Bolivia', 'Bolivian boliviano', 'BOB');
INSERT INTO all_currencies VALUES (29, 'Bonaire (Netherlands)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (30, 'Bosnia and Herzegovina', 'Bosnia and Herzegovina convertible mark', 'BAM');
INSERT INTO all_currencies VALUES (31, 'Botswana', 'Botswana pula', 'BWP');
INSERT INTO all_currencies VALUES (32, 'Brazil', 'Brazilian real', 'BRL');
INSERT INTO all_currencies VALUES (33, 'British Indian Ocean Territory (UK)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (34, 'British Virgin Islands (UK)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (35, 'Brunei', 'Brunei dollar', 'BND');
INSERT INTO all_currencies VALUES (36, 'Bulgaria', 'Bulgarian lev', 'BGN');
INSERT INTO all_currencies VALUES (37, 'Burkina Faso', 'West African CFA franc', 'XOF');
INSERT INTO all_currencies VALUES (38, 'Burundi', 'Burundi franc', 'BIF');
INSERT INTO all_currencies VALUES (39, 'Cabo Verde', 'Cape Verdean escudo', 'CVE');
INSERT INTO all_currencies VALUES (40, 'Cambodia', 'Cambodian riel', 'KHR');
INSERT INTO all_currencies VALUES (41, 'Cameroon', 'Central African CFA franc', 'XAF');
INSERT INTO all_currencies VALUES (42, 'Canada', 'Canadian dollar', 'CAD');
INSERT INTO all_currencies VALUES (43, 'Caribbean Netherlands (Netherlands)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (44, 'Cayman Islands (UK)', 'Cayman Islands dollar', 'KYD');
INSERT INTO all_currencies VALUES (45, 'Central African Republic', 'Central African CFA franc', 'XAF');
INSERT INTO all_currencies VALUES (46, 'Chad', 'Central African CFA franc', 'XAF');
INSERT INTO all_currencies VALUES (47, 'Chile', 'Chilean peso', 'CLP');
INSERT INTO all_currencies VALUES (48, 'China', 'Chinese Yuan Renminbi', 'CNY');
INSERT INTO all_currencies VALUES (49, 'Christmas Island (Australia)', 'Australian dollar', 'AUD');
INSERT INTO all_currencies VALUES (50, 'Cocos (Keeling) Islands (Australia)', 'Australian dollar', 'AUD');
INSERT INTO all_currencies VALUES (51, 'Colombia', 'Colombian peso', 'COP');
INSERT INTO all_currencies VALUES (52, 'Comoros', 'Comorian franc', 'KMF');
INSERT INTO all_currencies VALUES (53, 'Congo, Democratic Republic of the', 'Congolese franc', 'CDF');
INSERT INTO all_currencies VALUES (54, 'Congo, Republic of the', 'Central African CFA franc', 'XAF');
INSERT INTO all_currencies VALUES (55, 'Cook Islands (New Zealand)', 'Cook Islands dollar', 'none');
INSERT INTO all_currencies VALUES (56, 'Costa Rica', 'Costa Rican colon', 'CRC');
INSERT INTO all_currencies VALUES (57, 'Cote d''Ivoire', 'West African CFA franc', 'XOF');
INSERT INTO all_currencies VALUES (58, 'Croatia', 'Croatian kuna', 'HRK');
INSERT INTO all_currencies VALUES (59, 'Cuba', 'Cuban peso', 'CUP');
INSERT INTO all_currencies VALUES (60, 'Curacao (Netherlands)', 'Netherlands Antillean guilder', 'ANG');
INSERT INTO all_currencies VALUES (61, 'Cyprus', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (62, 'Czech Republic', 'Czech koruna', 'CZK');
INSERT INTO all_currencies VALUES (63, 'Denmark', 'Danish krone', 'DKK');
INSERT INTO all_currencies VALUES (64, 'Djibouti', 'Djiboutian franc', 'DJF');
INSERT INTO all_currencies VALUES (65, 'Dominica', 'East Caribbean dollar', 'XCD');
INSERT INTO all_currencies VALUES (66, 'Dominican Republic', 'Dominican peso', 'DOP');
INSERT INTO all_currencies VALUES (67, 'Ecuador', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (68, 'Egypt', 'Egyptian pound', 'EGP');
INSERT INTO all_currencies VALUES (69, 'El Salvador', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (70, 'Equatorial Guinea', 'Central African CFA franc', 'XAF');
INSERT INTO all_currencies VALUES (71, 'Eritrea', 'Eritrean nakfa', 'ERN');
INSERT INTO all_currencies VALUES (72, 'Estonia', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (73, 'Ethiopia', 'Ethiopian birr', 'ETB');
INSERT INTO all_currencies VALUES (74, 'Falkland Islands (UK)', 'Falkland Islands pound', 'FKP');
INSERT INTO all_currencies VALUES (75, 'Faroe Islands (Denmark)', 'Faroese krona', 'none');
INSERT INTO all_currencies VALUES (76, 'Fiji', 'Fijian dollar', 'FJD');
INSERT INTO all_currencies VALUES (77, 'Finland', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (78, 'France', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (79, 'French Guiana (France)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (80, 'French Polynesia (France)', 'CFP franc', 'XPF');
INSERT INTO all_currencies VALUES (81, 'Gabon', 'Central African CFA franc', 'XAF');
INSERT INTO all_currencies VALUES (82, 'Gambia', 'Gambian dalasi', 'GMD');
INSERT INTO all_currencies VALUES (83, 'Georgia', 'Georgian lari', 'GEL');
INSERT INTO all_currencies VALUES (84, 'Germany', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (85, 'Ghana', 'Ghanaian cedi', 'GHS');
INSERT INTO all_currencies VALUES (86, 'Gibraltar (UK)', 'Gibraltar pound', 'GIP');
INSERT INTO all_currencies VALUES (87, 'Greece', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (88, 'Greenland (Denmark)', 'Danish krone', 'DKK');
INSERT INTO all_currencies VALUES (89, 'Grenada', 'East Caribbean dollar', 'XCD');
INSERT INTO all_currencies VALUES (90, 'Guadeloupe (France)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (91, 'Guam (USA)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (92, 'Guatemala', 'Guatemalan quetzal', 'GTQ');
INSERT INTO all_currencies VALUES (93, 'Guernsey (UK)', 'Guernsey Pound', 'GGP');
INSERT INTO all_currencies VALUES (94, 'Guinea', 'Guinean franc', 'GNF');
INSERT INTO all_currencies VALUES (95, 'Guinea-Bissau', 'West African CFA franc', 'XOF');
INSERT INTO all_currencies VALUES (96, 'Guyana', 'Guyanese dollar', 'GYD');
INSERT INTO all_currencies VALUES (97, 'Haiti', 'Haitian gourde', 'HTG');
INSERT INTO all_currencies VALUES (98, 'Honduras', 'Honduran lempira', 'HNL');
INSERT INTO all_currencies VALUES (99, 'Hong Kong (China)', 'Hong Kong dollar', 'HKD');
INSERT INTO all_currencies VALUES (100, 'Hungary', 'Hungarian forint', 'HUF');
INSERT INTO all_currencies VALUES (101, 'Iceland', 'Icelandic krona', 'ISK');
INSERT INTO all_currencies VALUES (102, 'India', 'Indian rupee', 'INR');
INSERT INTO all_currencies VALUES (103, 'Indonesia', 'Indonesian rupiah', 'IDR');
INSERT INTO all_currencies VALUES (104, 'International Monetary Fund (IMF)', 'SDR (Special Drawing Right)', 'XDR');
INSERT INTO all_currencies VALUES (105, 'Iran', 'Iranian rial', 'IRR');
INSERT INTO all_currencies VALUES (106, 'Iraq', 'Iraqi dinar', 'IQD');
INSERT INTO all_currencies VALUES (107, 'Ireland', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (108, 'Isle of Man (UK)', 'Manx pound', 'IMP');
INSERT INTO all_currencies VALUES (109, 'Israel', 'Israeli new shekel', 'ILS');
INSERT INTO all_currencies VALUES (110, 'Italy', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (111, 'Jamaica', 'Jamaican dollar', 'JMD');
INSERT INTO all_currencies VALUES (112, 'Japan', 'Japanese yen', 'JPY');
INSERT INTO all_currencies VALUES (113, 'Jersey (UK)', 'Jersey pound', 'JEP');
INSERT INTO all_currencies VALUES (114, 'Jordan', 'Jordanian dinar', 'JOD');
INSERT INTO all_currencies VALUES (115, 'Kazakhstan', 'Kazakhstani tenge', 'KZT');
INSERT INTO all_currencies VALUES (116, 'Kenya', 'Kenyan shilling', 'KES');
INSERT INTO all_currencies VALUES (117, 'Kiribati', 'Australian dollar', 'AUD');
INSERT INTO all_currencies VALUES (118, 'Kosovo', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (119, 'Kuwait', 'Kuwaiti dinar', 'KWD');
INSERT INTO all_currencies VALUES (120, 'Kyrgyzstan', 'Kyrgyzstani som', 'KGS');
INSERT INTO all_currencies VALUES (121, 'Laos', 'Lao kip', 'LAK');
INSERT INTO all_currencies VALUES (122, 'Latvia', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (123, 'Lebanon', 'Lebanese pound', 'LBP');
INSERT INTO all_currencies VALUES (124, 'Lesotho', 'Lesotho loti', 'LSL');
INSERT INTO all_currencies VALUES (125, 'Liberia', 'Liberian dollar', 'LRD');
INSERT INTO all_currencies VALUES (126, 'Libya', 'Libyan dinar', 'LYD');
INSERT INTO all_currencies VALUES (127, 'Liechtenstein', 'Swiss franc', 'CHF');
INSERT INTO all_currencies VALUES (128, 'Lithuania', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (129, 'Luxembourg', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (130, 'Macau (China)', 'Macanese pataca', 'MOP');
INSERT INTO all_currencies VALUES (131, 'Macedonia', 'Macedonian denar', 'MKD');
INSERT INTO all_currencies VALUES (132, 'Madagascar', 'Malagasy ariary', 'MGA');
INSERT INTO all_currencies VALUES (133, 'Malawi', 'Malawian kwacha', 'MWK');
INSERT INTO all_currencies VALUES (134, 'Malaysia', 'Malaysian ringgit', 'MYR');
INSERT INTO all_currencies VALUES (135, 'Maldives', 'Maldivian rufiyaa', 'MVR');
INSERT INTO all_currencies VALUES (136, 'Mali', 'West African CFA franc', 'XOF');
INSERT INTO all_currencies VALUES (137, 'Malta', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (138, 'Marshall Islands', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (139, 'Martinique (France)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (140, 'Mauritania', 'Mauritanian ouguiya', 'MRO');
INSERT INTO all_currencies VALUES (141, 'Mauritius', 'Mauritian rupee', 'MUR');
INSERT INTO all_currencies VALUES (142, 'Mayotte (France)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (143, 'Mexico', 'Mexican peso', 'MXN');
INSERT INTO all_currencies VALUES (144, 'Micronesia', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (145, 'Moldova', 'Moldovan leu', 'MDL');
INSERT INTO all_currencies VALUES (146, 'Monaco', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (147, 'Mongolia', 'Mongolian tugrik', 'MNT');
INSERT INTO all_currencies VALUES (148, 'Montenegro', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (149, 'Montserrat (UK)', 'East Caribbean dollar', 'XCD');
INSERT INTO all_currencies VALUES (150, 'Morocco', 'Moroccan dirham', 'MAD');
INSERT INTO all_currencies VALUES (151, 'Mozambique', 'Mozambican metical', 'MZN');
INSERT INTO all_currencies VALUES (152, 'Myanmar (Burma)', 'Myanmar kyat', 'MMK');
INSERT INTO all_currencies VALUES (153, 'Namibia', 'Namibian dollar', 'NAD');
INSERT INTO all_currencies VALUES (154, 'Nauru', 'Australian dollar', 'AUD');
INSERT INTO all_currencies VALUES (155, 'Nepal', 'Nepalese rupee', 'NPR');
INSERT INTO all_currencies VALUES (156, 'Netherlands', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (157, 'New Caledonia (France)', 'CFP franc', 'XPF');
INSERT INTO all_currencies VALUES (158, 'New Zealand', 'New Zealand dollar', 'NZD');
INSERT INTO all_currencies VALUES (159, 'Nicaragua', 'Nicaraguan cordoba', 'NIO');
INSERT INTO all_currencies VALUES (160, 'Niger', 'West African CFA franc', 'XOF');
INSERT INTO all_currencies VALUES (161, 'Nigeria', 'Nigerian naira', 'NGN');
INSERT INTO all_currencies VALUES (162, 'Niue (New Zealand)', 'New Zealand dollar', 'NZD');
INSERT INTO all_currencies VALUES (163, 'Norfolk Island (Australia)', 'Australian dollar', 'AUD');
INSERT INTO all_currencies VALUES (164, 'Northern Mariana Islands (USA)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (165, 'North Korea', 'North Korean won', 'KPW');
INSERT INTO all_currencies VALUES (166, 'Norway', 'Norwegian krone', 'NOK');
INSERT INTO all_currencies VALUES (167, 'Oman', 'Omani rial', 'OMR');
INSERT INTO all_currencies VALUES (168, 'Pakistan', 'Pakistani rupee', 'PKR');
INSERT INTO all_currencies VALUES (169, 'Palau', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (170, 'Palestine', 'Israeli new shekel', 'ILS');
INSERT INTO all_currencies VALUES (171, 'Panama', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (172, 'Papua New Guinea', 'Papua New Guinean kina', 'PGK');
INSERT INTO all_currencies VALUES (173, 'Paraguay', 'Paraguayan guarani', 'PYG');
INSERT INTO all_currencies VALUES (174, 'Peru', 'Peruvian sol', 'PEN');
INSERT INTO all_currencies VALUES (175, 'Philippines', 'Philippine peso', 'PHP');
INSERT INTO all_currencies VALUES (176, 'Pitcairn Islands (UK)', 'New Zealand dollar', 'NZD');
INSERT INTO all_currencies VALUES (177, 'Poland', 'Polish zloty', 'PLN');
INSERT INTO all_currencies VALUES (178, 'Portugal', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (179, 'Puerto Rico (USA)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (180, 'Qatar', 'Qatari riyal', 'QAR');
INSERT INTO all_currencies VALUES (181, 'Reunion (France)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (182, 'Romania', 'Romanian leu', 'RON');
INSERT INTO all_currencies VALUES (183, 'Russia', 'Russian ruble', 'RUB');
INSERT INTO all_currencies VALUES (184, 'Rwanda', 'Rwandan franc', 'RWF');
INSERT INTO all_currencies VALUES (185, 'Saba (Netherlands)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (186, 'Saint Barthelemy (France)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (187, 'Saint Helena (UK)', 'Saint Helena pound', 'SHP');
INSERT INTO all_currencies VALUES (188, 'Saint Kitts and Nevis', 'East Caribbean dollar', 'XCD');
INSERT INTO all_currencies VALUES (189, 'Saint Lucia', 'East Caribbean dollar', 'XCD');
INSERT INTO all_currencies VALUES (190, 'Saint Martin (France)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (191, 'Saint Pierre and Miquelon (France)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (192, 'Saint Vincent and the Grenadines', 'East Caribbean dollar', 'XCD');
INSERT INTO all_currencies VALUES (193, 'Samoa', 'Samoan tala', 'WST');
INSERT INTO all_currencies VALUES (194, 'San Marino', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (195, 'Sao Tome and Principe', 'Sao Tome and Principe dobra', 'STD');
INSERT INTO all_currencies VALUES (196, 'Saudi Arabia', 'Saudi Arabian riyal', 'SAR');
INSERT INTO all_currencies VALUES (197, 'Senegal', 'West African CFA franc', 'XOF');
INSERT INTO all_currencies VALUES (198, 'Serbia', 'Serbian dinar', 'RSD');
INSERT INTO all_currencies VALUES (199, 'Seychelles', 'Seychellois rupee', 'SCR');
INSERT INTO all_currencies VALUES (200, 'Sierra Leone', 'Sierra Leonean leone', 'SLL');
INSERT INTO all_currencies VALUES (201, 'Singapore', 'Singapore dollar', 'SGD');
INSERT INTO all_currencies VALUES (202, 'Sint Eustatius (Netherlands)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (203, 'Sint Maarten (Netherlands)', 'Netherlands Antillean guilder', 'ANG');
INSERT INTO all_currencies VALUES (204, 'Slovakia', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (205, 'Slovenia', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (206, 'Solomon Islands', 'Solomon Islands dollar', 'SBD');
INSERT INTO all_currencies VALUES (207, 'Somalia', 'Somali shilling', 'SOS');
INSERT INTO all_currencies VALUES (208, 'South Africa', 'South African rand', 'ZAR');
INSERT INTO all_currencies VALUES (209, 'South Georgia Island (UK)', 'Pound sterling', 'GBP');
INSERT INTO all_currencies VALUES (210, 'South Korea', 'South Korean won', 'KRW');
INSERT INTO all_currencies VALUES (211, 'South Sudan', 'South Sudanese pound', 'SSP');
INSERT INTO all_currencies VALUES (212, 'Spain', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (213, 'Sri Lanka', 'Sri Lankan rupee', 'LKR');
INSERT INTO all_currencies VALUES (214, 'Sudan', 'Sudanese pound', 'SDG');
INSERT INTO all_currencies VALUES (215, 'Suriname', 'Surinamese dollar', 'SRD');
INSERT INTO all_currencies VALUES (216, 'Svalbard and Jan Mayen (Norway)', 'Norwegian krone', 'NOK');
INSERT INTO all_currencies VALUES (217, 'Swaziland', 'Swazi lilangeni', 'SZL');
INSERT INTO all_currencies VALUES (218, 'Sweden', 'Swedish krona', 'SEK');
INSERT INTO all_currencies VALUES (219, 'Switzerland', 'Swiss franc', 'CHF');
INSERT INTO all_currencies VALUES (220, 'Syria', 'Syrian pound', 'SYP');
INSERT INTO all_currencies VALUES (221, 'Taiwan', 'New Taiwan dollar', 'TWD');
INSERT INTO all_currencies VALUES (222, 'Tajikistan', 'Tajikistani somoni', 'TJS');
INSERT INTO all_currencies VALUES (223, 'Tanzania', 'Tanzanian shilling', 'TZS');
INSERT INTO all_currencies VALUES (224, 'Thailand', 'Thai baht', 'THB');
INSERT INTO all_currencies VALUES (225, 'Timor-Leste', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (226, 'Togo', 'West African CFA franc', 'XOF');
INSERT INTO all_currencies VALUES (227, 'Tokelau (New Zealand)', 'New Zealand dollar', 'NZD');
INSERT INTO all_currencies VALUES (228, 'Tonga', 'Tongan pa’anga', 'TOP');
INSERT INTO all_currencies VALUES (229, 'Trinidad and Tobago', 'Trinidad and Tobago dollar', 'TTD');
INSERT INTO all_currencies VALUES (230, 'Tristan da Cunha (UK)', 'Pound sterling', 'GBP');
INSERT INTO all_currencies VALUES (231, 'Tunisia', 'Tunisian dinar', 'TND');
INSERT INTO all_currencies VALUES (232, 'Turkey', 'Turkish lira', 'TRY');
INSERT INTO all_currencies VALUES (233, 'Turkmenistan', 'Turkmen manat', 'TMT');
INSERT INTO all_currencies VALUES (234, 'Turks and Caicos Islands (UK)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (235, 'Tuvalu', 'Australian dollar', 'AUD');
INSERT INTO all_currencies VALUES (236, 'Uganda', 'Ugandan shilling', 'UGX');
INSERT INTO all_currencies VALUES (237, 'Ukraine', 'Ukrainian hryvnia', 'UAH');
INSERT INTO all_currencies VALUES (238, 'United Arab Emirates', 'UAE dirham', 'AED');
INSERT INTO all_currencies VALUES (239, 'United Kingdom', 'Pound sterling', 'GBP');
INSERT INTO all_currencies VALUES (240, 'United States of America', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (241, 'Uruguay', 'Uruguayan peso', 'UYU');
INSERT INTO all_currencies VALUES (242, 'US Virgin Islands (USA)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (243, 'Uzbekistan', 'Uzbekistani som', 'UZS');
INSERT INTO all_currencies VALUES (244, 'Vanuatu', 'Vanuatu vatu', 'VUV');
INSERT INTO all_currencies VALUES (245, 'Vatican City (Holy See)', 'European euro', 'EUR');
INSERT INTO all_currencies VALUES (246, 'Venezuela', 'Venezuelan bolivar', 'VEF');
INSERT INTO all_currencies VALUES (247, 'Vietnam', 'Vietnamese dong', 'VND');
INSERT INTO all_currencies VALUES (248, 'Wake Island (USA)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (249, 'Wallis and Futuna (France)', 'CFP franc', 'XPF');
INSERT INTO all_currencies VALUES (250, 'Yemen', 'Yemeni rial', 'YER');
INSERT INTO all_currencies VALUES (251, 'Zambia', 'Zambian kwacha', 'ZMW');
INSERT INTO all_currencies VALUES (252, 'Zimbabwe', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (253, 'UK (Dfid and other)', 'Pound sterling', 'GBP');
INSERT INTO all_currencies VALUES (254, 'Sweden (Sida and other)', 'Swedish krona', 'SEK');
INSERT INTO all_currencies VALUES (255, 'Norway (Norad and other)', 'Norwegian krone', 'NOK');
INSERT INTO all_currencies VALUES (256, 'US (USAID and other)', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (258, 'United Nations', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (259, 'World Bank', 'United States dollar', 'USD');
INSERT INTO all_currencies VALUES (257, 'European Union or Commission', 'European euro', 'EUR');


--
-- Name: all_currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivolejon
--

SELECT pg_catalog.setval('all_currencies_id_seq', 259, false);


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: public; Owner: ivolejon
--



--
-- Name: blog_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivolejon
--

SELECT pg_catalog.setval('blog_posts_id_seq', 2, false);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: ivolejon
--

INSERT INTO cache VALUES (15, 697, '{"currency_pairs_in_project": ["JPYAOA"], "currencies_in_project": {"out": [], "in": ["JPY"]}, "overallRiskIn": [1997.0, 5.0], "currency": "AOA", "averge_risk_in_payments": 5.2338150320081267, "plot_payments_in": [{"pair": "JPYAOA", "diagram": "data:image/png;base64,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uQx5zpo1a5ajBwHX8M4772jEiBHat2+fNmzYoP79+xvTLQMCAvTVV18pNzdXnTt31jXXXGM8HfWKK67QK6+8optuukm9e/d28F6guVRVVen5559XSUmJvL295efnp8DAQHl7e+vGG2/UM888o9tvv10BAQHGiUjdlcXHH39cTz/9tHFFEe6roKBAS5YsUWVlpfz8/HTllVeqW7du6tixo7799ltlZmYa7draWuOBUWVlZfrvf/+roUOHGvefwfVZLBZFRUXpo48+UlZWlk6ePKmQkBC1bt1aJpNJffr00dy5c3XrrbeqS5cukn7+tYjS0lJ5e3tr4MCBBGk3VlVVpdmzZ2vnzp3q0KGD/Pz81LVrV/n6+srHx0c7duzQf//7Xw0aNMioHZvNpquvvloffPCBunbtqmuvvdbRu4FLLCMjQ9HR0Tp8+LBqamrUo0cPdezYUZ6enho4cKDi4+PVr18/de3aVTabzaidFi1a6LHHHtMTTzzBr0xchgjSaBY//PCD5syZo9dff11PPvmksrKytGPHDvn4+Bhhunv37tq0aZPatm2rG2+8Ud99951atWolSZowYQJXpV1IQUGB7rnnHnl5eamqqkovvPCCxowZo4CAAEnSVVddpWPHjmnDhg363//9XyP8SGfumfb29tYtt9wiLy8vTmjd2IcffqjIyEj17t1b6enp+vLLLxUaGiofHx9JZ2Y5HD58WLt27dLIkSONL2JMJpMOHjyoPn366MYbb3TwXuBSWrx4scLDw7VixQrZbDb98Y9/1KRJk9SuXTvV1tbK19dX3333ndatW6f7779f33zzjTw9PeXl5aUePXpoxIgRvOe4MavVqsGDB6tt27by8PBQSkqKbDab+vbtK0lq06aNrrjiCq1du1aDBg2Sr6+v8Z5TUlKiDh06aMyYMfLy4tdl3YnFYtGf//xn/fnPf1a7du00c+ZMhYWFqXPnzjKZTGrdurXKy8v1xhtvKDo6WiaTybgi7efnp9tvv13XXXcdP793GTLZmDuJ3+jUqVNGEJak3/3ud5o/f74GDx6sI0eOaO3atTp58qRmz55tXFncunWrXnvtNR06dEht2rTRp59+yhQoF/TFF19o/vz52rBhgyTpscceU+vWrfXII48Y39SfOnVKYWFheu2119SiRQuVlpbq97//vSOHDSdR97E0c+ZM3XTTTbr33nt18OBBJSYm6ptvvtGqVauMddPS0vTBBx9owoQJqq6uVvfu3bka5EZ+eeL53XffKS4uTi+88IIRfOLi4vTTTz9p7dq19Z67cPPNN8vb21vt27fXkiVLZDabjb/J8xnc144dO5SUlKTly5dLkj744ANNmTJFX331lRGOrVarli5dKpvNpnvvvVeFhYUaO3YsvwXsxj7++GOtW7fOeJDqrFmz9O233+r//b//p169ehnrDRgwQA8//LCOHTumzp07a9KkSQ4aMZoLnxT4TV544QVFRUVp2bJl+s9//iNJuu2224yHKXTt2lW33HKLKioqtGPHDmO7jz76SGlpabrnnnuUmZnJyYqLKC0t1X/+8x/j/p6SkhJ17NhR3333nSRp+vTpKioqUlZWlnHfYqtWrTRx4kSFh4frgQce4FtYKDc3V2VlZcZDV77//nvjIYTdu3fXlClTlJubq08//dTYZsyYMTp9+rRGjhypZ555pt6Xe3Btq1at0h133KH4+HgdO3ZMHTp0kMlkMkKQJL3yyivasmWLdu3aZXzerFmzRl999ZV69eqltWvX1gvREve3upOvv/5aWVlZxmfV6dOn9fHHHxvL77jjDvXr10+PP/648VpAQIBuueUWJSQkaPTo0WrVqlW9EM31Kde3adMmbdy4Ud9++60kqaysTFdeeaXKy8slnbl4UFZWpuzs7Hr3Pffp00cxMTHKycnRmDFjHDJ2NC8+LWCXPXv26JZbblFRUZGmTZum3NxcrV69WpIUFBSk3bt3a8+ePZKk0NBQHT161LgaffToUV111VXav3+/nn/+eYftA5rXiy++qNtuu00zZszQQw89pB9++EHXX3+9du7cKavVKunnL1Y++OADeXp6qqamRps3b9aqVav07LPPqqCgQGPHjnXwnsBRjh8/rgcffFB/+MMfNH36dOOkNSoqSiUlJdq/f788PDzUtWtXTZw4Ue+8846x7Z///Ge9//77+vvf/65///vfuuaaaxy1G7hErFar7rrrLm3YsEHx8fEqLi7WfffdJ0maM2eOPvzwQx06dEiS1K5dO02ePNm4UlRbW6vc3FylpaVp9erVuvrqq3nAj5t67rnnNHz4cC1evFgjR45UWVmZIiIi1LNnT7366qvGeosWLdKnn35qfJ7985//VHR0tJ555hl9/fXXGj58eL2/y5fCris3N1djxozRwoULlZycrMmTJ6uoqEiDBw+WxWLR/v37JUm+vr4KDw/XO++8Iw8PD9XU1Oj1119XQUGBPvnkE73zzjv1ng+DyxdBGnZp27at/vCHP2jFihUaNmyYRo0apeLiYknSnXfeqYqKCm3dulUnT56Uv7+/WrZsqWPHjkk6E7SfeeYZ455pXN6qq6v10ksvKScnRzt37tQ777yj0tJS/fOf/9R1112n0NBQLVq0SKdPn5Z0Zorltm3bVFxcLE9PT3Xv3l3/+te/9OKLLzp4T+BIxcXFeuyxx2Q2m5Wdna0ZM2YoNzdXn332mfr27avg4GCtWbNGkuTp6SkfHx+1adNGVVVVkqSHHnpIpaWlioqKkqQGvwoA1/Pdd9/prrvu0ubNmzVo0CCtWLFCxcXF2rt3r3r27Klx48bp4YcfNtb38/NTaGiopDNXmxcuXKiwsDDV1tYyjdsNVVdXa9GiRTp06JC2b9+utWvXKjg4WDNnzpQkPfzww0pNTdU333wjSerQoYNCQ0NVUlIiSYqIiNC+fftU94ih6upqh+wHLq3Kykpt2rRJQ4YMUUZGhtavXy8PDw99/vnn6tKli0aOHKmFCxcasxtiY2N16NAhHT9+XJ6enoqMjNSnn36q8PBw42FjfOly+ePTA3bp3r27Jk+ebLR79uyp48eP69SpU7r22msVFRWl/fv3a+LEiYqJidGBAwd00003OXDEuFg8PT31+9//Xm+88YbatWunNm3aqHfv3sa0uJdeekn5+flasWKFvv/+ex08eFADBw7UlVdeKUnq3bu3/Pz8HLkLcAKdOnXSpEmT9Nxzz8lkMqlLly7q0aOHJBkP7snLyzNmvhw9elRVVVXGTJe6J/3Xncxyn6Lr69Wrl+68805JZ477119/rR49eqh79+6SpIULF6q8vFxPPfWUHnvsMb3++usNZirYbDZ5eHgQot2Ql5eXbrvtNi1YsMD4DLrjjjuM3xAfPny4evXqpYceekiStG/fPh05csS4CNCyZUtdc801qqmpkc1m48FibqJFixYaP368nnzySeNKstlsNmZh/u1vf1N5ebnmzp2rnTt3atGiRQoJCZG/v78kGbVWU1NT72FjuLzxfz/O6mxPD2zbtq3x35999pmuu+46477EiIgI3XrrrVq/fr1KS0v12muvqWXLlpdszLi4flkTJpNJvXv3lre3t2pqauTp6anvvvtO4eHhkqSrr75aL774otLS0nT33Xfr66+/1tNPP602bdo4chfgYI29r9RN67fZbGrbtq327t1rnGQMHjxYP/30k55//nm98cYbOn36tBGqf4mTWdfVWM3U/QKAl5eXamtrderUqXpTtFNSUrR37159/PHH+uSTT9S5c+d623MlyL2FhYVJ+vnBcjt37jS+jGvTpo2WLFmiBx54QPfee6+ys7P1wgsvqH379vX+Bl/aubZ9+/YZX9TWvQddd9119d47srOzNW3aNElnvmCZN2+etm/frqefflo+Pj5asGBBgzqhblwLZx5ooC4UNXWiUbdOfn6+Bg4cKOnMb+j5+fmpT58+io6OvlTDxSVQ9yHyy5qw2WzGbx7W1tbK09NTx48fV9euXY11IiIiFBERoX//+9/q168fYcfN/XIa7S/DUd2JhclkUkFBgVq2bKkBAwZIOvNeM2LECPXr109Hjx41pujCfZhMJh09elRBQUGNTsV+9913ddNNN6l169batWuXrr76agUFBSkwMFCjRo2S9PNnFtzLuY573U/mHTlyRE888YSkM+9T3t7eevPNN3X8+HF17tzZmAED95Cdna05c+bovvvu07hx4xqcA9U9ENNmsxmfSSdOnFBwcLB69eqlcePGGVeiuX3EtXFkIenMSW15ebn++te/Gg9LyMvL07vvvmu0f6nuTeGbb77RyZMn9Yc//EHz5s3jRMVF1X14fPDBB5oxY4ZOnDhRL1S3aNFCP/zwg6qqqjRo0CB98MEHmjlzpnF/fFhYGCEaxvvGyy+/rI0bNza6zvHjx3XrrbdKOvPgqAULFkg6M8Oh7oSF+6BdW92V5brpk99++63Cw8P11VdfNXpCWlhYqJtuuknTp0/X+PHjVVhY2ODv8dnkXmw2m2w2m3HcT506Zbz+SyaTybhXNTQ0VKmpqbr33ntVU1Mjb29vdevWTS1atOA9x03UHefAwEANGjRI6enpOnnypDw8POrVTsuWLVVSUqLOnTvL29tbTzzxhGbOnGncV0+Idh8cXUg682HSpk0b7d27VykpKXr99dd11113aevWrbr99tv16aefGg/3qVu/qKhIa9eu1d///ncNGDBAaWlp9X4vD67j2LFjevXVV5WUlKQJEybIx8enwTqfffaZrFarJkyYoJdeeklDhw5tMJ0S7uXXJ615eXl64IEHdOjQId18882NbvP555/rww8/1IgRI5SXl2c8ROyXCEWure7Es+5BhVVVVbrjjjsazJKqq69t27bpqaeeUps2bbRv3z4NGjSo0b8H91F39TA/P1/jxo1TTEyM9u3b1+i6BQUF+vDDDxUVFaXXXntNMTExTMd1U3XHuUOHDho1apSqq6v11ltvSWp4O8jmzZv13nvv6Z577lFVVZXmzJkjX1/feuvw3uP6uETk5n79bdkLL7ygRx99VNdcc422b9+uoKAg9ejRQ+vXr5efn59xv4gkdenSRfPmzdOUKVPq3TeNy1tjU+H27t2rRYsW6Z577lH//v3rLaub8vTdd9/p0KFDmjp1qmJiYi7lkOGEfv3eUl1drdzcXK1fv16fffaZAgMDVV1d3WCmwvbt29WhQwfFx8dr6NChks7+vAa4hrqrh3X1UllZqZdeekn79+/X+vXrddVVV+mzzz5TaWmpunbtWm+aZXl5uSZOnKiJEycqKChIEtO43dUv33Nqamq0bt06paamavz48dq5c6fmzp2radOmNfgSb9euXfLz89Pdd9+t2NhYRwwdTsBms+nUqVN69dVXVV5erhdffFEDBgxQRkaGhg8fru7duxuzF0wmk7y8vPS73/1Or776qoKDgyVxBdodec6qe34/3M4v/4fPyclRq1at1LVrV508eVLp6ekaM2aMAgICFBoaqldeeUUhISG67rrr6p3UDhw4kIeJuZBfnoC+8cYbysvLU7du3XT99dersLBQVVVVuu2224x7o6Wfv6Vt3769nn/+eeMhLnBPvw45zz33nKxWq9q3b6/bbrtN+/fv16FDhzRmzJh6Jxx1Jyj9+/fXX/7yF1177bXG65yYuK6amhp5eHjIZDLp8OHDKiwsVKdOndSvXz+9/fbb+s9//qOOHTvK19dXe/fuVXh4uPGeY7PZ1LJlS91222268soreRqum6uri9OnT+vQoUN6+eWX1bp1a7300ksaNGiQLBaLTp48qV69eqlVq1ZG7QUGBupPf/qTcUtJ3etwbX/605/0xRdfaOjQoSouLpaPj488PDxUXFysHTt2qGfPnrrpppuUnZ2tgwcPavDgwfUettqjRw/FxcXJ19e3wZeBcB8EaTdTXFyssrIydejQQSaTSceOHdOkSZP0j3/8Q1999ZX27t2rRx55RBs2bJDZbFbXrl3VunVrffHFF2rbtq1uvvlmrgy5mO3bt+vDDz9UWFiYPDw8lJmZqUmTJumHH35QaWmp1q9fr2HDhumGG27Q66+/LrPZrGuvvbZBHVx55ZU8kAVGXWRmZmrmzJmqqqpSWVmZXn75Zd1999267rrrlJqaql69eqlz5871gpT080+EVFdX13sdrqOiokK7du1S586d5eHhoYqKCj399NOaO3eu9u/fr7y8PI0aNUojRoxQeXm5pkyZop9++knXX3+9+vfvX++qUJ26k1jqxT3VXU1ctGiRtm3bpgkTJqi2tlZ79uxRWFiYOnbsqOrqamVmZsrHx0dms9kIPd7e3mrZsqXxXkQYcg+tW7fWo48+qoceekh33XWX2rdvr759+6pdu3Y6evSoduzYocjISFVXVysjI0MdOnQwvuA1mUzGBYVff4bBvfBu4SZqamr03HPPaejQoTp69Kjx2po1a3T//fdr+/btOnTokFJTU9WyZUvdd999WrBggWbPnq1Zs2Zp27ZtDe47w+Xv+++/18SJE/X444+roKBAkpSfn6+nn35aq1at+v/t3X9M1PUfwPHnMVZ4PwzHUbhVHIQLIy5Dbm6cooihQs7LRexS2RpNhz/Yyhhz/sBiFcUomZaTBAZya1rDLI2ROUXRBtmGs4EO1E2xJMRTryQO7t7fP/xy35m1pK/ro97r8eeHcXu9t8/e93nd6/N6v/B4PLS0tFBTU0NMTAzPP/88VVVV/PTTTxpHLu4W+/fvp7m5Ga/XG7jW0NBARkYGTz75JFVVVWzcuJH4+Hjq6uqw2WykpqZSWloK/HXvoRxOd3/q7+/HarWSmZnJr7/+CsB7772HwWDg+PHjWK1WKisr2b59OyaTCafTyZtvvklPTw+7du0C/rzvUB5ig0tBQQHFxcXAjQLBSGJjsVg4c+YMJ06cYO7cucTHxwd6XOfPnx/omx7pv4f/3TvSDhA8/H4/06dPJz09nTVr1rBhwwbKy8sBiI6OJiUlhe7ubg4fPkxaWhqPPfYYFy9eBG7da+S+CW5SkQ4CTU1N2O12nn32WTZv3kxiYiJw42Fky5YtDAwMUFpaSlRUFNu2bUOv15OUlMSuXbtwu91MmDCBiooKLBaLtgsRd8TIAT06nY6wsDA8Hg+XLl2itbWVl19+mUmTJuHxeHA4HGRmZuJwOKiqqiI5OZnMzExqa2uZPn16oHIogpfP58PhcPD5559z+fJlZs6cCcDEiRNpbm7GaDQyd+5c4MaZCoWFhbz22muYzWaOHz+OzWbDZDJpuQTxL9Pr9fzwww90d3dz5coVMjIySE5O5plnniE3N5fe3l5mzJhBW1sbVquVhx9+mIkTJ2K1Wvnxxx9JTU1Fr9drvQyhsb+rJra1tQWqic3NzZhMJp544glsNhvPPfec/FAn0Ol0ZGRksHjxYlauXElnZydnz57FbrcTFhZGdXU1nZ2dZGdnM3XqVJKSkrQOWdyFJJEOAv39/WzatIlDhw4xduxYvv32W06cOEF8fDxHjhxh3759bNy4kfz8fPR6PXv37g30qM2ePZt58+ZhMBi0Xoa4AxobGzUw224AAAaESURBVElPT8dgMJCcnIzX66WtrQ2n00ljYyNGoxGr1cq+ffsYHBykpKSE2NhYiouLeeCBB5g1axZOp5OoqCitlyLuAoODg7S3t7No0SJqa2vxeDxERERgNpt55JFH+Oijj5g1axZms5mxY8dy7Ngx5s2bx/jx43E4HJJEB4Genh6KioowGo1YLBaGhoa4ePEi6enpVFdXM23aNKKjo/nqq6/o6enh008/JSUlhSVLlmA2m0lMTMRgMHD06FE6OjrIzc3VeklCY36/n5iYGFpbW2ltbSU/P5/S0lJeffVVwsPD8Xq9NDU18eijj5KSkkJ7ezsmk4nExMTAnjPSHiCCk06nw+fzYTAY+O233/jkk08oLy9n0aJFpKSksHXrVmJjY1m6dCmPP/544CwgOfhS/JG82h0EpkyZQlZWFg6Hg1WrVvHGG28wPDwMwOTJk0lKSqKjo4O+vj5yc3MpKyvj0qVLWK3WwEmE4v4QGRlJT08PdXV17NixA4/Hg8lk4tChQ5SUlPDOO+8AN+ZCX758mc2bN/PKK6/gdDrJz88nNDRU+qBFwJgxY/D7/Vy4cIEvv/wSn89HUVERfX19ZGRkYLPZyM7O5v3338dmsxEXF4fBYAi8CjcyL1jcv1paWti6dStvv/023333HSEhIfz88894vV4KCwtZtWoVcOOAqOvXr3Pq1Cm2bNlCWloadrudcePGMTw8zLZt226ZGCCC00giU1NTQ21tLZGRkVgsFsrKygBISEigt7eXiooKQkNDWbt2LU6n86bPkD5oMfI9VFpaysmTJ+nr66O+vp6PP/4YvV5PeXn5LYenShItbqFEUHC73SosLEwtWbLkpuvXr19XTU1NasGCBcput6vi4mJtAhT/mry8PGW1WtUXX3yhXnjhBdXV1aXy8vKU2+1Ws2fPVhUVFUopperq6lRaWpqqr6/XOGJxN/L7/Uoppb755hu1fPlypZRSe/bsUTqdTuXk5KiOjg515coVFR0drd5991118uRJLcMVGkpPT1c2m01VVlaqdevWqdOnT6ucnBzV29urJk2apL7++mt14cIFtXr1ahUXF6eWLl2q3G73TZ/x+++/axS9uBsNDw8rpZQqKipSdrtddXR0KKPRqA4cOKCWLVumXn/9ddXa2nrT/4zsWUKM8Pl8Siml6uvrlcViUUrdfJ+M/F2Iv6JT6r8Nk+K+t27dOg4ePMjhw4cZGhoiNDQ08Ova0NAQg4ODMg86CLjdbqKioujs7KS6upojR44QEhLC/v37aWlpYc6cOXR3d8vr2+K27N69m+3bt+P1ejl9+jSFhYX09/dTU1ODy+WisbGRlpYW9uzZE6hASzUouHz//fekpqZy/vx58vLyiIyMZGBgAJfLRV1dHSUlJXR1dQFw7ty5wDzoPzudW4g/MpvNNDQ04Ha7cblcREdHB6rTQvydkRGL06ZNY8WKFeTk5MjeI26bJNJBJioqioqKCnJychgeHpYDN4JUUVERbW1tHDhwgN27d3Pw4EFKSkowGo1UVlaSnZ1NeHi4fImIv+XxeIiJicHpdLJp0ybgxiFkx44dY8qUKfj9fhISEvjss894+umnNY5WaCUrK4sJEyZQVlbGhg0baG9vp6GhgQcffBCn08maNWtISEhAp9PJTFZxW0YSIJfLxdq1azl79uxNPawyg17crmvXrrFw4ULWr1+PzWbTOhxxD5FEOsi4XC4WL14svYkicBjUiy++yNWrV3nooYe0DkncowoKCpgxYwYLFizA5/PdMg5kYGCAMWPGaBSduBv09/czfvx42tvbeeqpp+ju7iYuLk7rsMQ9TqqJ4k7Yu3cvR48e5a233pJxVmJUpBwZZBYuXMgvv/wiA+QFH3zwAS+99BJ+v1+SaPGPKaU4f/48fr8fv9//pw8hkkSLiIgICgsLmT9/Pl1dXbck0VI9FP9ESEgI165dIzw8nNjY2MA1IUYjMzOTrKwsrcMQ9yCpSAsRxD788EMKCgrkRxXxf3G73YwbN07rMMQ9YObMmezcuZOIiAjZc8QdIdVEIYRWJJEWQghxRyiZsSmE+JfJviOE0Iq8/yKEEOKOkIdZcTt8Pp/WIYj7iOw7QgitSEVaCCGEEEIIIYQYBalICyGEEEIIIYQQoyCJtBBCCCGEEEIIMQqSSAshhBBCCCGEEKMgibQQQgghhBBCCDEKkkgLIYQQQgghhBCjIIm0EEIIIYQQQggxCv8BWXV3IIztyYsAAAAASUVORK5CYII=", "direction": "FUND", "outcome_table": "[{\"date\":\"2017-02-08T00:00:00.000Z\",\"pair\":\"JPYAOA\",\"budget\":7298.305,\"outcome\":7645.2924033254,\"pct\":4.7406542112,\"risk\":null},{\"date\":\"2017-03-16T00:00:00.000Z\",\"pair\":\"JPYAOA\",\"budget\":7298.305,\"outcome\":7556.9133268688,\"pct\":3.5297007575,\"risk\":null},{\"date\":\"2017-04-19T00:00:00.000Z\",\"pair\":\"JPYAOA\",\"budget\":7298.305,\"outcome\":7855.7085815888,\"pct\":7.6237370402,\"risk\":null},{\"date\":\"2017-05-25T00:00:00.000Z\",\"pair\":\"JPYAOA\",\"budget\":7298.305,\"outcome\":7667.2248249041,\"pct\":5.0411681192,\"risk\":null},{\"date\":\"2017-06-22T00:00:00.000Z\",\"pair\":\"JPYAOA\",\"budget\":7298.305,\"outcome\":7298.305,\"pct\":null,\"risk\":null},{\"date\":\"\",\"pair\":\"\",\"budget\":36491.525,\"outcome\":38023.4441366872,\"pct\":4.1980134749,\"risk\":\"\"}]", "risk_table": null}], "plot_exchangeRates": ["data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAVYAAAEWCAYAAAA997/vAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALiAAAC4gB5Y4pSQAAIABJREFUeJzs3Xd8U2X7P/DPSZN0TzopLZSyZ9myN4oCMosgU1RARJkuRAHFifP7iPJTEAQVwcGSB1EQZDwySlkFLNBSSvfOaLOv3x9pjg1Noehp0sL1fr18SXJOTq6cJp/c577vcyIQEYExxphkZK4ugDHG7jYcrIwxJjEOVsYYkxgHK2OMSYyDlTHGJMbByhhjEuNgrWOmT5+OBQsWuLoM5iJvvfUWXnjhBVeXIblvvvkGkyZNcnUZkuFgrSH9+vWDh4cH/Pz84OfnB19fX4SGhrq6rFpv+fLlGD169L/aRv/+/fHxxx8DANLS0iCTycS/Q4MGDTBnzhzodDosW7YMXbp0gcViER+r0+nQsmVL8fEAcPToUcTFxdk9x2OPPQaZTIa//vqr0vNrNBrMnz8f0dHR8Pb2RtOmTfHaa6/BbDZXWvePP/6ATCbDiy++eNvXpVKp8MEHH+D555+v9r6w+eqrr9CtWzcEBAQgMjISjz/+OEpKSqpcPykpCQ888ABCQkIgk8mgUqnsls+ePRu+vr7ifvX29oZMJsPp06fFx7dv3x7BwcF46aWXKj32yy+/tLtvwoQJOHHiBM6cOXPHr6024mCtIYIg4J133oFKpYJKpYJarUZubq6ry3Ipo9HokucVBAEZGRlQqVQ4evQofv/9d6xcuRJLly4FALzxxhviui+99BLq16+PZ555Rrxv586dePjhh8XbGo0GW7duRb169bB27Vq75zKZTBgyZAjOnDmDffv2QaPRYMuWLfj+++8xYcKESrWtW7cO9erVw1dffWUX8I5s3LgRffv2RWBgoMPly5cvx4oVKxwuKysrw7vvvovc3FwkJSUhKysLc+bMqfK5FAoFxo8fjw0bNkAQhErLP/30U6jVavH9/dprr6F58+biF9Dzzz+POXPmIDU1Fd999x0SExMBAEeOHMHly5cxffp0u+0JgoCJEyfik08+ueU+qDOI1Yh+/frRRx995HDZqVOnyN/fn5KSkoiIqLCwkKKjo+mrr74iIiKLxUIfffQRtWjRgnx9falZs2b0yy+/EBHRtGnT6IknnqBHHnmEfH19qUWLFnTgwAFx25s2baI2bdqQr68vNWzYkJYuXWr33IIg0GeffUZt2rQhf39/evjhh0mlUonLDx48SG3btiU/Pz8aM2YMzZgxg6ZNmyYuv3r1Kg0fPpxCQkKoUaNG9Prrr1e5D9avX09xcXH06quvUnh4OI0dO5Y0Gg09/PDDFBoaSgEBAdSnTx86c+YMERFt27aNlEolKRQK8vHxIV9fX3Fbtv0RGBhI/fv3p4sXL1Zr31+7do1kMhmVlJSIyxctWkQjRowgIqKkpCTy9/enc+fO0aFDhygwMJCuX79ut73WrVvTyZMnxduff/45hYeH09q1ayksLIxMJpO47Msvv6Tg4GBSq9V227h69SoplUo6ePCgeJ9KpSJvb2/avHkz+fr60o4dO6p8TUREQ4YMoU8//bTK5cuWLaPly5ffchs2O3bsoIYNG952PUf7z5FWrVrRu+++K95u2bIlJScnExHRI488Qlu3biWj0UidOnWiy5cvO9zGoUOHKCIiolr113YcrDXkVsFKRPTBBx9Q27ZtqaysjEaNGkWTJ08Wl3300UcUGxtLiYmJRESUnp5Oly5dIiJrsPr7+9Mff/xBFouFXn/9dWrUqJH42D179ohv3DNnzlB4eDh988034nJBEGjgwIGUn59PJSUl1LFjR/HDWFRURAEBAbR+/Xoym820e/du8vDwoOnTpxMRUWlpKTVq1Ig+/vhjMplMlJ6eTm3btqV169Y5fI3r168nuVxOK1euJKPRSGVlZaRSqWjLli1UVlZGer2e5s2bR82bNxcfs2zZMho1apTddj755BOKi4ujq1evktlspv/7v/+jJk2akNFovO2+vzkYrl69Si1atLALoFWrVlFcXBw1bdq00mtJSUmhyMhIu/u6d+9OixYtIo1GQz4+PvTTTz+JyyZMmEBTp051WFfv3r1pyZIl4u3PPvuMwsPDyWw209SpU+nhhx92+Dib0NBQ+v3336tcfifBumDBAho+fPht16tOsB49epSUSiXl5uaK940fP54++eQTKioqombNmtHFixdp5cqVtGLFiiq3U1BQQIIgUHZ2drVeQ23GwVpD+vXrR56enhQYGCj+N2TIELt1HnzwQWrfvj01adLEroXTsmVL2rRpk8PtTps2jSZMmCDezsjIIJlMRoWFhQ7XnzdvHj355JPibUEQaO/eveLtlStXiq23jRs3Utu2be0e/9BDD4nBunXrVurYsaPd8s8//5wGDhzo8LnXr19PwcHBDpfZFBUVkSAIlJmZSUSOg7V169aVWnORkZF0+PBhh9u8OVgFQaCAgAAKCgqi2NhYWrhwIRkMBnF9i8VCXbt2pcGDB1fa1ocffkgzZ84UbyclJZFMJqNz584REdHkyZNp2LBh4vLBgwfTiy++6LCu8ePH2/0tunbtSgsXLiQion379pFCobhlqCgUCkpISKhyeXWDdffu3RQQECAeMd1KdYJ1xowZNHr0aLv70tPTafjw4dShQwdavXo1XblyhTp16kRarZaefvpp6tu3Lz3zzDN2rX2j0UiCINzyaKSukLu6K+Ju9tZbb9n11d1s5syZGDVqFFatWgUfHx/x/rS0NDRp0qTKx4WHh4v/9vb2BhFBrVYjMDAQv/zyC1asWIHk5GQYjUYYDAYMHTrU7vFhYWF2j1er1QCAzMxMREVF2a0bHR0NnU4HALh27RrOnTuHoKAgAABZv5gRHR1dZa2RkZF2t3U6HRYsWID//ve/KCoqgiAIEAQB+fn5iIiIcLiNa9euYdKkSXBzcxOf12g04saNG1U+b0WCIOD69evw9fWtcnmrVq0c9l3u3LnTbhbG2rVr0b59e7Rp0wYAMGXKFAwdOhRZWVmIiIhAcHAwMjMzHT5PZmam+Hc9d+4cTpw4gc8//xyAdbAzIiICGzZswHPPPefw8YGBgZUGkdq3b4/09HQA1n5UQRDw4YcfgoggCAIKCwvt1t+/fz8mT56Mn376Ca1atXL4PHdCq9Viy5Yt+O677+zub9CgAXbs2CHeHjJkCD766CNs3LgRZWVlOHDgAKZPn45169bhiSeeAGAdnBMEoco+5LqEB69cpLi4GHPnzsWTTz6JN954wy4kGjVqhCtXrtzxNo1GI8aMGYPZs2cjKysLxcXFmDlzJqiaFzCrX7+++CG1uX79uvjvqKgodO7cGYWFhSgsLERRURGKi4tx9uzZKrcpk9m/xd577z0kJibi6NGjKC4uxrVr18SAdrQ+YA33rVu32j2vRqPB+PHjq/W6AFR7H1RUUlKCU6dOYdCgQQCsA1ObNm1CcnIyIiIiEBERgUmTJsFisWD9+vUAgMGDB2P37t3QaDR220pNTcWxY8cwZMgQANaAFgQBDzzwACIiIhAZGYm8vDysW7euynri4uJw6dIlu/vOnDkj7pcXXngBL7zwgriPHIVqfHw8Nm/ejH79+t3x/nDk22+/hb+/Px544IEq1/nqq68QExODnj174syZM+jWrRsAoHv37nazAC5cuICwsDC7L/66ioPVRWbMmIF+/frh008/xbRp0zBx4kTxw//kk09i+fLl4psuPT290gfKEb1eD71ej6CgIMjlchw7dgzffPNNtWt66KGHkJ6ejq+++gpmsxl79uzB/v37xeXDhg1DTk4OPv30U+j1elgsFiQnJ+PgwYPVfg6VSgUPDw/4+/tDo9HgxRdftBt1DgsLQ1pamt3UpKeeegpLly5FcnKyuI0dO3ZAq9VW6zn/SagCwJ49e9C3b18olUoAwPbt26FWq5GYmIgzZ87gzJkzOHv2LF5++WVxdsCkSZMQGxuLkSNHIjk5GRaLBadOncLo0aMxYsQI9OnTBwaDAV9//TXefvttnD59WtzWn3/+iZSUFBw+fNhhPcOHD7f7e9yJAwcOYOzYsdi4caP4RXE7er0eOp0ORASdTge9Xl9pnXXr1mH69OkOZw4AQEFBAVatWoV3330XANC4cWPs378fJpMJ+/fvR2xsrLju/v378dBDD/2DV1cLuaYH4u7Xr18/8vDwIF9fX/L19RVHuQsLC2nNmjUUGxsr9qsajUbq2rWr2LFvsVjo/fffp2bNmpGPjw81b95c7BedNm0azZ8/X3ye4uJikslklJaWRkREa9asofr164sj/s8884xdn6VMJhNH4YmsfYj9+/cXbx84cECcVTBmzBiaOnUqzZo1S1yekpJCY8aMofDwcAoMDKTOnTvTd99953AfrF+/njp06GB3X3Z2Ng0YMIB8fHwoJiaGNm3aZFdTYWEh9evXT+yXtvn000+pdevW5O/vTw0aNKBHHnmENBpNlfv+448/JqLqj2rfvF+JiB599FG7wawHH3yQZsyYUemx+fn55OXlJQ4sqdVqmjdvHkVGRpKnpyfFxsbS8uXLxf7ELVu2UEBAgMP6x40bV+XgV3FxMYWFhVXZn36rPtb+/fuTXC6v9H60OXTokN1tW9+0TCYjmUwm/tv2PiMiunDhArm5uVFqaqrD5ySy7tctW7aIt1UqFT344IMUEBBAI0aMIK1WS0TW93yzZs3EAdu6TiDiC12zqj3wwAPo27dvtSaw1xadOnXCokWLHM4brS6z2YyIiAgkJSUhJCREwur+nbfffhvFxcV48803XV2KpL799lvs3r0bGzdudHUpkuBgZXZ+/fVXdOzYEQEBAdi6dSumTp2Ks2fPonnz5q4urVrOnj2Lbt264ezZs2jatOk/3k5eXh62bNlyy0n0jFWFZwUwOwkJCXj00UdRVlaGmJgYbN68uc6E6qxZs7B792688847/ypUASAkJIRDlf1j3GJljDGJ8awAxhiTWJ3rCpi/8Dksfv6l26/IGGM1qH5oQJXL6lyLNSOjemfbMMaYq9S5YGWMsdqOg5UxxiTGwcoYYxLjYGWMMYlxsDLGmMQ4WBljTGIcrIwxJjEOVsYYkxgHK2OMSYyDlTHGJMbByhhjEuNgZYwxiXGwMsaYxDhYGWNMYk4J1nnz5iEqKkr8GeGb5eXloUOHDujYsSM6dOiAiIgIjBkzxhmlMcaY5JwSrPHx8UhISKhyeUhICBITE3Hq1CkkJiaiTZs2iI+Pd0ZpjDEmOaf8gkCPHj2qvW5mZiYSEhKwc+fOGqyIMcZqTq3rY928eTNGjhwJDw8PV5fCGGP/SK37zatNmzZh1apVVS7PycnGmytXiLd79e6L3n36OqM0xhirlloVrBcvXkR+fj4GDBhQ5TphYeF4cckrTqyKMcbujFO7Aojolss3btyIiRMnOqkaxhirGU4J1lmzZiEqKgoWiwXR0dGYO3cuEhISMGzYMLv1vv32W0yaNMkZJTHGWI1xSlfAZ5995vD+Xbt22d1OTU11RjmMMVajat2sAMYYq+s4WBljTGIcrIwxJjEOVsYYkxgHK2OMSYyDlTHGJMbByhhjEuNgZYwxiXGwMsaYxDhYGWNMYhysjDEmMQ5WxhiTGAcrY4xJjIOVMcYkxsHKGGMS42BljDGJcbAyxpjEOFgZY0xiHKyMMSYxDlbGGJMYBytjjEmMg5UxxiTGwcoYYxLjYGWMMYlxsDLGmMQ4WBljTGIcrIwxJjEOVsYYk5hTgnXevHmIioqCUqmscp3S0lJMmzYNLVq0QKtWrfD55587ozTGGJOcU4I1Pj4eCQkJt1xn4cKFaNu2LS5duoQLFy5g1KhRziiNMcYkJ3fGk/To0eOWyzUaDXbu3Inr16+L9wUHB9d0WYwxViNqRR9rSkoKQkNDMWfOHHTq1AljxoyxC1nGGKtLakWwmkwmnD59WuwyGDZsGB577DFXl8UYY/+IQETkrCdTKpUwGAyV7s/NzUWbNm2Qm5sLACgrK0NkZCQKCwsrrdu3/wC0axcn3u7Vuy969+lbc0UzxpgD9UMDqlzmlD5Wm6oyPDQ0FK1bt0ZiYiI6dOiAvXv3onXr1g7XDQsLx4tLXqnJMhlj7F9xSlfArFmzEBUVBYvFgujoaMydO1c85LdZvXo15syZg7i4OHzwwQf44osvnFEaY4xJzqldAVKIf2QiPvx4tavLYIzd427VFVArBq8YY+xuwsHKGGMS42BljDGJcbAyxpjEOFgZY0xiHKyMMSYxDlbGGJMYBytjjEmMg5UxxiTGwcoYYxLjYGWMMYlxsDLGmMQ4WBljTGIcrIwxJjEOVsYYkxgHK2OMSYyDlTHGJMbByhhjEuNgZYwxiXGwMsaYxDhYGWNMYhysjDEmMQ5WxhiTGAcrYzfRmowoMehdXQarw+SuLoCx2kBjNOBiSRG0JiPOFRVABgHTm7aEAAFuMgFKmZurS2R1CAcrYwD2Z91AikYl3jaDkFRciISCXLjL3BAf0xTecoULK2R1CXcFsHua1mhEsUGPFI0KXnI5BkVE4f760QCA/+VmQ2c2o8RowPbrKTBZLC6ultUV3GJl96wLxYXYm3kd7uWH+e0Cg9EmsB4sRDiUk4lSswkAEOzugVxdGc4VFaCZfwCySrVQyGSI8vaFTBBc+RJYLcUtVnZPKjOZ8EdOBgBAbzFDBgFtA+sBAGSCgCZ+/gCAGB8/3B/ZEABwsiAXG69ewq4b1/DT9RRcKC50TfGs1nNKsM6bNw9RUVFQKpVVrtOoUSO0bdsWHTp0QMeOHZGUlOSM0tg96n951sP81gFB6BNWH/dHRtv1oXasF4rGPn7oFVYfIR6eiPHxg9ZkhM5sRrinFwDgqrrEVeU71cXiQvyYdgV6sxlEBDNVr0tEZTDghlZTw9XVTk7pCoiPj8dLL72EBg0aVLmOTCbD3r17ERER4YyS2D0uVWMNxV6h9eEpr/wxCFC6Y0R0Y/F2t5AwpGlUiPH1x9DIhvh/yeeRrlWjxKBHsUGPhj5+Tqvd2U4W5KJAr0OqRoVzRfnQmox4JKYZPNyqjg8iwk/Xr6LYoMeMpq3go6i6UXU3ckqw9ujR47brEBEsPDjAnKDMZILaaESQ0t1hqDoS7umNx5u1hqebHIIgINrbF1fUJfg65S8YLBZMatwcwR6eNVy585QY9Diam432QcEo0OsAAOeK8pFRqgUA7Mu6gQ5BIQhyd3cYsNc0KhSVzwXO05VxsLrSsGHDIAgCHnroISxbtgxubjx3kEkvV1cKAAgtP6SvLq8KXQWNfPxwRV0CQ3ljILus9K4K1tOF+fhLVYTr2r+noNlCFQAuq4pxWVWMUA9PPBLTTBzEu1BciD/zsu22la/XIcbX3zmF1xK1ZvDq8OHDSExMxJEjR3Dp0iWsWrXK1SWxWsJksSBfVybZ9nLKtxX6L4IwxscPMgiwzQmwhfXdIqPU2jdaZjYDsA+KfuGRiPL2ga9CgVxdmTiIl68rw76sdKiMBqiMBsjK906+TufU2muDWtNijYyMBAB4enri8ccfx+rVqx2ul5OTjTdXrhBv9+rdF7379HVKjcz5DGYz1l25AJ3ZjCB3D/QJq49G1ejPTFWXwF/pjiB3j0rLcsvKW6wed9ZirchbocD4mKYwWiz4Pu0KciUMflfTm83Iq/B6BACtAurhfHEBfOQKtA8MRlxQCLLLtNicehkHsm/gRH4ONCYjzEToUi8UCjc3BLt7YEd6Kgr0d8++qS6nBisROby/tLQUZrMZvr6+MJvN+OGHH9CuXTuH64aFhePFJa/UZJmsliAi7LqRCl15q6lQr8OhnMzbBus1jQrb01PhI1dgapOWUMjsD8xsIRjyLw/dwzy9QERQymTI15XBQnRXzGvNLNWCAER7+yJPV4owT2+0CgjE+eICNPMLgFD+GsM9vdE+MBhnivJRYjTAw80NLX0D0CM0QlzH002OQr0eRosFerMZSpkMynugi88pwTpr1iz8/PPPsFgsiI6OxsMPP4xp06bh1Vdfxa5du5CTk4PRo0dbp3KYzejevTuWLFnijNJYLZarK8P1m6br+N5iEORITiYKDXqx20BjMiKxIA9dQ8LEdUpNJqiMBgQq3eEuwQdcEASEenjhRqkGRQY96jloIdcFFiKkazUo1OvEboAmfv54qEEjuAkC5DIZJse2gP9N+79/RAP0Cbcebbo5+FIJdvdAeqkGn1w6K64zuH40WvgH1vArci2nBOtnn33m8P5du3YBAGJiYpCYmOiMUlgtRkTIKtMiUOkBT7kcyapiAIAMAiywHu24V3ExlOyyUpwoyBVvh3t6IbesDCfyc+All6NlQBDcBAGJhXkAgChvH8nqDvHwxI1SDXLLSmtVsB7IvoF0rQbjY5re8iIyRISd6alIrXCtBABo4OVj9+VT1WtzFKg2QeXBCgCBSncUG/T4JSMNCpkMsXfxgFat6WNl7EJJIX7NTIe/QonxMc2QrCoCAEyKbY50rRq/Z2fgL1UR6AZhaGRD8XATgDgS3SogCESEHqERuFRShCO5WfgtKx2HczPR2McfyapiuAkCugSHOazhn7ANgh3Lz4bBYoG/UoloJ53uelVdgquqEvQJr48UtQqZpRrIZTL4K9xxujAfAHBDq0FjByFmIUKhXodzRQVI1agQoFSipX8QsstK4ekmR6DS/V/XF+HlhTNF1lCdFNscl1Ul2JORhiO5WWjs42f3NyQilJpNMFosMFkskAkCApXuduvUFRysrFbIKtXi96wbAIASowHfpPwFjcmI+p7eCHL3gMFiFtdNVhWjU71Q6Mxm5OpKkasrwzWNCn4KJQZGNICbYO1T7RIchihvHxzLy0GaRo0LJdbR6071Qm7ZpXCnmvoF4FJJEdK0avyebX0NLf0DMaR+NC6WFOF4fg56hUagiV+AZM9p80d2BkqMBvylKoK5ijGM9ArBWmYyYdeNVGhNJpSajOJ0MaVMhhFRjR0O9v0bzfwCoZS5IcrbB26CDC38A5FYkIscXRkulhThsqoYaqMBZWYzykwm8cjE5v760WgZECRpTc7Awcpc7s+8bBzLywYB6BYchnStBpll1jmTbcrP3w/x8EKPkAikaVXIKNXil4w0FFa4GLWHmxsGVAhVm3BPbzwc3Rh6sxmpmhIU6vXoXC9U0vrlMhlGRjdGmlaN7LJSnC8qwMWSIqSoVdCXfyH8np2BRj5+kMukm+FIRCgxGgAAZiJ4urmhf3gDa99yYR7CPb1xWVWMdK0ax/OyYQFQoNeJ81HlggwNvHwQ7umFFv6BkocqYL3uws2t5VYBQcjJzsDezOvifQKsA10+CgXcZW4QBOC6VoMTBblo4R9Y51qtHKy1kMFsht5ilrRVVVuVmUz4My8bCpkMvULro11gPdwXAqiMBrgJMvgorJPy3QQBXUPC0LFeCNZdviCG6n0h4QhUuiPW1/+WoeXu5oYW/jXX8hEEAY18/NDIxw8t/AOxKz0VRQY9ApTu8HKTI7NMi9OF+egcLF2o20I12N0DbQLrIcbHD/7lh+8dy788vrx8Afl6HfIrTNr3kSvwaOPm8HBzc0lgNfcPxB85mTAToamvPwbWjyoPU/taNqcmI7usFGladbWm2NUmHKy10O6MNKRr1Xi0cXNcVhXDUy5Hu8BgV5dVI65r1QCA5n4BaB/092v0r6J/Ty6ToVO9UBzKzUTneqG4LyTcKXXeiQClOybFthBvF+p12Hj1Eo7kZqLEqEe/8Aa3HPCpLtvshwgvb8QFhThcJ8rbByXlE/jDPLyQry/DoPpR1T6VtyZ4uMnRLTgMOboyDImMhqKKgbVO9ULx841r+F9uttiVoDYaYCGq8v1RW3Cw1jJaoxHXykdnd5a3euSCgDYB9SQdDLmqLkFSUQEAwFMuR4yPX430Ad6OLVijvX2r/ZiO9UIQ5e3zr+ehOkuQuwcG14/GHzkZOFdUgBB3T7QL+vdflPnl5/AHu1e9H2J8/XG+uBDtAuthQEQUjBZzlUHmTF2r8YUY6+uPMA8v5OhKsS/zBjrWC8GWa5dhIUJ8o6YI9fSCpbxfubbNH+ZgrWUuq4vFf9suYmEiQrFBL1kfmMFixq+Z18WJ9wBwsbgI05t6ObX7gYjEYI26g2AVBOGOz/N3tVYBQfBXKrH12hVcKimSJljFEx2qfl809vHDo42bI7j8vVMbQrW6ZIKA4VEx+DY1GRdKCnGxpFAc2tqRnooobx+kadQgEKbEtnRpK/xmteZaAfeydK0aJ/JzcKogF0nlh21Nyzv8bedbS3nK5JnCfOjMZjT1C8DExs3QNrAeLCCcKsiT7DluhYhgsliQplVDbTQi1MOzVn0oakp9T2/4KZTILNPiQPYN/JyeiiL93+fRV3VmYlXyy08VrXeLFqsgCAjx8Kxzgz82PgoFxjSMRaSXNwjWL4rmfoHQmIy4WFKEUrMJZWYz0su/oGuLu//d7CSZpdoqL6FWkcliwbbrKYj08ka3kHAczsnEqUL7QPNVKDC0QSO00KigNRqxP/sG8nSl1TpbhYiQqyuDmSzwUygrXa7NaLHgVEEuBAA9QsIR6O6B7iEKXCwuxLmiAnQJDrW7ipOULquK8WvmdXGKj83dPFG8IkEQ0MI/EMfzc8Q5plfUJZALMpjIAmX5jxZW5yQDg9mMYoMBfgqlJGeQ1WZB7h4Y27AJCvQ6BLl7QADQPigYJosFBXodDuZk4EapBs1q0dlcHKzVkK5V43h+DoZGNoKXg5ZVVqkWW65dRgv/QDxQ/jMeVW9LgxulGmSWakAAThXmwV3mhq4hYbCUh2JzvwDIBAGxvv7ixTDyqtliPZGfg6MVRoBDPDwxIipGPMS/rCpGWXlrNbD8A+wlV6BNYD2cLszHzzeuYVR0rKTTggBr4B/NzYLBYoGvQgG5IIO3XIEmfv537cCcIy39g3CqIA++CgWa+QXgXFEBLCDI4YYysxmHczLxcIULbFfFdjZTeB3rEvmnBEGwuyxjfS9vANazwQ7mZCBdq8GJ/BxYiNAlOOyO+lwLhKsZAAAgAElEQVTzdGXwVyol/YlzDtZqSCzIQ7pWg1R1CVqXz6usyPYTHalq1W0vxGG7cr0FwPH8HADAmIaxVfYZBrl7wE0QkFNWhsuqYmhNRgQpPRDtU7lPUmUw4Fh+DtzKQzlXV4Y8XRl2pqdiXKOmUMhkOF8+YNXuptfRMzQCWaVaZJRqcSQ3C33Lz/+WyjWNGkUGPep7eiM+pqmk265LAt3dMb1pS3i4yeEmCOgeav3FDJPFgq+uXkKqRoWMUg0ivf4+5ZaIoDObYSaCBQRvuRypausAZ2PfujUNSWreCgUCle4oMuhxJDcLAJCqUcHTTY7WAUG3HZBVGQz4Me0KvOUKxN/m1N87wcF6G7bz1wHYTUivyDaKr7eYcSwvG2eL8vFQgxg0uOl8dCISPxACAALQwj/wlgMxboKAAKU7CvQ6/Hzjmnj/tCYtEXDTlJPDuda5gd2Cw9A9NAJmIvyYdgUZpVr8nn0DneuFIrNMiwClEg287GtTyNwwPKox1l1Owl8lRegTVl+SfjkzEU4X5OF8sTXQO9RzPC3oXuLtoKtFLpOhe0g4fsm8jj+yM/FITFNx//+Rkyle4wAA/BRKmCwWCAAaet/bwQoADbx9xIFeP4US2eWXhczXlaGxr7/Dhs7R3CxklWmhNVn7aJv7B0raYuXBq9soKT/dDgCKDJUv2Ks2GsRpLwBwLD8HZWYzLpUUVVo3X6+D2mREuKcX2gTWg7vMDd2rMe3EdtjjI1egSXl/pK3laaMzm3BFVQwPNzdxErqbIGBYgxh4yeW4UFyIbddTAACtA+o5DE0fhQIRXt4oNZskGyy7qi7BodxMFBn0CPPwumf6U/+JFv6B4vQi2yBmoV6H04V5UAgyhHt6IVDpDpXRgFKzCRGe3vfEoN/txJSfPNA6IAiTY5tjdLR1sEttMiJNU3lQ67KqGMfzc8SreTXw8kHvMGmP0PivchuZFX6OokhfucVqa61Ge/vYXeLuRmnlP6h4+Objhy7BYegXHlnpFExH7gsJR31PbzT1C4DObLLOQS0uwHWtGsHunhgSGY0rqhJYYD1vveKUGk+5HIMiorAjPRUqowFRXj6Iu8VUnxgfP2SUanFNo0JYhZY0ESFfr4NSJoOfQlnt1mxG+T7pHVYfcUHBtW6+YW0iCAL6RzTA5tRkHMnNRDP/ABzOzQQBuC80HJ3qhcJksWDLtcvI1ZWh0T3eDWAT4+OHCTHNEOLhCZkgINrHFzqLGRmlWiQW5sHdzQ1hnp5wE2RQGQzYl5UOAOgfHgkzEVqVX/lMShyst2HrBgCAEoOhUh/qFZW1z7RzvTAU6vXQmIzwcHNDscEAtdFgNy/U1r8a4+sPQRDghur9Mb3lCvFCFD4yJWJ8/JCiUaHMXIZcXRnaBNYTL7HXzEGfUmNff/QNi4TObELXkLBbhnkjHz8czs1CqkaFbiHhuKwqRmapFjllpeL5+4C1Nfxgg0a3bYHaHtPE179aXyL3Ott5+5dKivBbZjpS1Cr4KqxX7QesXQYjohojqbgAcffQoN+tCIJg1wgAgFhfP3i6yXFdq8Z1rRpebnI08w9AmkYNndmMuKBgtK/ibDUpcLBWwWSx4GJJodjK9FcoUWI0oMRgQKC7tW9TazSKf7QG3j54qEEjaE1GpGs1OFOUjxtajRiIpSYTsspK4SNXiJO1/6muIeEoNhoQoFQiRa3CwewM5OpK4eUmtxv0qKi6fZv13D3gK1cgu6wUB7JviNOCACBI6Q6FzA1akxEakxH7stIrXbOzIoPZjHxdGbzlCvjdA9c9kEqneqG4VFIkfln2DI2wm6Xho1CgWy08lbc2cRNkGFI/GsmqIpSaTLiuVYvv5cY+fugj8aH/zThYb5JVqoXKaMCp8kubAdawifD0RklxAYoMOjFY/1IVgWC9qIRMEBBR3hdKgDVYS/8OVluXQYyv378eFAr39MKU2BYwE2H9lQvIKf8huzaB//60V0EQcF9oOH7NTMfpwnwIAPqGRyJI6YEG3j7i9n/JSMPFkiIczc1C/4gGDreVXVYKgrWPuK5OUHeFEA9PsWspxMMTzf1qz/zMuiTG1w8x5d0lmvJTxTUmIzrVC63xLikO1nJGixm/Z2eIvzgJWM+U6RwcikgvH3FUu8igh8pgwP/yssSO8ZY3TUy2jbinqlUwWSyQy2Ti1dkbS3iVHjdBwKCIaJwvykdz/0DJBoZaB9SDyUI4lJOJHqHhDi/w0TssElfVJThfXIDuoeEOT4ywdQPU9/SWpK57Sc/Q+tBnpaNfeAP+UpKAj0IhXoLSGThYYR2Y2ZNxHVfVJfCWy9HcLxB+SiXaBgaLndq2q6nf0GpwsbhQnAkQ5uFZ6WIgnnI5mvj644q6BJdKihDh6YWrqhIoBBka3ME58dXR0McXDR3Maf232gcFo+0tWsBecjma+QXgfHEhjuflIL1UA5XBADNZr/zezC9Q/AWASG8O1jsV5umFCY2bu7oM9g9xsMJ62H5VXSL+JIijs6vCPb2grNDyjPL2Qd+wSPhX8dMRneqF4oq6BCfyc6B0c4MFhF6hEZV+MbQ2u93hkvUnkQvFU3IVggwKmQwGi0Vs4XcNDvtXPzPNWF101wdroV6HpOJChHp4ormDc4kNFjOO5GZBBusot6NQBaynfT4S0wx/5GSg1GSq8vRWmwgvb0R6eVuv1m60BnNV18ysqyLK51UWGfSI9vbFyOjGkAkCtEbrFeyDPTzv+l/jZMyRuz5YtSYjEgpy0cwvwGGwXlYVw2ixWCdn3+a86yB3D4yMjq32c98f2RBXVMUQIKBp+fn/dxNBENAnrD4ulhShf3gD8fV5KxToFVbfxdUx5jp3fbDaLqlWoK981hQAcbCqdQ38YJmfQin+RMbdKsbXHzF8NhVjdu76YPWSy+HlJkeRXg8zkTgYZbRYcK4oHxmlWvgpKp87zxhj/1TdGUn5F+q5e8AC61X4bQ5k38AfOZkAgM7BoTylhTEmmXsjWMt/uqKgfMI/EeGqugRugoCJjZvdU9cDZYzVvHsjWG/qZ83Tl0FnNiPC05unAjHGJHePBGt5i7U8WG+UX3Epypv7VRlj0rungjWrrBTniwqQUn5hlZsvRM0YY1JwSrDOmzcPUVFRUCpvf4WjOXPmQKGQ9sfs3N3c4K9QQmsy4resdNwo1UBefuFgxhiTmlOCNT4+HgkJCbdd7/Dhw9BqtTUyQv9Qg0boFWq92LKnmxtaBgTy9UEZYzVCoDv9MfN/QalUwmAwOFxmMBgwcOBAbNu2DeHh4TAajQ7Xi39kIj78eHVNlskYY7dVP7TqHyqsNU22FStW4PHHH0e9es67tBdjjNWEWhGs586dw7FjxzB16lQA4Mn6jLE6rVac0nrkyBFcvHgRjRs3BhHBZDKhcePGOHv2LHx87Efuc3Ky8ebKFeLtXr37onefvs4umTHGquTUPlaFQlFl32l11+M+VsZYbeDyPtZZs2YhKioKFosF0dHRmDt3LhISEjBs2DCH63NXAGOsLnNKV8Bnn33m8P5du3Y5vL+qmQOMMVYX1IrBK8YYu5twsDLGmMQ4WBljTGIcrIwxJjEOVsYYkxgHK2OMSYyDlTHGJMbByhhjEuNgZYwxiXGwMsaYxDhYGWNMYhysjDEmMQ5WxhiTGAcrY4xJjIOVMcYkxsHKGGMS42BljDGJcbAyxpjEOFgZY0xiHKyMMSYxDlbGGJMYBytjjEmMg5UxxiTGwcoYYxLjYGWMMYlxsDLGmMQ4WBljTGIcrIwxJjEOVsYYk5hTgnXevHmIioqCUqmscp37778fHTt2RLt27RAfHw+NRuOM0hhjTHJOCdb4+HgkJCTccp3vv/8ep06dwtmzZxEZGYn333/fGaUxxpjk5M54kh49etx2HV9fXwCAxWKBTqeDIAg1XRZjjNWIWtXHOnr0aISFhSE5ORkLFy50dTmMMfaPCEREznoypVIJg8Fwy3VMJhNmzJiBgQMHYsqUKZWW9+0/AO3axYm3e/Xui959+kpeK2OM3Ur90IAqlzmlK+BOyOVyjB8/Hp9//rnDYA0LC8eLS15xQWWMMVY9Tu0KqKpxrNFokJ2dDcDax7pjxw60bt3amaUxxphknBKss2bNQlRUFCwWC6KjozF37lwkJCRg2LBhAAC1Wo0RI0YgLi4OcXFxMJvNePnll51RGmOMSc6pfaxSiH9kIj78eLWry2CM3eNu1cdaq2YFMMbY3YCDlTHGJMbByhhjEuNgZYwxiXGwMsaYxDhYGWNMYhysjDEmMQ5WxhiTGAcrY4xJjIOVMcYkxsHKGGMS42BljDGJcbAyxpjEOFgZY0xiHKyMMSYxDlbGGJMYBytjjEmMg5UxxiTGwcoYYxLjYGWMMYlxsDLGmMQ4WBljTGIcrIwxJjEOVsYYkxgHK2OMSYyDlTHGJMbByhhjEuNgZYwxiXGwMsaYxJwSrPPmzUNUVBSUSqXD5Tdu3MCgQYPQunVrtG3bFkuWLHFGWYwxViOcEqzx8fFISEiocrlcLsc777yDpKQkJCYm4tChQ9i5c+c/eq5Dfxz8p2U6XW2utTbXdrO6UmtdqROoO7XW1jqdEqw9evRAaGholcvDw8PRsWNHANaQ7dChA65fv/6Pnuvwodq5ox2pzbXW5tpuVldqrSt1AnWn1tpaZ63rYy0sLMS2bdswePBgV5fCGGP/iNzVBVRkNBoxbtw4zJ8/H82aNXO4Tk5ONt5cuUK83at3X/Tu09dZJTLG2G0JRETOejKlUgmDweBwmcViwfjx49GoUSO8++67VW6jT58+aNy4cZXLs7KyEBER8a9rdYbaXGttru1mdaXWulInUHdqdWWd0dHRWLFihcNlTg1WhUIBo9HocNmMGTMAAGvXrnVWOYwxViOc0sc6a9YsREVFwWKxIDo6GnPnzkVCQgKGDRsGADh69CjWr1+PkydPokOHDujYsSP+85//OKM0xhiTnFNbrIwxdi+odbMCqsNisdj9n/0zVfV3M8b+nToXrO+++y5mz54NAJDJan/5GzZswJUrV1xdRiXvvfcennnmGahUKleXclsFBQWIj4/H66+/DgCozQdZO3bsQFpamqvLqBbbeEdt3p8A6sz+rKj2J1O5HTt2oFevXvjyyy9RUlKCoqIiV5d0Szt27EDXrl2xaNEiXLhwwdXliH788UcMGDAAGzZswPbt2+Hn5+fqkm5p1apVuP/++5GWloZr165Br9dDEARXl1XJyZMnMWbMGIwcORLff/89gNodWK+//jr69rVOU6yN+xMAkpKSMHToUCxatAhms7lOHaHWqnmsVVmwYAEOHz6M//znP5DL5Xj66acRGBjo6rIcKigowPjx4+Hm5oa3334bH3/8MXQ6HQBr14WrWtkWiwVff/011qxZgxUrVmDAgAEYMGAAfvvtNwwaNMglNd2KXq/HpEmT4O7ujp9//hnHjx/H999/D3d3d5fux5vpdDq88sor+PXXX/H888/jwQcfREJCAoioVgbWtm3b8N5778HX1xdarRYJCQno1KmTq8uyU1paisWLF+PcuXOIjY3F/v374ebm5uqy7gzVATdu3LC73apVK/r1119dVM2tabVa2rJli3h75cqVNHLkSBdW9LecnBy7f0+dOpV+/vlnF1Z0a9evXxf/feXKFQoJCbF7DbVBdnY2ffPNN2QymYiI6KOPPqKnnnqKiIjMZrMrS6tkzZo19MADD9CBAwdIo9HQY489RidOnHB1WXb0ej19/vnnNG/ePNJoNERE9MADD9Bvv/3m4sru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"], "last_payment": "2017-06-22", "plot_walk_progress_budget_in": "data:image/png;base64,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JTfddFOtdZxPmA4cOEBYWBitWrWiVatWtnJ3d3deeOEFHBwciI2NZeTIkbZEo2vXrrbrWrVqxd/+9jcmT55sV//IkSOJiYkBYNSoUQwbNuzKPhghhBBCtDi/nDLyfW4VeaW/D9N20ECvAA0D23ng4qRv8jaZFJVVv5RxvMTMwDau9Ax2xkF74yUF5102OQgODmbnzp21lj355JM8+eSTlw+i09mGrvxRly5dah2KBPD3v/+dv//975et/3o2Y8YMJkyYQGFhIcOHDycjI4O+ffvWeu1nn33GrFmziImJISIigmeffZbExERb+RtvvMHo0aMvmhgAtGvXjvnz59vmiNx6663MnDnTloQFBwfb9biEh4fb9qU4evQozz33HOnp6VRUVKAoii0xPO98TxKAq6urbU8MIYQQQohLOXTKyGcHfh9yHeoGkd4auoW44+Xm1GztctRCW29HhnV0x1l3fexyfDVu/Ce8TgQHBzN37lwmT57MiRMnar3m5ptvZunSpZw4cYLJkyfzyCOPcOrUKaB6cvPq1av59NNPefPNNy8Z6/7772fdunXk5+cTExNDcnKyraywsBBFUWzHubm5hISEADBhwgRCQ0PJyMjg1KlTLFiwoFEmjgshhBCiZck5Z2bFoerEoLMPPNHDlbG9/RkQ6desiQFUv2P1au3SIhIDkOTgmtK9e3cGDhzIv//9b9u58y/fZrOZxYsXU1JSAoCXlxcajcY2K19VVdq2bcuGDRv43//+V2Piy3mZmZmkpaVhMBjQ6XS4u7vbzewvLy9n5syZmM1mdu7cyaeffspDDz0EQGlpqW0Sem5u7mWTkAvbL4QQQghRm9MVFj7NKMVihbaecF+0F608m35HYVVVqTDdmCsQ1UeLTA6ulc3PapvE8vzzz/PRRx+Rn59f45qlS5cSHR2Nv78/zzzzDJ988gk+Pj5214WHh7NhwwYWLFjArFmzatRvMpmYNm0aYWFhhISEsGXLFj744ANbeUxMDBaLhfDwcB566CFefvll4uLigOqVob766iv8/f154IEHGD58+GWf50acqCOEEEKIK6OqKtYL3pnKjVYWZ5RSZVEJdIX7O3ugd3Rs8nYdO2vif+klbDhW0eSxrzWXXa3oelXbakXX2iZo15qFCxcyZ86ci84xES2brFYkhBDiahSVW/h0fyklBisOGtBpNahUT/j1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88YYY6qqqszgwYNj+77xjW+YV1991RhjzNKlS81f/MVfxPatW7fO7Nq1yxQWFl732hs3bjSjRo3qkn5K1K1+n1/PunXrjMfjMcYYs3r1alNaWhrbd++995q1a9caY4z53ve+Z/7hH/7BGGNMMBg069evN2+//bb5sz/7s+tee/ny5eahhx7qkn7K7dHIgdy2N998k7vvvptJkybx6KOP0tra2mHfJ3cOfvvb3151rtvt5v777489njJlSmx1qlWrVrFgwQLcbjeJiYnMnz+fVatWATBixAjGjBmDxWK5br8aGhqorKxk7ty5XfVU+5358+fzn//5nwCsWLGCr3/967F9n9zdmTJlCiUlJfzrv/5rbN/999/Pd7/7XaZNm8bf/d3fdbjmyJEjKSwsBCApKYnRo0fH7h6vXLmSxx9/HICSkhIyMjLYvXs3EL2LmZ+ff8Pli//whz8wadIkLVPcRcLhML///e/55S9/yfr16zu8d4cPH873v/99SktLGTduHOvXrwfggw8+YMaMGTz66KOUlJR0GOUBePDBB7HZbABMmzYt9tpfq6DlypUrAUhNTeXuu+/G6bxxXZoVK1Yo56wTbuf9vmnTJmbPnh07rq6uLvb+vtLdd99NWloaAOPGjSMQCNDe3g7AW2+9FXvdFi5cyB/+8IfYebNmzYqddz0rVqzgG9/4xu08ZbmBkydPdngtV6xYwV/8xV8AsGzZMr70pS/xxS9+keLi4usuUTpr1izcbjfQ8f1++vRpamtrY/87V77f4+LiuO+++0hISLhh//R+73kKDuRThUKh2NSOqVOnAlBdXc0rr7zChg0bqKysZNq0afzTP/1T7JzGxkZ27NhBRUUFTz75JGfPnr3u9QOBAMuWLePzn/88cPMF8K7nN7/5DV/60pdwuVy3+lQHBIvFwle/+lV+/etfA/DHP/6xQyDlcDh488032b59Ozt37uS3v/0t1dXVsf3Nzc1s3bqV559//rptHDt2jMrKSu69917g6tc0Pz//ll5TfVl0rXfeeYeJEyeSn5/P5z//ed58882rjtm1axfLly/nm9/8ZmzK365du3juueeoqqoiNzf3utf/+c9/zuc+9zmg8+/nnTt34vf7ueeee276HLnsdt/v99xzD2fPnuX48eMAvP7667EfkNfz61//mpKSEhISEjh//jyJiYk4HA4A4uPj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", "payments_schedule": false, "completed_payments_in": {"outcome": 38023.444136687205, "budget": 36491.525000000001, "outcome_pct": 4.1980134748745144}, "snapshot_in": {"outcome": 38488.23229395494, "budget": 36491.525, "outcome_pct": 5.471701426440617}, "summary_in": "[{\"pair\":\"JPYAOA\",\"date\":\"2017-12-31T00:00:00.000Z\",\"amount\":43789.83,\"risk\":4.0288805274,\"outcome\":\"pastfuture\"}]", "project_duration": "5 months", "plot_nextPayment": {"diagram": "data:image/png;base64,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", "pair": "There are no more transactions"}, "plot_timeline_in": "data:image/png;base64,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", "direction": "in", "project_name": "pivooo", "projected_outcome_in": {"projected_outcome_pct": 2.7358507132203158, "projected_outcome_best": 1996.7072939549398, "projected_outcome": 37489.878646977471, "budget": 36491.525, "projected_outcome_worst": 0.0}, "totals_outcome": {"out_costs_increase": 0.0, "out_costs_decrease": 0.0, "in_funds_increase": 0.0, "in_funds_decrease": 0.0}, "plot_currency_pairs_in": ["data:image/png;base64,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"], "total_budget_in": 36491.525, "number_of_payments": {"out": 0, "in": 5}, "no_payments": 5, "cache_id": "94d7afa7-2293-46c6-83cb-286e2f13d113", "project_start_date": "2017-01-05 00:00:00", "project_date": "Friday 14. July 2017", "averge_amount_per_payments": 7298.305}', '2017-06-22 00:00:00', '94d7afa7-2293-46c6-83cb-286e2f13d113');


--
-- Name: cache_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivolejon
--

SELECT pg_catalog.setval('cache_id_seq', 15, true);


--
-- Data for Name: country_codes; Type: TABLE DATA; Schema: public; Owner: ivolejon
--



--
-- Name: country_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivolejon
--

SELECT pg_catalog.setval('country_codes_id_seq', 274, false);


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: ivolejon
--

INSERT INTO payments VALUES (969, '2017-05-19 00:00:00', '', 5000, 293, 681);
INSERT INTO payments VALUES (970, '2017-06-16 00:00:00', '', 6000, 294, 681);
INSERT INTO payments VALUES (971, '2017-06-29 00:00:00', '', 6000, 294, 681);
INSERT INTO payments VALUES (982, '2016-04-29 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (983, '2016-05-13 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (984, '2016-06-23 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (985, '2016-07-13 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (986, '2016-08-18 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (987, '2016-09-21 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (988, '2016-10-19 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (989, '2016-11-17 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (990, '2016-12-27 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (991, '2017-01-18 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (992, '2017-02-23 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (993, '2017-03-16 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (994, '2017-04-20 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (995, '2017-05-18 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (996, '2017-06-28 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (997, '2017-07-26 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (998, '2017-08-30 00:00:00', '', 10000, 296, 684);
INSERT INTO payments VALUES (999, '2016-08-24 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1000, '2016-09-08 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1001, '2016-10-15 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1002, '2016-11-11 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1003, '2016-12-15 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1004, '2017-01-25 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1005, '2017-02-16 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1006, '2017-03-15 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1007, '2017-04-27 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1008, '2017-05-25 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1009, '2017-06-29 00:00:00', '', 10000, 297, 684);
INSERT INTO payments VALUES (1010, '2016-09-13 00:00:00', '', 5000, 298, 685);
INSERT INTO payments VALUES (1011, '2016-10-20 00:00:00', '', 5000, 298, 685);
INSERT INTO payments VALUES (1012, '2016-11-30 00:00:00', '', 5000, 298, 685);
INSERT INTO payments VALUES (1013, '2016-12-14 00:00:00', '', 5000, 298, 685);
INSERT INTO payments VALUES (1014, '2016-09-14 00:00:00', '', 5000, 299, 686);
INSERT INTO payments VALUES (1015, '2016-10-12 00:00:00', '', 5000, 299, 686);
INSERT INTO payments VALUES (1016, '2016-11-17 00:00:00', '', 5000, 299, 686);
INSERT INTO payments VALUES (1017, '2016-12-15 00:00:00', '', 5000, 299, 686);
INSERT INTO payments VALUES (1020, '2017-05-18 00:00:00', '', 2000000, 301, 684);
INSERT INTO payments VALUES (1021, '2017-09-22 00:00:00', '', 2000000, 301, 684);
INSERT INTO payments VALUES (1023, '2017-06-15 00:00:00', '', 606007, 303, 687);
INSERT INTO payments VALUES (1024, '2017-06-30 00:00:00', '', 606007, 303, 687);
INSERT INTO payments VALUES (1025, '2017-07-13 00:00:00', '', 606007, 303, 687);
INSERT INTO payments VALUES (1026, '2017-08-25 00:00:00', '', 606007, 303, 687);
INSERT INTO payments VALUES (1027, '2017-09-13 00:00:00', '', 606007, 303, 687);
INSERT INTO payments VALUES (1028, '2017-10-26 00:00:00', '', 606007, 303, 687);
INSERT INTO payments VALUES (1029, '2016-11-15 00:00:00', '', 6000, 304, 688);
INSERT INTO payments VALUES (1030, '2016-12-09 00:00:00', '', 6000, 304, 688);
INSERT INTO payments VALUES (1031, '2017-02-09 00:00:00', '', 6000, 304, 688);
INSERT INTO payments VALUES (1032, '2017-04-13 00:00:00', '', 6000, 304, 688);
INSERT INTO payments VALUES (1033, '2017-06-15 00:00:00', '', 6000, 304, 688);
INSERT INTO payments VALUES (1034, '2017-08-31 00:00:00', '', 6000, 304, 688);
INSERT INTO payments VALUES (1035, '2016-12-27 00:00:00', '', 60000, 305, 689);
INSERT INTO payments VALUES (1036, '2017-02-14 00:00:00', '', 60000, 305, 689);
INSERT INTO payments VALUES (1037, '2017-06-21 00:00:00', '', 60000, 305, 689);
INSERT INTO payments VALUES (1038, '2017-08-18 00:00:00', '', 60000, 305, 689);
INSERT INTO payments VALUES (1039, '2017-09-14 00:00:00', '', 60000, 305, 689);
INSERT INTO payments VALUES (1040, '2017-10-19 00:00:00', '', 60000, 305, 689);
INSERT INTO payments VALUES (1041, '2016-11-15 00:00:00', '', 600000, 306, 690);
INSERT INTO payments VALUES (1042, '2016-12-14 00:00:00', '', 600000, 306, 690);
INSERT INTO payments VALUES (1043, '2017-02-22 00:00:00', '', 600000, 306, 690);
INSERT INTO payments VALUES (1044, '2017-04-13 00:00:00', '', 600000, 306, 690);
INSERT INTO payments VALUES (1045, '2017-06-21 00:00:00', '', 600000, 306, 690);
INSERT INTO payments VALUES (1046, '2017-08-17 00:00:00', '', 600000, 306, 690);
INSERT INTO payments VALUES (1047, '2017-10-12 00:00:00', '', 600000, 306, 690);
INSERT INTO payments VALUES (1048, '2017-12-14 00:00:00', '', 600000, 306, 690);
INSERT INTO payments VALUES (1055, '2017-01-09 00:00:00', '', 60000, 308, 690);
INSERT INTO payments VALUES (1056, '2017-03-23 00:00:00', '', 60000, 308, 690);
INSERT INTO payments VALUES (1057, '2017-05-18 00:00:00', '', 60000, 308, 690);
INSERT INTO payments VALUES (1058, '2017-07-14 00:00:00', '', 60000, 308, 690);
INSERT INTO payments VALUES (1059, '2016-12-20 00:00:00', '', 60000, 309, 691);
INSERT INTO payments VALUES (1060, '2017-01-06 00:00:00', '', 60000, 309, 691);
INSERT INTO payments VALUES (1061, '2017-02-24 00:00:00', '', 60000, 309, 691);
INSERT INTO payments VALUES (1062, '2017-03-27 00:00:00', '', 60000, 309, 691);
INSERT INTO payments VALUES (1063, '2017-04-20 00:00:00', '', 60000, 309, 691);
INSERT INTO payments VALUES (1064, '2017-05-11 00:00:00', '', 60000, 309, 691);
INSERT INTO payments VALUES (1065, '2017-06-14 00:00:00', '', 60000, 309, 691);
INSERT INTO payments VALUES (1066, '2017-07-13 00:00:00', '', 60000, 309, 691);
INSERT INTO payments VALUES (1067, '2017-08-30 00:00:00', '', 60000, 309, 691);
INSERT INTO payments VALUES (1068, '2017-02-13 00:00:00', '', 60000, 310, 691);
INSERT INTO payments VALUES (1069, '2017-04-13 00:00:00', '', 60000, 310, 691);
INSERT INTO payments VALUES (1070, '2017-05-18 00:00:00', '', 60000, 310, 691);
INSERT INTO payments VALUES (1071, '2017-06-15 00:00:00', '', 60000, 310, 691);
INSERT INTO payments VALUES (1072, '2017-08-17 00:00:00', '', 60000, 310, 691);
INSERT INTO payments VALUES (1073, '2017-09-20 00:00:00', '', 60000, 310, 691);
INSERT INTO payments VALUES (1074, '2017-10-20 00:00:00', '', 60000, 310, 691);
INSERT INTO payments VALUES (1075, '2017-11-22 00:00:00', '', 60000, 310, 691);
INSERT INTO payments VALUES (1076, '2017-05-18 00:00:00', '', 5000, 311, 692);
INSERT INTO payments VALUES (1077, '2017-06-14 00:00:00', '', 6000, 312, 692);
INSERT INTO payments VALUES (1091, '2016-09-14 00:00:00', '', 5000, 323, 695);
INSERT INTO payments VALUES (1092, '2016-10-12 00:00:00', '', 5000, 323, 695);
INSERT INTO payments VALUES (1093, '2016-11-17 00:00:00', '', 5000, 323, 695);
INSERT INTO payments VALUES (1094, '2016-12-15 00:00:00', '', 5000, 323, 695);
INSERT INTO payments VALUES (1095, '2017-07-14 00:00:00', '', 15000, 324, 696);
INSERT INTO payments VALUES (1096, '2017-07-15 00:00:00', '', 15000, 324, 696);
INSERT INTO payments VALUES (1097, '2017-07-16 00:00:00', '', 15000, 324, 696);
INSERT INTO payments VALUES (1098, '2017-02-08 00:00:00', '', 5000, 325, 697);
INSERT INTO payments VALUES (1099, '2017-03-16 00:00:00', '', 5000, 325, 697);
INSERT INTO payments VALUES (1100, '2017-04-19 00:00:00', '', 5000, 325, 697);
INSERT INTO payments VALUES (1101, '2017-05-25 00:00:00', '', 5000, 325, 697);
INSERT INTO payments VALUES (1102, '2017-06-22 00:00:00', '', 5000, 325, 697);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivolejon
--

SELECT pg_catalog.setval('payments_id_seq', 1102, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: ivolejon
--

INSERT INTO projects VALUES (684, 'f69133d7-00d8-4da0-bbab-a78c7c26eb98', 'hjh', '2017-03-29 14:17:53.064775', 11, '2016-02-17 00:00:00', NULL, NULL);
INSERT INTO projects VALUES (685, 'b4694814-dc7a-47b5-9ed4-d84169ff109b', 'ddd', '2017-03-30 19:14:55.378721', 11, NULL, NULL, NULL);
INSERT INTO projects VALUES (686, 'eb2f107d-d9a1-49f6-a2af-2b5046220bc5', 'fff', '2017-03-30 19:20:19.547197', 11, '2016-04-04 00:00:00', NULL, NULL);
INSERT INTO projects VALUES (687, '12cae955-91ee-497b-99e6-c1c43b65df66', 'ivo', '2017-04-18 08:26:33.04102', 11, NULL, NULL, NULL);
INSERT INTO projects VALUES (689, 'ea1db567-a0c4-4295-b347-ab88ccbae844', 'only out', '2017-04-18 10:44:46.736686', 11, NULL, NULL, NULL);
INSERT INTO projects VALUES (697, '52a73c5a-c53d-448c-8f3e-5deecebeb388', 'pivooo', '2017-07-14 11:53:12.235476', 11, '2017-01-05 00:00:00', NULL, '15');
INSERT INTO projects VALUES (688, 'c20e2987-fe25-4dce-bd6a-a7a6cf47ed09', 'Only in', '2017-04-18 10:24:30.735604', 11, NULL, NULL, '146');
INSERT INTO projects VALUES (691, '67c58f7c-b5f3-49b1-9d2b-bf9620dce92a', 'both', '2017-04-18 11:06:44.734762', 11, NULL, NULL, '2');
INSERT INTO projects VALUES (692, '7758447f-955f-4025-9a73-5bb9e8074398', 'ivo1', '2017-04-19 19:22:32.081076', 11, NULL, NULL, '3');
INSERT INTO projects VALUES (695, '8d3ffc98-bffa-4819-8fab-9a5950ec9894', 'copyyyyy', '2017-07-13 21:09:46.927014', 11, '2016-04-04 00:00:00', NULL, NULL);
INSERT INTO projects VALUES (696, '3ccbac9a-7552-4ae7-801a-54429009c3d3', 'Ivo testar', '2017-07-14 11:43:12.915524', 11, NULL, NULL, '4');


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivolejon
--

SELECT pg_catalog.setval('projects_id_seq', 697, true);


--
-- Data for Name: supported_currencies; Type: TABLE DATA; Schema: public; Owner: ivolejon
--

INSERT INTO supported_currencies VALUES (1, 'United Arab Emirates Dirham', 'AED');
INSERT INTO supported_currencies VALUES (2, 'Afghan Afghani', 'AFN');
INSERT INTO supported_currencies VALUES (3, 'Albanian Lek', 'ALL');
INSERT INTO supported_currencies VALUES (4, 'Armenian Dram', 'AMD');
INSERT INTO supported_currencies VALUES (5, 'Netherlands Antillean Guilder', 'ANG');
INSERT INTO supported_currencies VALUES (6, 'Angolan Kwanza', 'AOA');
INSERT INTO supported_currencies VALUES (7, 'Argentine Peso', 'ARS');
INSERT INTO supported_currencies VALUES (8, 'Australian Dollar', 'AUD');
INSERT INTO supported_currencies VALUES (9, 'Aruban Florin', 'AWG');
INSERT INTO supported_currencies VALUES (10, 'Azerbaijani Manat', 'AZN');
INSERT INTO supported_currencies VALUES (11, 'Bosnia-Herzegovina Convertible Mark', 'BAM');
INSERT INTO supported_currencies VALUES (12, 'Barbadian Dollar', 'BBD');
INSERT INTO supported_currencies VALUES (13, 'Bangladeshi Taka', 'BDT');
INSERT INTO supported_currencies VALUES (14, 'Bulgarian Lev', 'BGN');
INSERT INTO supported_currencies VALUES (15, 'Bahraini Dinar', 'BHD');
INSERT INTO supported_currencies VALUES (16, 'Burundian Franc', 'BIF');
INSERT INTO supported_currencies VALUES (17, 'Bermudan Dollar', 'BMD');
INSERT INTO supported_currencies VALUES (18, 'Brunei Dollar', 'BND');
INSERT INTO supported_currencies VALUES (19, 'Bolivian Boliviano', 'BOB');
INSERT INTO supported_currencies VALUES (20, 'Brazilian Real', 'BRL');
INSERT INTO supported_currencies VALUES (21, 'Bahamian Dollar', 'BSD');
INSERT INTO supported_currencies VALUES (22, 'Bitcoin', 'BTC');
INSERT INTO supported_currencies VALUES (23, 'Bhutanese Ngultrum', 'BTN');
INSERT INTO supported_currencies VALUES (24, 'Botswanan Pula', 'BWP');
INSERT INTO supported_currencies VALUES (25, 'Belarusian Ruble', 'BYR');
INSERT INTO supported_currencies VALUES (26, 'Belize Dollar', 'BZD');
INSERT INTO supported_currencies VALUES (27, 'Canadian Dollar', 'CAD');
INSERT INTO supported_currencies VALUES (28, 'Congolese Franc', 'CDF');
INSERT INTO supported_currencies VALUES (29, 'Swiss Franc', 'CHF');
INSERT INTO supported_currencies VALUES (30, 'Chilean Unit of Account (UF)', 'CLF');
INSERT INTO supported_currencies VALUES (31, 'Chilean Peso', 'CLP');
INSERT INTO supported_currencies VALUES (32, 'Chinese Yuan', 'CNY');
INSERT INTO supported_currencies VALUES (33, 'Colombian Peso', 'COP');
INSERT INTO supported_currencies VALUES (34, 'Costa Rican Colón', 'CRC');
INSERT INTO supported_currencies VALUES (35, 'Cuban Convertible Peso', 'CUC');
INSERT INTO supported_currencies VALUES (36, 'Cuban Peso', 'CUP');
INSERT INTO supported_currencies VALUES (37, 'Cape Verdean Escudo', 'CVE');
INSERT INTO supported_currencies VALUES (38, 'Czech Republic Koruna', 'CZK');
INSERT INTO supported_currencies VALUES (39, 'Djiboutian Franc', 'DJF');
INSERT INTO supported_currencies VALUES (40, 'Danish Krone', 'DKK');
INSERT INTO supported_currencies VALUES (41, 'Dominican Peso', 'DOP');
INSERT INTO supported_currencies VALUES (42, 'Algerian Dinar', 'DZD');
INSERT INTO supported_currencies VALUES (43, 'Estonian Kroon', 'EEK');
INSERT INTO supported_currencies VALUES (44, 'Egyptian Pound', 'EGP');
INSERT INTO supported_currencies VALUES (45, 'Eritrean Nakfa', 'ERN');
INSERT INTO supported_currencies VALUES (46, 'Ethiopian Birr', 'ETB');
INSERT INTO supported_currencies VALUES (47, 'Euro', 'EUR');
INSERT INTO supported_currencies VALUES (48, 'Fijian Dollar', 'FJD');
INSERT INTO supported_currencies VALUES (49, 'Falkland Islands Pound', 'FKP');
INSERT INTO supported_currencies VALUES (50, 'British Pound Sterling', 'GBP');
INSERT INTO supported_currencies VALUES (51, 'Georgian Lari', 'GEL');
INSERT INTO supported_currencies VALUES (52, 'Guernsey Pound', 'GGP');
INSERT INTO supported_currencies VALUES (53, 'Ghanaian Cedi', 'GHS');
INSERT INTO supported_currencies VALUES (54, 'Gibraltar Pound', 'GIP');
INSERT INTO supported_currencies VALUES (55, 'Gambian Dalasi', 'GMD');
INSERT INTO supported_currencies VALUES (56, 'Guinean Franc', 'GNF');
INSERT INTO supported_currencies VALUES (57, 'Guatemalan Quetzal', 'GTQ');
INSERT INTO supported_currencies VALUES (58, 'Guyanaese Dollar', 'GYD');
INSERT INTO supported_currencies VALUES (59, 'Hong Kong Dollar', 'HKD');
INSERT INTO supported_currencies VALUES (60, 'Honduran Lempira', 'HNL');
INSERT INTO supported_currencies VALUES (61, 'Croatian Kuna', 'HRK');
INSERT INTO supported_currencies VALUES (62, 'Haitian Gourde', 'HTG');
INSERT INTO supported_currencies VALUES (63, 'Hungarian Forint', 'HUF');
INSERT INTO supported_currencies VALUES (64, 'Indonesian Rupiah', 'IDR');
INSERT INTO supported_currencies VALUES (65, 'Israeli New Sheqel', 'ILS');
INSERT INTO supported_currencies VALUES (66, 'Manx pound', 'IMP');
INSERT INTO supported_currencies VALUES (67, 'Indian Rupee', 'INR');
INSERT INTO supported_currencies VALUES (68, 'Iraqi Dinar', 'IQD');
INSERT INTO supported_currencies VALUES (69, 'Iranian Rial', 'IRR');
INSERT INTO supported_currencies VALUES (70, 'Icelandic Króna', 'ISK');
INSERT INTO supported_currencies VALUES (71, 'Jersey Pound', 'JEP');
INSERT INTO supported_currencies VALUES (72, 'Jamaican Dollar', 'JMD');
INSERT INTO supported_currencies VALUES (73, 'Jordanian Dinar', 'JOD');
INSERT INTO supported_currencies VALUES (74, 'Japanese Yen', 'JPY');
INSERT INTO supported_currencies VALUES (75, 'Kenyan Shilling', 'KES');
INSERT INTO supported_currencies VALUES (76, 'Kyrgystani Som', 'KGS');
INSERT INTO supported_currencies VALUES (77, 'Cambodian Riel', 'KHR');
INSERT INTO supported_currencies VALUES (78, 'Comorian Franc', 'KMF');
INSERT INTO supported_currencies VALUES (79, 'North Korean Won', 'KPW');
INSERT INTO supported_currencies VALUES (80, 'South Korean Won', 'KRW');
INSERT INTO supported_currencies VALUES (81, 'Kuwaiti Dinar', 'KWD');
INSERT INTO supported_currencies VALUES (82, 'Cayman Islands Dollar', 'KYD');
INSERT INTO supported_currencies VALUES (83, 'Kazakhstani Tenge', 'KZT');
INSERT INTO supported_currencies VALUES (84, 'Laotian Kip', 'LAK');
INSERT INTO supported_currencies VALUES (85, 'Lebanese Pound', 'LBP');
INSERT INTO supported_currencies VALUES (86, 'Sri Lankan Rupee', 'LKR');
INSERT INTO supported_currencies VALUES (87, 'Liberian Dollar', 'LRD');
INSERT INTO supported_currencies VALUES (88, 'Lesotho Loti', 'LSL');
INSERT INTO supported_currencies VALUES (89, 'Lithuanian Litas', 'LTL');
INSERT INTO supported_currencies VALUES (90, 'Latvian Lats', 'LVL');
INSERT INTO supported_currencies VALUES (91, 'Libyan Dinar', 'LYD');
INSERT INTO supported_currencies VALUES (92, 'Moroccan Dirham', 'MAD');
INSERT INTO supported_currencies VALUES (93, 'Moldovan Leu', 'MDL');
INSERT INTO supported_currencies VALUES (94, 'Malagasy Ariary', 'MGA');
INSERT INTO supported_currencies VALUES (95, 'Macedonian Denar', 'MKD');
INSERT INTO supported_currencies VALUES (96, 'Myanma Kyat', 'MMK');
INSERT INTO supported_currencies VALUES (97, 'Mongolian Tugrik', 'MNT');
INSERT INTO supported_currencies VALUES (98, 'Macanese Pataca', 'MOP');
INSERT INTO supported_currencies VALUES (99, 'Mauritanian Ouguiya', 'MRO');
INSERT INTO supported_currencies VALUES (100, 'Mauritian Rupee', 'MUR');
INSERT INTO supported_currencies VALUES (101, 'Maldivian Rufiyaa', 'MVR');
INSERT INTO supported_currencies VALUES (102, 'Malawian Kwacha', 'MWK');
INSERT INTO supported_currencies VALUES (103, 'Mexican Peso', 'MXN');
INSERT INTO supported_currencies VALUES (104, 'Malaysian Ringgit', 'MYR');
INSERT INTO supported_currencies VALUES (105, 'Mozambican Metical', 'MZN');
INSERT INTO supported_currencies VALUES (106, 'Namibian Dollar', 'NAD');
INSERT INTO supported_currencies VALUES (107, 'Nigerian Naira', 'NGN');
INSERT INTO supported_currencies VALUES (108, 'Nicaraguan Córdoba', 'NIO');
INSERT INTO supported_currencies VALUES (109, 'Norwegian Krone', 'NOK');
INSERT INTO supported_currencies VALUES (110, 'Nepalese Rupee', 'NPR');
INSERT INTO supported_currencies VALUES (111, 'New Zealand Dollar', 'NZD');
INSERT INTO supported_currencies VALUES (112, 'Omani Rial', 'OMR');
INSERT INTO supported_currencies VALUES (113, 'Panamanian Balboa', 'PAB');
INSERT INTO supported_currencies VALUES (114, 'Peruvian Nuevo Sol', 'PEN');
INSERT INTO supported_currencies VALUES (115, 'Papua New Guinean Kina', 'PGK');
INSERT INTO supported_currencies VALUES (116, 'Philippine Peso', 'PHP');
INSERT INTO supported_currencies VALUES (117, 'Pakistani Rupee', 'PKR');
INSERT INTO supported_currencies VALUES (118, 'Polish Zloty', 'PLN');
INSERT INTO supported_currencies VALUES (119, 'Paraguayan Guarani', 'PYG');
INSERT INTO supported_currencies VALUES (120, 'Qatari Rial', 'QAR');
INSERT INTO supported_currencies VALUES (121, 'Romanian Leu', 'RON');
INSERT INTO supported_currencies VALUES (122, 'Serbian Dinar', 'RSD');
INSERT INTO supported_currencies VALUES (123, 'Russian Ruble', 'RUB');
INSERT INTO supported_currencies VALUES (124, 'Rwandan Franc', 'RWF');
INSERT INTO supported_currencies VALUES (125, 'Saudi Riyal', 'SAR');
INSERT INTO supported_currencies VALUES (126, 'Solomon Islands Dollar', 'SBD');
INSERT INTO supported_currencies VALUES (127, 'Seychellois Rupee', 'SCR');
INSERT INTO supported_currencies VALUES (128, 'Sudanese Pound', 'SDG');
INSERT INTO supported_currencies VALUES (129, 'Swedish Krona', 'SEK');
INSERT INTO supported_currencies VALUES (130, 'Singapore Dollar', 'SGD');
INSERT INTO supported_currencies VALUES (131, 'Saint Helena Pound', 'SHP');
INSERT INTO supported_currencies VALUES (132, 'Sierra Leonean Leone', 'SLL');
INSERT INTO supported_currencies VALUES (133, 'Somali Shilling', 'SOS');
INSERT INTO supported_currencies VALUES (134, 'Surinamese Dollar', 'SRD');
INSERT INTO supported_currencies VALUES (135, 'São Tomé and Príncipe Dobra', 'STD');
INSERT INTO supported_currencies VALUES (136, 'Salvadoran Colón', 'SVC');
INSERT INTO supported_currencies VALUES (137, 'Syrian Pound', 'SYP');
INSERT INTO supported_currencies VALUES (138, 'Swazi Lilangeni', 'SZL');
INSERT INTO supported_currencies VALUES (139, 'Thai Baht', 'THB');
INSERT INTO supported_currencies VALUES (140, 'Tajikistani Somoni', 'TJS');
INSERT INTO supported_currencies VALUES (141, 'Turkmenistani Manat', 'TMT');
INSERT INTO supported_currencies VALUES (142, 'Tunisian Dinar', 'TND');
INSERT INTO supported_currencies VALUES (143, 'Tongan Paʻanga', 'TOP');
INSERT INTO supported_currencies VALUES (144, 'Turkish Lira', 'TRY');
INSERT INTO supported_currencies VALUES (145, 'Trinidad and Tobago Dollar', 'TTD');
INSERT INTO supported_currencies VALUES (146, 'New Taiwan Dollar', 'TWD');
INSERT INTO supported_currencies VALUES (147, 'Tanzanian Shilling', 'TZS');
INSERT INTO supported_currencies VALUES (148, 'Ukrainian Hryvnia', 'UAH');
INSERT INTO supported_currencies VALUES (149, 'Ugandan Shilling', 'UGX');
INSERT INTO supported_currencies VALUES (150, 'United States Dollar', 'USD');
INSERT INTO supported_currencies VALUES (151, 'Uruguayan Peso', 'UYU');
INSERT INTO supported_currencies VALUES (152, 'Uzbekistan Som', 'UZS');
INSERT INTO supported_currencies VALUES (153, 'Venezuelan Bolívar Fuerte', 'VEF');
INSERT INTO supported_currencies VALUES (154, 'Vietnamese Dong', 'VND');
INSERT INTO supported_currencies VALUES (155, 'Vanuatu Vatu', 'VUV');
INSERT INTO supported_currencies VALUES (156, 'Samoan Tala', 'WST');
INSERT INTO supported_currencies VALUES (157, 'CFA Franc BEAC', 'XAF');
INSERT INTO supported_currencies VALUES (158, 'Silver (troy ounce)', 'XAG');
INSERT INTO supported_currencies VALUES (159, 'Gold (troy ounce)', 'XAU');
INSERT INTO supported_currencies VALUES (160, 'East Caribbean Dollar', 'XCD');
INSERT INTO supported_currencies VALUES (161, 'Special Drawing Rights', 'XDR');
INSERT INTO supported_currencies VALUES (162, 'CFA Franc BCEAO', 'XOF');
INSERT INTO supported_currencies VALUES (163, 'CFP Franc', 'XPF');
INSERT INTO supported_currencies VALUES (164, 'Yemeni Rial', 'YER');
INSERT INTO supported_currencies VALUES (165, 'South African Rand', 'ZAR');
INSERT INTO supported_currencies VALUES (166, 'Zambian Kwacha (pre-2013)', 'ZMK');
INSERT INTO supported_currencies VALUES (167, 'Zambian Kwacha', 'ZMW');
INSERT INTO supported_currencies VALUES (168, 'Zimbabwean Dollar', 'ZWL');


--
-- Name: supported_currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivolejon
--

SELECT pg_catalog.setval('supported_currencies_id_seq', 168, false);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: ivolejon
--

INSERT INTO tasks VALUES (296, '56aed2dc-4d5a-4130-b193-82dda7afc44e', '2017-03-29 14:34:02.968319', 684, 'df', 'SEK', 'AOA', 'in', 'Sweden (Sida and other)', 18.5572240000000015, 'Angola');
INSERT INTO tasks VALUES (297, '67333a34-e464-4227-bf68-bd09f6a38324', '2017-03-30 09:27:18.511695', 684, 'ffdf', 'DKK', 'AOA', 'in', 'Denmark', 23.8230080000000015, 'Please select a country');
INSERT INTO tasks VALUES (298, 'be53ff58-3230-40a8-8645-b2bb143e574b', '2017-03-30 19:15:27.13848', 685, 'assasa', 'USD', 'AOA', 'in', 'US (USAID and other)', 165.085998999999987, 'Angola');
INSERT INTO tasks VALUES (299, 'f5e7b0d1-9b6f-4aee-bea4-fc2e35ea821a', '2017-03-30 19:20:58.095527', 686, 'fff', 'NOK', 'AOA', 'in', 'Norway (Norad and other)', 19.2758849999999988, 'Angola');
INSERT INTO tasks VALUES (301, '27ffd12b-9636-4b92-afd8-45ba3d612264', '2017-04-11 21:12:57.292553', 684, 'sddsds', 'AOA', 'EUR', 'out', 'Please select a donor', 0, 'Austria');
INSERT INTO tasks VALUES (293, 'a96edf48-d0a2-401d-895a-e931b1606b96', '2017-03-22 16:28:39.237753', NULL, 'ivovo', 'JPY', 'AOA', 'in', 'Japan', 1.48694400000000004, 'Angola');
INSERT INTO tasks VALUES (294, '117469ce-7dd6-48a3-8a66-b73f9a78e159', '2017-03-22 16:30:24.029148', NULL, 'asdasd', 'AOA', 'DZD', 'out', 'Please select a donor', 0, 'Algeria');
INSERT INTO tasks VALUES (303, '606ba81f-c384-4d7e-a8c3-f5fc88e173c7', '2017-04-18 08:59:27.887007', 687, 'ff', 'JPY', 'AZN', 'in', 'Japan', 0.015626000000000001, 'Azerbaijan');
INSERT INTO tasks VALUES (304, '90c6214c-4140-43b8-8c7d-558a65345540', '2017-04-18 10:25:01.574098', 688, 'fdfdfd', 'SEK', 'AOA', 'in', 'Sweden (Sida and other)', 18.3463530000000006, 'Angola');
INSERT INTO tasks VALUES (305, 'd8d3440e-1766-4036-a9b0-8dc4c1066349', '2017-04-18 10:45:33.466973', 689, 'ccff', 'DZD', 'EUR', 'out', 'Algeria', 0, 'Austria');
INSERT INTO tasks VALUES (306, 'da01ee5e-a3b2-49b4-ab78-aafd9f095acd', '2017-04-18 10:51:49.591796', NULL, 'sds', 'JPY', 'BOB', 'in', 'Japan', 0.063292000000000001, 'Bolivia');
INSERT INTO tasks VALUES (308, '12d93e16-5022-450a-b098-23dcfacfcbde', '2017-04-18 10:58:16.496977', NULL, 'fdfd', 'BOB', 'CUP', 'out', 'Please select a donor', 0, 'Cuba');
INSERT INTO tasks VALUES (309, 'ee07e0fa-2fd5-4f72-9c44-859e1f24876b', '2017-04-18 11:07:38.988367', 691, 'fddf', 'SEK', 'ETB', 'in', 'Sweden (Sida and other)', 2.52449700000000021, 'Ethiopia');
INSERT INTO tasks VALUES (310, 'e0db9310-4842-4e14-8a38-b3a3c7173265', '2017-04-18 11:08:22.304988', 691, 'ffd', 'ETB', 'BWP', 'out', 'Please select a country', 0, 'Botswana');
INSERT INTO tasks VALUES (311, '145c9170-eaae-44c2-8590-fec6301a71ba', '2017-04-19 19:23:02.175063', 692, 'fdfd', 'SEK', 'ALL', 'in', 'Sweden (Sida and other)', 14.0551700000000004, 'Albania');
INSERT INTO tasks VALUES (312, 'a679d401-580f-4607-8e53-a910021bbf5f', '2017-04-19 19:25:13.900247', 692, 'fg', 'ALL', 'DZD', 'out', 'Please select a country', 0, 'Algeria');
INSERT INTO tasks VALUES (323, '34011a3d-be11-45f1-9921-ecd35a4d140e', '2017-07-13 21:09:47.011807', 695, 'fff', 'NOK', 'AOA', 'in', 'Norway (Norad and other)', 19.2758849999999988, 'Angola');
INSERT INTO tasks VALUES (324, '402821d3-b362-4f47-bbc5-ad91983888f0', '2017-07-14 11:43:45.050777', 696, 'sdsd', 'DKK', 'AOA', 'in', 'Denmark', 25.3482659999999989, 'Angola');
INSERT INTO tasks VALUES (325, 'e2b5dfa2-965d-40c3-b035-35a483da8ec2', '2017-07-14 11:53:41.902518', 697, 'dsd', 'JPY', 'AOA', 'in', 'Japan', 1.4596610000000001, 'Angola');


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivolejon
--

SELECT pg_catalog.setval('tasks_id_seq', 325, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ivolejon
--

INSERT INTO users VALUES (11, NULL, NULL, 'ivo.lejon@gmail.com', NULL, 'f816609d-167c-4704-adf3-d220108cc88d', '2017-03-22 16:26:26.512116', false, NULL, 'admin');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ivolejon
--

SELECT pg_catalog.setval('users_id_seq', 11, true);


--
-- Name: all_currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: ivolejon; Tablespace: 
--

ALTER TABLE ONLY all_currencies
    ADD CONSTRAINT all_currencies_pkey PRIMARY KEY (id);


--
-- Name: blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: ivolejon; Tablespace: 
--

ALTER TABLE ONLY blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (id);


--
-- Name: cache_pkey; Type: CONSTRAINT; Schema: public; Owner: ivolejon; Tablespace: 
--

ALTER TABLE ONLY cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (id);


--
-- Name: country_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: ivolejon; Tablespace: 
--

ALTER TABLE ONLY country_codes
    ADD CONSTRAINT country_codes_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: ivolejon; Tablespace: 
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: ivolejon; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: supported_currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: ivolejon; Tablespace: 
--

ALTER TABLE ONLY supported_currencies
    ADD CONSTRAINT supported_currencies_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: ivolejon; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ivolejon; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_projects_long_id; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_projects_long_id ON projects USING btree (long_id);


--
-- Name: ix_projects_name; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_projects_name ON projects USING btree (name);


--
-- Name: ix_tasks_donor; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_tasks_donor ON tasks USING btree (donor);


--
-- Name: ix_tasks_long_id; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_tasks_long_id ON tasks USING btree (long_id);


--
-- Name: ix_tasks_name; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_tasks_name ON tasks USING btree (name);


--
-- Name: ix_tasks_receiver; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_tasks_receiver ON tasks USING btree (receiver);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_users_email ON users USING btree (email);


--
-- Name: ix_users_first_name; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_users_first_name ON users USING btree (first_name);


--
-- Name: ix_users_last_name; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_users_last_name ON users USING btree (last_name);


--
-- Name: ix_users_long_id; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_users_long_id ON users USING btree (long_id);


--
-- Name: ix_users_password; Type: INDEX; Schema: public; Owner: ivolejon; Tablespace: 
--

CREATE INDEX ix_users_password ON users USING btree (password);


--
-- Name: payments_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivolejon
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_task_id_fkey FOREIGN KEY (task_id) REFERENCES tasks(id);


--
-- Name: projects_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivolejon
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: tasks_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ivolejon
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_project_id_fkey FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: ivolejon
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM ivolejon;
GRANT ALL ON SCHEMA public TO ivolejon;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

