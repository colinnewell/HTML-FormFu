package HTML::FormFu::Element::Radio;
use Moose;

extends 'HTML::FormFu::Element::Checkbox';

use HTML::FormFu::Constants qw( $EMPTY_STR );

__PACKAGE__->mk_output_accessors(qw( default ));

after BUILD => sub {
    my $self = shift;

    $self->field_type('radio');

    return;
};

1;

__END__

=head1 NAME

HTML::FormFu::Element::Radio - Radio form field

=head1 SYNOPSIS

    my $element = $form->element( Radio => 'foo' );

=head1 DESCRIPTION

Radio form field.

=head1 METHODS

=head2 reverse_multi

Overrides the default value, so it's C<true>.

=head1 SEE ALSO

Is a sub-class of, and inherits methods from
L<HTML::FormFu::Element::Checkbox>, 
L<HTML::FormFu::Element::_Input>, 
L<HTML::FormFu::Element::_Field>, 
L<HTML::FormFu::Element>

L<HTML::FormFu>

=head1 AUTHOR

Carl Franks, C<cfranks@cpan.org>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut
