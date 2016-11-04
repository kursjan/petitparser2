tests - document
testDocument4
	| htmlElement |
	super testDocument4.
	
	htmlElement := self result secondChild.
	self assert: htmlElement name equals: 'html'.
	self assert: htmlElement firstChild name equals: 'head'.