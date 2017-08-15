parsing
parse: input rule: rule checkResult: aBlock
	result := super parse: input rule: rule.
	self assert: (aBlock value: result)
	