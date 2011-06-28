--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO andrewramos;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO andrewramos;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO andrewramos;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO andrewramos;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_message; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO andrewramos;

--
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO andrewramos;

--
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('auth_message_id_seq', 1, false);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO andrewramos;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO andrewramos;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('auth_permission_id_seq', 84, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO andrewramos;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO andrewramos;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO andrewramos;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO andrewramos;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO andrewramos;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO andrewramos;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 201, true);


--
-- Name: blog_article; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE blog_article (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    slug character varying(50) NOT NULL,
    content_markdown text NOT NULL,
    content text,
    is_featured boolean DEFAULT false NOT NULL,
    date_added timestamp with time zone DEFAULT '2010-08-11 04:43:37.001186+00'::timestamp with time zone NOT NULL,
    date_modified timestamp with time zone DEFAULT '2010-08-11 04:43:37.001423+00'::timestamp with time zone NOT NULL,
    date_published timestamp with time zone DEFAULT '2010-08-11 04:43:37.001623+00'::timestamp with time zone NOT NULL,
    status character varying(1) DEFAULT 'd'::character varying NOT NULL,
    excerpt text NOT NULL,
    display_title boolean DEFAULT true NOT NULL,
    subtitle character varying(100) NOT NULL,
    image_width character varying(1) DEFAULT 'f'::character varying NOT NULL
);


ALTER TABLE public.blog_article OWNER TO andrewramos;

--
-- Name: blog_article_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE blog_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.blog_article_id_seq OWNER TO andrewramos;

--
-- Name: blog_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE blog_article_id_seq OWNED BY blog_article.id;


--
-- Name: blog_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('blog_article_id_seq', 24, true);


--
-- Name: blog_casestudy; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE blog_casestudy (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    slug character varying(50) NOT NULL,
    content_markdown text NOT NULL,
    content text,
    is_featured boolean DEFAULT false NOT NULL,
    date_added timestamp with time zone DEFAULT '2010-08-11 04:43:37.017691+00'::timestamp with time zone NOT NULL,
    date_modified timestamp with time zone DEFAULT '2010-08-11 04:43:37.017943+00'::timestamp with time zone NOT NULL,
    date_published timestamp with time zone DEFAULT '2010-08-11 04:43:37.018151+00'::timestamp with time zone NOT NULL,
    status character varying(1) DEFAULT 'd'::character varying NOT NULL,
    excerpt text NOT NULL,
    image_width character varying(1) DEFAULT 'f'::character varying NOT NULL
);


ALTER TABLE public.blog_casestudy OWNER TO andrewramos;

--
-- Name: blog_casestudy_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE blog_casestudy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.blog_casestudy_id_seq OWNER TO andrewramos;

--
-- Name: blog_casestudy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE blog_casestudy_id_seq OWNED BY blog_casestudy.id;


--
-- Name: blog_casestudy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('blog_casestudy_id_seq', 2, true);


--
-- Name: blog_image; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE blog_image (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    CONSTRAINT blog_image_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.blog_image OWNER TO andrewramos;

--
-- Name: blog_image_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE blog_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.blog_image_id_seq OWNER TO andrewramos;

--
-- Name: blog_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE blog_image_id_seq OWNED BY blog_image.id;


--
-- Name: blog_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('blog_image_id_seq', 28, true);


--
-- Name: blog_quote; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE blog_quote (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    slug character varying(50) NOT NULL,
    content_markdown text NOT NULL,
    content text,
    is_featured boolean DEFAULT false NOT NULL,
    date_added timestamp with time zone DEFAULT '2010-08-11 04:43:37.049662+00'::timestamp with time zone NOT NULL,
    date_modified timestamp with time zone DEFAULT '2010-08-11 04:43:37.049876+00'::timestamp with time zone NOT NULL,
    date_published timestamp with time zone DEFAULT '2010-08-11 04:43:37.050061+00'::timestamp with time zone NOT NULL,
    status character varying(1) DEFAULT 'd'::character varying NOT NULL,
    author character varying(100) NOT NULL
);


ALTER TABLE public.blog_quote OWNER TO andrewramos;

--
-- Name: blog_quote_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE blog_quote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.blog_quote_id_seq OWNER TO andrewramos;

--
-- Name: blog_quote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE blog_quote_id_seq OWNED BY blog_quote.id;


--
-- Name: blog_quote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('blog_quote_id_seq', 5, true);


--
-- Name: blog_shortpost; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE blog_shortpost (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    slug character varying(50) NOT NULL,
    content_markdown text NOT NULL,
    content text,
    is_featured boolean DEFAULT false NOT NULL,
    date_added timestamp with time zone DEFAULT '2010-08-11 04:43:37.034905+00'::timestamp with time zone NOT NULL,
    date_modified timestamp with time zone DEFAULT '2010-08-11 04:43:37.035118+00'::timestamp with time zone NOT NULL,
    date_published timestamp with time zone DEFAULT '2010-08-11 04:43:37.035304+00'::timestamp with time zone NOT NULL,
    status character varying(1) DEFAULT 'd'::character varying NOT NULL,
    link character varying(200) NOT NULL
);


ALTER TABLE public.blog_shortpost OWNER TO andrewramos;

--
-- Name: blog_shortpost_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE blog_shortpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.blog_shortpost_id_seq OWNER TO andrewramos;

--
-- Name: blog_shortpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE blog_shortpost_id_seq OWNED BY blog_shortpost.id;


--
-- Name: blog_shortpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('blog_shortpost_id_seq', 12, true);


--
-- Name: content_frontpagecontent; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE content_frontpagecontent (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    link character varying(200) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.content_frontpagecontent OWNER TO andrewramos;

--
-- Name: content_frontpagecontent_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE content_frontpagecontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.content_frontpagecontent_id_seq OWNER TO andrewramos;

--
-- Name: content_frontpagecontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE content_frontpagecontent_id_seq OWNED BY content_frontpagecontent.id;


--
-- Name: content_frontpagecontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('content_frontpagecontent_id_seq', 12, true);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO andrewramos;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO andrewramos;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 275, true);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO andrewramos;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO andrewramos;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('django_content_type_id_seq', 28, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO andrewramos;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO andrewramos;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO andrewramos;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone DEFAULT '2009-11-23 02:16:23.523494+00'::timestamp with time zone NOT NULL,
    storage_id integer NOT NULL,
    storage_hash character varying(40) NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO andrewramos;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO andrewramos;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 49, true);


--
-- Name: easy_thumbnails_storage; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE easy_thumbnails_storage (
    id integer NOT NULL,
    hash character varying(40) NOT NULL,
    pickle text NOT NULL
);


ALTER TABLE public.easy_thumbnails_storage OWNER TO andrewramos;

--
-- Name: easy_thumbnails_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE easy_thumbnails_storage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_storage_id_seq OWNER TO andrewramos;

--
-- Name: easy_thumbnails_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE easy_thumbnails_storage_id_seq OWNED BY easy_thumbnails_storage.id;


--
-- Name: easy_thumbnails_storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('easy_thumbnails_storage_id_seq', 4, true);


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone DEFAULT '2009-11-23 02:16:23.523494+00'::timestamp with time zone NOT NULL,
    source_id integer NOT NULL,
    storage_id integer NOT NULL,
    storage_hash character varying(40) NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO andrewramos;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO andrewramos;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 63, true);


--
-- Name: portfolio_category; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE portfolio_category (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    CONSTRAINT portfolio_category_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.portfolio_category OWNER TO andrewramos;

--
-- Name: portfolio_category_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE portfolio_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.portfolio_category_id_seq OWNER TO andrewramos;

--
-- Name: portfolio_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE portfolio_category_id_seq OWNED BY portfolio_category.id;


--
-- Name: portfolio_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('portfolio_category_id_seq', 1, false);


--
-- Name: portfolio_client; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE portfolio_client (
    id integer NOT NULL,
    client_name character varying(100) NOT NULL
);


ALTER TABLE public.portfolio_client OWNER TO andrewramos;

--
-- Name: portfolio_client_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE portfolio_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.portfolio_client_id_seq OWNER TO andrewramos;

--
-- Name: portfolio_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE portfolio_client_id_seq OWNED BY portfolio_client.id;


--
-- Name: portfolio_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('portfolio_client_id_seq', 5, true);


--
-- Name: portfolio_portfoliopiece; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE portfolio_portfoliopiece (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    date_added timestamp with time zone DEFAULT '2010-08-11 04:43:37.417242+00'::timestamp with time zone NOT NULL,
    date_modified timestamp with time zone DEFAULT '2010-08-11 04:43:37.417485+00'::timestamp with time zone NOT NULL,
    "order" integer,
    CONSTRAINT portfolio_portfoliopiece_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.portfolio_portfoliopiece OWNER TO andrewramos;

--
-- Name: portfolio_portfoliopiece_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE portfolio_portfoliopiece_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.portfolio_portfoliopiece_id_seq OWNER TO andrewramos;

--
-- Name: portfolio_portfoliopiece_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE portfolio_portfoliopiece_id_seq OWNED BY portfolio_portfoliopiece.id;


--
-- Name: portfolio_portfoliopiece_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('portfolio_portfoliopiece_id_seq', 18, true);


--
-- Name: portfolio_project; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE portfolio_project (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(150) NOT NULL,
    slug character varying(50) NOT NULL,
    client_id integer NOT NULL,
    status character varying(1) DEFAULT 'd'::character varying NOT NULL,
    image_width character varying(1) DEFAULT 'f'::character varying NOT NULL,
    case_study_id integer,
    date_added timestamp with time zone DEFAULT '2010-08-11 04:43:37.374237+00'::timestamp with time zone NOT NULL,
    date_modified timestamp with time zone DEFAULT '2010-08-11 04:43:37.374566+00'::timestamp with time zone NOT NULL
);


ALTER TABLE public.portfolio_project OWNER TO andrewramos;

--
-- Name: portfolio_project_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE portfolio_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.portfolio_project_id_seq OWNER TO andrewramos;

--
-- Name: portfolio_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE portfolio_project_id_seq OWNED BY portfolio_project.id;


--
-- Name: portfolio_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('portfolio_project_id_seq', 5, true);


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO andrewramos;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO andrewramos;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

-- SELECT pg_catalog.setval('south_migrationhistory_id_seq', 18, true);


--
-- Name: tagging_tag; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE tagging_tag (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tagging_tag OWNER TO andrewramos;

--
-- Name: tagging_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE tagging_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tagging_tag_id_seq OWNER TO andrewramos;

--
-- Name: tagging_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE tagging_tag_id_seq OWNED BY tagging_tag.id;


--
-- Name: tagging_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('tagging_tag_id_seq', 15, true);


--
-- Name: tagging_taggeditem; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE tagging_taggeditem (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    CONSTRAINT tagging_taggeditem_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.tagging_taggeditem OWNER TO andrewramos;

--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE tagging_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tagging_taggeditem_id_seq OWNER TO andrewramos;

--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE tagging_taggeditem_id_seq OWNED BY tagging_taggeditem.id;


--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('tagging_taggeditem_id_seq', 20, true);


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO andrewramos;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO andrewramos;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO andrewramos;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: andrewramos
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO andrewramos;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: andrewramos
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: andrewramos
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE blog_article ALTER COLUMN id SET DEFAULT nextval('blog_article_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE blog_casestudy ALTER COLUMN id SET DEFAULT nextval('blog_casestudy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE blog_image ALTER COLUMN id SET DEFAULT nextval('blog_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE blog_quote ALTER COLUMN id SET DEFAULT nextval('blog_quote_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE blog_shortpost ALTER COLUMN id SET DEFAULT nextval('blog_shortpost_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE content_frontpagecontent ALTER COLUMN id SET DEFAULT nextval('content_frontpagecontent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE easy_thumbnails_storage ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_storage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE portfolio_category ALTER COLUMN id SET DEFAULT nextval('portfolio_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE portfolio_client ALTER COLUMN id SET DEFAULT nextval('portfolio_client_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE portfolio_portfoliopiece ALTER COLUMN id SET DEFAULT nextval('portfolio_portfoliopiece_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE portfolio_project ALTER COLUMN id SET DEFAULT nextval('portfolio_project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE tagging_tag ALTER COLUMN id SET DEFAULT nextval('tagging_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE tagging_taggeditem ALTER COLUMN id SET DEFAULT nextval('tagging_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: andrewramos
--

ALTER TABLE taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: andrewramos
--



--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: andrewramos
--



--
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: andrewramos
--



--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO auth_permission VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO auth_permission VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO auth_permission VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO auth_permission VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO auth_permission VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO auth_permission VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO auth_permission VALUES (7, 'Can add user', 3, 'add_user');
INSERT INTO auth_permission VALUES (8, 'Can change user', 3, 'change_user');
INSERT INTO auth_permission VALUES (9, 'Can delete user', 3, 'delete_user');
INSERT INTO auth_permission VALUES (10, 'Can add message', 4, 'add_message');
INSERT INTO auth_permission VALUES (11, 'Can change message', 4, 'change_message');
INSERT INTO auth_permission VALUES (12, 'Can delete message', 4, 'delete_message');
INSERT INTO auth_permission VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission VALUES (19, 'Can add site', 7, 'add_site');
INSERT INTO auth_permission VALUES (20, 'Can change site', 7, 'change_site');
INSERT INTO auth_permission VALUES (21, 'Can delete site', 7, 'delete_site');
INSERT INTO auth_permission VALUES (22, 'Can add log entry', 8, 'add_logentry');
INSERT INTO auth_permission VALUES (23, 'Can change log entry', 8, 'change_logentry');
INSERT INTO auth_permission VALUES (24, 'Can delete log entry', 8, 'delete_logentry');
INSERT INTO auth_permission VALUES (25, 'Can add migration history', 9, 'add_migrationhistory');
INSERT INTO auth_permission VALUES (26, 'Can change migration history', 9, 'change_migrationhistory');
INSERT INTO auth_permission VALUES (27, 'Can delete migration history', 9, 'delete_migrationhistory');
INSERT INTO auth_permission VALUES (28, 'Can add tag', 10, 'add_tag');
INSERT INTO auth_permission VALUES (29, 'Can change tag', 10, 'change_tag');
INSERT INTO auth_permission VALUES (30, 'Can delete tag', 10, 'delete_tag');
INSERT INTO auth_permission VALUES (31, 'Can add tagged item', 11, 'add_taggeditem');
INSERT INTO auth_permission VALUES (32, 'Can change tagged item', 11, 'change_taggeditem');
INSERT INTO auth_permission VALUES (33, 'Can delete tagged item', 11, 'delete_taggeditem');
INSERT INTO auth_permission VALUES (34, 'Can add storage', 12, 'add_storage');
INSERT INTO auth_permission VALUES (35, 'Can change storage', 12, 'change_storage');
INSERT INTO auth_permission VALUES (36, 'Can delete storage', 12, 'delete_storage');
INSERT INTO auth_permission VALUES (37, 'Can add source', 13, 'add_source');
INSERT INTO auth_permission VALUES (38, 'Can change source', 13, 'change_source');
INSERT INTO auth_permission VALUES (39, 'Can delete source', 13, 'delete_source');
INSERT INTO auth_permission VALUES (40, 'Can add thumbnail', 14, 'add_thumbnail');
INSERT INTO auth_permission VALUES (41, 'Can change thumbnail', 14, 'change_thumbnail');
INSERT INTO auth_permission VALUES (42, 'Can delete thumbnail', 14, 'delete_thumbnail');
INSERT INTO auth_permission VALUES (43, 'Can add image', 15, 'add_image');
INSERT INTO auth_permission VALUES (44, 'Can change image', 15, 'change_image');
INSERT INTO auth_permission VALUES (45, 'Can delete image', 15, 'delete_image');
INSERT INTO auth_permission VALUES (46, 'Can add article', 16, 'add_article');
INSERT INTO auth_permission VALUES (47, 'Can change article', 16, 'change_article');
INSERT INTO auth_permission VALUES (48, 'Can delete article', 16, 'delete_article');
INSERT INTO auth_permission VALUES (49, 'Can add case study', 17, 'add_casestudy');
INSERT INTO auth_permission VALUES (50, 'Can change case study', 17, 'change_casestudy');
INSERT INTO auth_permission VALUES (51, 'Can delete case study', 17, 'delete_casestudy');
INSERT INTO auth_permission VALUES (52, 'Can add short post', 18, 'add_shortpost');
INSERT INTO auth_permission VALUES (53, 'Can change short post', 18, 'change_shortpost');
INSERT INTO auth_permission VALUES (54, 'Can delete short post', 18, 'delete_shortpost');
INSERT INTO auth_permission VALUES (55, 'Can add quote', 19, 'add_quote');
INSERT INTO auth_permission VALUES (56, 'Can change quote', 19, 'change_quote');
INSERT INTO auth_permission VALUES (57, 'Can delete quote', 19, 'delete_quote');
INSERT INTO auth_permission VALUES (58, 'Can add project', 20, 'add_project');
INSERT INTO auth_permission VALUES (59, 'Can change project', 20, 'change_project');
INSERT INTO auth_permission VALUES (60, 'Can delete project', 20, 'delete_project');
INSERT INTO auth_permission VALUES (61, 'Can add image', 21, 'add_category');
INSERT INTO auth_permission VALUES (62, 'Can change image', 21, 'change_category');
INSERT INTO auth_permission VALUES (63, 'Can delete image', 21, 'delete_category');
INSERT INTO auth_permission VALUES (64, 'Can add portfolio piece', 22, 'add_portfoliopiece');
INSERT INTO auth_permission VALUES (65, 'Can change portfolio piece', 22, 'change_portfoliopiece');
INSERT INTO auth_permission VALUES (66, 'Can delete portfolio piece', 22, 'delete_portfoliopiece');
INSERT INTO auth_permission VALUES (67, 'Can add client', 23, 'add_client');
INSERT INTO auth_permission VALUES (68, 'Can change client', 23, 'change_client');
INSERT INTO auth_permission VALUES (69, 'Can delete client', 23, 'delete_client');
INSERT INTO auth_permission VALUES (70, 'Can add static page', 24, 'add_staticpage');
INSERT INTO auth_permission VALUES (71, 'Can change static page', 24, 'change_staticpage');
INSERT INTO auth_permission VALUES (72, 'Can delete static page', 24, 'delete_staticpage');
INSERT INTO auth_permission VALUES (73, 'Can add email', 25, 'add_emailmessage');
INSERT INTO auth_permission VALUES (74, 'Can change email', 25, 'change_emailmessage');
INSERT INTO auth_permission VALUES (75, 'Can delete email', 25, 'delete_emailmessage');
INSERT INTO auth_permission VALUES (76, 'Can add front page image', 26, 'add_frontpagecontent');
INSERT INTO auth_permission VALUES (77, 'Can change front page image', 26, 'change_frontpagecontent');
INSERT INTO auth_permission VALUES (78, 'Can delete front page image', 26, 'delete_frontpagecontent');
INSERT INTO auth_permission VALUES (79, 'Can add Tag', 27, 'add_tag');
INSERT INTO auth_permission VALUES (80, 'Can change Tag', 27, 'change_tag');
INSERT INTO auth_permission VALUES (81, 'Can delete Tag', 27, 'delete_tag');
INSERT INTO auth_permission VALUES (82, 'Can add Tagged Item', 28, 'add_taggeditem');
INSERT INTO auth_permission VALUES (83, 'Can change Tagged Item', 28, 'change_taggeditem');
INSERT INTO auth_permission VALUES (84, 'Can delete Tagged Item', 28, 'delete_taggeditem');


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO auth_user VALUES (1, 'mikemeyer', 'Michael', 'Meyer', '[REDACTED]', '[REDACTED]', true, true, true, '2011-06-24 04:30:38.33026+00', '2010-08-11 04:43:32+00');
INSERT INTO auth_user VALUES (4, 'demouser', '', '', '', '[REDACTED]', false, true, false, '2011-02-07 22:23:00.231517+00', '2011-02-07 22:23:00.231536+00');
INSERT INTO auth_user VALUES (2, 'andrew', 'Andrew', 'Ramos', '[REDACTED]', '[REDACTED]', true, true, false, '2011-06-17 22:40:38.531654+00', '2010-08-11 05:09:37+00');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: andrewramos
--



--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO auth_user_user_permissions VALUES (64, 2, 13);
INSERT INTO auth_user_user_permissions VALUES (65, 2, 14);
INSERT INTO auth_user_user_permissions VALUES (66, 2, 15);
INSERT INTO auth_user_user_permissions VALUES (67, 2, 16);
INSERT INTO auth_user_user_permissions VALUES (68, 2, 17);
INSERT INTO auth_user_user_permissions VALUES (69, 2, 18);
INSERT INTO auth_user_user_permissions VALUES (70, 2, 22);
INSERT INTO auth_user_user_permissions VALUES (71, 2, 23);
INSERT INTO auth_user_user_permissions VALUES (72, 2, 24);
INSERT INTO auth_user_user_permissions VALUES (73, 2, 25);
INSERT INTO auth_user_user_permissions VALUES (74, 2, 26);
INSERT INTO auth_user_user_permissions VALUES (75, 2, 27);
INSERT INTO auth_user_user_permissions VALUES (76, 2, 28);
INSERT INTO auth_user_user_permissions VALUES (77, 2, 29);
INSERT INTO auth_user_user_permissions VALUES (78, 2, 30);
INSERT INTO auth_user_user_permissions VALUES (79, 2, 31);
INSERT INTO auth_user_user_permissions VALUES (80, 2, 32);
INSERT INTO auth_user_user_permissions VALUES (81, 2, 33);
INSERT INTO auth_user_user_permissions VALUES (82, 2, 34);
INSERT INTO auth_user_user_permissions VALUES (83, 2, 35);
INSERT INTO auth_user_user_permissions VALUES (84, 2, 36);
INSERT INTO auth_user_user_permissions VALUES (85, 2, 37);
INSERT INTO auth_user_user_permissions VALUES (86, 2, 38);
INSERT INTO auth_user_user_permissions VALUES (87, 2, 39);
INSERT INTO auth_user_user_permissions VALUES (88, 2, 40);
INSERT INTO auth_user_user_permissions VALUES (89, 2, 41);
INSERT INTO auth_user_user_permissions VALUES (90, 2, 42);
INSERT INTO auth_user_user_permissions VALUES (91, 2, 43);
INSERT INTO auth_user_user_permissions VALUES (92, 2, 44);
INSERT INTO auth_user_user_permissions VALUES (93, 2, 45);
INSERT INTO auth_user_user_permissions VALUES (94, 2, 46);
INSERT INTO auth_user_user_permissions VALUES (95, 2, 47);
INSERT INTO auth_user_user_permissions VALUES (96, 2, 48);
INSERT INTO auth_user_user_permissions VALUES (97, 2, 49);
INSERT INTO auth_user_user_permissions VALUES (98, 2, 50);
INSERT INTO auth_user_user_permissions VALUES (99, 2, 51);
INSERT INTO auth_user_user_permissions VALUES (100, 2, 52);
INSERT INTO auth_user_user_permissions VALUES (101, 2, 53);
INSERT INTO auth_user_user_permissions VALUES (102, 2, 54);
INSERT INTO auth_user_user_permissions VALUES (103, 2, 55);
INSERT INTO auth_user_user_permissions VALUES (104, 2, 56);
INSERT INTO auth_user_user_permissions VALUES (105, 2, 57);
INSERT INTO auth_user_user_permissions VALUES (106, 2, 58);
INSERT INTO auth_user_user_permissions VALUES (107, 2, 59);
INSERT INTO auth_user_user_permissions VALUES (108, 2, 60);
INSERT INTO auth_user_user_permissions VALUES (109, 2, 61);
INSERT INTO auth_user_user_permissions VALUES (110, 2, 62);
INSERT INTO auth_user_user_permissions VALUES (111, 2, 63);
INSERT INTO auth_user_user_permissions VALUES (112, 2, 64);
INSERT INTO auth_user_user_permissions VALUES (113, 2, 65);
INSERT INTO auth_user_user_permissions VALUES (114, 2, 66);
INSERT INTO auth_user_user_permissions VALUES (115, 2, 67);
INSERT INTO auth_user_user_permissions VALUES (116, 2, 68);
INSERT INTO auth_user_user_permissions VALUES (117, 2, 69);
INSERT INTO auth_user_user_permissions VALUES (118, 2, 70);
INSERT INTO auth_user_user_permissions VALUES (119, 2, 71);
INSERT INTO auth_user_user_permissions VALUES (120, 2, 72);
INSERT INTO auth_user_user_permissions VALUES (121, 2, 73);
INSERT INTO auth_user_user_permissions VALUES (122, 2, 74);
INSERT INTO auth_user_user_permissions VALUES (123, 2, 75);
INSERT INTO auth_user_user_permissions VALUES (124, 2, 76);
INSERT INTO auth_user_user_permissions VALUES (125, 2, 77);
INSERT INTO auth_user_user_permissions VALUES (126, 2, 78);


--
-- Data for Name: blog_article; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO blog_article VALUES (1, 'The Glass Bottle Effect', 'glass-bottle-effect', 'The presentation of a product is so important. How it looks and feels conveys a level of quality about the product and what you can expect from it. But even how you''re introduced to it can play into your evaluation of the product or brand. While in Prague this last summer, we noticed there seemed to be much less advertising than what we are used to Stateside. Instead of brands being able to *tell* me how good they were, they had to *prove* it to me.

Here in the States, the Coca-Cola brand means little to nothing for me. It''s a simple soft drink (or soda, or pop depending on your geographical persuasion). It''s a cheap drink that''s delivered in an equally cheap plastic package. But in Prague, glass bottles were the norm. And not just any glass bottles mind you—heavy, re-used glass bottles. The kind of glass bottle that would literally bounce if you dropped it. The kind of glass bottle where the logo was actually raised from the side creating a wonderful tactile quality. When it was actually brought to the table, it was poured into another glass like it was some fine wine, like maybe I would need to approve the bottle before it was poured. And it was incredibly good. This wasn''t a cheap drink, this was something everyone looked forward to. Can a simple change in presentation make that much of a difference? *Absolutely.*
', '<p>The presentation of a product is so important. How it looks and feels conveys a level of quality about the product and what you can expect from it. But even how you''re introduced to it can play into your evaluation of the product or brand. While in Prague this last summer, we noticed there seemed to be much less advertising than what we are used to Stateside. Instead of brands being able to <em>tell</em> me how good they were, they had to <em>prove</em> it to me.</p>
<p>Here in the States, the Coca-Cola brand means little to nothing for me. It''s a simple soft drink (or soda, or pop depending on your geographical persuasion). It''s a cheap drink that''s delivered in an equally cheap plastic package. But in Prague, glass bottles were the norm. And not just any glass bottles mind you—heavy, re-used glass bottles. The kind of glass bottle that would literally bounce if you dropped it. The kind of glass bottle where the logo was actually raised from the side creating a wonderful tactile quality. When it was actually brought to the table, it was poured into another glass like it was some fine wine, like maybe I would need to approve the bottle before it was poured. And it was incredibly good. This wasn''t a cheap drink, this was something everyone looked forward to. Can a simple change in presentation make that much of a difference? <em>Absolutely.</em></p>', true, '2010-08-11 22:47:36.045215+00', '2010-08-14 19:33:22.067889+00', '2010-08-11 22:41:38+00', 'p', '', true, '', 'p');
INSERT INTO blog_article VALUES (2, 'GVL / PRG', 'gvl-prg', 'A few travel details from our flight to Prague this last summer. ', '<p>A few travel details from our flight to Prague this last summer. </p>', false, '2010-08-11 23:17:47.450515+00', '2010-09-13 18:00:15.797452+00', '2010-08-07 23:16:38+00', 'p', '', false, '', 'f');
INSERT INTO blog_article VALUES (9, 'iTV and the Apple Cloud', 'apple-cloud', 'As an Apple TV user for the last two years, it''s been particularly interesting to hear the speculation of an updated device. Overall, I''ve enjoyed the experience of the Apple TV. It has a relatively limited offering, but what it does, it does well. It''s allowed us to comfortably ditch cable for the last two years and still enjoy the shows we like, when we want them—with no commercials. The tv shows and movies are ready to watch within seconds, so it''s all around pretty enjoyable. 

There are a few areas it stumbles in though, one being storage. I rarely watch a tv show a second time, but also have a hard time deleting that content, so it sits on the device taking up valuable space. Movies take up even more space and we only watch them a few times a year. I see a disconnect there. Is there any real value in owning the physical data, whether disc or digital? Personally, I have no interest in having tv shows and movies stored locally. I suppose you could argue music is a little different since you may listen to it more often than you would watch videos, but even then the music I''m listening to right now is streaming via Pandora. If the rumors are true, we''ll soon be able to upload our music, tv shows and movies to an account on the Apple Cloud and then access it from a computer, iTV, iPad, etc while having the *option* to save it to a device if needed. You then have access to all your purchased content, without sacrificing hard drive space. With companies like Pandora and Hulu leading the way, the idea of local media storage is quickly becoming a thing of the past.
', '<p>As an Apple TV user for the last two years, it''s been particularly interesting to hear the speculation of an updated device. Overall, I''ve enjoyed the experience of the Apple TV. It has a relatively limited offering, but what it does, it does well. It''s allowed us to comfortably ditch cable for the last two years and still enjoy the shows we like, when we want them—with no commercials. The tv shows and movies are ready to watch within seconds, so it''s all around pretty enjoyable. </p>
<p>There are a few areas it stumbles in though, one being storage. I rarely watch a tv show a second time, but also have a hard time deleting that content, so it sits on the device taking up valuable space. Movies take up even more space and we only watch them a few times a year. I see a disconnect there. Is there any real value in owning the physical data, whether disc or digital? Personally, I have no interest in having tv shows and movies stored locally. I suppose you could argue music is a little different since you may listen to it more often than you would watch videos, but even then the music I''m listening to right now is streaming via Pandora. If the rumors are true, we''ll soon be able to upload our music, tv shows and movies to an account on the Apple Cloud and then access it from a computer, iTV, iPad, etc while having the <em>option</em> to save it to a device if needed. You then have access to all your purchased content, without sacrificing hard drive space. With companies like Pandora and Hulu leading the way, the idea of local media storage is quickly becoming a thing of the past.</p>', false, '2010-08-31 15:23:13.644829+00', '2011-01-25 21:07:08.134102+00', '2010-08-31 15:16:50+00', 'p', '', true, '', 'f');
INSERT INTO blog_article VALUES (3, 'Specialty Shops', 'specialty-shops', 'Most Saturday mornings I can be found at my city''s Downtown Market. Loads of fresh food available directly from the local farmers themselves. I was thinking this week how each booth there is like it''s own little specialty shop: They''re focused on a small niche, passionate about what they are doing, and are intensely focused on providing value to their customers. I love that. Other shops or stores may offer more products--they may even cost less--but that doesn''t mean it''s valuable. Honestly, It''s tough to match the passion for quality and the deep desire to make something better that comes with running a small shop. 

The same thing goes for my business. I don''t want to be the shop that offers everything possible. Generic products and ideas wrapped with a shiny ribbon of business jargon. I want to provide a niche offering of identity and illustration that''s focused on the client, meeting them where they are at and helping them move forward. Carefully crafting a brand that pays attention to the small things, all those little details that add up to so much—because that''s *worth* something. Because that *is* valuable.', '<p>Most Saturday mornings I can be found at my city''s Downtown Market. Loads of fresh food available directly from the local farmers themselves. I was thinking this week how each booth there is like it''s own little specialty shop: They''re focused on a small niche, passionate about what they are doing, and are intensely focused on providing value to their customers. I love that. Other shops or stores may offer more products--they may even cost less--but that doesn''t mean it''s valuable. Honestly, It''s tough to match the passion for quality and the deep desire to make something better that comes with running a small shop. </p>
<p>The same thing goes for my business. I don''t want to be the shop that offers everything possible. Generic products and ideas wrapped with a shiny ribbon of business jargon. I want to provide a niche offering of identity and illustration that''s focused on the client, meeting them where they are at and helping them move forward. Carefully crafting a brand that pays attention to the small things, all those little details that add up to so much—because that''s <em>worth</em> something. Because that <em>is</em> valuable.</p>', false, '2010-08-12 00:01:50.258669+00', '2011-01-25 21:07:08.526992+00', '2010-08-08 23:58:49+00', 'p', '', true, '', 'f');
INSERT INTO blog_article VALUES (8, 'Alarm', 'alarm', '', '', false, '2010-08-26 18:05:58.991378+00', '2010-08-27 18:11:54.742254+00', '2010-08-26 18:05:09+00', 'p', '', false, '', 'f');
INSERT INTO blog_article VALUES (4, 'Inspiration: Opened House', 'inspiration-opened-house', '[Via](http://www.dwell.com/articles/Opened-House.html)', '<p><a href="http://www.dwell.com/articles/Opened-House.html">Via</a></p>', false, '2010-08-20 19:00:34.249118+00', '2010-08-27 18:12:12.266877+00', '2010-08-20 18:56:02+00', 'p', '', false, '', 'p');
INSERT INTO blog_article VALUES (10, 'Southern Savers', 'southern-savers', 'Southern Savers is a site that makes saving money easy and rewarding. When Jenny Martin decided it was time to give the brand a new look, she first tapped Matthew Smith of Squared Eye for the web design, who then brought me in for the identity and illustration. What a great project to work on! Jenny has done such a good job of building up this business and works so hard to make saving money easy for the rest of us. 

My part started with a call and questionnaire to learn more about Jenny, Southern Savers and how she interacted with visitors and fans. Next came a mood board, which gives me a really good feel for what the client likes and dislikes, and Jenny gave us really great feedback—She was excellent to work with! Because Jenny is such a big part of the Southern Saver brand,  her personality and likes/dislikes played a bigger part than normal in this particular project. 

After that process, we take all of her feedback from the moodboard and sketch out several concepts (or directions). The direction she chose was one that used an illustration of her magnolia, but paired it with an aesthetic that was along the lines of an older general store. A palette of blue and green seemed to really fit her personal aesthetics, as well as what she was trying to accomplish with the brand. Those colors generally evoke a sense of calm and casualness, obviously very appropriate for approaching something like Southern Savers, where people may think it''s going to be complicated based on their past couponing fiascos. The hand-lettered type has an old-school feel to it, but is also clean and updated. We wanted to resist using weathering techniques for the rebrand, but also push this classic southern feel forward. We also knew we wanted other illustrations to play a role in the branding, and give Matthew at Squared Eye some nice visuals to work with as he designed the site. So in the sketches, we presented some ideas of what accompanying illustrations might look like for each direction.


Credits:

Identity and illustration: Andrew Ramos
Website Design: Squared Eye
Strategy and IA: Emily Smith
Development: Kevin Smith
Project Management: Jamin Jantz
', '<p>Southern Savers is a site that makes saving money easy and rewarding. When Jenny Martin decided it was time to give the brand a new look, she first tapped Matthew Smith of Squared Eye for the web design, who then brought me in for the identity and illustration. What a great project to work on! Jenny has done such a good job of building up this business and works so hard to make saving money easy for the rest of us. </p>
<p>My part started with a call and questionnaire to learn more about Jenny, Southern Savers and how she interacted with visitors and fans. Next came a mood board, which gives me a really good feel for what the client likes and dislikes, and Jenny gave us really great feedback—She was excellent to work with! Because Jenny is such a big part of the Southern Saver brand,  her personality and likes/dislikes played a bigger part than normal in this particular project. </p>
<p>After that process, we take all of her feedback from the moodboard and sketch out several concepts (or directions). The direction she chose was one that used an illustration of her magnolia, but paired it with an aesthetic that was along the lines of an older general store. A palette of blue and green seemed to really fit her personal aesthetics, as well as what she was trying to accomplish with the brand. Those colors generally evoke a sense of calm and casualness, obviously very appropriate for approaching something like Southern Savers, where people may think it''s going to be complicated based on their past couponing fiascos. The hand-lettered type has an old-school feel to it, but is also clean and updated. We wanted to resist using weathering techniques for the rebrand, but also push this classic southern feel forward. We also knew we wanted other illustrations to play a role in the branding, and give Matthew at Squared Eye some nice visuals to work with as he designed the site. So in the sketches, we presented some ideas of what accompanying illustrations might look like for each direction.</p>
<p>Credits:</p>
<p>Identity and illustration: Andrew Ramos
Website Design: Squared Eye
Strategy and IA: Emily Smith
Development: Kevin Smith
Project Management: Jamin Jantz</p>', false, '2010-09-08 15:59:18.904135+00', '2010-09-08 19:58:29.988722+00', '2010-09-08 13:01:00+00', 'd', '', true, 'Southern Deals & Frugal Steals', 'f');
INSERT INTO blog_article VALUES (12, 'Outsourcing Surprise & Delight', 'outsourcing-surprise-delight', 'The act of comping, or compensating, customers by occasionally giving them free drinks is a fairly routine action by Starbucks coffee shops as a way to Surprise & Delight their customers. It''s such a small gesture yet one that has big payoff. Surprise & Delight. The perfect description.

This morning a manager at my local starbucks told me that with their new rewards program, they are no longer allowing employees to comp drinks; the card system takes care of that automatically. Once you purchase 15 drinks, you''ll get a free one. But doesn''t that go against everything that ''Surprise & Delight'' tries to achieve? Why the decision to suddenly outsource the personal connection? Now there is no surprise, only expectations—and instead of delight a mere system of card-swipes.
', '<p>The act of comping, or compensating, customers by occasionally giving them free drinks is a fairly routine action by Starbucks coffee shops as a way to Surprise &amp; Delight their customers. It''s such a small gesture yet one that has big payoff. Surprise &amp; Delight. The perfect description.</p>
<p>This morning a manager at my local starbucks told me that with their new rewards program, they are no longer allowing employees to comp drinks; the card system takes care of that automatically. Once you purchase 15 drinks, you''ll get a free one. But doesn''t that go against everything that ''Surprise &amp; Delight'' tries to achieve? Why the decision to suddenly outsource the personal connection? Now there is no surprise, only expectations—and instead of delight a mere system of card-swipes.</p>', false, '2010-09-17 16:01:01.654282+00', '2010-09-17 16:03:57.723821+00', '2010-09-17 16:00:16+00', 'p', '', true, '', 'f');
INSERT INTO blog_article VALUES (13, 'Time to stop', 'time-stop', '', '', false, '2010-10-09 14:52:12.480854+00', '2010-10-09 14:57:23.94092+00', '2010-10-09 14:51:21+00', 'p', '', false, '', 'p');
INSERT INTO blog_article VALUES (16, 'Christmas Traditions', 'christmas-traditions', '', '', false, '2010-11-11 21:54:09.839537+00', '2011-03-30 14:38:04.046632+00', '2010-11-11 21:53:22+00', 'p', '', false, '', 'f');
INSERT INTO blog_article VALUES (18, 'Panel Discussion', 'panel-discussion', 'Last night I was able to sit on a panel of three designers giving a Q&A with design students. The panel consisted of an ad agency designer, an in-house designer, and a freelancer (me). Questions varied from "where do you find your inspiration?" and "how do you stay creative?" to "what''s most important in a client relationship?" and "what is the average salary?" One question I found interesting:

He asked\\*: "What things were you lacking when you started [designing]?" <br>
I said\\*\\*: "Well. Lot''s of things. So many things. But the important part is I didn''t *know* I was lacking those things. After school I just started working. We all start somewhere, and then you keep learning. 

I would have added: It''s more important to focus on what you do know than what you don''t. We start each day thinking we have things figured out and it''s not until tomorrow that we realize we never did. 

\\*Not verbatim.<br>
\\*\\*Very much not verbatim.

', '<p>Last night I was able to sit on a panel of three designers giving a Q&amp;A with design students. The panel consisted of an ad agency designer, an in-house designer, and a freelancer (me). Questions varied from "where do you find your inspiration?" and "how do you stay creative?" to "what''s most important in a client relationship?" and "what is the average salary?" One question I found interesting:</p>
<p>He asked*: "What things were you lacking when you started [designing]?" <br>
I said**: "Well. Lot''s of things. So many things. But the important part is I didn''t <em>know</em> I was lacking those things. After school I just started working. We all start somewhere, and then you keep learning. </p>
<p>I would have added: It''s more important to focus on what you do know than what you don''t. We start each day thinking we have things figured out and it''s not until tomorrow that we realize we never did. </p>
<p>*Not verbatim.<br>
**Very much not verbatim.</p>', false, '2011-01-27 21:55:32.236155+00', '2011-06-14 16:21:41.666051+00', '2011-01-27 21:02:46+00', 'p', '', false, '', 'p');
INSERT INTO blog_article VALUES (15, '4 Shots', '4-shots', '', '', false, '2010-10-25 22:42:30.157855+00', '2010-10-25 22:44:13.246392+00', '2010-10-25 22:41:30+00', 'p', '', false, '', 'p');
INSERT INTO blog_article VALUES (19, 'Designspiration', 'designspiration', 'I get a lot of questions about where to find inspiration. The usual answer is Everywhere, which is true. But it''s also just not. I <em>can</em> find inspiration everywhere, but it''s usually from a few specific sources: FFFFound, Dieline, Dribbble, Barnes & Noble, and most recently: <b>Designspiration</b>.

Hence this post. Designspiration has been great for finding new inspiration and cataloguing it for later. My dashboard is always a great starting place when I need a jumpstart for a new project. I can see what others are finding plus add great design pieces that I find elsewhere. So while you won''t see me posting on this blog about those design inspiration pieces, you''ll now know where to go to find a small piece of my inspiration collection. 

<a href="http://ds.pn/andrewramos">My Designspiration Dashboard</a>
', '<p>I get a lot of questions about where to find inspiration. The usual answer is Everywhere, which is true. But it''s also just not. I <em>can</em> find inspiration everywhere, but it''s usually from a few specific sources: FFFFound, Dieline, Dribbble, Barnes &amp; Noble, and most recently: <b>Designspiration</b>.</p>
<p>Hence this post. Designspiration has been great for finding new inspiration and cataloguing it for later. My dashboard is always a great starting place when I need a jumpstart for a new project. I can see what others are finding plus add great design pieces that I find elsewhere. So while you won''t see me posting on this blog about those design inspiration pieces, you''ll now know where to go to find a small piece of my inspiration collection. </p>
<p><a href="http://ds.pn/andrewramos">My Designspiration Dashboard</a></p>', true, '2011-03-30 14:27:07.501582+00', '2011-03-30 14:38:03.950756+00', '2011-03-30 14:16:34+00', 'p', '', false, '', 'f');
INSERT INTO blog_article VALUES (21, 'Vintage Denim Neckties', 'vintage-denim-neckties', 'These spectacular <a href="http://jachristensen-maker.blogspot.com/">ties by J. A. Christensen</a> are made of vintage denim from the 30s and 40s and are made on a single-needle sewing machine. While the first run has sold out, I''m hoping to pick one up when his second run comes out in May.
', '<p>These spectacular <a href="http://jachristensen-maker.blogspot.com/">ties by J. A. Christensen</a> are made of vintage denim from the 30s and 40s and are made on a single-needle sewing machine. While the first run has sold out, I''m hoping to pick one up when his second run comes out in May.</p>', false, '2011-04-30 15:25:26.320441+00', '2011-04-30 15:27:21.270638+00', '2011-04-30 15:16:20+00', 'p', '', true, '', 'f');
INSERT INTO blog_article VALUES (23, 'Introducing Wren for Mac', 'wren', 'Today I''m proud to announce Wren for Mac, a small Twitter app for the Mac desktop. Wren keeps you focused on what you''re doing by not showing the timeline. It lets you quickly jot down a thought, link or comment to someone and then get back to what you were doing. You can even save a tweet for later to get just the right wording, or to spread your tweets throughout the day. Learn a bit more at <a href="http://www.wrenapp.com/">wrenapp.com</a> and pick up a copy on the [Mac app store](http://j.mp/wrenapp). <b>$4.99 for a limited time!</b>

This app is the result of many months of work by myself and [Kevin Smith](http://www.kevinsmith.cc). It has been a lot of time, work and late nights—but it''s also been a lot of fun. It was honestly something we just saw a need for. I can read the timeline on several awesome apps (Twitter and Tweetbot coming to mind first), but when I''m working I want a quick way to simply share something new. Wren was my first app to design and seeing it finally launch feels *absolutely* fantastic—but there''s a lot more in store for Wren. For now, I hope you enjoy using it as much as I do. ', '<p>Today I''m proud to announce Wren for Mac, a small Twitter app for the Mac desktop. Wren keeps you focused on what you''re doing by not showing the timeline. It lets you quickly jot down a thought, link or comment to someone and then get back to what you were doing. You can even save a tweet for later to get just the right wording, or to spread your tweets throughout the day. Learn a bit more at <a href="http://www.wrenapp.com/">wrenapp.com</a> and pick up a copy on the <a href="http://j.mp/wrenapp">Mac app store</a>. <b>$4.99 for a limited time!</b></p>
<p>This app is the result of many months of work by myself and <a href="http://www.kevinsmith.cc">Kevin Smith</a>. It has been a lot of time, work and late nights—but it''s also been a lot of fun. It was honestly something we just saw a need for. I can read the timeline on several awesome apps (Twitter and Tweetbot coming to mind first), but when I''m working I want a quick way to simply share something new. Wren was my first app to design and seeing it finally launch feels <em>absolutely</em> fantastic—but there''s a lot more in store for Wren. For now, I hope you enjoy using it as much as I do. </p>', true, '2011-06-10 18:23:39.560398+00', '2011-06-21 20:57:11.815965+00', '2011-06-21 20:47:13+00', 'p', '', true, 'A tiny Twitter client that keeps you focused on your work', 'f');
INSERT INTO blog_article VALUES (24, 'All Things Must End', 'all-things-must-end', 'I recently sold my first car. Well, it wasn''t *really* my first car. But it was the first one that got me excited about cars rather than just having a license. It was a 1987 Honda CRX Si, a quick and nimble two-seater that was a sheer blast to drive. So many good memories with that car: delivering pizzas, <s>running from cops</s> *exploring backroads quickly* and surviving 1 (almost 2) engine swaps. From the beginning I had planned to restore the CRX back to her former glory. New seats, interior, wheels and paint. A new motor for more power, new shocks/struts/sway bars for stability and new brakes/pads/brake-lines to bring it to a stop. I even found some parts from the european market that were never available here. I can''t count the number of hours I spent finding parts and planning the details of the project. 

Fast-forward four years and life looks a bit different. Goals have changed, my business is growing (read: *I have no time*) and weeks are passing faster than you can spend them. My once prominent dream of a restored CRX has been overshadowed by new and exciting things. The rebuilt D16 engine that was last swapped in will now power a pretty little red 3rd Gen hatchback, and all the parts I had sourced have gone to new homes. All that''s left is the Si emblem that once adorned the back hatch, a memento of my younger days and my first car.', '<p>I recently sold my first car. Well, it wasn''t <em>really</em> my first car. But it was the first one that got me excited about cars rather than just having a license. It was a 1987 Honda CRX Si, a quick and nimble two-seater that was a sheer blast to drive. So many good memories with that car: delivering pizzas, <s>running from cops</s> <em>exploring backroads quickly</em> and surviving 1 (almost 2) engine swaps. From the beginning I had planned to restore the CRX back to her former glory. New seats, interior, wheels and paint. A new motor for more power, new shocks/struts/sway bars for stability and new brakes/pads/brake-lines to bring it to a stop. I even found some parts from the european market that were never available here. I can''t count the number of hours I spent finding parts and planning the details of the project. </p>
<p>Fast-forward four years and life looks a bit different. Goals have changed, my business is growing (read: <em>I have no time</em>) and weeks are passing faster than you can spend them. My once prominent dream of a restored CRX has been overshadowed by new and exciting things. The rebuilt D16 engine that was last swapped in will now power a pretty little red 3rd Gen hatchback, and all the parts I had sourced have gone to new homes. All that''s left is the Si emblem that once adorned the back hatch, a memento of my younger days and my first car.</p>', true, '2011-06-10 20:36:45.525904+00', '2011-06-14 16:21:12.04629+00', '2011-06-10 20:23:47+00', 'p', '', true, '', 'f');


--
-- Data for Name: blog_casestudy; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO blog_casestudy VALUES (2, 'Southern Savers', 'southern-savers', 'Southern Savers is a site that makes saving money on groceries easy and rewarding. When Jenny Martin decided it was time to give the brand a new look, she first tapped Matthew Smith of Squared Eye for the web design, who then brought me in for the identity and illustration. What a great project to work on! Jenny has done such a good job of building up this business and works so hard to make saving money easy for the rest of us. She''s passionate about her work and loves what she does so I was thrilled to be a part of the project.

My part started with a call and questionnaire to learn more about Jenny, Southern Savers and how she interacts with visitors and fans. Next came a mood board, a part of my process which gives me a really good feel for what the client likes and dislikes, and Jenny gave us really great feedback—She was excellent to work with! Because Jenny is such a big part of the Southern Savers brand, her personality and likes/dislikes played a bigger part than normal in this particular project. 

After that process, I take all of her feedback from the mood board and sketch out several concepts (or directions). The direction she chose was one that used an illustration of her trademark magnolia, but paired it with an aesthetic that was along the lines of an older general store. A palette of blue and green seemed to really fit her personal aesthetics, as well as what she was trying to accomplish with the brand. Those colors generally evoke a sense of calm and casualness, obviously very appropriate for approaching something like Southern Savers, where people may think it''s going to be complicated based on their past couponing fiascos. The hand-lettered type has an old-school feel without relying on weathering techniques, but is also clean and updated and pushes the classic southern style forward. 

From the beginning I wanted other illustrations to play a role in the branding, and give Matthew Smith from Squared Eye some nice visuals to work with as he designed the site. In my initial sketches, we presented some ideas of what accompanying illustrations might look like for each direction so that Jenny could see where we were headed. Once the logo was approved I moved my attention to the illustrations for the learning page of the site and to creating a small brand mascot—Martin the chipmunk. These additional elements add a lot of fun and personality to the overall brand and were a lot of fun to create. 

Overall, it was really great to see a team of people come together to work on such a wonderful project. I''m really pleased with the way it all came together, and I think our team did an incredible job on the IA, Site Design, Development, Print Collateral and Project Management. The new site and brand has received great comments and reviews from it''s users, and as always I''m excited to have played a part in that. Check out the <a href="http://www.southernsavers.com/">Southern Savers site</a> to see this brand in action and to start saving money on your grocery bill!<br><br>



**Credits**:<br>
Identity and illustration: <a href="http://www.andrewramos.com/">Andrew Ramos</a><br>
Website Design: <a href="http://www.squaredeye.com/">Squared Eye</a><br>
Strategy and IA: <a href="http://www.emilysmith.cc/">Emily Smith</a><br>
Development: <a href="http://www.kevinsmith.cc/">Kevin Smith</a><br>
Print Collateral: <a href="http://www.elizabethramos.com/">Elizabeth Ramos</a><br>
Project Management: <a href="http://www.twitter.com/jaminjantz">Jamin Jantz</a><br><br>
', '<p>Southern Savers is a site that makes saving money on groceries easy and rewarding. When Jenny Martin decided it was time to give the brand a new look, she first tapped Matthew Smith of Squared Eye for the web design, who then brought me in for the identity and illustration. What a great project to work on! Jenny has done such a good job of building up this business and works so hard to make saving money easy for the rest of us. She''s passionate about her work and loves what she does so I was thrilled to be a part of the project.</p>
<p>My part started with a call and questionnaire to learn more about Jenny, Southern Savers and how she interacts with visitors and fans. Next came a mood board, a part of my process which gives me a really good feel for what the client likes and dislikes, and Jenny gave us really great feedback—She was excellent to work with! Because Jenny is such a big part of the Southern Savers brand, her personality and likes/dislikes played a bigger part than normal in this particular project. </p>
<p>After that process, I take all of her feedback from the mood board and sketch out several concepts (or directions). The direction she chose was one that used an illustration of her trademark magnolia, but paired it with an aesthetic that was along the lines of an older general store. A palette of blue and green seemed to really fit her personal aesthetics, as well as what she was trying to accomplish with the brand. Those colors generally evoke a sense of calm and casualness, obviously very appropriate for approaching something like Southern Savers, where people may think it''s going to be complicated based on their past couponing fiascos. The hand-lettered type has an old-school feel without relying on weathering techniques, but is also clean and updated and pushes the classic southern style forward. </p>
<p>From the beginning I wanted other illustrations to play a role in the branding, and give Matthew Smith from Squared Eye some nice visuals to work with as he designed the site. In my initial sketches, we presented some ideas of what accompanying illustrations might look like for each direction so that Jenny could see where we were headed. Once the logo was approved I moved my attention to the illustrations for the learning page of the site and to creating a small brand mascot—Martin the chipmunk. These additional elements add a lot of fun and personality to the overall brand and were a lot of fun to create. </p>
<p>Overall, it was really great to see a team of people come together to work on such a wonderful project. I''m really pleased with the way it all came together, and I think our team did an incredible job on the IA, Site Design, Development, Print Collateral and Project Management. The new site and brand has received great comments and reviews from it''s users, and as always I''m excited to have played a part in that. Check out the <a href="http://www.southernsavers.com/">Southern Savers site</a> to see this brand in action and to start saving money on your grocery bill!<br><br></p>
<p><strong>Credits</strong>:<br>
Identity and illustration: <a href="http://www.andrewramos.com/">Andrew Ramos</a><br>
Website Design: <a href="http://www.squaredeye.com/">Squared Eye</a><br>
Strategy and IA: <a href="http://www.emilysmith.cc/">Emily Smith</a><br>
Development: <a href="http://www.kevinsmith.cc/">Kevin Smith</a><br>
Print Collateral: <a href="http://www.elizabethramos.com/">Elizabeth Ramos</a><br>
Project Management: <a href="http://www.twitter.com/jaminjantz">Jamin Jantz</a><br><br></p>', false, '2010-09-08 20:05:35.562288+00', '2011-01-25 21:07:21.52122+00', '2010-09-08 19:52:58+00', 'p', '', 'f');


--
-- Data for Name: blog_image; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO blog_image VALUES (1, 'uploads/blog/Travel.jpg', 16, 2);
INSERT INTO blog_image VALUES (3, 'uploads/blog/Saturday-Market-peaches.jpg', 16, 3);
INSERT INTO blog_image VALUES (2, 'uploads/blog/Glass-Bottle.jpg', 16, 1);
INSERT INTO blog_image VALUES (4, 'uploads/blog/edstrom-house-exterior.jpg', 16, 4);
INSERT INTO blog_image VALUES (6, 'uploads/blog/Alarm-Clock.jpg', 16, 8);
INSERT INTO blog_image VALUES (7, 'uploads/blog/Apple-Cloud.jpg', 16, 9);
INSERT INTO blog_image VALUES (8, 'uploads/blog/SS-sketches.jpg', 16, 10);
INSERT INTO blog_image VALUES (9, 'uploads/blog/SS-logo.jpg', 16, 10);
INSERT INTO blog_image VALUES (10, 'uploads/blog/SS-learning.jpg', 16, 10);
INSERT INTO blog_image VALUES (11, 'uploads/blog/SS-martin.jpg', 16, 10);
INSERT INTO blog_image VALUES (12, 'uploads/blog/SS-sketches2.jpg', 16, 10);
INSERT INTO blog_image VALUES (13, 'uploads/blog/SS-logo_1.jpg', 17, 2);
INSERT INTO blog_image VALUES (14, 'uploads/blog/SS-sketches_1.jpg', 17, 2);
INSERT INTO blog_image VALUES (15, 'uploads/blog/SS-learning_1.jpg', 17, 2);
INSERT INTO blog_image VALUES (18, 'uploads/blog/Traffic-Light_1.jpg', 16, 13);
INSERT INTO blog_image VALUES (20, 'uploads/blog/4_Shots_1.jpg', 16, 15);
INSERT INTO blog_image VALUES (21, 'uploads/blog/DontWorry.jpg', 16, 16);
INSERT INTO blog_image VALUES (16, 'uploads/blog/SS-martin_2.jpg', 17, 2);
INSERT INTO blog_image VALUES (23, 'uploads/blog/QA_1.jpg', 16, 18);
INSERT INTO blog_image VALUES (24, 'uploads/blog/Designspiration.png', 16, 19);
INSERT INTO blog_image VALUES (26, 'uploads/blog/Ties.png', 16, 21);
INSERT INTO blog_image VALUES (28, 'uploads/blog/GoodbyeCRX_3.jpg', 16, 24);
INSERT INTO blog_image VALUES (27, 'uploads/blog/Wren-Launch2.jpg', 16, 23);


--
-- Data for Name: blog_quote; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO blog_quote VALUES (2, 'Decisions are progress', 'decisions-are-progress', 'You can''t build on top of "We''ll decide later," but you can build on top of "Done." Decisions are progress.', '<p>You can''t build on top of "We''ll decide later," but you can build on top of "Done." Decisions are progress.</p>', false, '2010-08-18 13:29:41.14096+00', '2010-08-22 04:15:41.340785+00', '2010-08-18 13:24:29+00', 'p', ' <a href="http://37signals.com/rework/">Rework</a>, 37 Signals');
INSERT INTO blog_quote VALUES (1, 'The Scariest Moment', 'scariest-moment', 'The scariest moment is always just before you start.', '<p>The scariest moment is always just before you start.</p>', false, '2010-08-11 22:52:37.077108+00', '2010-09-13 18:00:29.494973+00', '2010-08-06 22:51:07+00', 'p', 'Stephen King');
INSERT INTO blog_quote VALUES (3, 'Fortnight', 'fortnight', 'I like when good things happen to me, but I wait two weeks to tell anyone because I like to use the word fortnight.', '<p>I like when good things happen to me, but I wait two weeks to tell anyone because I like to use the word fortnight.</p>', false, '2011-04-30 15:35:54.804345+00', '2011-04-30 15:36:26.293268+00', '2011-04-30 15:28:32+00', 'p', 'Demetri Martin');
INSERT INTO blog_quote VALUES (5, 'Texting & Driving', 'texting-driving', 'Maybe the reason texting and driving is so dangerous is we just don''t practice enough.', '<p>Maybe the reason texting and driving is so dangerous is we just don''t practice enough.</p>', false, '2011-06-10 13:04:56.004548+00', '2011-06-10 13:08:53.087825+00', '2011-06-10 13:03:11+00', 'p', '@WhollySchmidt');
INSERT INTO blog_quote VALUES (4, 'The Art of Living', 'the-art-of-living', 'A master in the art of living draws no sharp distinction between his work and his play; his labor and his leisure; his mind and his body; his education and his recreation. He hardly knows which is which. He simply pursues his vision of excellence through whatever he is doing, and leaves others to determine whether he is working or playing. To himself, he always appears to be doing both.', '<p>A master in the art of living draws no sharp distinction between his work and his play; his labor and his leisure; his mind and his body; his education and his recreation. He hardly knows which is which. He simply pursues his vision of excellence through whatever he is doing, and leaves others to determine whether he is working or playing. To himself, he always appears to be doing both.</p>', false, '2011-05-22 18:56:39.262025+00', '2011-06-14 16:22:01.042328+00', '2011-05-22 18:55:03+00', 'p', 'François Auguste René Chateaubriand');


--
-- Data for Name: blog_shortpost; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO blog_shortpost VALUES (1, 'Dropbox', 'dropbox', 'If you haven''t tried Dropbox yet, I highly recommend it. It''s a great way to share files with others and backup your work. Also, sign up via this link and we''ll both get some complimentary MBs:', '<p>If you haven''t tried Dropbox yet, I highly recommend it. It''s a great way to share files with others and backup your work. Also, sign up via this link and we''ll both get some complimentary MBs:</p>', true, '2010-08-11 22:55:07.325778+00', '2010-08-12 19:43:18.529578+00', '2010-08-09 22:54:08+00', 'p', 'http://tiny.cc/morespace');
INSERT INTO blog_shortpost VALUES (3, 'Today I wish I had a bicycle', 'today-i-wish-i-had-bicycle', 'Not because the weather is particularly beautiful, although it is a fine day out. And not for the sake of exercise, even though it''s a great benefit. Today I simply want to feel the wind rushing against my face as I peddle as fast and hard as I''m able, stopping only when I''m completely out of breath. Today a car feels like cheating, like I''m missing the point of movement.', '<p>Not because the weather is particularly beautiful, although it is a fine day out. And not for the sake of exercise, even though it''s a great benefit. Today I simply want to feel the wind rushing against my face as I peddle as fast and hard as I''m able, stopping only when I''m completely out of breath. Today a car feels like cheating, like I''m missing the point of movement.</p>', false, '2011-04-26 14:58:34.571282+00', '2011-04-26 15:00:14.140928+00', '2011-04-26 14:49:27+00', 'p', '');
INSERT INTO blog_shortpost VALUES (11, 'What''s making me laugh this week', 'whats-making-me-laugh-this-week', 'This Canadian Border Patrol sketch from HBO. It''s an oldie, but well worth watching this very minute.', '<p>This Canadian Border Patrol sketch from HBO. It''s an oldie, but well worth watching this very minute.</p>', false, '2011-05-14 17:45:22.131269+00', '2011-05-14 17:46:07.41886+00', '2011-05-14 17:44:22+00', 'p', 'http://youtu.be/DFcIH2tK2iM');
INSERT INTO blog_shortpost VALUES (12, 'Fear', 'smoke-monster', 'Every once in a while, I can hear a distant motorbike''s high-pitched groaning as it tears down a neighboring street. The throaty rumble of the exhaust, the whine of the engine and the sound of leaves and twigs being crushed as it moves along it''s path. <br>
<br>
In my mind, I fear the smoke monster is coming.', '<p>Every once in a while, I can hear a distant motorbike''s high-pitched groaning as it tears down a neighboring street. The throaty rumble of the exhaust, the whine of the engine and the sound of leaves and twigs being crushed as it moves along it''s path. <br>
<br>
In my mind, I fear the smoke monster is coming.</p>', false, '2011-06-03 17:06:06.901961+00', '2011-06-03 17:13:35.934263+00', '2011-06-03 16:57:14+00', 'p', '');


--
-- Data for Name: content_frontpagecontent; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO content_frontpagecontent VALUES (1, 'uploads/front-page/shot_1279813053.png', 'http://dribbble.com/shots/37234-Keys', false);
INSERT INTO content_frontpagecontent VALUES (2, 'uploads/front-page/shot_1281106568.png', 'http://dribbble.com/shots/42521-The-Trappe-Door-Identity-In-Progress', false);
INSERT INTO content_frontpagecontent VALUES (3, 'uploads/front-page/New_iTunes_Icon.png', 'http://andrewramos.com/media/iTunes-icon.png', false);
INSERT INTO content_frontpagecontent VALUES (5, 'uploads/front-page/Screen_shot_2010-10-06_at_3.29.21_PM.png', 'http://drbl.in/62701', false);
INSERT INTO content_frontpagecontent VALUES (4, 'uploads/front-page/Screen_shot_2010-09-02_at_4.49.35_PM.png', 'http://drbl.in/51712', false);
INSERT INTO content_frontpagecontent VALUES (6, 'uploads/front-page/Subpage.jpg', 'http://drbl.in/MWb', false);
INSERT INTO content_frontpagecontent VALUES (10, 'uploads/front-page/Screen_shot_2011-03-23_at_9.11.08_PM_2.png', 'http://drbl.in/Yra', true);
INSERT INTO content_frontpagecontent VALUES (12, 'uploads/front-page/Screen_shot_2011-04-13_at_3.41.07_PM_1.png', 'http://drbl.in/bcQD', true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO django_admin_log VALUES (1, '2010-08-11 04:57:57.040192+00', 1, 24, '1', 'About (about)', 1, '');
INSERT INTO django_admin_log VALUES (2, '2010-08-11 04:58:18.982843+00', 1, 7, '1', 'andrewramos.com', 2, 'Changed domain and name.');
INSERT INTO django_admin_log VALUES (3, '2010-08-11 05:09:37.38298+00', 1, 3, '2', 'andrewramos', 1, '');
INSERT INTO django_admin_log VALUES (4, '2010-08-11 05:10:18.274587+00', 1, 3, '2', 'andrewramos', 2, 'Changed first_name, last_name, email, is_staff and user_permissions.');
INSERT INTO django_admin_log VALUES (5, '2010-08-11 05:11:18.493456+00', 1, 3, '2', 'andrew', 2, 'Changed username.');
INSERT INTO django_admin_log VALUES (6, '2010-08-11 14:00:23.550782+00', 1, 7, '1', 'dev.andrewramos.com', 2, 'Changed domain.');
INSERT INTO django_admin_log VALUES (7, '2010-08-11 18:48:17.688751+00', 1, 24, '1', 'About (about)', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (8, '2010-08-11 22:47:36.321071+00', 2, 16, '1', 'Glass Bottle Delicacy', 1, '');
INSERT INTO django_admin_log VALUES (9, '2010-08-11 22:50:55.384262+00', 2, 16, '1', 'Glass Bottle Delicacy', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (10, '2010-08-11 22:52:37.170266+00', 2, 19, '1', 'The Scariest Moment', 1, '');
INSERT INTO django_admin_log VALUES (11, '2010-08-11 22:53:59.442007+00', 2, 17, '1', 'Southern Savers', 1, '');
INSERT INTO django_admin_log VALUES (12, '2010-08-11 22:55:07.364823+00', 2, 18, '1', 'Dropbox', 1, '');
INSERT INTO django_admin_log VALUES (13, '2010-08-11 23:05:46.869333+00', 1, 26, '1', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (14, '2010-08-11 23:08:17.061514+00', 2, 26, '2', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (15, '2010-08-11 23:09:09.484922+00', 2, 26, '2', 'Front page image', 2, 'Changed link.');
INSERT INTO django_admin_log VALUES (16, '2010-08-11 23:09:51.056709+00', 2, 18, '1', 'Dropbox', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (17, '2010-08-11 23:13:35.606115+00', 2, 23, '1', 'Personal', 1, '');
INSERT INTO django_admin_log VALUES (18, '2010-08-11 23:13:43.277274+00', 2, 20, '1', 'Teaser images', 1, '');
INSERT INTO django_admin_log VALUES (19, '2010-08-11 23:13:53.741458+00', 2, 20, '1', 'Teaser Images', 2, 'Changed title.');
INSERT INTO django_admin_log VALUES (20, '2010-08-11 23:16:26.750991+00', 2, 20, '1', 'Teaser Images', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (21, '2010-08-11 23:17:47.459334+00', 2, 16, '2', 'GVL / PRG', 1, '');
INSERT INTO django_admin_log VALUES (22, '2010-08-11 23:18:22.277148+00', 2, 16, '2', 'GVL / PRG', 2, 'Added image "Image 1".');
INSERT INTO django_admin_log VALUES (23, '2010-08-11 23:22:21.85273+00', 2, 20, '1', 'Teaser Images', 2, 'Changed case_study.');
INSERT INTO django_admin_log VALUES (24, '2010-08-11 23:31:52.885106+00', 2, 16, '1', 'Glass Bottle Delicacy', 2, 'Changed content_markdown. Added image "Image 2".');
INSERT INTO django_admin_log VALUES (25, '2010-08-11 23:32:36.706972+00', 2, 17, '1', 'Southern Savers', 3, '');
INSERT INTO django_admin_log VALUES (26, '2010-08-11 23:46:15.503845+00', 2, 26, '2', 'Front page image', 2, 'Changed image and link.');
INSERT INTO django_admin_log VALUES (27, '2010-08-11 23:46:36.014383+00', 2, 26, '1', 'Front page image', 2, 'Changed image and link.');
INSERT INTO django_admin_log VALUES (28, '2010-08-11 23:51:48.595084+00', 2, 19, '1', 'The Scariest Moment', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (29, '2010-08-11 23:51:59.03364+00', 2, 16, '2', 'GVL / PRG', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (30, '2010-08-11 23:51:59.082002+00', 2, 16, '1', 'Glass Bottle Delicacy', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (31, '2010-08-11 23:54:36.390586+00', 1, 16, '1', 'Glass Bottle Delicacy', 2, 'Changed tags.');
INSERT INTO django_admin_log VALUES (32, '2010-08-11 23:56:05.379271+00', 1, 16, '1', 'Glass Bottle Delicacy', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (33, '2010-08-12 00:01:50.275473+00', 2, 16, '3', 'Specialty Shops', 1, '');
INSERT INTO django_admin_log VALUES (34, '2010-08-12 00:04:25.974647+00', 1, 16, '3', 'Specialty Shops', 2, 'Changed tags.');
INSERT INTO django_admin_log VALUES (35, '2010-08-12 00:22:48.84394+00', 2, 16, '1', 'Glass Bottle Delicacy', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (36, '2010-08-12 00:31:33.395036+00', 2, 16, '1', 'Glass Bottle Delicacy', 2, 'Changed image for image "Image 2".');
INSERT INTO django_admin_log VALUES (37, '2010-08-12 03:18:03.907399+00', 2, 24, '1', 'About (about)', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (38, '2010-08-12 04:16:40.253129+00', 1, 20, '1', 'Teaser Images', 2, 'Changed image_width.');
INSERT INTO django_admin_log VALUES (39, '2010-08-12 04:17:00.117561+00', 1, 20, '1', 'Teaser Images', 2, 'Changed image_width.');
INSERT INTO django_admin_log VALUES (40, '2010-08-12 04:34:58.443227+00', 1, 20, '1', 'Teaser Images', 2, 'Changed order for portfolio piece "Image 1". Changed order for portfolio piece "Image 2".');
INSERT INTO django_admin_log VALUES (41, '2010-08-12 04:35:33.34505+00', 1, 20, '1', 'Teaser Images', 2, 'Changed order for portfolio piece "Image 2".');
INSERT INTO django_admin_log VALUES (42, '2010-08-12 04:45:40.34414+00', 1, 16, '2', 'GVL / PRG', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (43, '2010-08-12 04:46:45.197672+00', 1, 16, '3', 'Specialty Shops', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (44, '2010-08-12 04:47:14.387031+00', 1, 16, '3', 'Specialty Shops', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (45, '2010-08-12 04:47:52.22264+00', 1, 16, '3', 'Specialty Shops', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (46, '2010-08-12 05:57:19.080024+00', 1, 20, '1', 'Teaser Images', 2, 'Changed order for portfolio piece "Image 1".');
INSERT INTO django_admin_log VALUES (47, '2010-08-12 05:57:28.633394+00', 1, 20, '1', 'Teaser Images', 2, 'Changed order for portfolio piece "Image 1".');
INSERT INTO django_admin_log VALUES (48, '2010-08-12 18:41:08.571966+00', 2, 26, '1', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (49, '2010-08-12 19:03:55.426415+00', 2, 20, '1', 'Teaser Images', 2, 'Added portfolio piece "Image 3". Added portfolio piece "Image 4". Added portfolio piece "Image 5".');
INSERT INTO django_admin_log VALUES (50, '2010-08-12 19:05:31.629594+00', 2, 20, '1', 'Teaser Images', 2, 'Changed order for portfolio piece "Image 3". Changed order for portfolio piece "Image 4". Changed order for portfolio piece "Image 5".');
INSERT INTO django_admin_log VALUES (51, '2010-08-12 19:09:52.757849+00', 2, 16, '2', 'GVL / PRG', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (52, '2010-08-12 19:10:30.191807+00', 2, 16, '2', 'GVL / PRG', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (53, '2010-08-12 19:13:19.970142+00', 2, 16, '3', 'Specialty Shops', 2, 'Changed content_markdown and tags.');
INSERT INTO django_admin_log VALUES (54, '2010-08-12 19:14:49.004585+00', 2, 16, '3', 'Specialty Shops', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (55, '2010-08-12 19:36:17.487145+00', 2, 16, '1', 'The Glass Bottle Effect', 2, 'Changed title, content_markdown and tags.');
INSERT INTO django_admin_log VALUES (56, '2010-08-12 19:43:18.618516+00', 2, 18, '1', 'Dropbox', 2, 'Changed content_markdown and link.');
INSERT INTO django_admin_log VALUES (57, '2010-08-14 19:33:22.170422+00', 1, 16, '1', 'The Glass Bottle Effect', 2, 'Changed slug.');
INSERT INTO django_admin_log VALUES (58, '2010-08-14 19:40:30.369821+00', 1, 7, '1', 'andrewramos.com', 2, 'Changed domain.');
INSERT INTO django_admin_log VALUES (59, '2010-08-14 19:42:04.65026+00', 1, 19, '1', 'The Scariest Moment', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (60, '2010-08-14 19:42:22.570432+00', 1, 16, '3', 'Specialty Shops', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (61, '2010-08-14 19:42:48.530278+00', 1, 19, '1', 'The Scariest Moment', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (62, '2010-08-14 19:43:15.597949+00', 1, 19, '1', 'The Scariest Moment', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (63, '2010-08-18 13:29:41.260368+00', 2, 19, '2', 'Decisions are progress', 1, '');
INSERT INTO django_admin_log VALUES (64, '2010-08-20 19:00:34.380636+00', 2, 16, '4', 'Inspiration: Opened House', 1, '');
INSERT INTO django_admin_log VALUES (65, '2010-08-20 19:01:01.751098+00', 2, 16, '4', 'Inspiration: Opened House', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (66, '2010-08-22 04:15:41.460727+00', 1, 19, '2', 'Decisions are progress', 2, 'Changed author.');
INSERT INTO django_admin_log VALUES (67, '2010-08-26 18:05:59.008351+00', 2, 16, '8', 'Alarm', 1, '');
INSERT INTO django_admin_log VALUES (68, '2010-08-26 18:06:34.183338+00', 2, 16, '8', 'Alarm', 3, '');
INSERT INTO django_admin_log VALUES (69, '2010-08-26 18:07:01.638412+00', 2, 16, '8', 'Alarm', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (70, '2010-08-27 17:33:11.351438+00', 1, 3, '1', 'mikemeyer', 2, 'Changed first_name and last_name.');
INSERT INTO django_admin_log VALUES (71, '2010-08-27 18:08:45.81029+00', 1, 16, '8', 'Alarm', 2, 'Added image "Image 5".');
INSERT INTO django_admin_log VALUES (72, '2010-08-27 18:08:56.746604+00', 1, 16, '8', 'Alarm', 2, 'Deleted image "Image None".');
INSERT INTO django_admin_log VALUES (73, '2010-08-27 18:11:54.766674+00', 2, 16, '8', 'Alarm', 2, 'Changed status. Added image "Image 6".');
INSERT INTO django_admin_log VALUES (74, '2010-08-27 18:12:12.395981+00', 1, 16, '4', 'Inspiration: Opened House', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (75, '2010-08-31 15:23:14.125632+00', 2, 16, '9', 'iTV and the Apple Cloud', 1, '');
INSERT INTO django_admin_log VALUES (76, '2010-09-02 18:20:17.078688+00', 1, 16, '9', 'iTV and the Apple Cloud', 2, 'Changed tags.');
INSERT INTO django_admin_log VALUES (77, '2010-09-02 21:12:58.758693+00', 2, 26, '3', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (78, '2010-09-02 21:13:08.302485+00', 2, 26, '2', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (79, '2010-09-02 21:22:03.824069+00', 2, 26, '4', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (80, '2010-09-08 15:59:19.836661+00', 2, 16, '10', 'Southern Savers', 1, '');
INSERT INTO django_admin_log VALUES (81, '2010-09-08 19:51:10.271178+00', 2, 16, '10', 'Southern Savers', 2, 'Changed content_markdown. Added image "Image 8". Added image "Image 9". Added image "Image 10". Added image "Image 11".');
INSERT INTO django_admin_log VALUES (82, '2010-09-08 19:52:14.874845+00', 2, 16, '10', 'Southern Savers', 2, 'Changed subtitle.');
INSERT INTO django_admin_log VALUES (83, '2010-09-08 19:58:30.257914+00', 2, 16, '10', 'Southern Savers', 2, 'Added image "Image 12".');
INSERT INTO django_admin_log VALUES (84, '2010-09-08 20:05:35.823142+00', 2, 17, '2', 'Southern Savers', 1, '');
INSERT INTO django_admin_log VALUES (85, '2010-09-08 20:07:03.362131+00', 2, 17, '2', 'Southern Savers', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (86, '2010-09-08 20:14:05.682707+00', 2, 17, '2', 'Southern Savers', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (87, '2010-09-09 17:57:48.420963+00', 1, 17, '2', 'Southern Savers', 2, 'Added image "Image 17".');
INSERT INTO django_admin_log VALUES (88, '2010-09-09 18:05:41.590606+00', 1, 17, '2', 'Southern Savers', 2, 'Deleted image "Image None".');
INSERT INTO django_admin_log VALUES (89, '2010-09-09 19:24:47.255457+00', 2, 17, '2', 'Southern Savers', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (90, '2010-09-09 19:25:27.496246+00', 2, 16, '11', 'yada', 1, '');
INSERT INTO django_admin_log VALUES (91, '2010-09-09 19:25:57.949412+00', 2, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (92, '2010-09-09 19:26:04.235319+00', 2, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (93, '2010-09-09 19:26:31.226149+00', 2, 16, '11', 'yada', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (94, '2010-09-09 19:31:26.821583+00', 2, 17, '2', 'Southern Savers', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (95, '2010-09-09 19:31:56.135594+00', 2, 17, '2', 'Southern Savers', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (96, '2010-09-09 19:32:10.307735+00', 2, 17, '2', 'Southern Savers', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (97, '2010-09-09 19:32:59.24903+00', 2, 17, '2', 'Southern Savers', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (98, '2010-09-09 19:33:12.926811+00', 2, 17, '2', 'Southern Savers', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (99, '2010-09-09 19:34:05.35602+00', 2, 17, '2', 'Southern Savers', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (100, '2010-09-09 22:16:04.482332+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (101, '2010-09-09 22:18:10.862204+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (102, '2010-09-09 22:26:48.020019+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (103, '2010-09-09 22:30:40.100921+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (104, '2010-09-09 22:31:20.500059+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (105, '2010-09-09 22:36:08.903441+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (106, '2010-09-13 18:00:16.670795+00', 2, 16, '2', 'GVL / PRG', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (107, '2010-09-13 18:00:29.759912+00', 2, 19, '1', 'The Scariest Moment', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (108, '2010-09-13 18:00:36.603898+00', 2, 17, '2', 'Southern Savers', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (109, '2010-09-14 15:55:21.704829+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (110, '2010-09-14 16:01:06.49117+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (111, '2010-09-14 16:01:32.557997+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (112, '2010-09-14 16:07:26.460981+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (113, '2010-09-14 16:11:38.303688+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (114, '2010-09-14 18:47:39.233974+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (115, '2010-09-17 16:01:02.6238+00', 2, 16, '12', 'Outsourcing Surprise & Delight', 1, '');
INSERT INTO django_admin_log VALUES (116, '2010-09-17 16:02:00.31351+00', 2, 18, '2', 'Outsourcing Surprise & Delight', 1, '');
INSERT INTO django_admin_log VALUES (117, '2010-09-17 16:02:57.494124+00', 2, 18, '2', 'Outsourcing Surprise & Delight', 3, '');
INSERT INTO django_admin_log VALUES (118, '2010-09-17 16:03:57.792446+00', 2, 16, '12', 'Outsourcing Surprise & Delight', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (119, '2010-10-06 19:35:09.351107+00', 2, 26, '5', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (120, '2010-10-06 19:35:16.332968+00', 2, 26, '3', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (121, '2010-10-09 14:52:13.1653+00', 2, 16, '13', 'Time to stop', 1, '');
INSERT INTO django_admin_log VALUES (122, '2010-10-09 14:57:24.080544+00', 2, 16, '13', 'Time to stop', 2, 'Changed status. Changed image for image "Image 18".');
INSERT INTO django_admin_log VALUES (123, '2010-10-10 22:50:40.725889+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (124, '2010-10-10 23:47:53.427204+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (125, '2010-10-10 23:47:54.499034+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (126, '2010-10-11 00:26:45.370123+00', 1, 16, '11', 'yada', 3, '');
INSERT INTO django_admin_log VALUES (127, '2010-10-25 22:37:58.895524+00', 2, 16, '14', '4 Shots', 1, '');
INSERT INTO django_admin_log VALUES (128, '2010-10-25 22:38:24.280631+00', 2, 16, '14', '4 Shots', 2, 'Added image "Image 19".');
INSERT INTO django_admin_log VALUES (129, '2010-10-25 22:39:16.481163+00', 2, 16, '14', '4 Shots', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (130, '2010-10-25 22:39:52.033216+00', 2, 16, '14', '4 Shots', 3, '');
INSERT INTO django_admin_log VALUES (131, '2010-10-25 22:42:30.312468+00', 2, 16, '15', '4 Shots', 1, '');
INSERT INTO django_admin_log VALUES (132, '2010-10-25 22:43:44.939141+00', 2, 16, '15', '4 Shots', 2, 'Changed image for image "Image 20".');
INSERT INTO django_admin_log VALUES (133, '2010-10-25 22:44:13.356744+00', 2, 16, '15', '4 Shots', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (134, '2010-11-11 21:54:10.699998+00', 2, 16, '16', 'Christmas Traditions', 1, '');
INSERT INTO django_admin_log VALUES (135, '2010-11-11 21:55:30.785627+00', 2, 16, '16', 'Christmas Traditions', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (136, '2010-11-27 20:02:13.820013+00', 1, 3, '3', 'demouser', 1, '');
INSERT INTO django_admin_log VALUES (137, '2010-11-27 20:02:51.183269+00', 1, 3, '3', 'demouser', 2, 'Changed first_name, is_staff and user_permissions.');
INSERT INTO django_admin_log VALUES (138, '2010-11-29 21:02:57.287119+00', 2, 16, '17', 'New Illustrations', 1, '');
INSERT INTO django_admin_log VALUES (139, '2010-12-31 22:09:56.436402+00', 1, 3, '3', 'demouser', 3, '');
INSERT INTO django_admin_log VALUES (140, '2011-01-25 16:49:26.584422+00', 2, 23, '2', 'The Trappe Door', 1, '');
INSERT INTO django_admin_log VALUES (141, '2011-01-25 16:49:44.662445+00', 2, 23, '3', 'Somewhat Organic Soap Co.', 1, '');
INSERT INTO django_admin_log VALUES (142, '2011-01-25 16:49:54.120086+00', 2, 23, '4', 'Southern Savers', 1, '');
INSERT INTO django_admin_log VALUES (143, '2011-01-25 17:09:25.748053+00', 2, 20, '2', 'The Trappe Door Branding', 1, '');
INSERT INTO django_admin_log VALUES (144, '2011-01-25 17:10:47.583658+00', 2, 20, '2', 'The Trappe Door', 2, 'Changed title. Changed order for portfolio piece "Image 7". Changed order for portfolio piece "Image 8".');
INSERT INTO django_admin_log VALUES (145, '2011-01-25 17:32:23.186147+00', 2, 20, '2', 'The Trappe Door', 2, 'Changed image for portfolio piece "Image 8".');
INSERT INTO django_admin_log VALUES (146, '2011-01-25 17:33:02.68847+00', 2, 20, '2', 'The Trappe Door', 2, 'Changed description.');
INSERT INTO django_admin_log VALUES (147, '2011-01-25 20:19:06.557716+00', 2, 20, '3', 'Somewhat Organic Soap Co.', 1, '');
INSERT INTO django_admin_log VALUES (148, '2011-01-25 20:25:28.369693+00', 2, 20, '4', 'Southern Savers', 1, '');
INSERT INTO django_admin_log VALUES (149, '2011-01-25 20:25:58.796375+00', 2, 20, '4', 'Southern Savers', 2, 'Changed order for portfolio piece "Image 14". Changed order for portfolio piece "Image 15".');
INSERT INTO django_admin_log VALUES (150, '2011-01-25 20:26:38.922473+00', 2, 20, '4', 'Southern Savers', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (151, '2011-01-25 20:27:05.440079+00', 2, 20, '4', 'Southern Savers', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (152, '2011-01-25 20:27:05.468507+00', 2, 20, '3', 'Somewhat Organic Soap Co.', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (153, '2011-01-25 20:27:05.486203+00', 2, 20, '2', 'The Trappe Door', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (154, '2011-01-25 20:27:47.981387+00', 2, 20, '1', 'Teaser Images', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (155, '2011-01-25 20:39:51.625739+00', 2, 20, '4', 'Southern Savers', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (156, '2011-01-25 20:57:34.63507+00', 2, 17, '2', 'Southern Savers', 2, 'Changed image for image "Image 16".');
INSERT INTO django_admin_log VALUES (157, '2011-01-25 21:04:20.243961+00', 2, 26, '6', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (158, '2011-01-25 21:04:35.691686+00', 2, 26, '7', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (159, '2011-01-25 21:04:51.081077+00', 2, 26, '8', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (160, '2011-01-25 21:05:09.795225+00', 2, 26, '8', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (161, '2011-01-25 21:05:09.839328+00', 2, 26, '7', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (162, '2011-01-25 21:05:09.850067+00', 2, 26, '5', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (163, '2011-01-25 21:05:09.85997+00', 2, 26, '4', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (164, '2011-01-25 21:05:21.47195+00', 2, 26, '8', 'Front page image', 3, '');
INSERT INTO django_admin_log VALUES (165, '2011-01-25 21:05:21.497798+00', 2, 26, '7', 'Front page image', 3, '');
INSERT INTO django_admin_log VALUES (166, '2011-01-25 21:07:08.498024+00', 2, 16, '9', 'iTV and the Apple Cloud', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (167, '2011-01-25 21:07:08.584611+00', 2, 16, '3', 'Specialty Shops', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (168, '2011-01-25 21:07:21.983703+00', 2, 17, '2', 'Southern Savers', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (169, '2011-01-25 21:18:04.773997+00', 2, 20, '3', 'Somewhat Organic Soap Co.', 2, 'Deleted portfolio piece "Image None". Deleted portfolio piece "Image None".');
INSERT INTO django_admin_log VALUES (170, '2011-01-25 21:18:43.442496+00', 2, 20, '4', 'Southern Savers', 2, 'Changed image for portfolio piece "Image 15".');
INSERT INTO django_admin_log VALUES (171, '2011-01-27 21:55:33.480076+00', 2, 16, '18', 'Panel Discussion', 1, '');
INSERT INTO django_admin_log VALUES (172, '2011-01-27 21:56:01.216369+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed image_width.');
INSERT INTO django_admin_log VALUES (173, '2011-01-27 22:01:24.749058+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed image for image "Image 23".');
INSERT INTO django_admin_log VALUES (174, '2011-01-27 22:07:53.682345+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed image for image "Image 23".');
INSERT INTO django_admin_log VALUES (175, '2011-01-27 22:18:32.487558+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed image for image "Image 23".');
INSERT INTO django_admin_log VALUES (176, '2011-01-27 22:19:55.078284+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (177, '2011-01-27 22:24:15.11461+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed image for image "Image 23".');
INSERT INTO django_admin_log VALUES (178, '2011-01-27 22:26:40.396586+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed image for image "Image 23".');
INSERT INTO django_admin_log VALUES (179, '2011-01-27 22:40:01.41918+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (180, '2011-01-28 14:12:17.533646+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed image for image "Image 23".');
INSERT INTO django_admin_log VALUES (181, '2011-01-28 14:13:34.762223+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (182, '2011-01-28 14:14:19.720866+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (183, '2011-01-28 14:16:05.982121+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (184, '2011-01-28 14:36:36.607314+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed content_markdown and status.');
INSERT INTO django_admin_log VALUES (185, '2011-01-28 14:37:21.061875+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (186, '2011-02-04 19:05:48.014641+00', 2, 23, '5', 'Parachute Clothing', 1, '');
INSERT INTO django_admin_log VALUES (187, '2011-02-04 21:44:48.288327+00', 2, 20, '5', 'Parachute Clothing', 1, '');
INSERT INTO django_admin_log VALUES (188, '2011-02-04 21:45:19.619784+00', 2, 20, '5', 'Parachute Clothing', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (189, '2011-02-04 21:46:08.842208+00', 2, 20, '5', 'Parachute Clothing', 2, 'Changed order for portfolio piece "Image 17". Changed order for portfolio piece "Image 18".');
INSERT INTO django_admin_log VALUES (190, '2011-02-04 21:46:09.923095+00', 2, 20, '5', 'Parachute Clothing', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (191, '2011-02-04 21:52:12.115644+00', 2, 20, '5', 'Parachute Clothing', 2, 'Changed description.');
INSERT INTO django_admin_log VALUES (192, '2011-02-07 22:23:00.397191+00', 1, 3, '4', 'demouser', 1, '');
INSERT INTO django_admin_log VALUES (193, '2011-03-24 01:12:49.909794+00', 2, 26, '9', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (194, '2011-03-24 01:13:11.505018+00', 2, 26, '6', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (195, '2011-03-24 01:14:32.646109+00', 2, 26, '6', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (196, '2011-03-24 01:14:48.141285+00', 2, 26, '9', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (197, '2011-03-24 01:15:32.570974+00', 2, 26, '9', 'Front page image', 2, 'Changed image and enabled.');
INSERT INTO django_admin_log VALUES (198, '2011-03-24 01:15:53.089094+00', 2, 26, '9', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (199, '2011-03-24 01:15:53.124095+00', 2, 26, '6', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (200, '2011-03-24 01:16:49.257529+00', 2, 26, '10', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (201, '2011-03-30 14:27:08.837416+00', 2, 16, '19', 'Designspiration', 1, '');
INSERT INTO django_admin_log VALUES (202, '2011-03-30 14:27:48.533827+00', 2, 16, '19', 'Designspiration', 2, 'Changed display_title.');
INSERT INTO django_admin_log VALUES (203, '2011-03-30 14:29:31.798151+00', 2, 16, '19', 'Designspiration', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (204, '2011-03-30 14:32:17.964885+00', 2, 16, '19', 'Designspiration', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (205, '2011-03-30 14:37:50.116174+00', 2, 16, '19', 'Designspiration', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (206, '2011-03-30 14:38:04.033526+00', 2, 16, '19', 'Designspiration', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (207, '2011-03-30 14:38:04.105294+00', 2, 16, '16', 'Christmas Traditions', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (208, '2011-04-13 21:21:24.253272+00', 2, 26, '11', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (209, '2011-04-13 21:23:33.423544+00', 2, 26, '12', 'Front page image', 1, '');
INSERT INTO django_admin_log VALUES (210, '2011-04-13 21:23:55.353791+00', 2, 26, '11', 'Front page image', 2, 'Changed enabled.');
INSERT INTO django_admin_log VALUES (211, '2011-04-14 14:14:44.441645+00', 2, 26, '11', 'Front page image', 3, '');
INSERT INTO django_admin_log VALUES (212, '2011-04-14 14:14:44.501664+00', 2, 26, '9', 'Front page image', 3, '');
INSERT INTO django_admin_log VALUES (213, '2011-04-26 14:58:35.721061+00', 2, 18, '3', 'Today I wish I had a bicycle', 1, '');
INSERT INTO django_admin_log VALUES (214, '2011-04-26 15:00:14.273582+00', 2, 18, '3', 'Today I wish I had a bicycle', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (215, '2011-04-30 14:59:00.579106+00', 2, 16, '20', 'This Week in Things I Need: ', 1, '');
INSERT INTO django_admin_log VALUES (216, '2011-04-30 15:03:20.296796+00', 2, 16, '20', 'This Week in Things I Need: ', 2, 'Changed image for image "Image 25".');
INSERT INTO django_admin_log VALUES (217, '2011-04-30 15:04:33.669112+00', 2, 16, '20', 'This Week in Things I Need: ', 2, 'Changed subtitle.');
INSERT INTO django_admin_log VALUES (218, '2011-04-30 15:13:21.060828+00', 2, 16, '20', 'This Week in Things I Need: ', 3, '');
INSERT INTO django_admin_log VALUES (219, '2011-04-30 15:25:26.415623+00', 2, 16, '21', 'Vintage Denim Neckties', 1, '');
INSERT INTO django_admin_log VALUES (220, '2011-04-30 15:27:21.397635+00', 2, 16, '21', 'Vintage Denim Neckties', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (221, '2011-04-30 15:35:55.078018+00', 2, 19, '3', 'Fortnight', 1, '');
INSERT INTO django_admin_log VALUES (222, '2011-04-30 15:36:26.340486+00', 2, 19, '3', 'Fortnight', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (223, '2011-05-14 17:45:23.214767+00', 2, 18, '11', 'What''s making me laugh this week', 1, '');
INSERT INTO django_admin_log VALUES (224, '2011-05-14 17:46:07.541214+00', 2, 18, '11', 'What''s making me laugh this week', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (225, '2011-05-14 17:58:54.771824+00', 2, 18, '2', 'Outsourcing Surprise & Delight', 3, '');
INSERT INTO django_admin_log VALUES (226, '2011-05-22 18:56:40.653324+00', 2, 19, '4', 'The Art of Living', 1, '');
INSERT INTO django_admin_log VALUES (227, '2011-05-22 18:57:32.520013+00', 2, 19, '4', 'The Art of Living', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (228, '2011-05-22 18:58:02.594398+00', 2, 19, '4', 'The Art of Living', 2, 'Changed author.');
INSERT INTO django_admin_log VALUES (229, '2011-05-22 18:58:17.907035+00', 2, 19, '4', 'The Art of Living', 2, 'Changed author.');
INSERT INTO django_admin_log VALUES (230, '2011-05-22 18:58:46.69806+00', 2, 19, '4', 'The Art of Living', 2, 'Changed author.');
INSERT INTO django_admin_log VALUES (231, '2011-05-22 18:59:20.471293+00', 2, 19, '4', 'The Art of Living', 2, 'Changed is_featured and status.');
INSERT INTO django_admin_log VALUES (232, '2011-05-22 19:00:53.033044+00', 2, 19, '4', 'The Art of Living', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (233, '2011-06-03 17:06:08.116881+00', 2, 18, '12', 'Every Once in a while', 1, '');
INSERT INTO django_admin_log VALUES (234, '2011-06-03 17:06:57.889785+00', 2, 18, '12', 'Every Once in a while,', 2, 'Changed title.');
INSERT INTO django_admin_log VALUES (235, '2011-06-03 17:07:46.2857+00', 2, 18, '12', 'Every Once in a while', 2, 'Changed title and content_markdown.');
INSERT INTO django_admin_log VALUES (236, '2011-06-03 17:07:57.392813+00', 2, 18, '12', 'Every Once in a while', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (237, '2011-06-03 17:08:11.192488+00', 2, 18, '12', 'Every Once in a while', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (238, '2011-06-03 17:08:48.70155+00', 2, 18, '12', 'Every Once in a while I can hear a distant motorbike''s high-pitched groaning as it tears down a neighboring street', 2, 'Changed title and content_markdown.');
INSERT INTO django_admin_log VALUES (239, '2011-06-03 17:09:34.457569+00', 2, 18, '12', 'Fear', 2, 'Changed title and content_markdown.');
INSERT INTO django_admin_log VALUES (240, '2011-06-03 17:13:36.278992+00', 2, 18, '12', 'Fear', 2, 'Changed content_markdown and status.');
INSERT INTO django_admin_log VALUES (241, '2011-06-10 13:04:57.544676+00', 2, 19, '5', 'Texting & Driving', 1, '');
INSERT INTO django_admin_log VALUES (242, '2011-06-10 13:05:56.850212+00', 2, 19, '5', 'Texting & Driving', 2, 'Changed author.');
INSERT INTO django_admin_log VALUES (243, '2011-06-10 13:08:35.203717+00', 2, 19, '5', 'Texting & Driving', 2, 'Changed author.');
INSERT INTO django_admin_log VALUES (244, '2011-06-10 13:08:53.185113+00', 2, 19, '5', 'Texting & Driving', 2, 'Changed status.');
INSERT INTO django_admin_log VALUES (245, '2011-06-10 18:23:42.568125+00', 2, 16, '23', 'Introducing Wren', 1, '');
INSERT INTO django_admin_log VALUES (246, '2011-06-10 18:30:38.720384+00', 2, 16, '23', 'Introducing Wren', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (247, '2011-06-10 18:31:19.710698+00', 2, 16, '23', 'Introducing Wren', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (248, '2011-06-10 20:23:38.012213+00', 2, 16, '17', 'New Illustrations', 3, '');
INSERT INTO django_admin_log VALUES (249, '2011-06-10 20:36:45.898865+00', 2, 16, '24', 'Goodbye Old Friend', 1, '');
INSERT INTO django_admin_log VALUES (250, '2011-06-10 20:37:34.936147+00', 2, 16, '24', 'All Things Must End', 2, 'Changed title, slug and display_title.');
INSERT INTO django_admin_log VALUES (251, '2011-06-10 20:37:51.284179+00', 2, 16, '24', 'All Things Must End', 2, 'No fields changed.');
INSERT INTO django_admin_log VALUES (252, '2011-06-14 14:51:11.605315+00', 2, 16, '24', 'All Things Must End', 2, 'Changed image for image "Image 28".');
INSERT INTO django_admin_log VALUES (253, '2011-06-14 14:54:48.825094+00', 2, 16, '24', 'All Things Must End', 2, 'Changed image for image "Image 28".');
INSERT INTO django_admin_log VALUES (254, '2011-06-14 14:55:53.202516+00', 2, 16, '24', 'All Things Must End', 2, 'Changed image for image "Image 28".');
INSERT INTO django_admin_log VALUES (255, '2011-06-14 15:40:23.306337+00', 2, 16, '24', 'All Things Must End', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (256, '2011-06-14 15:57:27.734339+00', 2, 16, '24', 'All Things Must End', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (257, '2011-06-14 15:58:17.954796+00', 2, 16, '24', 'All Things Must End', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (258, '2011-06-14 15:59:42.950196+00', 2, 16, '24', 'All Things Must End', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (259, '2011-06-14 16:06:11.92072+00', 2, 16, '24', 'All Things Must End', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (260, '2011-06-14 16:17:19.812997+00', 2, 16, '24', 'All Things Must End', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (261, '2011-06-14 16:18:14.333568+00', 2, 16, '24', 'All Things Must End', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (262, '2011-06-14 16:20:20.297086+00', 2, 16, '24', 'All Things Must End', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (263, '2011-06-14 16:21:12.853494+00', 2, 16, '24', 'All Things Must End', 2, 'Changed is_featured and status.');
INSERT INTO django_admin_log VALUES (264, '2011-06-14 16:21:41.77393+00', 2, 16, '18', 'Panel Discussion', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (265, '2011-06-14 16:22:02.083239+00', 2, 19, '4', 'The Art of Living', 2, 'Changed is_featured.');
INSERT INTO django_admin_log VALUES (266, '2011-06-21 13:45:14.566816+00', 2, 16, '23', 'Introducing Wren', 2, 'Changed content_markdown. Changed image for image "Image 27".');
INSERT INTO django_admin_log VALUES (267, '2011-06-21 20:19:05.276248+00', 2, 16, '23', 'Introducing Wren', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (268, '2011-06-21 20:20:44.287773+00', 2, 16, '23', 'Introducing Wren', 2, 'Changed content_markdown. Changed image for image "Image 27".');
INSERT INTO django_admin_log VALUES (269, '2011-06-21 20:25:35.488807+00', 2, 16, '23', 'Introducing Wren for Mac', 2, 'Changed title and subtitle.');
INSERT INTO django_admin_log VALUES (270, '2011-06-21 20:30:23.964082+00', 2, 16, '23', 'Introducing Wren for Mac', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (271, '2011-06-21 20:45:32.471116+00', 2, 16, '23', 'Introducing Wren for Mac', 2, 'Changed content_markdown.');
INSERT INTO django_admin_log VALUES (272, '2011-06-21 20:46:18.503323+00', 2, 16, '23', 'Introducing Wren for Mac', 2, 'Changed is_featured and status.');
INSERT INTO django_admin_log VALUES (273, '2011-06-21 20:47:17.423864+00', 2, 16, '23', 'Introducing Wren for Mac', 2, 'Changed date_published.');
INSERT INTO django_admin_log VALUES (274, '2011-06-21 20:52:00.535218+00', 2, 16, '23', 'Introducing Wren for Mac', 2, 'Changed image for image "Image 27".');
INSERT INTO django_admin_log VALUES (275, '2011-06-21 20:57:11.911444+00', 2, 16, '23', 'Introducing Wren for Mac', 2, 'No fields changed.');


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO django_content_type VALUES (1, 'permission', 'auth', 'permission');
INSERT INTO django_content_type VALUES (2, 'group', 'auth', 'group');
INSERT INTO django_content_type VALUES (3, 'user', 'auth', 'user');
INSERT INTO django_content_type VALUES (4, 'message', 'auth', 'message');
INSERT INTO django_content_type VALUES (5, 'content type', 'contenttypes', 'contenttype');
INSERT INTO django_content_type VALUES (6, 'session', 'sessions', 'session');
INSERT INTO django_content_type VALUES (7, 'site', 'sites', 'site');
INSERT INTO django_content_type VALUES (8, 'log entry', 'admin', 'logentry');
INSERT INTO django_content_type VALUES (9, 'migration history', 'south', 'migrationhistory');
INSERT INTO django_content_type VALUES (10, 'tag', 'tagging', 'tag');
INSERT INTO django_content_type VALUES (11, 'tagged item', 'tagging', 'taggeditem');
INSERT INTO django_content_type VALUES (12, 'storage', 'easy_thumbnails', 'storage');
INSERT INTO django_content_type VALUES (13, 'source', 'easy_thumbnails', 'source');
INSERT INTO django_content_type VALUES (14, 'thumbnail', 'easy_thumbnails', 'thumbnail');
INSERT INTO django_content_type VALUES (15, 'image', 'blog', 'image');
INSERT INTO django_content_type VALUES (16, 'article', 'blog', 'article');
INSERT INTO django_content_type VALUES (17, 'case study', 'blog', 'casestudy');
INSERT INTO django_content_type VALUES (18, 'short post', 'blog', 'shortpost');
INSERT INTO django_content_type VALUES (19, 'quote', 'blog', 'quote');
INSERT INTO django_content_type VALUES (20, 'project', 'portfolio', 'project');
INSERT INTO django_content_type VALUES (21, 'image', 'portfolio', 'category');
INSERT INTO django_content_type VALUES (22, 'portfolio piece', 'portfolio', 'portfoliopiece');
INSERT INTO django_content_type VALUES (23, 'client', 'portfolio', 'client');
INSERT INTO django_content_type VALUES (24, 'static page', 'content', 'staticpage');
INSERT INTO django_content_type VALUES (25, 'email', 'content', 'emailmessage');
INSERT INTO django_content_type VALUES (26, 'front page image', 'content', 'frontpagecontent');
INSERT INTO django_content_type VALUES (27, 'Tag', 'taggit', 'tag');
INSERT INTO django_content_type VALUES (28, 'Tagged Item', 'taggit', 'taggeditem');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO django_session VALUES ('42472dd8e346f83e62e1483a9221c0dc', 'ZjliOWE5MjY3Yzc4YzJjZTUzNzc0ZGFiYmM2MzA1MmMzYjBmMDY0YzqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2011-06-29 13:59:02.17116+00');
INSERT INTO django_session VALUES ('9f5a8247b3b968c5a84b5108fc226fdf', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-10-01 15:59:19.932123+00');
INSERT INTO django_session VALUES ('1e990133e7873ca737f9d5eea979e5f5', 'gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjc0ZjYwMWVhMWQ0MjdjMTM3MGFmMzFiOTRi
NDgzZTE5
', '2010-10-06 21:48:09.923295+00');
INSERT INTO django_session VALUES ('d526d6ffa8348f005a3509bc4a359744', 'gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjc0ZjYwMWVhMWQ0MjdjMTM3MGFmMzFiOTRi
NDgzZTE5
', '2010-10-10 07:36:37.356451+00');
INSERT INTO django_session VALUES ('c1ec87c1a8fde0024b887f32184e486d', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjQwYzA5MzM5NDY4YTE1YzQ2Zjk0
MTRiNTJkZWQzNDVj
', '2010-10-11 22:31:59.317199+00');
INSERT INTO django_session VALUES ('3066c3f8fd1fa28ba9acb5135bce3309', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-08-25 12:42:38.775523+00');
INSERT INTO django_session VALUES ('f8001c27b732cf2ce225d35faabadfa3', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjQwYzA5MzM5NDY4YTE1YzQ2Zjk0
MTRiNTJkZWQzNDVj
', '2010-08-25 14:00:11.74173+00');
INSERT INTO django_session VALUES ('6ac98b304fa940bd1fa3160f2b07f2cf', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-08-25 22:39:22.649285+00');
INSERT INTO django_session VALUES ('958688a683e9b06a7194f4ea7fbbc64b', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-10-12 02:51:36.400822+00');
INSERT INTO django_session VALUES ('d255f98c1f9620d96bb332e4ef1357e2', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjQwYzA5MzM5NDY4YTE1YzQ2Zjk0
MTRiNTJkZWQzNDVj
', '2010-08-28 19:33:00.906558+00');
INSERT INTO django_session VALUES ('8bb294a0fea9d6602a4b869852bc62b5', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-09-09 18:02:17.394277+00');
INSERT INTO django_session VALUES ('b348f3a7167b213fd915765c82683e36', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-09-09 18:09:04.014495+00');
INSERT INTO django_session VALUES ('20200ff0ad38717c78d7adabd3c842f1', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-09-14 15:14:57.854883+00');
INSERT INTO django_session VALUES ('7b6e27a1f441b929d3d3b379da82cc73', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjQwYzA5MzM5NDY4YTE1YzQ2Zjk0
MTRiNTJkZWQzNDVj
', '2010-09-16 18:20:00.802124+00');
INSERT INTO django_session VALUES ('3868ccba17c2965f58dde2bc863f45c6', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-10-20 19:34:16.341819+00');
INSERT INTO django_session VALUES ('7310c58dd8a6bd35c339957486140441', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-11-08 23:37:11.324399+00');
INSERT INTO django_session VALUES ('fe75f959a5165d164ce1ae4317d3e609', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-11-25 21:53:14.234348+00');
INSERT INTO django_session VALUES ('e22fe5e75ff33c32c889c7ee3777b72f', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjdkNjRhNWY1YTBiMDBlM2Q4NGQ1
OTNiYmViOTU5MjA1
', '2010-12-11 20:03:04.113323+00');
INSERT INTO django_session VALUES ('3d7d708c9ce9a3036775332d9d81db36', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjQwYzA5MzM5NDY4YTE1YzQ2Zjk0
MTRiNTJkZWQzNDVj
', '2010-12-10 00:36:53.142369+00');
INSERT INTO django_session VALUES ('f2ca194c3b66f1a0b8e3c50d1f22f0dd', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2010-12-13 20:55:23.865139+00');
INSERT INTO django_session VALUES ('038bfa11dd601ec0f0b6b6925b1d959f', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjdkNjRhNWY1YTBiMDBlM2Q4NGQ1
OTNiYmViOTU5MjA1
', '2010-12-12 12:45:26.231269+00');
INSERT INTO django_session VALUES ('5d3ab661c500e824e3d938e8ab0472ec', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjdkNjRhNWY1YTBiMDBlM2Q4NGQ1
OTNiYmViOTU5MjA1
', '2010-12-13 14:29:14.794977+00');
INSERT INTO django_session VALUES ('2bc8b35eff75bbfe160cf472aed6209f', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjdkNjRhNWY1YTBiMDBlM2Q4NGQ1
OTNiYmViOTU5MjA1
', '2010-12-20 15:42:52.085555+00');
INSERT INTO django_session VALUES ('e03b89a2ff715fb1ac76e7787d95b721', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwN1LjdkNjRhNWY1YTBiMDBlM2Q4NGQ1
OTNiYmViOTU5MjA1
', '2010-12-13 18:17:14.667482+00');
INSERT INTO django_session VALUES ('0c37d13120e27a0a8226a44ca51ba1e4', 'gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjc0ZjYwMWVhMWQ0MjdjMTM3MGFmMzFiOTRi
NDgzZTE5
', '2010-12-28 16:09:53.517683+00');
INSERT INTO django_session VALUES ('dd38111ef9895c4648674d8a006b30f6', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjQwYzA5MzM5NDY4YTE1YzQ2Zjk0
MTRiNTJkZWQzNDVj
', '2011-01-14 00:39:51.49867+00');
INSERT INTO django_session VALUES ('c391bd5b1dba7ca803b47325ea149ffd', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2011-02-07 23:30:01.355455+00');
INSERT INTO django_session VALUES ('ad3b6624d0c808219b15ab562253c7ab', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjQwYzA5MzM5NDY4YTE1YzQ2Zjk0
MTRiNTJkZWQzNDVj
', '2011-02-08 20:54:05.123602+00');
INSERT INTO django_session VALUES ('5a14f99817716318a954b68abf26857c', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2011-02-08 16:49:02.38547+00');
INSERT INTO django_session VALUES ('960da62d6cde9210ec4e770ab6a88d84', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2011-03-23 20:24:28.827384+00');
INSERT INTO django_session VALUES ('3f5788af30ef9773071d5af64ed286a0', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2011-04-07 01:12:25.30398+00');
INSERT INTO django_session VALUES ('877c4533570a639dbcef184bb274c26a', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2011-04-27 21:19:38.514907+00');
INSERT INTO django_session VALUES ('f4e2092dddffe5a241e94b0c8d9cbeb3', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwJ1LjRhY2NkMWFmMTU4MTUzYjM1NzQ4
YjllMmJiOGMxYjJl
', '2011-05-10 14:49:12.979451+00');
INSERT INTO django_session VALUES ('8dd3fc177963c23c6c149a397b603485', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k
cy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEESwF1LjQwYzA5MzM5NDY4YTE1YzQ2Zjk0
MTRiNTJkZWQzNDVj
', '2011-05-14 16:39:48.832177+00');
INSERT INTO django_session VALUES ('a66390e0540ceb50cb25a22bab74eb50', 'MWY5YjA3YThiYmRlMTUyZTFiNzcxNzNjMjE5NzA1YTA1OWI5ZDdhYTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAnUu
', '2011-06-17 16:57:03.534687+00');
INSERT INTO django_session VALUES ('f1006b8095f72dbead67ab00ea5aec0f', 'MWY5YjA3YThiYmRlMTUyZTFiNzcxNzNjMjE5NzA1YTA1OWI5ZDdhYTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAnUu
', '2011-07-01 22:40:38.55321+00');
INSERT INTO django_session VALUES ('144a630eebaa1146e35be475fedcab66', 'NmJjZDYwMTc2ZGUxM2Y0NTdkOGQwYjYwOGVkZjc2OTY3ZTQzZGVlYjqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
', '2011-07-08 04:30:38.356214+00');
INSERT INTO django_session VALUES ('fc937f8d3d40b680bed9888c31fc5362', 'MWY5YjA3YThiYmRlMTUyZTFiNzcxNzNjMjE5NzA1YTA1OWI5ZDdhYTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAnUu
', '2011-05-24 15:18:41.815472+00');
INSERT INTO django_session VALUES ('b2d64624c97f655a609048a8b0690305', 'NmJjZDYwMTc2ZGUxM2Y0NTdkOGQwYjYwOGVkZjc2OTY3ZTQzZGVlYjqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAXUu
', '2011-05-26 22:21:31.220343+00');
INSERT INTO django_session VALUES ('65db757dfd15084a9eb818fa11e25e60', 'ZjliOWE5MjY3Yzc4YzJjZTUzNzc0ZGFiYmM2MzA1MmMzYjBmMDY0YzqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2011-05-26 22:24:02.155921+00');
INSERT INTO django_session VALUES ('7ef16573b2dbb0b51a8ddb05c6878443', 'ZjliOWE5MjY3Yzc4YzJjZTUzNzc0ZGFiYmM2MzA1MmMzYjBmMDY0YzqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2011-05-26 22:24:02.77894+00');
INSERT INTO django_session VALUES ('7a8eb88be2b1e9446f64c390a88f2c08', 'ZjliOWE5MjY3Yzc4YzJjZTUzNzc0ZGFiYmM2MzA1MmMzYjBmMDY0YzqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2011-05-26 22:24:03.301011+00');
INSERT INTO django_session VALUES ('30be037726463b3a29720af8d2293035', 'ZjliOWE5MjY3Yzc4YzJjZTUzNzc0ZGFiYmM2MzA1MmMzYjBmMDY0YzqAAn1xAVUKdGVzdGNvb2tp
ZXECVQZ3b3JrZWRxA3Mu
', '2011-05-26 22:24:03.823802+00');
INSERT INTO django_session VALUES ('f0002b30a669cc23c2098ba9965f582b', 'MWY5YjA3YThiYmRlMTUyZTFiNzcxNzNjMjE5NzA1YTA1OWI5ZDdhYTqAAn1xAShVEl9hdXRoX3Vz
ZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED
VQ1fYXV0aF91c2VyX2lkcQRLAnUu
', '2011-05-27 17:42:43.149931+00');


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO django_site VALUES (1, 'andrewramos.com', 'AndrewRamos.com');


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO easy_thumbnails_source VALUES (1, 'uploads/front-page/shot_1281221339.png', '2010-08-11 23:05:46+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (2, 'uploads/front-page/Process-2.jpg', '2010-08-11 23:08:17+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (3, 'uploads/portfolio/Start-Copy.jpg', '2010-08-11 23:13:43+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (4, 'uploads/portfolio/Shopping-Cart.jpg', '2010-08-11 23:13:43+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (5, 'uploads/blog/Travel.jpg', '2010-08-11 23:18:22+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (6, 'uploads/blog/Glass_Bottle.jpg', '2010-08-11 23:31:52+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (7, 'uploads/front-page/shot_1281106568.png', '2010-08-11 23:46:15+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (8, 'uploads/front-page/shot_1279813053.png', '2010-08-11 23:46:36+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (9, 'uploads/blog/Saturday-Market-peaches.jpg', '2010-08-12 00:01:50+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (10, 'uploads/blog/Glass-Bottle.jpg', '2010-08-12 00:31:33+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (11, 'uploads/portfolio/Coupons.jpg', '2010-08-12 19:03:55+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (12, 'uploads/portfolio/Max.jpg', '2010-08-12 19:03:55+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (13, 'uploads/portfolio/Volume.jpg', '2010-08-12 19:03:55+00', 1, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (14, 'uploads/blog/edstrom-house-exterior.jpg', '2010-08-20 19:00:34+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (15, 'uploads/blog/putin-large.jpg', '2010-08-27 18:08:45+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (16, 'uploads/blog/Alarm-Clock.jpg', '2010-08-27 18:11:54+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (17, 'uploads/blog/Apple-Cloud.jpg', '2010-08-31 15:23:14+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (18, 'uploads/front-page/New_iTunes_Icon.png', '2010-09-02 21:12:58+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (19, 'uploads/front-page/Screen_shot_2010-09-02_at_4.49.35_PM.png', '2010-09-02 21:22:03+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (20, 'uploads/front-page/Screen_shot_2010-09-02_at_4.49.35_PM.png', '2010-09-02 21:22:03+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (21, 'uploads/blog/SS-sketches.jpg', '2010-09-08 19:51:10+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (22, 'uploads/blog/SS-logo.jpg', '2010-09-08 19:51:10+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (23, 'uploads/blog/SS-learning.jpg', '2010-09-08 19:51:10+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (24, 'uploads/blog/SS-martin.jpg', '2010-09-08 19:51:10+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (25, 'uploads/blog/SS-sketches2.jpg', '2010-09-08 19:58:30+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (26, 'uploads/blog/SS-logo_1.jpg', '2010-09-08 20:05:35+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (27, 'uploads/blog/SS-sketches_1.jpg', '2010-09-08 20:05:35+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (28, 'uploads/blog/SS-learning_1.jpg', '2010-09-08 20:05:35+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (29, 'uploads/blog/SS-martin_1.jpg', '2010-09-08 20:05:35+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (30, 'uploads/blog/avatard-dribbble.png', '2010-09-09 17:57:48+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (31, 'uploads/front-page/Screen_shot_2010-10-06_at_3.29.21_PM.png', '2010-10-06 19:35:09+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (32, 'uploads/blog/Traffic-Light.jpg', '2010-10-09 14:52:13+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_source VALUES (33, 'uploads/blog/Traffic-Light_1.jpg', '2010-10-09 14:57:24+00', 3, 'df2a8819fc7f348e9715cca951e8e5df');


--
-- Data for Name: easy_thumbnails_storage; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO easy_thumbnails_storage VALUES (1, '83f1ae0d72fa22720588d828bdf569ab', 'ccopy_reg
_reconstructor
p0
(cdjango.core.files.storage
DefaultStorage
p1
c__builtin__
object
p2
Ntp3
Rp4
(dp5
S''_wrapped''
p6
g0
(cdjango.core.files.storage
FileSystemStorage
p7
g2
Ntp8
Rp9
(dp10
S''location''
p11
S''/home/webdev/django/andrewramos/media''
p12
sS''base_url''
p13
S''/media/''
p14
sbsb.');
INSERT INTO easy_thumbnails_storage VALUES (2, '946e682f847f97f5beeb0a2662cc04c8', 'ccopy_reg
_reconstructor
p0
(ceasy_thumbnails.storage
ThumbnailFileSystemStorage
p1
c__builtin__
object
p2
Ntp3
Rp4
(dp5
S''location''
p6
S''/home/webdev/django/andrewramos/media''
p7
sS''base_url''
p8
S''/media/''
p9
sb.');
INSERT INTO easy_thumbnails_storage VALUES (3, 'ead393cc130ce4665fa8f5d77b8f2398', 'ccopy_reg
_reconstructor
p0
(cdjango.core.files.storage
DefaultStorage
p1
c__builtin__
object
p2
Ntp3
Rp4
(dp5
S''_wrapped''
p6
g0
(cdjango.core.files.storage
FileSystemStorage
p7
g2
Ntp8
Rp9
(dp10
S''location''
p11
S''/home/webdev/django/andrewramos/media''
p12
sS''base_url''
p13
S''http://andrewramos.com/media/''
p14
sbsb.');
INSERT INTO easy_thumbnails_storage VALUES (4, '0a7d011ac34a6b576c0152d2bba8c04a', 'ccopy_reg
_reconstructor
p0
(ceasy_thumbnails.storage
ThumbnailFileSystemStorage
p1
c__builtin__
object
p2
Ntp3
Rp4
(dp5
S''location''
p6
S''/home/webdev/django/andrewramos/media''
p7
sS''base_url''
p8
S''http://andrewramos.com/media/''
p9
sb.');


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO easy_thumbnails_thumbnail VALUES (1, 'resized/uploads/front-page/r_shot_1281221339.png.100x100_q85.png', '2010-08-11 23:05:47+00', 1, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (2, 'resized/uploads/front-page/r_shot_1281221339.png.220x800_q85.png', '2010-08-11 23:07:38+00', 1, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (3, 'resized/uploads/front-page/r_Process-2.jpg.100x100_q85.png', '2010-08-11 23:08:18+00', 2, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (4, 'resized/uploads/front-page/r_Process-2.jpg.220x800_q85.png', '2010-08-11 23:08:26+00', 2, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (5, 'resized/uploads/portfolio/r_Start-Copy.jpg.100x100_q85.png', '2010-08-11 23:13:46+00', 3, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (6, 'resized/uploads/portfolio/r_Shopping-Cart.jpg.100x100_q85.png', '2010-08-11 23:13:46+00', 4, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (7, 'resized/uploads/portfolio/r_Shopping-Cart.jpg.480x440_q85_crop_upscale.png', '2010-08-11 23:13:58+00', 4, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (8, 'resized/uploads/portfolio/r_Start-Copy.jpg.480x440_q85_crop_upscale.png', '2010-08-11 23:13:58+00', 3, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (9, 'resized/uploads/blog/r_Travel.jpg.700x440_q85_crop_upscale.png', '2010-08-11 23:18:27+00', 5, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (10, 'resized/uploads/blog/r_Travel.jpg.100x100_q85.png', '2010-08-11 23:18:35+00', 5, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (11, 'resized/uploads/blog/r_Glass_Bottle.jpg.480x440_q85_crop_upscale.png', '2010-08-11 23:31:57+00', 6, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (12, 'resized/uploads/front-page/r_shot_1281106568.png.100x100_q85.png', '2010-08-11 23:46:15+00', 7, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (13, 'resized/uploads/front-page/r_shot_1279813053.png.100x100_q85.png', '2010-08-11 23:46:36+00', 8, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (14, 'resized/uploads/front-page/r_shot_1281106568.png.220x800_q85.png', '2010-08-11 23:46:39+00', 7, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (15, 'resized/uploads/front-page/r_shot_1279813053.png.220x800_q85.png', '2010-08-11 23:46:39+00', 8, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (16, 'resized/uploads/blog/r_Glass_Bottle.jpg.100x100_q85.png', '2010-08-11 23:54:26+00', 6, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (17, 'resized/uploads/blog/r_Saturday-Market-peaches.jpg.700x440_q85_crop_upscale.png', '2010-08-12 00:01:54+00', 9, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (18, 'resized/uploads/blog/r_Saturday-Market-peaches.jpg.100x100_q85.png', '2010-08-12 00:04:17+00', 9, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (19, 'resized/uploads/blog/r_Glass-Bottle.jpg.480x440_q85_crop_upscale.png', '2010-08-12 00:31:38+00', 10, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (20, 'resized/uploads/portfolio/r_Shopping-Cart.jpg.700x440_q85_crop_upscale.png', '2010-08-12 04:16:52+00', 4, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (21, 'resized/uploads/portfolio/r_Start-Copy.jpg.700x440_q85_crop_upscale.png', '2010-08-12 04:16:52+00', 3, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (22, 'resized/uploads/portfolio/r_Coupons.jpg.480x440_q85_crop_upscale.png', '2010-08-12 19:04:05+00', 11, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (23, 'resized/uploads/portfolio/r_Max.jpg.480x440_q85_crop_upscale.png', '2010-08-12 19:04:06+00', 12, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (24, 'resized/uploads/portfolio/r_Volume.jpg.480x440_q85_crop_upscale.png', '2010-08-12 19:04:06+00', 13, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (25, 'resized/uploads/portfolio/r_Coupons.jpg.100x100_q85.png', '2010-08-12 19:04:54+00', 11, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (26, 'resized/uploads/portfolio/r_Max.jpg.100x100_q85.png', '2010-08-12 19:04:54+00', 12, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (27, 'resized/uploads/portfolio/r_Volume.jpg.100x100_q85.png', '2010-08-12 19:04:54+00', 13, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (28, 'resized/uploads/blog/r_Glass-Bottle.jpg.100x100_q85.png', '2010-08-12 19:15:41+00', 10, 2, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (29, 'resized/uploads/blog/r_edstrom-house-exterior.jpg.480x440_q85_crop_upscale.png', '2010-08-20 19:01:07+00', 14, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (30, 'resized/uploads/blog/r_putin-large.jpg.100x100_q85.png', '2010-08-27 18:08:48+00', 15, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (31, 'resized/uploads/blog/r_edstrom-house-exterior.jpg.100x100_q85.png', '2010-08-27 18:10:58+00', 14, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (32, 'resized/uploads/blog/r_Alarm-Clock.jpg.700x440_q85_crop_upscale.png', '2010-08-27 18:12:03+00', 16, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (33, 'resized/uploads/blog/r_Alarm-Clock.jpg.100x100_q85.png', '2010-08-27 18:20:39+00', 16, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (34, 'resized/uploads/blog/r_Apple-Cloud.jpg.700x440_q85_crop_upscale.png', '2010-08-31 15:23:21+00', 17, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (35, 'resized/uploads/blog/r_Apple-Cloud.jpg.100x100_q85.png', '2010-09-02 18:20:08+00', 17, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (36, 'resized/uploads/front-page/r_New_iTunes_Icon.png.100x100_q85.png', '2010-09-02 21:12:59+00', 18, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (37, 'resized/uploads/front-page/r_New_iTunes_Icon.png.220x800_q85.png', '2010-09-02 21:13:13+00', 18, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (38, 'resized/uploads/front-page/r_Screen_shot_2010-09-02_at_4.49.35_PM.png.100x100_q85.png', '2010-09-02 21:22:04+00', 19, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (39, 'resized/uploads/front-page/r_Screen_shot_2010-09-02_at_4.49.35_PM.png.220x800_q85.png', '2010-09-02 21:22:04+00', 20, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (40, 'resized/uploads/blog/r_SS-sketches.jpg.700x440_q85_crop_upscale.png', '2010-09-08 19:51:15+00', 21, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (41, 'resized/uploads/blog/r_SS-logo.jpg.700x440_q85_crop_upscale.png', '2010-09-08 19:51:15+00', 22, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (42, 'resized/uploads/blog/r_SS-learning.jpg.700x440_q85_crop_upscale.png', '2010-09-08 19:51:16+00', 23, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (43, 'resized/uploads/blog/r_SS-martin.jpg.700x440_q85_crop_upscale.png', '2010-09-08 19:51:16+00', 24, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (44, 'resized/uploads/blog/r_SS-sketches.jpg.100x100_q85.png', '2010-09-08 19:51:46+00', 21, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (45, 'resized/uploads/blog/r_SS-logo.jpg.100x100_q85.png', '2010-09-08 19:51:46+00', 22, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (46, 'resized/uploads/blog/r_SS-learning.jpg.100x100_q85.png', '2010-09-08 19:51:46+00', 23, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (47, 'resized/uploads/blog/r_SS-martin.jpg.100x100_q85.png', '2010-09-08 19:51:47+00', 24, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (48, 'resized/uploads/blog/r_SS-sketches2.jpg.700x440_q85_crop_upscale.png', '2010-09-08 19:58:33+00', 25, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (49, 'resized/uploads/blog/r_SS-logo_1.jpg.700x440_q85_crop_upscale.png', '2010-09-08 20:05:41+00', 26, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (50, 'resized/uploads/blog/r_SS-sketches_1.jpg.700x440_q85_crop_upscale.png', '2010-09-08 20:05:41+00', 27, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (51, 'resized/uploads/blog/r_SS-learning_1.jpg.700x440_q85_crop_upscale.png', '2010-09-08 20:05:41+00', 28, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (52, 'resized/uploads/blog/r_SS-martin_1.jpg.700x440_q85_crop_upscale.png', '2010-09-08 20:05:41+00', 29, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (53, 'resized/uploads/blog/r_SS-logo_1.jpg.100x100_q85.png', '2010-09-08 20:05:55+00', 26, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (54, 'resized/uploads/blog/r_SS-sketches_1.jpg.100x100_q85.png', '2010-09-08 20:05:55+00', 27, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (55, 'resized/uploads/blog/r_SS-learning_1.jpg.100x100_q85.png', '2010-09-08 20:05:55+00', 28, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (56, 'resized/uploads/blog/r_SS-martin_1.jpg.100x100_q85.png', '2010-09-08 20:05:55+00', 29, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (57, 'resized/uploads/blog/r_avatard-dribbble.png.100x100_q85.png', '2010-09-09 17:57:49+00', 30, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (58, 'resized/uploads/blog/r_avatard-dribbble.png.700x440_q85_crop_upscale.png', '2010-09-09 17:58:31+00', 30, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (59, 'resized/uploads/front-page/r_Screen_shot_2010-10-06_at_3.29.21_PM.png.100x100_q85.png', '2010-10-06 19:35:10+00', 31, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (60, 'resized/uploads/front-page/r_Screen_shot_2010-10-06_at_3.29.21_PM.png.220x800_q85.png', '2010-10-06 19:35:27+00', 31, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (61, 'resized/uploads/blog/r_Traffic-Light.jpg.480x440_q85_crop_upscale.png', '2010-10-09 14:52:17+00', 32, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (62, 'resized/uploads/blog/r_Traffic-Light.jpg.100x100_q85.png', '2010-10-09 14:55:56+00', 32, 4, 'df2a8819fc7f348e9715cca951e8e5df');
INSERT INTO easy_thumbnails_thumbnail VALUES (63, 'resized/uploads/blog/r_Traffic-Light_1.jpg.480x440_q85_crop_upscale.png', '2010-10-09 14:57:45+00', 33, 4, 'df2a8819fc7f348e9715cca951e8e5df');


--
-- Data for Name: portfolio_category; Type: TABLE DATA; Schema: public; Owner: andrewramos
--



--
-- Data for Name: portfolio_client; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO portfolio_client VALUES (1, 'Personal');
INSERT INTO portfolio_client VALUES (2, 'The Trappe Door');
INSERT INTO portfolio_client VALUES (3, 'Somewhat Organic Soap Co.');
INSERT INTO portfolio_client VALUES (4, 'Southern Savers');
INSERT INTO portfolio_client VALUES (5, 'Parachute Clothing');


--
-- Data for Name: portfolio_portfoliopiece; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO portfolio_portfoliopiece VALUES (2, 'uploads/portfolio/Shopping-Cart.jpg', 20, 1, '2010-08-11 23:13:43.275679+00', '2010-08-12 04:35:33.341876+00', 2);
INSERT INTO portfolio_portfoliopiece VALUES (1, 'uploads/portfolio/Start-Copy.jpg', 20, 1, '2010-08-11 23:13:43.23667+00', '2010-08-12 05:57:28.62863+00', 1);
INSERT INTO portfolio_portfoliopiece VALUES (3, 'uploads/portfolio/Coupons.jpg', 20, 1, '2010-08-12 19:03:55.378647+00', '2010-08-12 19:05:31.616478+00', 3);
INSERT INTO portfolio_portfoliopiece VALUES (4, 'uploads/portfolio/Max.jpg', 20, 1, '2010-08-12 19:03:55.422491+00', '2010-08-12 19:05:31.621599+00', 4);
INSERT INTO portfolio_portfoliopiece VALUES (5, 'uploads/portfolio/Volume.jpg', 20, 1, '2010-08-12 19:03:55.425008+00', '2010-08-12 19:05:31.626694+00', 5);
INSERT INTO portfolio_portfoliopiece VALUES (6, 'uploads/portfolio/TTD1.jpg', 20, 2, '2011-01-25 17:09:25.729252+00', '2011-01-25 17:09:25.729321+00', 1);
INSERT INTO portfolio_portfoliopiece VALUES (7, 'uploads/portfolio/TTD2.jpg', 20, 2, '2011-01-25 17:09:25.742553+00', '2011-01-25 17:10:47.572661+00', 2);
INSERT INTO portfolio_portfoliopiece VALUES (8, 'uploads/portfolio/TTD3_1.jpg', 20, 2, '2011-01-25 17:09:25.746087+00', '2011-01-25 17:32:23.182768+00', 3);
INSERT INTO portfolio_portfoliopiece VALUES (9, 'uploads/portfolio/SOS-1b.jpg', 20, 3, '2011-01-25 20:19:06.542502+00', '2011-01-25 20:19:06.542548+00', 1);
INSERT INTO portfolio_portfoliopiece VALUES (10, 'uploads/portfolio/SOS-2.jpg', 20, 3, '2011-01-25 20:19:06.546793+00', '2011-01-25 20:19:06.546845+00', 2);
INSERT INTO portfolio_portfoliopiece VALUES (13, 'uploads/portfolio/SS-logo.jpg', 20, 4, '2011-01-25 20:25:28.362894+00', '2011-01-25 20:25:28.362947+00', 1);
INSERT INTO portfolio_portfoliopiece VALUES (14, 'uploads/portfolio/SS-learning.jpg', 20, 4, '2011-01-25 20:25:28.366232+00', '2011-01-25 20:25:58.788276+00', 2);
INSERT INTO portfolio_portfoliopiece VALUES (15, 'uploads/portfolio/SS-martin_1.jpg', 20, 4, '2011-01-25 20:25:28.368605+00', '2011-01-25 21:18:43.439566+00', 3);
INSERT INTO portfolio_portfoliopiece VALUES (16, 'uploads/portfolio/Parachute1.jpg', 20, 5, '2011-02-04 21:44:48.250106+00', '2011-02-04 21:44:48.250183+00', 1);
INSERT INTO portfolio_portfoliopiece VALUES (17, 'uploads/portfolio/Parachute2.jpg', 20, 5, '2011-02-04 21:44:48.283448+00', '2011-02-04 21:46:08.833588+00', 2);
INSERT INTO portfolio_portfoliopiece VALUES (18, 'uploads/portfolio/Parachute3.jpg', 20, 5, '2011-02-04 21:44:48.286859+00', '2011-02-04 21:46:08.83945+00', 3);


--
-- Data for Name: portfolio_project; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

INSERT INTO portfolio_project VALUES (2, 'The Trappe Door', 'Identity', 'trappe-door-branding', 2, 'p', 'f', NULL, '2011-01-25 17:09:25.659888+00', '2011-01-25 20:27:05.480123+00');
INSERT INTO portfolio_project VALUES (1, 'Teaser Images', '', 'teaser-images', 1, 'd', 'p', NULL, '2010-08-11 23:13:43.160903+00', '2011-01-25 20:27:47.97157+00');
INSERT INTO portfolio_project VALUES (3, 'Somewhat Organic Soap Co.', 'Identity', 'somewhat-organic-soap-co', 3, 'p', 'f', NULL, '2011-01-25 20:19:06.536287+00', '2011-01-25 21:18:04.758877+00');
INSERT INTO portfolio_project VALUES (4, 'Southern Savers', 'Identity', 'southern-savers', 4, 'p', 'f', 2, '2011-01-25 20:25:28.35775+00', '2011-01-25 21:18:43.426977+00');
INSERT INTO portfolio_project VALUES (5, 'Parachute Clothing', 'Identity, Website', 'parachute-clothing', 5, 'p', 'f', NULL, '2011-02-04 21:44:48.183705+00', '2011-02-04 21:52:12.088292+00');


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

-- INSERT INTO south_migrationhistory VALUES (1, 'easy_thumbnails', '0001_initial', '2010-08-11 08:43:36.714022+00');
-- INSERT INTO south_migrationhistory VALUES (2, 'easy_thumbnails', '0002_filename_indexes', '2010-08-11 08:43:36.757648+00');
-- INSERT INTO south_migrationhistory VALUES (3, 'blog', '0001_initial', '2010-08-11 08:43:37.073414+00');
-- INSERT INTO south_migrationhistory VALUES (4, 'portfolio', '0001_initial', '2010-08-11 08:43:37.463286+00');
-- INSERT INTO south_migrationhistory VALUES (5, 'content', '0001_initial', '2010-08-11 08:43:37.848809+00');
-- INSERT INTO south_migrationhistory VALUES (6, 'portfolio', '0002_auto__add_field_portfoliopiece_order', '2010-08-12 08:33:49.388459+00');
-- INSERT INTO south_migrationhistory VALUES (7, 'easy_thumbnails', '0003_auto__add_storagenew', '2011-05-14 01:41:06.689708+00');
-- INSERT INTO south_migrationhistory VALUES (8, 'easy_thumbnails', '0004_auto__add_field_source_storage_new__add_field_thumbnail_storage_new', '2011-05-14 01:41:06.986676+00');
-- INSERT INTO south_migrationhistory VALUES (9, 'easy_thumbnails', '0005_storage_fks_null', '2011-05-14 01:41:07.42705+00');
-- INSERT INTO south_migrationhistory VALUES (10, 'easy_thumbnails', '0006_copy_storage', '2011-05-14 01:41:07.500399+00');
-- INSERT INTO south_migrationhistory VALUES (11, 'easy_thumbnails', '0007_storagenew_fks_not_null', '2011-05-14 01:41:07.640433+00');
-- INSERT INTO south_migrationhistory VALUES (12, 'easy_thumbnails', '0008_auto__del_field_source_storage__del_field_thumbnail_storage', '2011-05-14 01:41:07.678411+00');
-- INSERT INTO south_migrationhistory VALUES (13, 'easy_thumbnails', '0009_auto__del_storage', '2011-05-14 01:41:07.738566+00');
-- INSERT INTO south_migrationhistory VALUES (14, 'easy_thumbnails', '0010_rename_storage', '2011-05-14 01:41:07.780439+00');
-- INSERT INTO south_migrationhistory VALUES (15, 'easy_thumbnails', '0011_auto__add_field_source_storage_hash__add_field_thumbnail_storage_hash', '2011-05-14 01:41:07.881189+00');
-- INSERT INTO south_migrationhistory VALUES (16, 'easy_thumbnails', '0012_build_storage_hashes', '2011-05-14 01:41:07.927854+00');
-- INSERT INTO south_migrationhistory VALUES (17, 'blog', '0002_auto__del_field_article_tags__del_field_shortpost_tags__del_field_quot', '2011-05-14 01:48:47.746441+00');
-- INSERT INTO south_migrationhistory VALUES (18, 'content', '0002_auto__del_emailmessage__del_staticpage', '2011-05-14 01:48:47.99986+00');


--
-- Data for Name: tagging_tag; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

-- INSERT INTO tagging_tag VALUES (1, 'Coca Cola');
-- INSERT INTO tagging_tag VALUES (2, 'Coke');
-- INSERT INTO tagging_tag VALUES (3, 'Not Real');
-- INSERT INTO tagging_tag VALUES (4, 'Test');
-- INSERT INTO tagging_tag VALUES (5, 'coca cola');
-- INSERT INTO tagging_tag VALUES (6, 'coke');
-- INSERT INTO tagging_tag VALUES (7, 'Branding');
-- INSERT INTO tagging_tag VALUES (8, 'branding');
-- INSERT INTO tagging_tag VALUES (9, 'illustration');
-- INSERT INTO tagging_tag VALUES (10, 'presentation');
-- INSERT INTO tagging_tag VALUES (11, 'Apple');
-- INSERT INTO tagging_tag VALUES (12, 'apple');
-- INSERT INTO tagging_tag VALUES (13, 'case study');
-- INSERT INTO tagging_tag VALUES (14, 'identity');
-- INSERT INTO tagging_tag VALUES (15, 'Two Over Zero');


--
-- Data for Name: tagging_taggeditem; Type: TABLE DATA; Schema: public; Owner: andrewramos
--

-- INSERT INTO tagging_taggeditem VALUES (3, 3, 17, 1);
-- INSERT INTO tagging_taggeditem VALUES (4, 4, 17, 1);
-- INSERT INTO tagging_taggeditem VALUES (8, 8, 16, 3);
-- INSERT INTO tagging_taggeditem VALUES (9, 9, 16, 3);
-- INSERT INTO tagging_taggeditem VALUES (10, 8, 16, 1);
-- INSERT INTO tagging_taggeditem VALUES (11, 10, 16, 1);
-- INSERT INTO tagging_taggeditem VALUES (13, 12, 16, 9);
-- INSERT INTO tagging_taggeditem VALUES (14, 13, 16, 10);
-- INSERT INTO tagging_taggeditem VALUES (15, 14, 16, 10);
-- INSERT INTO tagging_taggeditem VALUES (16, 9, 16, 10);
-- INSERT INTO tagging_taggeditem VALUES (17, 13, 17, 2);
-- INSERT INTO tagging_taggeditem VALUES (18, 14, 17, 2);
-- INSERT INTO tagging_taggeditem VALUES (19, 9, 17, 2);
-- INSERT INTO tagging_taggeditem VALUES (20, 15, 16, 17);


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: andrewramos
--



--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: andrewramos
--



--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_article_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY blog_article
    ADD CONSTRAINT blog_article_pkey PRIMARY KEY (id);


--
-- Name: blog_article_slug_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY blog_article
    ADD CONSTRAINT blog_article_slug_key UNIQUE (slug);


--
-- Name: blog_casestudy_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY blog_casestudy
    ADD CONSTRAINT blog_casestudy_pkey PRIMARY KEY (id);


--
-- Name: blog_casestudy_slug_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY blog_casestudy
    ADD CONSTRAINT blog_casestudy_slug_key UNIQUE (slug);


--
-- Name: blog_image_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY blog_image
    ADD CONSTRAINT blog_image_pkey PRIMARY KEY (id);


--
-- Name: blog_quote_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY blog_quote
    ADD CONSTRAINT blog_quote_pkey PRIMARY KEY (id);


--
-- Name: blog_quote_slug_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY blog_quote
    ADD CONSTRAINT blog_quote_slug_key UNIQUE (slug);


--
-- Name: blog_shortpost_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY blog_shortpost
    ADD CONSTRAINT blog_shortpost_pkey PRIMARY KEY (id);


--
-- Name: blog_shortpost_slug_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY blog_shortpost
    ADD CONSTRAINT blog_shortpost_slug_key UNIQUE (slug);


--
-- Name: content_frontpagecontent_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY content_frontpagecontent
    ADD CONSTRAINT content_frontpagecontent_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_storage
    ADD CONSTRAINT easy_thumbnails_storage_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: portfolio_category_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY portfolio_category
    ADD CONSTRAINT portfolio_category_pkey PRIMARY KEY (id);


--
-- Name: portfolio_client_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY portfolio_client
    ADD CONSTRAINT portfolio_client_pkey PRIMARY KEY (id);


--
-- Name: portfolio_portfoliopiece_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY portfolio_portfoliopiece
    ADD CONSTRAINT portfolio_portfoliopiece_pkey PRIMARY KEY (id);


--
-- Name: portfolio_project_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY portfolio_project
    ADD CONSTRAINT portfolio_project_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: tagging_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY tagging_tag
    ADD CONSTRAINT tagging_tag_name_key UNIQUE (name);


--
-- Name: tagging_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY tagging_tag
    ADD CONSTRAINT tagging_tag_pkey PRIMARY KEY (id);


--
-- Name: tagging_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tagging_taggeditem_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_tag_id_key UNIQUE (tag_id, content_type_id, object_id);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: andrewramos; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: blog_image_content_type_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX blog_image_content_type_id ON blog_image USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: easy_thumbnails_source_name; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_storage_new_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_new_id ON easy_thumbnails_source USING btree (storage_id);


--
-- Name: easy_thumbnails_storagenew_hash; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX easy_thumbnails_storagenew_hash ON easy_thumbnails_storage USING btree (hash);


--
-- Name: easy_thumbnails_storagenew_hash_like; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX easy_thumbnails_storagenew_hash_like ON easy_thumbnails_storage USING btree (hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_name; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_source_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_source_id ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_storage_new_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_new_id ON easy_thumbnails_thumbnail USING btree (storage_id);


--
-- Name: portfolio_category_content_type_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX portfolio_category_content_type_id ON portfolio_category USING btree (content_type_id);


--
-- Name: portfolio_portfoliopiece_content_type_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX portfolio_portfoliopiece_content_type_id ON portfolio_portfoliopiece USING btree (content_type_id);


--
-- Name: portfolio_project_case_study_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX portfolio_project_case_study_id ON portfolio_project USING btree (case_study_id);


--
-- Name: portfolio_project_client_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX portfolio_project_client_id ON portfolio_project USING btree (client_id);


--
-- Name: portfolio_project_slug; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX portfolio_project_slug ON portfolio_project USING btree (slug);


--
-- Name: portfolio_project_slug_like; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX portfolio_project_slug_like ON portfolio_project USING btree (slug varchar_pattern_ops);


--
-- Name: tagging_taggeditem_content_type_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX tagging_taggeditem_content_type_id ON tagging_taggeditem USING btree (content_type_id);


--
-- Name: tagging_taggeditem_object_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX tagging_taggeditem_object_id ON tagging_taggeditem USING btree (object_id);


--
-- Name: tagging_taggeditem_tag_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX tagging_taggeditem_tag_id ON tagging_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_content_type_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX taggit_taggeditem_content_type_id ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_object_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX taggit_taggeditem_object_id ON taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id; Type: INDEX; Schema: public; Owner: andrewramos; Tablespace: 
--

CREATE INDEX taggit_taggeditem_tag_id ON taggit_taggeditem USING btree (tag_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: case_study_id_refs_id_2a8846430c478604; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY portfolio_project
    ADD CONSTRAINT case_study_id_refs_id_2a8846430c478604 FOREIGN KEY (case_study_id) REFERENCES blog_casestudy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: client_id_refs_id_4c30a54fdcc44ebe; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY portfolio_project
    ADD CONSTRAINT client_id_refs_id_4c30a54fdcc44ebe FOREIGN KEY (client_id) REFERENCES portfolio_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_547e0b2bfe6df27f; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY portfolio_portfoliopiece
    ADD CONSTRAINT content_type_id_refs_id_547e0b2bfe6df27f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_669a34ef66f6ddaf; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY portfolio_category
    ADD CONSTRAINT content_type_id_refs_id_669a34ef66f6ddaf FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_7cab9e513e9dc5c4; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY blog_image
    ADD CONSTRAINT content_type_id_refs_id_7cab9e513e9dc5c4 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: source_id_refs_id_38c628a45bffe8f5; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT source_id_refs_id_38c628a45bffe8f5 FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: storage_new_id_refs_id_41bc24c3806913c9; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT storage_new_id_refs_id_41bc24c3806913c9 FOREIGN KEY (storage_id) REFERENCES easy_thumbnails_storage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: storage_new_id_refs_id_5cebe21bafd2e07f; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT storage_new_id_refs_id_5cebe21bafd2e07f FOREIGN KEY (storage_id) REFERENCES easy_thumbnails_storage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagging_taggeditem_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagging_taggeditem_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tagging_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: andrewramos
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

