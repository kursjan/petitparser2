reporting
printFiveNumberSummary: summary on: stream
	"expeted: min, q1 mean q3 max"
	^ self printNumberSummary: summary on: stream 