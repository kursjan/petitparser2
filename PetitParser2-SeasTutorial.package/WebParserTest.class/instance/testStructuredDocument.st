tests
testStructuredDocument
	| html body |
	super testStructuredDocument.
	
	self assert: result name equals: 'DOCUMENT'.

	html := result secondChild.
	self assert: html name equals: 'html'.

	self assert: html firstChild name equals: 'head'.	
	self assert: html secondChild name equals: 'body'.
	
	body := html secondChild.
	self assert: body children size equals: 4.