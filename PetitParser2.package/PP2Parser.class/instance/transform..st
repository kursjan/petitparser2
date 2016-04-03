transforming
transform: aBlock
	"Answer a copy of all parsers reachable from the receiver transformed using aBlock."

	| mapping root |
	mapping := IdentityDictionary new.
	self allParsersDo: [ :each |
		mapping
			at: each
			put: (aBlock value: each copy) ].
	root := mapping at: self.
	[	| changed |
		changed := false.
		root allParsersDo: [ :each |
			each children do: [ :old |
				mapping at: old ifPresent: [ :new |
					each replace: old with: new.
					changed := true ] ] ].
		changed ] whileTrue.
	^ root