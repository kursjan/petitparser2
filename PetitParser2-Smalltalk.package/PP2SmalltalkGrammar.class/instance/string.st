primitives
string
	^ ($' asPParser , ('''''' asPParser / $' asPParser negate) star , $' asPParser)
		forbidCache;
		yourself