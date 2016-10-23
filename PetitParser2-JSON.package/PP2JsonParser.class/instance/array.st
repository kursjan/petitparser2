grammar
array
	^ super array ==> [ :nodes | Array withAll: (nodes second ifNil: [ #() ]) ]