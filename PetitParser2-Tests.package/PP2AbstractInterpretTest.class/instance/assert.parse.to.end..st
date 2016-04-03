utilities
assert: aGrammar parse: aCollection to: aTargetObject end: anInteger
	| stream result |

	self assert: aGrammar isPetit2Parser description: 'Parser invalid'.
	stream := aCollection asPetit2Stream.
	
	result := self interpret: stream grammar: aGrammar.
	aTargetObject isNil
		ifTrue: [ self deny: result isPetit2Failure ]
		ifFalse: [ self assert: result value equals: aTargetObject ].
	self assert: result position = anInteger description: 'Parser accepted at wrong position'.
	^ result