package Math::Random::ISAAC::XS;
# ABSTRACT: C implementation of the ISAAC PRNG algorithm

use strict;
use warnings;

=head1 SYNOPSIS

This module implements the same interface as C<Math::Random::ISAAC> and can
be used as a drop-in replacement. This is the recommended implementation of
the module, based on Bob Jenkins' reference implementation in C.

Selecting the backend to use manually really only has two uses:

=over

=item *

If you are trying to avoid the small overhead incurred with dispatching
method calls to the appropriate backend modules.

=item *

If you are testing the module for performance and wish to explicitly decide
which module you would like to use.

=back

Example code:

  # With Math::Random::ISAAC
  my $rng = Math::Random::ISAAC->new(time);
  my $rand = $rng->rand();

  # With Math::Random::ISAAC::XS
  my $rng = Math::Random::ISAAC::XS->new(time);
  my $rand = $rng->rand();

=head1 DESCRIPTION

See L<Math::Random::ISAAC> for the full description.

=head1 METHODS

=head2 new

  Math::Random::ISAAC::XS->new( @seeds )

Implements the interface as specified in C<Math::Random::ISAAC>

=head2 rand

  $rng->rand()

Implements the interface as specified in C<Math::Random::ISAAC>

=head2 irand

  $rng->irand()

Implements the interface as specified in C<Math::Random::ISAAC>

=cut

# This is the code that actually bootstraps the module and exposes
# the interface for the user. XSLoader is believed to be more
# memory efficient than DynaLoader.
use XSLoader;
XSLoader::load(__PACKAGE__, $Math::Random::ISAAC::XS::VERSION);

=head1 SEE ALSO

L<Math::Random::ISAAC>

1;
