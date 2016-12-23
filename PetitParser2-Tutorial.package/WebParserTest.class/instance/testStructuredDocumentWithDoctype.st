tests
testStructuredDocumentWithDoctype
	| html body javascript |
	super testStructuredDocumentWithDoctype.
	
	self assert: result name equals: 'DOCUMENT'.


	html := result secondChild.
	self assert: html name equals: 'html'.

	body := html firstChild.
	self assert: body name equals: 'body'.
	
	javascript := body firstChild.
	self assert: javascript isKindOf: JavascriptElement.
	self assert: javascript code equals: 'alert("hello world")'.