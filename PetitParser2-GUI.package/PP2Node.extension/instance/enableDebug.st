*PetitParser2-GUI
enableDebug
	self allChildren do: [ :child | child strategy: child strategy debug ]