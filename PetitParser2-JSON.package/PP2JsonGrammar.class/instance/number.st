primitives
number
	^ $- asPParser optional ,
		($0 asPParser / #digit asPParser plus) ,
		($. asPParser , #digit asPParser plus) optional , 
		(($e asPParser / $E asPParser) , ($- asPParser / $+ asPParser) optional , #digit asPParser plus) optional