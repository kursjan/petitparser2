tests
testRepetitionReplace
	| one two otherone othertwo repetition |
	one := $a asParser.
	two := $b asParser.
	otherone := $1 asParser.
	othertwo := $2 asParser.
	
	repetition := one starLazy: two.
	self assert: repetition children first == one.
	self assert: repetition children second == two.
	
	repetition replace: one with: otherone.
	self assert: repetition children first == otherone.
	self assert: repetition children second == two.
	
	repetition replace: two with: othertwo.
	self assert: repetition children first == otherone.
	self assert: repetition children second == othertwo