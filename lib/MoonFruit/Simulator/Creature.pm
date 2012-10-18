package MoonFruit::Simulator::Creature;

use Moose;

has depth => (
    is      => 'rw',
    isa     => 'Int',
);

has eats => (
    is      => 'rw',
    isa     => 'ArrayRef[Any]',
);

has oxygen_hr => (
    is      => 'rw',
    isa     => 'Int',
);

has min_temperature => (
    is      => 'rw',
    isa     => 'Int',
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=head1 NAME

MoonFruit::Simulator::Creature;

=head1 SYNOPSIS

=head1 DESCRIPTION

This is a base class which can model any creature that exists in the fishtank simulation.

=head2 ATTRIBUTES

=head3 depth

The current depth the fish is swimming at (let's assume it is centimeters)

=head3 eats

A reference to an Array of Class names of things it eats.

=head3 oxygen_hr

The amount of oxygen the creature consumes per hour

=head3 min_temperature

The minimum temperature at which the creature can exist

=head1 METHODS

TBD

=head1 AUTHORS

Ian Docherty E<lt>pause@iandocherty.comE<gt>

=head1 COPYRIGHT AND LICENSE

This is free software, you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

=cut.     
