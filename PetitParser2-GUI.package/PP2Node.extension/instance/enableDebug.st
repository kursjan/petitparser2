*PetitParser2-GUI
enableDebug
	self allNodesDo: [ :child | child strategy: child strategy debug ]