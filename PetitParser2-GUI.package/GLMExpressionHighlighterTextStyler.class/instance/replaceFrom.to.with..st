as yet unclassified
replaceFrom: start to: stop with: aText
	super replaceFrom: start to: stop with: aText.
	
	context ifNotNil: [  
		(start > stop and: [aText string size = 1]) ifTrue: [  
			context applyChange: (PP2InsertCharacter new
				position: start;
				input: text string;
				yourself)
		]
	].
