test - fixture
testSideEffectChoice
	"Adding another element to a choice should create a copy, otherwise we get unwanted side-effects."

	| p1 p2 p3 |
	p1 := $a asParser2.
	p2 := p1 / $b asParser2.
	p3 := p1 / $c asParser2.
	
	self assert: p1 parse: 'a'.
	self assert: p1 fail: 'b'.
	self assert: p1 fail: 'c'.
	
	self assert: p2 parse: 'a'.
	self assert: p2 parse: 'b'.
	self assert: p2 fail: 'c'.
	
	self assert: p3 parse: 'a'.
	self assert: p3 fail: 'b'.
	self assert: p3 parse: 'c'