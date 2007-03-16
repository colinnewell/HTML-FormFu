use strict;
use warnings;

use Test::More tests => 17;

use HTML::FormFu;

my $form = HTML::FormFu->new;
my $fs   = $form->element('fieldset');

$fs->element('text')->name('name')->constraint('Word');
$fs->element('text')->name('age')->constraint('Number');

$form->constraint( Required => 'name', 'age' );

{
    my $constraints = $form->get_constraints;

    is( @$constraints, 4 );

    is( $constraints->[0]->name, 'name' );
    is( $constraints->[1]->name, 'name' );
    is( $constraints->[2]->name, 'age' );
    is( $constraints->[3]->name, 'age' );

    is( $constraints->[0]->constraint_type, 'Word' );
    is( $constraints->[1]->constraint_type, 'Required' );
    is( $constraints->[2]->constraint_type, 'Number' );
    is( $constraints->[3]->constraint_type, 'Required' );
}

{
    my $constraints = $form->get_constraints('name');

    is( @$constraints, 2 );

    is( $constraints->[0]->constraint_type, 'Word' );
    is( $constraints->[1]->constraint_type, 'Required' );
}

{
    my $constraints = $form->get_constraints( { name => 'age' } );

    is( @$constraints, 2 );

    is( $constraints->[0]->constraint_type, 'Number' );
    is( $constraints->[1]->constraint_type, 'Required' );
}

{
    my $constraints = $form->get_constraints( { type => 'Number' } );

    is( @$constraints, 1 );

    is( $constraints->[0]->name, 'age' );
}
