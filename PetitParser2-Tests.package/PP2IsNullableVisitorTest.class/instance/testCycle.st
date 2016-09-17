tests
testCycle
	| delegateOne delegateTwo sequence |
	delegateOne := PP2DelegateNode new.
	delegateTwo := PP2DelegateNode new.
	sequence := nil asPParser, delegateTwo.
	
	delegateOne child: delegateTwo.
	delegateTwo child: delegateOne.
	
	self should: [ self assertIsNullable: sequence ] raise: Error