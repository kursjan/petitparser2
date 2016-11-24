debugging
enableDebug
	self allNodesDo: [ :child | child strategy: child strategy debug ]