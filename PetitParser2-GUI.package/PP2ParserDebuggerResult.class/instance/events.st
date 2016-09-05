analysis
events
	| ctx |
	ctx := self findContext.
	ctx isNil ifTrue: [ ^ #() ].
	
	^ result isPetit2Success ifTrue: [ 
		ctx filterFrom: self start to: self stop.
	] ifFalse: [ 
		ctx filterFrom: self start to: self start + 1.
	]