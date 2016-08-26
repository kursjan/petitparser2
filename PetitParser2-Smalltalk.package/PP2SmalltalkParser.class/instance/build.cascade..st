private
build: aNode cascade: anArray 
	| messages semicolons |
	^ (anArray isNil or: [ anArray isEmpty ]) 
		ifTrue: [ aNode ]
		ifFalse: [
			messages := OrderedCollection new: anArray size + 1.
			messages addLast: aNode.
			semicolons := OrderedCollection new.
			anArray do: [ :each | 
				messages addLast: (self 
					build: aNode receiver
					messages: (Array with: each second)).
				semicolons addLast: each first start ].
			RBCascadeNode messages: messages semicolons: semicolons ]