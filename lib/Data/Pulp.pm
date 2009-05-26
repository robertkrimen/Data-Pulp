package Data::Pulp;

use warnings;
use strict;

=head1 NAME

Data::Pulp -

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

=cut

use Moose();
use Data::Pulp::Carp;

sub EXPORT () {qw/
    case if_value if_type if_object
    then empty nil default
    pulper
/}

use Sub::Exporter -setup => {
    exports => [
        EXPORT,
#        pulper => sub { my $caller = caller; sub { pulper( $caller, @_ ) }, },
#        pulp => sub { my $caller = caller; sub { pulp( $caller, @_ ) }, },
    ],
    groups => {
        default => [ EXPORT ],
#        default => [ EXPORT, qw/ pulper pulp / ],
    },
};

use Data::Pulp::Pulper;

##my ($import, $unimport) = Moose::Exporter->build_import_methods( cj
#Moose::Exporter->setup_import_methods(
#    with_caller => [qw/ pulper /],
#    as_is => [qw/ case then empty nil default /],
#);

sub case (&@) { return case => @_ }
sub if_value (&@) { return if_value => @_ }
sub if_type (&@) { return if_type => @_ }
sub if_object (&@) { return if_object => @_ }
sub then (&@) { return then => @_ }
sub empty (&@) { return empty => @_ }
sub nil (&@) { return nil => @_ }
sub default (&@) { return default => @_ }

sub pulper {
    shift if $_[0] eq __PACKAGE__;
    return Data::Pulp::Pulper->parse( @_ );
}

#{
#    my %PULPER; # Meh?

#    sub pulper {
#        my $caller = shift;
#        if ( ref $_[0] eq 'ARRAY' ) {
#            return Data::Pulp::Pulper->parse( @{ $_[0] } );
#        }
#        else {
#            my $name = shift;
#            $PULPER{$caller}{$name} = Data::Pulp::Pulper->parse( @_ );
#        }
#    }

#    sub pulp {
#        my $caller = shift;
#        my $name = shift;
#        my $value = shift;

#        my $pulper = $PULPER{$caller}{$name};
#        croak "Can't find pulper for \"$name\" (in $caller)" unless $pulper;
#        return $pulper->prepare( $value );
#    }
#}

=head1 AUTHOR

Robert Krimen, C<< <rkrimen at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-data-pulp at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Data-Pulp>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Data::Pulp


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Data-Pulp>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Data-Pulp>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Data-Pulp>

=item * Search CPAN

L<http://search.cpan.org/dist/Data-Pulp/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Robert Krimen, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Data::Pulp
