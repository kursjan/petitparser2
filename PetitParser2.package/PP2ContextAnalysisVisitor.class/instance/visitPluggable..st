visiting
visitPluggable: node
	self flag: 'perphas pluggable should be set as CHANGES CONTEXT as default'.
	^ node propertyAt: #changesContext ifAbsent: [ 
		^ false
	]