*PetitParser2-RewriteEngine
move: anObject after: anotherObject withWhitespace: aString
	| start stop oldStop |
	start := self startIndexFor: anObject.
	stop := self stopIndexFor: anObject.
	oldStop := self stopIndexFor: anotherObject.
	self source moveFrom: start to: stop after: oldStop.
	aString notEmpty
		ifTrue:
			[ self source addNewLineWhitespace: aString from: start to: stop ].
	rewriteEngine
		updateStopPositionFor:
			((anotherObject isParseNode)
				ifTrue: [ anotherObject ]
				ifFalse: [ match ])
		to: stop
		whenEqualTo: oldStop.
	^ self startIndexFor: anotherObject