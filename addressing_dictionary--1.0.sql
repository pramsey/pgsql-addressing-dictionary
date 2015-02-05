-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION addressing_dictionary" to load this file. \quit

CREATE TEXT SEARCH DICTIONARY public.addressing_stop_en (
	TEMPLATE = pg_catalog.simple,
	STOPWORDS = addressing_en
);

CREATE TEXT SEARCH DICTIONARY public.addressing_syn_en (
	TEMPLATE = pg_catalog.synonym, 
	SYNONYMS = addressing_en
);

CREATE TEXT SEARCH CONFIGURATION addressing_en (
	COPY = simple
);

ALTER TEXT SEARCH CONFIGURATION addressing_en
    ALTER MAPPING FOR asciiword, word
    WITH addressing_syn_en, addressing_stop_en;


