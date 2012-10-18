package MoonFruit::Simulator::Creature::Fish::Pirahna;

use Moose;

extends 'MoonFruit::Simulator::Creature::Fish';

has type => (
    is      => 'ro',
    isa     => 'Str',
    default => 'Pirahna Fish',
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=head1 NAME

MoonFruit::Simulator::Creature::Fish::Pirahna;

=head1 SYNOPSIS

 my $fish = MoonFruit::Simulator::Creature::Fish::Pirahna->new({
     depth => 0,
 });

=head1 DESCRIPTION

This class defines a representation of a Pirahna Fish

=head2 ATTRIBUTES

See the base classes for any attributes not mentioned here

=head3 eats

This defaults to a reference to an Array of class names for things which it eats (other fish mostly)

=head3 oxygen_hr

Defaults to a value suitable for Pirahna, but allows it to be specified to allow for variation within the species.

=head3 min_temperature

Defaults to 15 (degrees Centigrade), but allows it to be specified to allow for variation within the species.

=head1 METHODS

TBD

=head1 AUTHORS

Ian Docherty E<lt>pause@iandocherty.comE<gt>

=head1 COPYRIGHT AND LICENSE

This is free software, you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

=cut.     
