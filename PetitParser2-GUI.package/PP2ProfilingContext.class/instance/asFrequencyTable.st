converting
asFrequencyTable
	| bag total result |
	bag := selectors asBag.
	result := OrderedCollection new.
	bag isEmpty ifTrue: [ ^ result ].
	total := 100.0 / bag size.
	bag sortedCounts 
		do: [ :each | result addLast: (Array with: each value with: each key with: total * each key) ].
	^ result