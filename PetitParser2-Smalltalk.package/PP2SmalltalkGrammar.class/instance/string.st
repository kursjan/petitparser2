primitives
string
	^ ($' asParser2 , ('''''' asParser2 / $' asParser2 negate) star , $' asParser2)
		forbidCache;
		yourself