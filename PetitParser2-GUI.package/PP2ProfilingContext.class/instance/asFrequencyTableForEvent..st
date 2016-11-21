converting
asFrequencyTableForEvent: event
	| bag total result filtered |
	
	filtered := OrderedCollection new.
	eventsTrace entriesDo: [ :e | 
		event == e event ifTrue: [ filtered add: e strategy ]
	].
	
	bag := filtered asBag.
	result := OrderedCollection new.
	bag isEmpty ifTrue: [ ^ result ].
	total := 100.0 / bag size.
	bag sortedCounts 
		do: [ :each | result addLast: (Array with: each value with: each key with: total * each key) ].
	^ result