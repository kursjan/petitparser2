tests
testCycleNoRecursion
	| delegateOne delegateTwo sequence |
	delegateOne := PP2DelegateNode new.
	delegateTwo := PP2DelegateNode new.
	sequence := $a asParser2, delegateTwo.
	
	delegateOne child: delegateTwo.
	delegateTwo child: delegateOne.
	
	self denyNeverFails: sequence