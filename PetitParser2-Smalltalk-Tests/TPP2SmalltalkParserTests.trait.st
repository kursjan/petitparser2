Trait {
	#name : #TPP2SmalltalkParserTests,
	#category : 'PetitParser2-Smalltalk-Tests-Core'
}

{ #category : #private }
TPP2SmalltalkParserTests >> assert: aNode format: aString [
	aNode isCollection
		ifFalse: [ ^ self assert: (Array with: aNode) format: (Array with: aString) ].
	self assert: aNode size equals: aString size.
	aNode with: aString do: [ :node :string | self assert: (BIConfigurableFormatter format: node) equals: string ]
]

{ #category : #accessing }
TPP2SmalltalkParserTests >> parserClass [
	^ PP2SmalltalkParser
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testArgumentsBlock1 [
	super testArgumentsBlock1.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testArgumentsBlock2 [
	super testArgumentsBlock2.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 2.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result arguments second isVariable.
	self assert: self result arguments second name equals: 'b'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testArgumentsBlock3 [
	super testArgumentsBlock3.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 3.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result arguments second isVariable.
	self assert: self result arguments second name equals: 'b'.
	self assert: self result arguments third isVariable.
	self assert: self result arguments third name equals: 'c'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testArray1 [
	super testArray1.
	self assert: self result statements isEmpty.
	self assert: self result periods isEmpty
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testArray2 [
	super testArray2.
	self assert: self result periods isEmpty.
	self assert: self result statements size equals: 1.
	self assert: self result statements first isMessage.
	self assert: self result statements first selector equals: #foo
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testArray3 [
	super testArray3.
	self assert: self result periods size equals: 1.
	self assert: self result statements size equals: 2.
	self assert: self result statements first isMessage.
	self assert: self result statements first selector equals: #foo.
	self assert: self result statements last isMessage.
	self assert: self result statements last selector equals: #bar
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testArray4 [
	super testArray4.
	self assert: self result periods size equals: 2.
	self assert: self result statements size equals: 2.
	self assert: self result statements first isMessage.
	self assert: self result statements first selector equals: #foo.
	self assert: self result statements last isMessage.
	self assert: self result statements last selector equals: #bar
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral1 [
	super testArrayLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #()
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral10 [
	super testArrayLiteral10.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(#(1 2) #(1 2 3))
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral11 [
	super testArrayLiteral11.
	self assert: self result isLiteralNode.
	self assert: self result value size equals: 2.
	self assert: (self result value first isKindOf: ByteArray).
	self assert: self result value first size equals: 2.
	self assert: (self result value last isKindOf: ByteArray).
	self assert: self result value last size equals: 3
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral2 [
	super testArrayLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(1)
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral3 [
	super testArrayLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(1 2)
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral4 [
	super testArrayLiteral4.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(true false nil)
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral5 [
	super testArrayLiteral5.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #($a)
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral6 [
	super testArrayLiteral6.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(1.2)
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral7 [
	super testArrayLiteral7.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(#size #at: #at:put: #==).
	self result value do: [ :each | self assert: each isSymbol ]
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral8 [
	super testArrayLiteral8.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #('baz').
	self assert: self result value first isString.
	self assert: self result value first isSymbol not
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testArrayLiteral9 [
	super testArrayLiteral9.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #(#(1) 2)
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testAssignment1 [
	super testAssignment1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 1
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testAssignment2 [
	super testAssignment2.
	self assert: self result isAssignment.
	self assert: self result variable isVariable.
	self assert: self result variable name equals: 'a'.
	self assert: self result value isLiteralNode.
	self assert: self result value value equals: 1
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testAssignment3 [
	super testAssignment3.
	self assert: self result isAssignment.
	self assert: self result variable isVariable.
	self assert: self result variable name equals: 'a'.
	self assert: self result value isAssignment.
	self assert: self result value variable isVariable.
	self assert: self result value variable name equals: 'b'.
	self assert: self result value value isLiteralNode.
	self assert: self result value value value equals: 1
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testAssignment4 [
	super testAssignment4.
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testAssignment5 [
	super testAssignment5.
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testAssignment6 [
	super testAssignment6.
	self assert: self result isAssignment.
	self assert: self result variable isVariable.
	self assert: self result variable name equals: 'a'.
	self assert: self result value isAssignment.
	self assert: self result value variable isVariable.
	self assert: self result value variable name equals: 'b'.
	self assert: self result value value isVariable.
	self assert: self result value value name equals: 'c'
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testBinaryExpression1 [
	super testBinaryExpression1.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result receiver value equals: 1.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 2
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testBinaryExpression2 [
	super testBinaryExpression2.
	self assert: self result isMessage.
	self assert: self result receiver isMessage.
	self assert: self result receiver receiver isLiteralNode.
	self assert: self result receiver receiver value equals: 1.
	self assert: self result receiver arguments size equals: 1.
	self assert: self result receiver arguments first isLiteralNode.
	self assert: self result receiver arguments first value equals: 2.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 3
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testBinaryExpression3 [
	super testBinaryExpression3.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result receiver value equals: 1.
	self assert: self result selector equals: #//.
	self assert: self result keywordsPositions equals: #(3) asIntegerArray.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 2
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testBinaryExpression4 [
	super testBinaryExpression4.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result receiver value equals: 1.
	self assert: self result selector equals: #--.
	self assert: self result keywordsPositions equals: #(3) asIntegerArray.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 2
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testBinaryExpression5 [
	super testBinaryExpression5.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result receiver value equals: 1.
	self assert: self result selector equals: #==>.
	self assert: self result keywordsPositions equals: #(3) asIntegerArray.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 2
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testBinaryMethod1 [
	super testBinaryMethod1.
	self assert: self result isMethod.
	self assert: self result selector equals: #+.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testBinaryMethod2 [
	super testBinaryMethod2.
	self assert: self result isMethod.
	self assert: self result selector equals: #+.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testBinaryMethod3 [
	super testBinaryMethod3.
	self assert: self result isMethod.
	self assert: self result selector equals: #+.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.	
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testBinaryMethod4 [
	super testBinaryMethod4.
	self assert: self result isMethod.
	self assert: self result selector equals: #+.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.	
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements size equals: 1
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testBinaryMethod5 [
	super testBinaryMethod5.
	self assert: self result isMethod.
	self assert: self result selector equals: #--.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.	
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testBlock1 [
	super testBlock1.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 0.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testByteLiteral1 [
	super testByteLiteral1.
	self assert: self result isLiteralNode.
	self assert: (self result value isKindOf: ByteArray).
	self assert: self result value isEmpty
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testByteLiteral2 [
	super testByteLiteral2.
	self assert: self result isLiteralNode.
	self assert: (self result value isKindOf: ByteArray).
	self assert: self result value size equals: 1.
	self assert: self result value first equals: 0
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testByteLiteral3 [
	super testByteLiteral3.
	self assert: self result isLiteralNode.
	self assert: (self result value isKindOf: ByteArray).
	self assert: self result value size equals: 1.
	self assert: self result value first equals: 255
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testByteLiteral4 [
	super testByteLiteral4.
	self assert: self result isLiteralNode.
	self assert: (self result value isKindOf: ByteArray).
	self assert: self result value size equals: 2.
	self assert: self result value first equals: 1.
	self assert: self result value last equals: 2
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testByteLiteral5 [
	super testByteLiteral5.
	self assert: self result isLiteralNode.
	self assert: (self result value isKindOf: ByteArray).
	self assert: self result value size equals: 3.
	self assert: self result value first equals: 10.
	self assert: self result value second equals: 63.
	self assert: self result value last equals: 255
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testCascadeExpression1 [
	super testCascadeExpression1.
	self assert: self result isCascade.
	self assert: self result receiver isLiteralNode.
	self assert: self result messages size equals: 2.
	self assert: self result messages first receiver equals: self result receiver.
	self assert: self result messages first selector equals: #abs.
	self assert: self result messages first keywordsPositions equals: #(3) asIntegerArray.
	self assert: self result messages second receiver equals: self result receiver.
	self assert: self result messages second selector equals: #negated.
	self assert: self result messages second keywordsPositions equals: #(8) asIntegerArray
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testCascadeExpression2 [
	super testCascadeExpression2.
	self assert: self result isCascade.
	self assert: self result receiver isMessage.
	self assert: self result receiver receiver isLiteralNode.
	self assert: self result receiver receiver value equals: 1.
	self assert: self result receiver selector equals: #abs.
	self assert: self result receiver keywordsPositions equals: #(3) asIntegerArray.
	self assert: self result messages size equals: 3.
	self assert: self result messages first receiver equals: self result receiver.
	self assert: self result messages first selector equals: #negated.
	self assert: self result messages first keywordsPositions equals: #(7) asIntegerArray.
	self assert: self result messages second receiver equals: self result receiver.
	self assert: self result messages second selector equals: #raisedTo:.
	self assert: self result messages second keywordsPositions equals: #(16) asIntegerArray.
	self assert: self result messages third receiver equals: self result receiver.
	self assert: self result messages third selector equals: #negated.
	self assert: self result messages third keywordsPositions equals: #(30) asIntegerArray
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testCascadeExpression3 [
	super testCascadeExpression3.
	self assert: self result isCascade.
	self assert: self result receiver isLiteralNode.
	self assert: self result receiver value equals: 1.
	self assert: self result messages size equals: 2.
	self assert: self result messages first receiver equals: self result receiver.
	self assert: self result messages first selector equals: #+.
	self assert: self result messages first keywordsPositions equals: #(3) asIntegerArray.				
	self assert: self result messages first arguments size equals: 1.
	self assert: self result messages second receiver equals: self result receiver.
	self assert: self result messages second selector equals: #-.
	self assert: self result messages second keywordsPositions equals: #(8) asIntegerArray.				
	self assert: self result messages second arguments size equals: 1
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testCharLiteral1 [
	super testCharLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: $a
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testCharLiteral2 [
	super testCharLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: Character space
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testCharLiteral3 [
	super testCharLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: $$
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testComment1 [
	super testComment1.
	self assert: self result isMessage.
	self assert: self result receiver isValue.
	self assert: self result selector equals: #+.
	self assert: self result arguments first isValue
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testComment2 [
	super testComment2.
	self assert: self result isMessage.
	self assert: self result receiver isValue.
	self assert: self result selector equals: #+.
	self assert: self result arguments first isValue
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testComment3 [
	super testComment3.
	self assert: self result isMessage.
	self assert: self result receiver isValue.
	self assert: self result selector equals: #+.
	self assert: self result arguments first isValue
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testComment4 [
	super testComment4.
	self assert: self result isMessage.
	self assert: self result receiver isValue.
	self assert: self result selector equals: #+.
	self assert: self result arguments first isValue
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testComment5 [
	super testComment5.
	self assert: self result isMessage.
	self assert: self result receiver isValue.
	self assert: self result selector equals: #+.
	self assert: self result arguments first isValue
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testComplexBlock1 [
	super testComplexBlock1.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 1.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements size equals: 1
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testComplexBlock2 [
	super testComplexBlock2.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 1.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements size equals: 1
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testKeywordExpression1 [
	super testKeywordExpression1.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result receiver value equals: 1.
	self assert: self result selector equals: #to:.
	self assert: self result keywordsPositions equals: #(3) asIntegerArray.
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 2
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testKeywordExpression2 [
	super testKeywordExpression2.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result selector equals: #to:by:.
	self assert: self result keywordsPositions equals: #(3 9) asIntegerArray.
	self assert: self result arguments size equals: 2.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 2.
	self assert: self result arguments second isLiteralNode.
	self assert: self result arguments second value equals: 3
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testKeywordExpression3 [
	super testKeywordExpression3.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result selector equals: #to:by:do:.
	self assert: self result keywordsPositions equals: #(3 9 15) asIntegerArray.
	self assert: self result arguments size equals: 3.
	self assert: self result arguments first isLiteralNode.
	self assert: self result arguments first value equals: 2.
	self assert: self result arguments second isLiteralNode.
	self assert: self result arguments second value equals: 3.
	self assert: self result arguments third isLiteralNode.
	self assert: self result arguments third value equals: 4
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testKeywordMethod1 [
	super testKeywordMethod1.
	self assert: self result isMethod.
	self assert: self result selector equals: #to:.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.		
	self assert: self result arguments size equals: 1.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testKeywordMethod2 [
	super testKeywordMethod2.
	self assert: self result isMethod.
	self assert: self result selector equals: #to:do:.
	self assert: self result keywordsPositions equals: #(1 7) asIntegerArray.		
	self assert: self result arguments size equals: 2.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result arguments second isVariable.
	self assert: self result arguments second name equals: 'b'.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testKeywordMethod3 [
	super testKeywordMethod3.
	self assert: self result isMethod.
	self assert: self result selector equals: #to:do:by:.
	self assert: self result keywordsPositions equals: #(1 7 13) asIntegerArray.			
	self assert: self result arguments size equals: 3.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result arguments second isVariable.
	self assert: self result arguments second name equals: 'b'.
	self assert: self result arguments third isVariable.
	self assert: self result arguments third name equals: 'c'.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testKeywordMethod4 [
	super testKeywordMethod4.
	self assert: self result isMethod.
	self assert: self result selector equals: #to:do:by:.
	self assert: self result keywordsPositions equals: #(1 7 13) asIntegerArray.			
	self assert: self result arguments size equals: 3.
	self assert: self result arguments first isVariable.
	self assert: self result arguments first name equals: 'a'.
	self assert: self result arguments second isVariable.
	self assert: self result arguments second name equals: 'b'.
	self assert: self result arguments third isVariable.
	self assert: self result arguments third name equals: 'c'.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements size equals: 1
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testMethod1 [
	super testMethod1.
	self assert: self result isMethod.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1.
	self assert: self result body statements first isReturn.
	self assert: self result body statements first value isMessage.
	self assert: self result body statements first value receiver isLiteralNode.
	self assert: self result body statements first value selector equals: #-.
	self assert: self result body statements first value arguments size equals: 1.
	self assert: self result body statements first value arguments first isVariable
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testMethod2 [
	super testMethod2.
	self assert: self result isMethod.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1.
	self assert: self result body statements first isReturn.
	self assert: self result body statements first value isMessage.
	self assert: self result body statements first value receiver isLiteralNode.
	self assert: self result body statements first value selector equals: #-.
	self assert: self result body statements first value arguments size equals: 1.
	self assert: self result body statements first value arguments first isVariable
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testMethod3 [
	super testMethod3.
	self assert: self result isMethod.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1.
	self assert: self result body statements first isReturn.
	self assert: self result body statements first value isMessage.
	self assert: self result body statements first value receiver isLiteralNode.
	self assert: self result body statements first value selector equals: #-.
	self assert: self result body statements first value arguments size equals: 1.
	self assert: self result body statements first value arguments first isVariable
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral1 [
	super testNumberLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 0.
	self assert: self result value isInteger
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral10 [
	super testNumberLiteral10.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 10.
	self assert: self result value isInteger
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral11 [
	super testNumberLiteral11.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 511.
	self assert: self result value isInteger
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral12 [
	super testNumberLiteral12.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 175.
	self assert: self result value isInteger
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral13 [
	super testNumberLiteral13.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 202.9921875.
	self assert: self result value isFloat
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral14 [
	super testNumberLiteral14.
	self assert: self result isLiteralNode.
	self assert: self result value floor equals: -9.
	self assert: self result value isFloat
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral15 [
	super testNumberLiteral15.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 1 / 2
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral2 [
	super testNumberLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 0.1.
	self assert: self result value isFloat
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral3 [
	super testNumberLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 123.
	self assert: self result value isInteger
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral4 [
	super testNumberLiteral4.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 123.456.
	self assert: self result value isFloat
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral5 [
	super testNumberLiteral5.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 0.
	self assert: self result value isInteger
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral6 [
	super testNumberLiteral6.
	self assert: self result isLiteralNode.
	self assert: self result value equals: -0.1.
	self assert: self result value isFloat
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral7 [
	super testNumberLiteral7.
	self assert: self result isLiteralNode.
	self assert: self result value equals: -123.
	self assert: self result value isInteger
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral8 [
	super testNumberLiteral8.
	self assert: self result isLiteralNode.
	self assert: self result value equals: -123.
	self assert: self result value isInteger
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testNumberLiteral9 [
	super testNumberLiteral9.
	self assert: self result isLiteralNode.
	self assert: self result value equals: -123.456.
	self assert: self result value isFloat
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma1 [
	super testPragma1.
	self 
		assert: self result pragmas
		format: #('<foo>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma10 [
	super testPragma10.
	self 
		assert: self result pragmas
		format: #('<foo: #bar>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma11 [
	super testPragma11.
	self 
		assert: self result pragmas
		format: #('<foo: true>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma12 [
	super testPragma12.
	self 
		assert: self result pragmas
		format: #('<foo: false>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma13 [
	super testPragma13.
	self 
		assert: self result pragmas
		format: #('<foo: nil>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma14 [
	super testPragma14.
	self 
		assert: self result pragmas
		format: #('<foo: #()>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma15 [
	super testPragma15.
	self 
		assert: self result pragmas
		format: #('<foo: #()>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma16 [
	super testPragma16.
	self 
		assert: self result pragmas
		format: #('< + 1>' ).
	self assert: self result pragmas first keywordsPositions equals: #(10) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma17 [
	super testPragma17.
	self 
		assert: self result pragmas
		format: #('<foo: 1 bar: 2>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9 16) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma18 [
	super testPragma18.
	self 
		assert: self result pragmas
		format: #('<foo: 1 bar: 2 baz: #b>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9 16 24) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma2 [
	super testPragma2.
	self 
		assert: self result pragmas
		format: #('<foo>' '<bar>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: self result pragmas second keywordsPositions equals: #(15) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma3 [
	super testPragma3.
	self assert: self result pragmas format: #('<foo>').
	self assert: self result pragmas first keywordsPositions equals: #(15) asIntegerArray.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma4 [
	super testPragma4.
	self assert: self result pragmas format: #('<foo>').
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.	
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma5 [
	super testPragma5.
	self assert: self result pragmas format: #('<foo>' '<bar>').
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.
	self assert: self result pragmas second keywordsPositions equals: #(21) asIntegerArray.	
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma6 [
	super testPragma6.
	self 
		assert: self result pragmas
		format: #('<foo: 1>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma7 [
	super testPragma7.
	self 
		assert: self result pragmas
		format: #('<foo: 1.2>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma8 [
	super testPragma8.
	self 
		assert: self result pragmas
		format: #('<foo: ''bar''>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-pragmas' }
TPP2SmalltalkParserTests >> testPragma9 [
	super testPragma9.
	self 
		assert: self result pragmas
		format: #('<foo: #bar>' ).
	self assert: self result pragmas first keywordsPositions equals: #(9) asIntegerArray.		
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testSequence1 [
	super testSequence1.
	self assert: self result isSequence.
	self assert: self result temporaries size equals: 1.
	self assert: self result temporaries first isVariable.
	self assert: self result temporaries first name equals: 'a'.
	self assert: self result statements size equals: 2.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements second isLiteralNode.
	self assert: self result statements second value equals: 2
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testSimpleBlock1 [
	super testSimpleBlock1.
	self assert: self result isBlock.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testSimpleBlock2 [
	super testSimpleBlock2.
	self assert: self result isBlock.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testSimpleBlock3 [
	super testSimpleBlock3.
	self assert: self result isBlock.
	self assert: self result arguments size equals: 1.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSpecialLiteral1 [
	super testSpecialLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: true
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSpecialLiteral2 [
	super testSpecialLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: false
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSpecialLiteral3 [
	super testSpecialLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: nil
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testStatementBlock1 [
	super testStatementBlock1.
	self assert: self result isBlock.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testStatementBlock2 [
	super testStatementBlock2.
	self assert: self result isBlock.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements size equals: 1
]

{ #category : #'testing-blocks' }
TPP2SmalltalkParserTests >> testStatementBlock3 [
	super testStatementBlock3.
	self assert: self result isBlock.
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries size equals: 2.
	self assert: self result body statements size equals: 1
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testStatements1 [
	super testStatements1.
	self assert: self result isSequence.
	self assert: self result temporaries isEmpty.
	self assert: self result statements size equals: 1.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements first value isInteger
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testStatements2 [
	super testStatements2.
	self assert: self result isSequence.
	self assert: self result temporaries isEmpty.
	self assert: self result statements size equals: 2.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements first value isInteger.
	self assert: self result statements second isLiteralNode.
	self assert: self result statements second value equals: 2.
	self assert: self result statements second value isInteger
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testStatements3 [
	super testStatements3.
	self assert: self result isSequence.
	self assert: self result temporaries isEmpty.
	self assert: self result statements size equals: 3.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements first value isInteger.
	self assert: self result statements second isLiteralNode.
	self assert: self result statements second value equals: 2.
	self assert: self result statements second value isInteger.
	self assert: self result statements third isLiteralNode.
	self assert: self result statements third value equals: 3.
	self assert: self result statements third value isInteger
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testStatements4 [
	super testStatements4.
	self assert: self result isSequence.
	self assert: self result temporaries isEmpty.
	self assert: self result statements size equals: 3.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements first value isInteger.
	self assert: self result statements second isLiteralNode.
	self assert: self result statements second value equals: 2.
	self assert: self result statements second value isInteger.
	self assert: self result statements third isLiteralNode.
	self assert: self result statements third value equals: 3.
	self assert: self result statements third value isInteger
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testStatements5 [
	super testStatements5.
	self assert: self result isSequence.
	self assert: self result temporaries isEmpty.
	self assert: self result statements size equals: 2.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements first value isInteger.
	self assert: self result statements second isLiteralNode.
	self assert: self result statements second value equals: 2.
	self assert: self result statements second value isInteger
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testStatements6 [
	super testStatements6.
	self assert: self result isSequence.
	self assert: self result temporaries isEmpty.
	self assert: self result statements size equals: 2.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements first value isInteger.
	self assert: self result statements second isLiteralNode.
	self assert: self result statements second value equals: 2.
	self assert: self result statements second value isInteger
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testStatements7 [
	super testStatements7.
	self assert: self result isSequence.
	self assert: self result temporaries isEmpty.
	self assert: self result statements size equals: 1.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements first value isInteger
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testStatements8 [
	super testStatements8.
	self assert: self result isSequence.
	self assert: self result temporaries isEmpty.
	self assert: self result statements size equals: 1.
	self assert: self result statements first isLiteralNode.
	self assert: self result statements first value equals: 1.
	self assert: self result statements first value isInteger
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testStatements9 [
	super testStatements9.
	self assert: self result isEmpty.
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testStringLiteral1 [
	super testStringLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: ''
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testStringLiteral2 [
	super testStringLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 'ab'
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testStringLiteral3 [
	super testStringLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: 'ab''cd'
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSymbolLiteral1 [
	super testSymbolLiteral1.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #foo.
	self assert: self result value isSymbol
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSymbolLiteral2 [
	super testSymbolLiteral2.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #+.
	self assert: self result value isSymbol
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSymbolLiteral3 [
	super testSymbolLiteral3.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #key:.
	self assert: self result value isSymbol
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSymbolLiteral4 [
	super testSymbolLiteral4.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #key:value:.
	self assert: self result value isSymbol
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSymbolLiteral5 [
	super testSymbolLiteral5.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #'testing-result'.
	self assert: self result value isSymbol
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSymbolLiteral6 [
	super testSymbolLiteral6.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #'__gen__binding'.
	self assert: self result value isSymbol
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSymbolLiteral7 [
	super testSymbolLiteral7.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #fucker.
	self assert: self result value isSymbol
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSymbolLiteral8 [
	super testSymbolLiteral8.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #fucker.
	self assert: self result value isSymbol
]

{ #category : #'testing-literals' }
TPP2SmalltalkParserTests >> testSymbolLiteral9 [
	super testSymbolLiteral9.
	self assert: self result isLiteralNode.
	self assert: self result value equals: #fucker.
	self assert: self result value isSymbol
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testTemporaries1 [
	super testTemporaries1.
	self assert: self result isSequence.
	self assert: self result temporaries size equals: 1.
	self assert: self result temporaries first isVariable.
	self assert: self result temporaries first name equals: 'a'.
	self assert: self result statements isEmpty
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testTemporaries2 [
	super testTemporaries2.
	self assert: self result isSequence.
	self assert: self result temporaries size equals: 2.
	self assert: self result temporaries first isVariable.
	self assert: self result temporaries first name equals: 'a'.
	self assert: self result temporaries second isVariable.
	self assert: self result temporaries second name equals: 'b'.
	self assert: self result statements isEmpty
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testTemporaries3 [
	super testTemporaries3.
	self assert: self result isSequence.
	self assert: self result temporaries size equals: 3.
	self assert: self result temporaries first isVariable.
	self assert: self result temporaries first name equals: 'a'.
	self assert: self result temporaries second isVariable.
	self assert: self result temporaries second name equals: 'b'.
	self assert: self result temporaries third isVariable.
	self assert: self result temporaries third name equals: 'c'.
	self assert: self result statements isEmpty
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testUnaryExpression1 [
	super testUnaryExpression1.
	self assert: self result isMessage.
	self assert: self result receiver isLiteralNode.
	self assert: self result selector equals: #abs.
	self assert: self result keywordsPositions equals: #(3) asIntegerArray.		
	self assert: self result arguments isEmpty
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testUnaryExpression2 [
	super testUnaryExpression2.
	self assert: self result isMessage.
	self assert: self result receiver isMessage.
	self assert: self result receiver receiver isLiteralNode.
	self assert: self result receiver receiver value equals: 1.
	self assert: self result receiver selector equals: #abs.
	self assert: self result receiver keywordsPositions equals: #(3) asIntegerArray.		
	self assert: self result receiver arguments isEmpty.
	self assert: self result selector equals: #negated.
	self assert: self result keywordsPositions equals: #(7) asIntegerArray.		
	self assert: self result arguments isEmpty
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testUnaryMethod1 [
	super testUnaryMethod1.
	self assert: self result isMethod.
	self assert: self result selector equals: #abs.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.		
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testUnaryMethod2 [
	super testUnaryMethod2.
	self assert: self result isMethod.
	self assert: self result selector equals: #abs.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.			
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testUnaryMethod3 [
	super testUnaryMethod3.
	self assert: self result isMethod.
	self assert: self result selector equals: #abs.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.			
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries isEmpty.
	self assert: self result body statements size equals: 1
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testUnaryMethod4 [
	super testUnaryMethod4.
	self assert: self result isMethod.
	self assert: self result selector equals: #abs.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.			
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements size equals: 1
]

{ #category : #'testing-messages' }
TPP2SmalltalkParserTests >> testUnaryMethod5 [
	super testUnaryMethod5.
	self assert: self result isMethod.
	self assert: self result selector equals: #abs.
	self assert: self result keywordsPositions equals: #(1) asIntegerArray.		
	self assert: self result arguments isEmpty.
	self assert: self result body temporaries size equals: 1.
	self assert: self result body statements isEmpty
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testVariable1 [
	super testVariable1.
	self assert: self result isVariable.
	self assert: self result name equals: 'trueBinding'
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testVariable2 [
	super testVariable2.
	self assert: self result isVariable.
	self assert: self result name equals: 'falseBinding'
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testVariable3 [
	super testVariable3.
	self assert: self result isVariable.
	self assert: self result name equals: 'nilly'
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testVariable4 [
	super testVariable4.
	self assert: self result isVariable.
	self assert: self result name equals: 'selfish'
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testVariable5 [
	super testVariable5.
	self assert: self result isVariable.
	self assert: self result name equals: 'supernanny'
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testVariable6 [
	super testVariable6.
	self assert: self result isVariable.
	self assert: self result name equals: 'super_nanny'
]

{ #category : #testing }
TPP2SmalltalkParserTests >> testVariable7 [
	super testVariable7.
	self assert: self result isVariable.
	self assert: self result name equals: '__gen_var_123__'
]
