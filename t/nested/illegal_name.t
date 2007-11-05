use strict;
use warnings;

use Test::More tests => 1;

use HTML::FormFu;

my $form = HTML::FormFu->new({ render_class_args => { INCLUDE_PATH => 'share/templates/tt/xhtml' } });

eval {
    $form->element({ name => 'foo.bar' });
};

# died

ok($@);