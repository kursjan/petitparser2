enumerating
allGettersDo: aBlock
	"
	 Map	`children at: 1` to #first, 
			`children at: 2` to #second,
			etc ...
	"
	(self allNumerals copyFrom: 1 to: children size) do: aBlock.
	self allVariableSelectors
		do: [ :sel | (self perform: sel) do: aBlock ]