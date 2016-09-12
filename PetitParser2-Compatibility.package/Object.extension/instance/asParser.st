*PetitParser2-Compatibility
asParser
	"Answer a parser accepting the receiving object."

	^ PP2PredicateObjectNode expect: self message: self asString, ' expected'