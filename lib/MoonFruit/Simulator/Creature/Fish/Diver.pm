package MoonFruit::Simulator::Creature::Fish::Diver;

use Moose;

extends 'MoonFruit::Simulator::Creature::Fish';

has type => (
    is      => 'ro',
    isa     => 'Str',
    default => 'Diver Fish',
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=head1 NAME

MoonFruit::Simulator::Creature::Fish::Diver;

=head1 SYNOPSIS

 my $fish = MoonFruit::Simulator::Creature::Fish::Diver->new({
     depth => 50,
 });

=head1 DESCRIPTION

This class defines a representation of a Diver Fish

=head2 ATTRIBUTES

See the base classes for any attributes not mentioned here

=head3 eats

This defaults to a reference to an Array of class names for things which it eats (just Fish Food)

=head3 oxygen_hr

Defaults to a value suitable for this type of fish, but allows it to be specified to allow for variation within the species.

=head3 min_temperature

The specification does not say so we will make an assumption and set it to Zero (centigrade)

=head1 METHODS

TBD

=head1 AUTHORS

Ian Docherty E<lt>pause@iandocherty.comE<gt>

=head1 COPYRIGHT AND LICENSE

This is free software, you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

=cut.     
