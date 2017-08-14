accessing
children: collection
	collection do: [ :each | each parent: self ].
	children := OrderedCollection withAll: collection