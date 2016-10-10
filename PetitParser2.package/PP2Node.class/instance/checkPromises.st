reparsing
checkPromises
	self allReparsables do: [ :reparsable | 
		(reparsable buffer values anySatisfy: [ :e | e isPromise ]) ifTrue: [  
			PP2ReparseException signal: 'Some of the promises were not resolved'
		]
	]