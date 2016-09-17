as yet unclassified
testJavaSources
	| s1 s2 |
	PP2Sources reset.
	s1 := PP2Sources current javaSourcesProfiling.
	PP2Sources reset.
	s2 := PP2Sources current javaSourcesProfiling.
	
	self assert: s1 equals: s2.