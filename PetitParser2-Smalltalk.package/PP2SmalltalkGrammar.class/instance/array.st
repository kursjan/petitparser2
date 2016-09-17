grammar
array
	^ ${ asPParser smalltalkToken , (expression delimitedBy: periodToken) optional , $} asPParser smalltalkToken