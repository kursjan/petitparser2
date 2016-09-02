visiting
visitChoice: choice
	| productions productionsBag |
	super visitChoice: choice.
	productions := OrderedCollection new.

	(choice children do: [ :c | productions addAll: c firstProductionSet ]).
	productions := productions select: [ :e | e isProduction ].
	productionsBag := productions asBag.
	
	"
		Small magic alert: I take all the equivalent productions and set the same caching 
		strategy for all production that occur in the first set of more than one alternives.
	"
	productionsBag doWithOccurrences: [ :production :occurences | 
		(occurences > 1 and: [self cacheMakesSense: production]) ifTrue: [ 
			productions select: [ :e | e = production ] thenDo: [ :e |
				"note that we are sharing the same strategy over multiple productions!"
				self cache: e production: production.
			] 
		]
	].
