as yet unclassified
testSequenceWithPushPop
	parser := $a asPParser push, $b asPParser pop.
	self flag: 'should fix, but needs some searious thinking about pus-pop analysis visitor'
	"self denyChangesContext: parser"