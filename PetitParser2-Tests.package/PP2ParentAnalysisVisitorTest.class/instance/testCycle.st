tests
testCycle
	|  delegateOne delegateTwo |

	delegateOne := PP2DelegateNode new.
	delegateTwo := PP2DelegateNode new.
	delegateOne child: delegateTwo.
	delegateTwo child: delegateOne.
	
	visitor visit: delegateOne.
	
	self assert: delegateOne parents size equals: 1.
	self assert: delegateOne parents includes: delegateTwo.

	self assert: delegateTwo parents size equals: 1.
	self assert: delegateTwo parents includes: delegateOne.
		