querying
dependencyAt: aClass
	"Answer the dependent parser aClass. Throws an error if this parser class is not declared in the method #dependencies on the class-side of the receiver."
	
	^ dependencies at: aClass ifAbsent: [ self error: 'Undeclared dependency in ' , self class name , ' to ' , aClass name ]