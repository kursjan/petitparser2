Extension { #name : #SmaCCRewriteMatchContext }

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> computeStringFor: value [
	(value isKindOf: Collection)
		ifTrue:
			[ | first last |
			first := last := nil.
			value
				do:
					[ :each | 
					(each isKindOf: SmaCCParseNode)
						ifTrue:
							[ self processChild: each.
							first isNil
								ifTrue: [ first := self startIndexFor: each ].
							(self stopIndexFor: each)
								ifNotNil: [ :i | 
									i ~= 0
										ifTrue: [ last := i ] ] ]
						ifFalse:
							[ (each isKindOf: SmaCCToken)
								ifTrue:
									[ first isNil
										ifTrue: [ first := value startPosition ].
									last := value stopPosition ] ] ].
			(first notNil and: [ last notNil ])
				ifTrue: [ ^ self sourceFrom: first to: last ] ].
	(value isParseNode)
		ifTrue: [ ^ self rewrite: value ].
	^ (value isToken)
		ifTrue: [ value value ]
		ifFalse: [ value ]
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> insert: aString after: anObject [
	| position endPosition anIndex |
	anIndex := self stopIndexFor: anObject.
	anIndex isNil
		ifTrue: [ ^ nil ].
	position := self source
		insert: aString
		at: (self source nextIndex: anIndex).
	position isNil
		ifTrue: [ ^ nil ].
	endPosition := position + (aString size - 1).
	self
		updateStopPositionFor:
			((anObject isParseNode)
				ifTrue: [ anObject ]
				ifFalse: [ match ])
		to: endPosition
		whenEqualTo: anIndex.
	^ position
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> insert: aString before: anObject [
	| position anIndex |
	anIndex := self startIndexFor: anObject.
	anIndex isNil
		ifTrue: [ ^ nil ].
	position := self source insert: aString at: anIndex.
	rewriteEngine
		updateStartPositionFor:
			((anObject isParseNode)
				ifTrue: [ anObject ]
				ifFalse: [ match ])
		to: position
		whenEqualTo: anIndex.
	^ position
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> isAtEndOfParent: anObject [
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				reverseDo: [ :each | ^ self isAtEndOfParent: each ] ].
	^ (anObject isParseNode)
		and:
			[ anObject parent notNil
				and: [ anObject parent stopPosition = anObject stopPosition ] ]
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> isAtStartOfParent: anObject [
	(anObject isKindOf: Collection)
		ifTrue: [ anObject do: [ :each | ^ self isAtStartOfParent: each ] ].
	^ (anObject isParseNode)
		and:
			[ anObject parent notNil
				and: [ anObject parent startPosition = anObject startPosition ] ]
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> move: anObject after: anotherObject withWhitespace: aString [
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
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> originalStartIndexFor: anObject [
	^ ((anObject isParseNode)
		or: [ anObject isToken ])
		ifTrue: [ anObject startPosition ]
		ifFalse: [ anObject ]
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> originalStartPosition: anObject [
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				do: [ :each | ^ self originalStartPosition: each ] ].
	((anObject isParseNode)
		or: [ anObject isToken ])
		ifTrue: [ ^ anObject startPosition ].
	^ nil
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> originalStopPosition: anObject [
	(anObject isKindOf: Collection)
		ifTrue: [ anObject
				reverseDo: [ :each | ^ self originalStopPosition: each ] ].
	((anObject isParseNode)
		or: [ anObject isToken ])
		ifTrue: [ ^ anObject stopPosition ].
	^ nil
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> startIndexFor: anObject [
	^ ((anObject isParseNode)
		or: [ anObject isToken ])
		ifTrue: [ rewriteEngine startPositionForNode: anObject ]
		ifFalse: [ anObject ]
]

{ #category : #'*PetitParser2-RewriteEngine' }
SmaCCRewriteMatchContext >> stopIndexFor: anObject [
	^ ((anObject isParseNode )
		or: [ anObject isToken ])
		ifTrue: [ rewriteEngine stopPositionForNode: anObject ]
		ifFalse: [ anObject ]
]
