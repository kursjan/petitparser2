visiting
visitSequence: sequence
	| productions |

	super visitSequence: sequence.
	"First child is nullable, i.e. it cannot fail, the cache would be superfluous"
	sequence firstChild isNullable ifFalse: [ ^ self ].

	"so far only for the first two children"
	productions := OrderedCollection new.
	productions	addAll: (sequence firstChild firstProductionSet).
	productions addAll: (sequence secondChild firstProductionSet).
	
	self assert: (productions allSatisfy: [ :e | e isProduction ]).
	
	self cacheProductions: productions