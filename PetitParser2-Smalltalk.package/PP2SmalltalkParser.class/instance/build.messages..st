private
build: aNode messages: anArray
	^ (anArray isNil or: [ anArray isEmpty ])
		ifTrue: [ aNode ]
		ifFalse: [ 
			anArray
				inject: aNode
				into: [ :rec :msg | 
					msg isNil
						ifTrue: [ rec ]
						ifFalse: [ 
							RBMessageNode
								receiver: rec
								selector: (self buildSelector: msg first)
								keywordsPositions: (msg first collect: [ :each | each start ])
								arguments: msg second ] ] ]