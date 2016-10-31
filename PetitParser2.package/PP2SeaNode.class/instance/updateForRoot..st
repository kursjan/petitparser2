initialization
updateForRoot: newRoot
	root := newRoot.
	self updateBeforeWater: root.
	self updateAfterWater: root