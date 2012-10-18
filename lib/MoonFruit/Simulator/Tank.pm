package MoonFruit::Simulator::Tank;

use Moose;

has creatures => (
    is      => 'rw',
    isa     => 'ArrayRef[MoonFruit::Simulator::Creature]',
);

has food => (
    is      => 'rw',
    isa     => 'Int',
);

has temperature => (
    is      => 'rw',
    isa     => 'Int',
);

has depth => (
    is      => 'rw',
    isa     => 'Int',
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=head1 NAME

MoonFruit::Simulator::Tank;

=head1 SYNOPSIS

 my $tank = MoonFruit::Simulator::Tank->new({
     depth          => 100,
     temperature    => 20,
 };

=head1 DESCRIPTION

This module models the Tank object for the MoonFruit simulation.

=head2 ATTRIBUTES

=head3 creatures

An reference to an array of Creatures that inhabit the tank.

=head3 food

The current quantity of food (excluding fish and snails being considered to be food)

=head3 temperature

The current temperature of the water in the tank (probably measured in Centegrade)

=head3 depth

The current depth of the water in the tank (let's assume it is centimeters)

=head1 METHODS

TBD

=head1 AUTHORS

Ian Docherty E<lt>pause@iandocherty.comE<gt>

=head1 COPYRIGHT AND LICENSE

This is free software, you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

=cut.     
