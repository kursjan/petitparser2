summary
groupBy: fieldName
	| dictionary |
	dictionary := OrderedDictionary new.
	entries do: [ :e |
		| collection |
		collection := dictionary at: (e perform: fieldName) ifAbsentPut: [ OrderedCollection new ].
		collection add: e.
	].
	^ dictionary