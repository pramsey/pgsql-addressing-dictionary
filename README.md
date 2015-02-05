# TSearch Address Dictionaries

## Motivation

Trying to use full-text indexing for address data with the default language configurations doesn't work well: you end up getting street names stemmed by the language dictionaries, you might get tokens dropped. Using very simple configurations is better but still not optimal: there is no handling of obvious abbreviations, so you might fail to match "12 N Oak st" to "12 North Oak Street", or vice versa.

Using full-text indexing for nationwide address data might still be a bad idea, since there are so many possible false or multiple matches to find, but for a single city, county or even state, this approach can general a quick'n'dirty address lookup routine perfect to tying to an autocomplete form field on a web page.

Currently there is only support for Engligh (really, North American English) addressing, pull requests gratefully received.

## Installation

Clone the repository, ensure that `pg_config` is on your path, and run `make install` to copy the dictionary files into place.

## Examples

    > CREATE EXTENSION addressing_dictionary;

    > SELECT to_tsvector('addressing_en', '1234 n main st');

                  to_tsvector               
    ----------------------------------------
     '1234':1 'main':3 'north':2 'street':4
    (1 row)



