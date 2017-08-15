*PetitParser2-RewriteEngine
child: newChild
	child := newChild.
	
	"JK: hack"
	(child isKindOf: PP2SmaCCAstNode) ifTrue: [ 
		child nodeName: self name
	]