seas optimizations
removeRepetitions: nextSet
	"
		finds standalne seas and replaces them with islands.
		This helps the performance, because seas are not nested
	"
	| newNextSet |
	newNextSet := IdentitySet new.
	
	nextSet do: [ :node | 
		(node isRepeating and: [ node min <= 1 ]) ifTrue: [ 
			newNextSet add: node child 
		] ifFalse: [  
			newNextSet add: node
		]
	].

	^ newNextSet