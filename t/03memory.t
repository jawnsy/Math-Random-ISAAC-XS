#!/usr/bin/perl -T

# t/02memory.t
#  Tests that there are no memory leaks
#
# $Id$

use strict;
use warnings;

use Test::More;

use Math::Random::ISAAC::XS ();

if (exists($INC{'Devel/Cover.pm'})) {
  plan skip_all => 'This test is not compatible with Devel::Cover';
}

eval {
  require Test::LeakTrace;
};
if ($@) {
  plan skip_all => 'Test::LeakTrace required to test memory leaks';
}

plan tests => 2;

Test::LeakTrace->import;

no_leaks_ok(sub {
  my $obj = Math::Random::ISAAC::XS->new(time);
  for (0..10) {
    $obj->irand();
  }
}, '->irand does not leak memory');

no_leaks_ok(sub {
  my $obj = Math::Random::ISAAC::XS->new(time);
  for (0..30) {
    $obj->rand();
  }
}, '->rand does not leak memory');
