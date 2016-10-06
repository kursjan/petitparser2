*PetitParser2-GUI-Mondrian
namedNodes
	^ self allNodes select: [ :node | node name isNil not ]