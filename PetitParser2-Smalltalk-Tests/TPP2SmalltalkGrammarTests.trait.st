Trait {
	#name : #TPP2SmalltalkGrammarTests,
	#category : 'PetitParser2-Smalltalk-Tests-Core'
}

{ #category : #accessing }
TPP2SmalltalkGrammarTests >> parserClass [
	^ PP2SmalltalkGrammar
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testArgumentsBlock1 [
	self 
		parse: '[ :a | ]'
		rule: #block
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testArgumentsBlock2 [
	self 
		parse: '[ :a :b | ]'
		rule: #block
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testArgumentsBlock3 [
	self 
		parse: '[ :a :b :c | ]'
		rule: #block
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testArray1 [
	self 
		parse: '{}'
		rule: #array
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testArray2 [
	self 
		parse: '{self foo}'
		rule: #array
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testArray3 [
	self 
		parse: '{self foo. self bar}'
		rule: #array
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testArray4 [
	self 
		parse: '{self foo. self bar.}'
		rule: #array
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral1 [
	self 
		parse: '#()'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral10 [
	self 
		parse: '#((1 2) #(1 2 3))'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral11 [
	self 
		parse: '#([1 2] #[1 2 3])'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral2 [
	self 
		parse: '#(1)'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral3 [
	self 
		parse: '#(1 2)'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral4 [
	self 
		parse: '#(true false nil)'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral5 [
	self 
		parse: '#($a)'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral6 [
	self 
		parse: '#(1.2)'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral7 [
	self 
		parse: '#(size #at: at:put: #''=='')'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral8 [
	self 
		parse: '#(''baz'')'
		rule: #arrayLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testArrayLiteral9 [
	self 
		parse: '#((1) 2)'
		rule: #arrayLiteral
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testAssignment1 [
	self 
		parse: '1'
		rule: #expression
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testAssignment2 [
	self 
		parse: 'a := 1'
		rule: #expression
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testAssignment3 [
	self 
		parse: 'a := b := 1'
		rule: #expression
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testAssignment4 [
	self fail: 'a _ 1' rule: #expression
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testAssignment5 [
	self fail: 'a _ b _ 1' rule: #expression
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testAssignment6 [
	self 
		parse: 'a := (b := c)'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testBinaryExpression1 [
	self 
		parse: '1 + 2'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testBinaryExpression2 [
	self 
		parse: '1 + 2 + 3'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testBinaryExpression3 [
	self 
		parse: '1 // 2'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testBinaryExpression4 [
	self 
		parse: '1 -- 2'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testBinaryExpression5 [
	self 
		parse: '1 ==> 2'
		rule: #expression.
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testBinaryMethod1 [
	self 
		parse: '+ a'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testBinaryMethod2 [
	self 
		parse: '+ a | b |'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testBinaryMethod3 [
	self 
		parse: '+ a b'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testBinaryMethod4 [
	self 
		parse: '+ a | b | c'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testBinaryMethod5 [
	self 
		parse: '-- a'
		rule: #method
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testBlock1 [
	self 
		parse: '[]'
		rule: #block
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testByteLiteral1 [
	self 
		parse: '#[]'
		rule: #byteLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testByteLiteral2 [
	self 
		parse: '#[0]'
		rule: #byteLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testByteLiteral3 [
	self 
		parse: '#[255]'
		rule: #byteLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testByteLiteral4 [
	self 
		parse: '#[ 1 2 ]'
		rule: #byteLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testByteLiteral5 [
	self 
		parse: '#[ 2r1010 8r77 16rFF ]'
		rule: #byteLiteral
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testCascadeExpression1 [
	self 
		parse: '1 abs; negated'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testCascadeExpression2 [
	self 
		parse: '1 abs negated; raisedTo: 12; negated'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testCascadeExpression3 [
	self 
		parse: '1 + 2; - 3'
		rule: #expression
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testCharLiteral1 [
	self 
		parse: '$a'
		rule: #charLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testCharLiteral2 [
	self 
		parse: '$ '
		rule: #charLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testCharLiteral3 [
	self 
		parse: '$$'
		rule: #charLiteral
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testComment1 [
	self 
		parse: '1"one"+2'
		rule: #expression
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testComment2 [
	self 
		parse: '1 "one" +2'
		rule: #expression
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testComment3 [
	self 
		parse: '1"one"+"two"2'
		rule: #expression
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testComment4 [
	self 
		parse: '1"one""two"+2'
		rule: #expression
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testComment5 [
	self 
		parse: '1"one"	"two"+2'
		rule: #expression
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testComplexBlock1 [
	self 
		parse: '[ :a | | b | c ]'
		rule: #block
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testComplexBlock2 [
	self 
		parse: '[:a||b|c]'
		rule: #block
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testKeywordExpression1 [
	self 
		parse: '1 to: 2'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testKeywordExpression2 [
	self 
		parse: '1 to: 2 by: 3'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testKeywordExpression3 [
	self 
		parse: '1 to: 2 by: 3 do: 4'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testKeywordMethod1 [
	self 
		parse: 'to: a'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testKeywordMethod2 [
	self 
		parse: 'to: a do: b | c |'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testKeywordMethod3 [
	self 
		parse: 'to: a do: b by: c d'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testKeywordMethod4 [
	self 
		parse: 'to: a do: b by: c | d | e'
		rule: #method
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testMethod1 [
	self 
		parse: 'negated ^ 0 - self'
		rule: #method
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testMethod2 [
	"Spaces at the beginning of the method."
	self 
		parse: '	  negated ^ 0 - self'
		rule: #method
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testMethod3 [
	"Spaces at the end of the method."
	self 
		parse: '	negated ^ 0 - self  '
		rule: #method
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral1 [
	self 
		parse: '0'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral10 [
	self 
		parse: '10r10'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral11 [
	self 
		parse: '8r777'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral12 [
	self 
		parse: '16rAF'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral13 [
	self 
		parse: '16rCA.FE'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral14 [
	self 
		parse: '3r-22.2'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral15 [
	self 
		parse: '0.50s2'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral2 [
	self 
		parse: '0.1'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral3 [
	self 
		parse: '123'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral4 [
	self 
		parse: '123.456'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral5 [
	self 
		parse: '-0'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral6 [
	self 
		parse: '-0.1'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral7 [
	self 
		parse: '-123'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral8 [
	self 
		parse: '-123'
		rule: #numberLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testNumberLiteral9 [
	self 
		parse: '-123.456'
		rule: #numberLiteral
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma1 [
	self 
		parse: 'method <foo>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma10 [
	self 
		parse: 'method <foo: bar>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma11 [
	self 
		parse: 'method <foo: true>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma12 [
	self 
		parse: 'method <foo: false>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma13 [
	self 
		parse: 'method <foo: nil>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma14 [
	self 
		parse: 'method <foo: ()>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma15 [
	self 
		parse: 'method <foo: #()>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma16 [
	self 
		parse: 'method < + 1 >'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma17 [
	self 
		parse: 'method <foo: 1 bar: 2>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma18 [
	self 
		parse: 'method <foo: 1 bar: 2  baz: b>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma2 [
	self 
		parse: 'method <foo> <bar>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma3 [
	self 
		parse: 'method | a | <foo>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma4 [
	self 
		parse: 'method <foo> | a |'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma5 [
	self 
		parse: 'method <foo> | a | <bar>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma6 [
	self 
		parse: 'method <foo: 1>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma7 [
	self 
		parse: 'method <foo: 1.2>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma8 [
	self 
		parse: 'method <foo: ''bar''>'
		rule: #method
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkGrammarTests >> testPragma9 [
	self 
		parse: 'method <foo: #''bar''>'
		rule: #method
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testSequence1 [
	self 
		parse: '| a | 1 . 2'
		rule: #sequence
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testSimpleBlock1 [
	self 
		parse: '[ ]'
		rule: #block
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testSimpleBlock2 [
	self 
		parse: '[ nil ]'
		rule: #block
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testSimpleBlock3 [
	self 
		parse: '[ :a ]'
		rule: #block
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSpecialLiteral1 [
	self 
		parse: 'true'
		rule: #trueLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSpecialLiteral2 [
	self 
		parse: 'false'
		rule: #falseLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSpecialLiteral3 [
	self 
		parse: 'nil'
		rule: #nilLiteral
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testStatementBlock1 [
	self 
		parse: '[ nil ]'
		rule: #block
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testStatementBlock2 [
	self 
		parse: '[ | a | nil ]'
		rule: #block
]

{ #category : #'testing-blocks' }
TPP2SmalltalkGrammarTests >> testStatementBlock3 [
	self 
		parse: '[ | a b | nil ]'
		rule: #block
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testStatements1 [
	self 
		parse: '1'
		rule: #sequence
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testStatements2 [
	self 
		parse: '1 . 2'
		rule: #sequence
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testStatements3 [
	self 
		parse: '1 . 2 . 3'
		rule: #sequence
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testStatements4 [
	self 
		parse: '1 . 2 . 3 .'
		rule: #sequence
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testStatements5 [
	self 
		parse: '1 . . 2'
		rule: #sequence
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testStatements6 [
	self 
		parse: '1. 2'
		rule: #sequence
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testStatements7 [
	self 
		parse: '. 1'
		rule: #sequence
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testStatements8 [
	self 
		parse: '.1'
		rule: #sequence
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testStatements9 [
	self 
		parse: ''
		rule: #statements
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testStringLiteral1 [
	self 
		parse: ''''''
		rule: #stringLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testStringLiteral2 [
	self 
		parse: '''ab'''
		rule: #stringLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testStringLiteral3 [
	self 
		parse: '''ab''''cd'''
		rule: #stringLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSymbolLiteral1 [
	self 
		parse: '#foo'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSymbolLiteral2 [
	self 
		parse: '#+'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSymbolLiteral3 [
	self 
		parse: '#key:'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSymbolLiteral4 [
	self 
		parse: '#key:value:'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSymbolLiteral5 [
	self 
		parse: '#''testing-result'''
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSymbolLiteral6 [
		self 
			parse: '#__gen__binding'
			rule: #symbolLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSymbolLiteral7 [
	self 
		parse: '# fucker'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSymbolLiteral8 [
	self 
		parse: '##fucker'
		rule: #symbolLiteral
]

{ #category : #'testing-literals' }
TPP2SmalltalkGrammarTests >> testSymbolLiteral9 [
	self 
		parse: '## fucker'
		rule: #symbolLiteral
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testTemporaries1 [
	self 
		parse: '| a |'
		rule: #sequence
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testTemporaries2 [
	self 
		parse: '| a b |'
		rule: #sequence
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testTemporaries3 [
	self 
		parse: '| a b c |'
		rule: #sequence
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testUnaryExpression1 [
	self 
		parse: '1 abs'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testUnaryExpression2 [
	self 
		parse: '1 abs negated'
		rule: #expression
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testUnaryMethod1 [
	self 
		parse: 'abs'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testUnaryMethod2 [
	self 
		parse: 'abs | a |'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testUnaryMethod3 [
	self 
		parse: 'abs a'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testUnaryMethod4 [
	self 
		parse: 'abs | a | b'
		rule: #method
]

{ #category : #'testing-messages' }
TPP2SmalltalkGrammarTests >> testUnaryMethod5 [
	self 
		parse: 'abs | a |'
		rule: #method
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testVariable1 [
	self 
		parse: 'trueBinding'
		rule: #primary
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testVariable2 [
	self 
		parse: 'falseBinding'
		rule: #primary
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testVariable3 [
	self 
		parse: 'nilly'
		rule: #primary
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testVariable4 [
	self 
		parse: 'selfish'
		rule: #primary
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testVariable5 [
	self 
		parse: 'supernanny'
		rule: #primary
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testVariable6 [
		self 
			parse: 'super_nanny'
			rule: #primary
]

{ #category : #testing }
TPP2SmalltalkGrammarTests >> testVariable7 [
		self 
			parse: '__gen_var_123__'
			rule: #primary 
]
