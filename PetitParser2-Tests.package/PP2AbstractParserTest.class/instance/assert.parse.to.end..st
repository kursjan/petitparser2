utilities
assert: aParser parse: aCollection to: aTargetObject end: anInteger
	| stream result context |

	self assert: aParser isPetit2Parser description: 'Parser invalid'.
	stream := aCollection asPetit2Stream.
	context := self context.
	
	result := aParser perform: self parseSelector withArguments: { stream . context }.
	
	aTargetObject isNil
		ifTrue: [ self deny: result isPetit2Failure ]
		ifFalse: [ self assert: result value equals: aTargetObject ].
	self assert: result position = anInteger description: 'Parser accepted at wrong position'.
	^ result