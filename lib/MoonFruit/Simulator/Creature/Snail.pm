package MoonFruit::Simulator::Creature::Snail;

use Moose;

extends 'MoonFruit::Simulator::Creature';

no Moose;
__PACKAGE__->meta->make_immutable;
1;

=head1 NAME

MoonFruit::Simulator::Creature::Snail;

=head1 SYNOPSIS

 my $snail = MoonFruit::Simulator::Creature::Snail->new({
     depth      => 20,
     eats       => ['MoonFruit::Simulator::Food'],
     oxygen_hr  => 5,
 });

=head1 DESCRIPTION

This class defines a Snail.

=head2 ATTRIBUTES

See base class for all attributes

=head1 METHODS

TBD

=head1 AUTHORS

Ian Docherty E<lt>pause@iandocherty.comE<gt>

=head1 COPYRIGHT AND LICENSE

This is free software, you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

=cut.     
