visiting
visitPP2Parser: aPP2Parser
	super visitPP2Parser: aPP2Parser.
	"simply return all the visited nodes"
	^ closeSet 