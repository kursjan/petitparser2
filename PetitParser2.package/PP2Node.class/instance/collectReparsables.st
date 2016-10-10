reparsing
collectReparsables
	| reparsables |
	reparsables := IdentitySet new. 
	self allNodesDo: [ :c | c strategies do: [ :s | s isReparsable ifTrue: [ reparsables add: s ] ] ].
	^ reparsables asArray
