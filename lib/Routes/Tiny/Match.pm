package Routes::Tiny::Match;

use strict;
use warnings;

sub new {
    my $class = shift;

    my $self = {params => {}, @_};
    bless $self, $class;

    return $self;
}

sub arguments {
    my $self = shift;

    return $self->{arguments};
}

sub params {&captures}

sub captures {
    my $self = shift;

    return $self->{captures};
}

sub name {
    my $self = shift;

    return $self->{name};
}

1;
__END__

=head1 NAME

Routes::Tiny::Match - Matched object

=head1 SYNOPSIS

    my $match = $r->match('/foo/bar');

    my $name = $match->name;
    my $params_hashref = $match->params;

=head1 DESCRIPTION

L<Routes::Tiny::Match> is a Value Object that holds params of a matched route.

=head1 ATTRIBUTES

=head2 C<name>

    my $name = $match->name;

Get original route's pattern name.

=head2 C<arguments>

    my $arguments = $match->arguments;

Get route's pattern arguments.

=head2 C<captures>

    my $hashref = $match->captures;

Get params.

=head2 C<params>

An alias to C<captures.

=head1 METHODS

=head2 C<new>

    my $match = Routes::Tiny::Match->new;

Create new instance of L<Routes::Tiny::Match>.

=cut
