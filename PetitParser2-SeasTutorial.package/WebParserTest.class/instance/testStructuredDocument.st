tests
testStructuredDocument
	| html |
	super testStructuredDocument.
	
	self assert: result name equals: 'DOCUMENT'.

	html := result secondChild.
	self assert: html name equals: 'html'.

	self assert: html firstChild name equals: 'head'.	
	self assert: html secondChild name equals: 'body'.