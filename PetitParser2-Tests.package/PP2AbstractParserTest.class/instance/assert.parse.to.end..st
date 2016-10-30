utilities
assert: aParser parse: aCollection to: aTargetObject end: anInteger
	| stream result ctx |

	self assert: aParser isPetit2Parser description: 'Parser invalid'.
	stream := aCollection asPetit2Stream.
	ctx := self context.
	
	result := self parse: stream withParser: aParser withContext: ctx.
	
	aTargetObject isNil
		ifTrue: [ self deny: result isPetit2Failure ]
		ifFalse: [ self assert: result value asArray equals: aTargetObject asArray ].
	self assert: result position = anInteger description: 'Parser accepted at wrong position'.
	^ result