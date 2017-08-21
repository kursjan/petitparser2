*PetitParser2-RewriteEngine
enablePatternMatching
	self allNodesDo: [ :child | child strategy: child strategy patternMatching ]