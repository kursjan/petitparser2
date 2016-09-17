*PetitParser2-GUI
checkCompositeParser2: aClass
	^ (RBCondition isMetaclass: aClass) not
	"&  RBCondition isSubclass: class of: self compositeParserClass"
	& (RBCondition new
		type: (Array with: #subclass with: self compositeParser2Class with: aClass)
		block: [ aClass includesClass: self compositeParser2Class ]
		errorString: aClass printString , ' is <1?:not >a subclass of ' , self compositeParser2Class printString)