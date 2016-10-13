testing
changeBetween: lowIndex and: highIndex
	^ (position >= lowIndex) and: [ position <= (highIndex + 1) ]