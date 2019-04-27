package MetaCPAN::Document::Contributor;

use MetaCPAN::Moose;

use MetaCPAN::Types qw( Str );

has distribution => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has release_author => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has release_name => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

has pauseid => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

__PACKAGE__->meta->make_immutable;
1;
