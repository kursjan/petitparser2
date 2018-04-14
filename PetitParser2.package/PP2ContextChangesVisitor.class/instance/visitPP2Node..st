visiting
visitPP2Node: node
	"
		If you see this, you have probably added your own parser. 
		
		If your parser is not context-sensitive or you don't know what context-sensitive mean, 
		for terminal parsers return 			
			PP2CcChange change
		or for delegating parsers get inspired by
			#visitDelegate:
	"
	self error: 'should provide specific implementation, it is usually easy!'