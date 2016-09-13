caching
context: node
	"Remember to override the #reset method if you dont' want to use #=="
	^ PP2NoopContext new
		node: node;
		yourself