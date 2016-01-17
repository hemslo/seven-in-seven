! START:full
USING: kernel sequences ;
! START:init
IN: examples.strings

: palindrome? ( x -- y ) dup reverse = ;

! END:init
! END:full
