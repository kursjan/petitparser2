Class {
	#name : #ExpressionScanner,
	#superclass : #SmaCCScanner,
	#category : 'PetitParser2-RewriteEngine-SmaCC'
}

{ #category : #generated }
ExpressionScanner >> emptySymbolTokenId [
	^ 17
]

{ #category : #generated }
ExpressionScanner >> errorTokenId [
	^ 18
]

{ #category : #generated }
ExpressionScanner >> scanForToken [
	self step.
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self scanForTokenX4
]

{ #category : #generated }
ExpressionScanner >> scanForTokenX1 [
	[ self recordMatch: #(10).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue
]

{ #category : #generated }
ExpressionScanner >> scanForTokenX2 [
	[ self recordMatch: #(11).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
ExpressionScanner >> scanForTokenX3 [
	[ self recordMatch: #(9).
	self step.
	currentCharacter == $.
		ifTrue: [ [ self recordMatch: #(9).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
ExpressionScanner >> scanForTokenX4 [
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $/
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $^
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $`
		ifTrue: [ [ self step.
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(12) ].
			true ] whileTrue ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX3 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX2 ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue:
			[ self scanForTokenX1 ].
	^ self reportLastMatch
]

{ #category : #generated }
ExpressionScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil #whitespace #patternToken)
]
