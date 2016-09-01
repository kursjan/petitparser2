comparing
= anotherNode
	^ self equals: anotherNode visitedSet: IdentitySet new
	
	"	
		Note: should not be really overriden by children, try to 
				override #equals:, unless you know what you are doing, 
				of course :)
	"
