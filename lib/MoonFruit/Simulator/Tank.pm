package MoonFruit::Simulator::Tank;

use Moose;

has creatures => (
    is      => 'rw',
    isa     => 'ArrayRef[MoonFruit::Simulator::Creature]',
    default => sub {[]} ,
);

has food => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has temperature => (
    is      => 'rw',
    isa     => 'Int',
    default => 20,
);

has depth => (
    is      => 'rw',
    isa     => 'Int',
    default => 100,
);

use overload '""' => sub {
    my ($self) = @_;

    my $string;
    $string  = "Tank object\n";
    $string .= "  temperature = ".$self->temperature."\n";
    $string .= "  water depth = ".$self->depth."\n";
    $string .= "  fish food   = ".$self->food."\n";
    $string .= " there are ".scalar(@{$self->creatures})." creatures in the tank\n";
    foreach my $creature (@{$self->creatures}) {
        $string .= $creature;
    }
    return $string;
};

sub add_creature {
    my ($self, $creature) = @_;

    my $creatures = $self->creatures;
    push @$creatures, $creature;
    $self->creatures($creatures);
}

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

=head3 add_creature

Add a single creature object to the tank.

=head1 JOKE

 Two fish in a tank.

 One fish turns to the other and says...

 'Can you drive this thing?'

=head1 AUTHORS

Ian Docherty E<lt>pause@iandocherty.comE<gt>

=head1 COPYRIGHT AND LICENSE

This is free software, you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

=cut.     
