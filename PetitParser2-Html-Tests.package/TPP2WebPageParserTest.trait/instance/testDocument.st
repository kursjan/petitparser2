tests - document
testDocument
	| scripts |
	super testDocument.
	
	scripts := self scripts: self result.
	self assert: scripts size equals: 1.
	self assert: scripts first code equals: 'alert("hello world")'