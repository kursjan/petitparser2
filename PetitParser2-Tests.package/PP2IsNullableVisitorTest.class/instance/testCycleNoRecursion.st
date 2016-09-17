tests
testCycleNoRecursion
	| delegateOne delegateTwo sequence |
	delegateOne := PP2DelegateNode new.
	delegateTwo := PP2DelegateNode new.
	sequence := $a asPParser, delegateTwo.
	
	delegateOne child: delegateTwo.
	delegateTwo child: delegateOne.
	
	self denyIsNullable: sequence