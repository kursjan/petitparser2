visiting
visitChoice: choice
	| productions |
	super visitChoice: choice.
	productions := OrderedCollection new.

	(choice children do: [ :c | productions addAll: c firstProductionSet ]).
	self assert: (productions allSatisfy: [ :e | e isProduction ]).

	self cacheProductions: productions
