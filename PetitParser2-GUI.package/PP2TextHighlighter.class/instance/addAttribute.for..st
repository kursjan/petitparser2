public
addAttribute: aTextAttribute for: anElementString 
	| attributes |
	attributes := self attributeMapper 
		at: anElementString asSymbol 
		ifAbsentPut: [ OrderedCollection new ].
	attributes add: aTextAttribute