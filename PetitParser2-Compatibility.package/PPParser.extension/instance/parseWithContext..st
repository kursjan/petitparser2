*PetitParser2-Compatibility
parseWithContext: context
	| result |
	context parser: self.
	result := self parseOn: context.
	
	"Return the furthest failure, it gives better results than the last failure"
	(result isPetitFailure and: [ context furthestFailure notNil]) 
		ifTrue: [ ^ context furthestFailure ].
	^ result
	