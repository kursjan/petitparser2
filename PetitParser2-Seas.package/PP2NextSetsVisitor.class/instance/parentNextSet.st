accessing
parentNextSet
	self isRoot ifTrue: [  
		^ IdentitySet with: eoi
	].

	^ nextSets at: self parentContext node