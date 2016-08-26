grammar-literals
arrayLiteral
	^ '#(' asParser2 smalltalkToken , arrayItem star , $) asParser2 smalltalkToken