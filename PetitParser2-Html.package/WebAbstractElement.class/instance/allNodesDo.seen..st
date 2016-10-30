enumerating
allNodesDo: aBlock seen: aSet
	"
		Iterate over all the parse nodes of the receiver, do not visit the ones contained in aSet.
	"

	(aSet includes: self) ifTrue: [ ^ self ].
	aSet add: self.
	
	aBlock value: self.
	self children do: [ :each | each allNodesDo: aBlock seen: aSet ]