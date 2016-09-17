tests
testMultipleParents
	| parentOne parentTwo superParent |

	parser := $a asPParser.
	parentOne := parser wrapped.
	parentTwo := parser star.
	superParent := parentOne, parentTwo.
	
	visitor visit: superParent.
	
	self assert: parser parents size equals: 2.
	self assert: parser parents includes: parentOne.
	self assert: parser parents includes: parentTwo.
		