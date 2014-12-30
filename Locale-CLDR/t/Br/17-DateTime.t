#!/usr/bin/perl
# Do not normalise this test file. It has deliberately unnormalised characters in it.
use v5.10;
use strict;
use warnings;
use utf8;
use if $^V ge v5.12.0, feature => 'unicode_strings';

use Test::More tests => 2;
use Test::Exception;

use ok 'Locale::CLDR';

use DateTime;

my $br_fr = Locale::CLDR->new('br_FR');

my $dt_br_fr = DateTime->new(
	year => 1966,
	month => 10,
	day        => 25,
    hour       => 7,
    minute     => 15,
    second     => 47,
    locale 	   => $br_fr,
	time_zone  => 'Europe/London',
);

is ($dt_br_fr->format_cldr($br_fr->datetime_format_full), '1966 Here 25, Meurzh 07:15:47 Europe/London', 'Date Time Format Full Breton');