parsing
changeStrategy: aPP2Strategy
	"
		Contrary to the #strategy:, I do not assert the identity equivalence of the node.
		This means you can you the same strategy with multiple nodes, as long as the nodes
		are equivalent (i.e. nodeOne = node2)
	"
	self assert: (aPP2Strategy node = self).
	strategy := aPP2Strategy