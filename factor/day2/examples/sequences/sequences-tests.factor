! START:full
USING: examples.sequences tools.test ;
IN: examples.sequences.tests

{ 1 } [ { 1 2 3 } [ 0 > ] find_first ] unit-test
{ f } [ { 1 2 3 } [ 0 < ] find_first ] unit-test

! END:full
