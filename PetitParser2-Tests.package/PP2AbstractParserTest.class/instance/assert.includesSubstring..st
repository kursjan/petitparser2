utilities
assert: string1 includesSubstring: string2
	"Support portability by using ANSI search method"

	self assert: (string1 notEmpty and: [string2 notEmpty and: [0 < (string1 indexOfSubCollection: string2 startingAt: 1)]])