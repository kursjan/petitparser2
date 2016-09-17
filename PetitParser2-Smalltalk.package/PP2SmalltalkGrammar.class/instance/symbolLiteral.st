grammar-literals
symbolLiteral
	"This is totally fucked up: The Pharo compiler allows multiple #, arbitrary spaces between the # and the symbol, as well as comments inbetween. And yes, it is used."

	^ $# asPParser smalltalkToken plus , symbol smalltalkToken ==> [ :tokens | tokens first copyWith: tokens last ]