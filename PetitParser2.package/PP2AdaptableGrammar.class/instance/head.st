accessing
head
	"I set the body parser dynamically; based on the result of the head"
	^ #digit asPParser plus flatten 
	
	==> [ :_number |
		body changeChild: (#any asPParser times: _number asNumber) flatten
	]