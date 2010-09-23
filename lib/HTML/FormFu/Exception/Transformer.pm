package HTML::FormFu::Exception::Transformer;


use Moose;
extends 'HTML::FormFu::Exception::Input';

sub stage {
    return 'transformer';
}

sub transformer {
    return shift->processor(@_);
}

1;
