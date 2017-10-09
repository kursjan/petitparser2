*PetitParser2-RewriteEngine
parseNode: aClass
	^ (PP2CreateParseNode on: self)
		nodeClass: aClass;
		yourself