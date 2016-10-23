private
addStatements: aCollection into: aNode
	aCollection isNil 
		ifTrue: [ ^ aNode ].
	aCollection do: [ :each |
		each class == PP2SmalltalkToken
			ifFalse: [ aNode addNode:  each ]
			ifTrue: [
				aNode statements isEmpty
					ifTrue: [ aNode pp2AddComments: each comments ]
					ifFalse: [ aNode statements last pp2AddComments: each comments ].
				aNode periods: (aNode periods asOrderedCollection
					addLast: each start;
					yourself) ] ].
	^ aNode