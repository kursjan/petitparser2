caching - choice
cacheProductions: productions
	| names |
	names := productions collect: [:p | p name ].
	
	"
		Small magic alert: I take all the equivalent productions and set the same caching 
		strategy for all production that occur in the first set of more than one alternives.
	"
	names do: [ :name |
		| occurences production |
		occurences := productions select: [ :p | p name = name ].
		production := occurences first.
		
		(occurences size > 1 and: [self cacheMakesSense: production ]) ifTrue: [ 
			occurences do: [ :o |
				"note that we are sharing the same strategy over multiple productions!"
				self cache: o production: production.
			] 
		]
	].
