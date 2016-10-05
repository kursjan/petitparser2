tests
testTrimmingReplace
	| one trimmer trimming other otherTrimmer |

	one := $a asPParser.
	trimmer := $b asPParser.
	
	other := $c asPParser.
	otherTrimmer := $d asPParser.
	
	trimming := one trim: trimmer.

	self assert: trimming children first == trimmer.
	self assert: trimming children second == one.
	self deny: trimming children first == otherTrimmer.
	self deny: trimming children second == other.
	
	trimming replace: trimmer with: otherTrimmer.
	self assert: trimming children first == otherTrimmer.
	self assert: trimming children second == one.
	
	trimming replace: one with: other.
	self assert: trimming children second == other