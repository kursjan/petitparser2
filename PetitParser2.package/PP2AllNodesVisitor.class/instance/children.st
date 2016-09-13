visiting
children
	self halt: 'deprecated'.
	^ closeSet collect: [ :ctx | ctx node ]