transforming
transform: aBlock suchThat: predicate
	"Answer a copy of all nodes reachable from the receiver transformed using aBlock."
	| mapping root |
	self halt: 'JK TODO: use visitor to do this'.
	
	mapping := IdentityDictionary new.
	self allNodesDo: [ :each |
		(predicate value: each) ifTrue: [ 
			mapping at: each put: (aBlock value: each copy).
		] ifFalse: [  
			mapping at: each put: each copy.
		]
	].

	root := mapping at: self.
	[	| changed |
		changed := false.
		root allNodesDo: [ :each |
			each children do: [ :old |
				mapping at: old ifPresent: [ :new |
					each replace: old with: new.
					changed := true ] ] ].
		changed ] whileTrue.
	^ root