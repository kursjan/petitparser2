private
nonEpsilon: node
	^ node isNullable ifTrue: [ node nonEpsilon  ] ifFalse: [ node ]