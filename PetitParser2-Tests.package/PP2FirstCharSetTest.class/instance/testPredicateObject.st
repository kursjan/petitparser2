tests
testPredicateObject
	firstCharSet := #digit asPParser firstCharSet.

	self assert: firstCharSet value: $0.
	self assert: firstCharSet value: $1.
	self assert: firstCharSet value: $2.
	self assert: firstCharSet value: $3.
	self assert: firstCharSet value: $4.
	self assert: firstCharSet value: $5.
	self assert: firstCharSet value: $6.
	self assert: firstCharSet value: $7.
	self assert: firstCharSet value: $8.
	self assert: firstCharSet value: $9.

	self reject: firstCharSet value: $/.
	self reject: firstCharSet value: $:.
	
	self reject: firstCharSet value: (Character codePoint: 1024).
	self reject: firstCharSet value: (Character codePoint: 0).
	
