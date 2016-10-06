seas optimizations
removeSeas: nextSet
	"
		finds standalne seas and replaces them with islands.
		This helps the performance, because seas are not nested
	"
	| newNextSet |
	newNextSet := IdentitySet new.
	
	nextSet do: [ :node | 
		| firstSet |
		firstSet := node firstSeasOrTerminalsSet.
		self seaCanBeRemoved: firstSet ifTrue:  [ :sea |
			newNextSet add: sea island
		] ifFalse: [  
			newNextSet add: node
		]
	].

	^ newNextSet