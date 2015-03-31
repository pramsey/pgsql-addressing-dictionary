
#MODULE_big = http
#OBJS = http.o
EXTENSION = addressing_dictionary
DATA = addressing_dictionary--1.1.sql addressing_dictionary--1.0--1.1.sql
REGRESS = addressing_dictionary
EXTRA-CLEAN =
DATA_TSEARCH = addressing_en.ths addressing_en.stop addressing_en.syn addressing_fr.ths addressing_fr.stop addressing_fr.syn

PG_CONFIG = pg_config

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

