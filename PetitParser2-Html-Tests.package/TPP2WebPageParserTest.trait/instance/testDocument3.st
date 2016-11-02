tests - document
testDocument3
	| htmlElement bodyElement |
	super testDocument3.
	
	htmlElement := self result secondChild.
	self assert: htmlElement name equals: 'html'.
	self assert: htmlElement children size equals: 2.
	self assert: htmlElement secondChild name equals: 'body'.
	
	bodyElement := htmlElement secondChild.
	self assert: bodyElement children size equals: 2.
	self assert: bodyElement secondChild secondChild name equals: 'span'.