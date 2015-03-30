-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION addressing_dictionary" to load this file. \quit

------------------------------------------------------------
-- Read about how dictionaries should be ordered and what should go in
-- them http://www.postgresql.org/docs/9.3/static/textsearch-dictionaries.html
-- before mucking around with ordering or adding new languages.
--


------------------------------------------------------------
-- English configuration
--
CREATE TEXT SEARCH DICTIONARY public.addressing_stop_en (
	TEMPLATE = pg_catalog.simple,
	STOPWORDS = addressing_en
);

CREATE TEXT SEARCH DICTIONARY public.addressing_syn_en (
	TEMPLATE = pg_catalog.synonym, 
	SYNONYMS = addressing_en
);

CREATE TEXT SEARCH DICTIONARY public.addresses_ths_en (
	TEMPLATE = pg_catalog.thesaurus,
	DictFile = addressing_en,
	Dictionary = simple
);

CREATE TEXT SEARCH CONFIGURATION addressing_en (
	COPY = simple
);

ALTER TEXT SEARCH CONFIGURATION addressing_en
	ALTER MAPPING FOR asciiword, word
	WITH addresses_ths_en, addressing_syn_en, addressing_stop_en;

------------------------------------------------------------
-- French configuration
--
CREATE TEXT SEARCH DICTIONARY public.addressing_stop_fr (
	TEMPLATE = pg_catalog.simple,
	STOPWORDS = addressing_fr
);

CREATE TEXT SEARCH DICTIONARY public.addressing_syn_fr (
	TEMPLATE = pg_catalog.synonym, 
	SYNONYMS = addressing_fr
);


CREATE TEXT SEARCH DICTIONARY public.addresses_ths_fr (
        TEMPLATE = pg_catalog.thesaurus,
        DictFile = addressing_fr,
        Dictionary = simple
);

CREATE TEXT SEARCH CONFIGURATION addressing_fr (
	COPY = simple
);

ALTER TEXT SEARCH CONFIGURATION addressing_fr
    ALTER MAPPING FOR asciiword, word
    WITH addresses_ths_fr, addressing_syn_fr, addressing_stop_fr;


