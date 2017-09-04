tests - document
testDocument2
	| scripts htmlElement |
	super testDocument2.
	
	scripts := self scripts: self result.
	self assert: scripts size equals: 1.
	self assert: scripts first code equals: 'alert("hello world")'.
	
	htmlElement := self result secondChild.
	self assert: htmlElement name equals: 'html'.
	self assert: htmlElement children size equals: 2.
	self assert: htmlElement firstChild isKindOf: PP2HtmlText.
	self assert: htmlElement secondChild name equals: 'body'.