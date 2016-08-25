reporting
printNumberSummary: summary on: stream
	"expeted: min, q1 mean q3 max"

	summary do: [ :e | 
		stream 
			nextPut: Character tab;
			nextPutAll: (e printShowingDecimalPlaces: 3);
			yourself
	]