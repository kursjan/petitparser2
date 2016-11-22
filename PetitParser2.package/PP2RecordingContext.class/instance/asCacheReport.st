converting
asCacheReport
	| table |
	table := OrderedCollection new. 
	parser allCaches do: [ :c | 
		table add: (Array with: c with: c hitRatio with: c invocations).
	].

	^ table