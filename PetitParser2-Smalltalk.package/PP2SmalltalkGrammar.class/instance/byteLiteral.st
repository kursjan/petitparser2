grammar-literals
byteLiteral
	^ '#[' asParser2 smalltalkToken , numberLiteral star , $] asParser2 smalltalkToken