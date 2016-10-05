transforming
transform: aBlock suchThat: predicate
	^ PP2TransformVisitor new
		block: aBlock;
		predicate: predicate;
		visit: self