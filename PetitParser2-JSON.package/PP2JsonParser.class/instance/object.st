grammar
object
	^ super object ==> [ :nodes |
		(nodes second ifNil: [ #() ])
			inject: Dictionary new
			into: [ :result :each | 
				result
					add: each;
					yourself ] ]