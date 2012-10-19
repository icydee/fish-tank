package MoonFruit::Simulator::Creature::Fish::Clockwork;

use Moose;

extends 'MoonFruit::Simulator::Creature::Fish';

has type => (
    is      => 'ro',
    isa     => 'Str',
    default => 'Clockwork Fish',
);

has min_depth => (
    is      => 'ro',
    isa     => 'Int',
    default => 0,
);

has max_depth => (
    is      => 'ro',
    isa     => 'Int',
    default => 1000,
);


no Moose;
__PACKAGE__->meta->make_immutable;
1;

=head1 NAME

MoonFruit::Simulator::Creature::Fish::Clockwork;

=head1 SYNOPSIS

 my $fish = MoonFruit::Simulator::Creature::Fish::Clockwork->new({
     depth => 0,
 });

=head1 DESCRIPTION

This class defines a representation of a Clockwork Fish (presumably water and rust-proof)

=head2 ATTRIBUTES

See the base classes for any attributes not mentioned here

=head3 eats

Nothing, this defaults to a reference to an empty Array

=head3 oxygen_hr

Nothing, this defaults to zero.

=head3 min_temperature

Defaults to Zero, let's assume that it will survive until water freezes over

=head1 METHODS

TBD

=head1 AUTHORS

Ian Docherty E<lt>pause@iandocherty.comE<gt>

=head1 COPYRIGHT AND LICENSE

This is free software, you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

=cut.     
