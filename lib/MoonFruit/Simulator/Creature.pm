package MoonFruit::Simulator::Creature;

use Moose;
use Carp;
use List::Util qw(min max);

has depth => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has eats => (
    is      => 'rw',
    isa     => 'ArrayRef[Any]',
    default => sub { [] },
);

has food_hr => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has oxygen_hr => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has min_temperature => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has min_depth => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has max_depth => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has type => (
    is      => 'ro',
    isa     => 'Str',
    default => 'Undefined',
);

has food_value => (
    is      => 'ro',
    isa     => 'Int',
    default => 0,
);

has status => (
    is      => 'rw',
    isa     => 'Str',
    default => 'alive',
);

has reason => (
    is      => 'rw',
    default => '',
);

use overload '""' => sub {
    my ($self) = @_;

    return "  Creature: ".$self->type." current depth ".$self->depth."\n";
};

sub dies {
    my ($self, $reason) = @_;
    $reason = $reason || 'Unknown';
    $self->status('dead');
    $self->reason($reason);
}

sub tick {
    my ($self, $args) = @_;

    print "Tick a ".$self->type."\n";
    my $tank    = $args->{tank} || croak "You need to supply a 'tank' attribute";
    my $seconds = $args->{seconds} || 1;

    my $hours = $seconds / 3600;
    # consume oxygen
    if ($self->status eq 'alive' and $self->oxygen_hr > 0) {
        my $oxygen_consumed = $self->oxygen_hr * $hours;
        my $tank_oxygen     = $tank->oxygen;
        $tank_oxygen       -= $oxygen_consumed;
        if ($tank_oxygen < 0) {
            # no more oxygen. Fish suffocates
            $tank_oxygen = 0;
            $self->dies('lock of oxygen');
        }
        # I know that this is introducing rounding errors, but it will do for now
        $tank_oxygen = int($tank_oxygen);
        $tank->oxygen($tank_oxygen);
    }

    # consume food
    if ($self->status eq 'alive' and $self->food_hr > 0) {
        my $food_needed     = $self->food_hr * $hours;
        my $food_consumed   = 0;

        FOOD_CLASS:
        foreach my $food_class (@{$self->eats}) {
            # TODO: For each food class, see if there is any, if so consume it

            # TODO: for fish-food, assume that all fish food is accessible
            
            # TODO: for other creatures, only get those creatures within the min/max depth of this creature
            
        }
        # I know that this is introducing rounding errors, but it will do for now
        # TODO: For now just keep the fish alive

#        $food_consumed = int($food_consumed);
#        if ($food_consumed < $food_needed) {
#            $self->dies('lack of food');
#        }
    }

    # Randomly adjust depth
    my $max_depth = min $tank->depth, $self->max_depth;
    my $min_depth = max 0, $self->min_depth;
    if ($min_depth > $max_depth) {
        # I'm out of my depth here, what should I do?
        $self->dies("out of depth");
    }
    else {
        my $depth = int(rand($max_depth - $min_depth)) + $min_depth;
        $self->depth($depth);
    }

    # check temperature tolerance

    if ($tank->temperature < $self->min_temperature) {
        $self->dies('too cold');
    }
}

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

=head3 food_hr

The amount of food the creature consumes per hour (assuming it eats at all)

=head3 oxygen_hr

The amount of oxygen the creature consumes per hour

=head3 min_temperature

The minimum temperature at which the creature can exist

=head3 food_value

The equivalent 'food value' that this creature has if consumed by another creature

=head1 METHODS

=head2 tick <seconds>

Tick the simulation of the creature forward by B<seconds>

 $sun_fish->tick({ tank => $tank, creature => $creature });


=head1 AUTHORS

Ian Docherty E<lt>pause@iandocherty.comE<gt>

=head1 COPYRIGHT AND LICENSE

This is free software, you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.

=cut.     
