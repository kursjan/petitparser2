tests
testCycle
	| delegateOne delegateTwo sequence |
	delegateOne := PP2DelegateNode new.
	delegateTwo := PP2DelegateNode new.
	sequence := nil asParser2, delegateTwo.
	
	delegateOne child: delegateTwo.
	delegateTwo child: delegateOne.
	
	self should: [ self assertAcceptsEpsilon: sequence ] raise: Error