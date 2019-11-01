------------------------------------------------------------
-- English configuration
--
CREATE TEXT SEARCH DICTIONARY public.addresses_ths_en (
	TEMPLATE = pg_catalog.thesaurus,
	DictFile = addressing_en,
	Dictionary = simple
);

ALTER TEXT SEARCH CONFIGURATION addressing_en
	ALTER MAPPING FOR asciiword, word
	WITH addresses_ths_en, addressing_syn_en, addressing_stop_en;

------------------------------------------------------------
-- French configuration
--
CREATE TEXT SEARCH DICTIONARY public.addresses_ths_fr (
        TEMPLATE = pg_catalog.thesaurus,
        DictFile = addressing_fr,
        Dictionary = simple
);

ALTER TEXT SEARCH CONFIGURATION addressing_fr
    ALTER MAPPING FOR asciiword, word
    WITH addresses_ths_fr, addressing_syn_fr, addressing_stop_fr;


