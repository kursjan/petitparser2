grammar
array
	^ ${ asParser2 smalltalkToken , (expression delimitedBy: periodToken) optional , $} asParser2 smalltalkToken