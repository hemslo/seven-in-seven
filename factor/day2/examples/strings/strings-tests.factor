! START:full
USING: examples.strings tools.test ;
IN: examples.strings.tests

{ t } [ "racecar" palindrome? ] unit-test
{ f } [ "hello" palindrome? ] unit-test

! END:full
