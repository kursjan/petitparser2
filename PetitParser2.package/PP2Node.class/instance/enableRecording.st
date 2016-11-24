debugging
enableRecording
	| parent |
	self allNodesDo: [ :node | 
		parent := node.
		node strategies do: [ :s | 
			parent := self switchToRecording: s parent: parent.
		]
	].

	"The caches has been changed to their recording equivalents, the info needs to be updated"
	self refreshCaches.
