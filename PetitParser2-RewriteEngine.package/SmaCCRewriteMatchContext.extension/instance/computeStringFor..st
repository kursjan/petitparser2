*PetitParser2-RewriteEngine
computeStringFor: value
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