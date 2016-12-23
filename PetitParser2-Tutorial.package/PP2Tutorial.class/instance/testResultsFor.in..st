pillar-support
testResultsFor: selectorArray in: class
	"
		self new testResultsFor: #(#testText #testJavascript) in: WebGrammarTest
	"
	^ (class buildSuiteFromMethods: selectorArray) run asString
