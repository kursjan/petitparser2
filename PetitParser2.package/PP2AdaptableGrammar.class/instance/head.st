accessing
head
	"I set the body parser dynamically; based on the result of the head"
	^ #digit asParser2 plus flatten 
	
	==> [ :_number |
		body setChild: (#any asParser2 times: _number asNumber) flatten
	]