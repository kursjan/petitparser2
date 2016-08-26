grammar
methodSequence
	^ super methodSequence map: [ :periodNodes1 :pragmaNodes1 :periodNodes2 :tempNodes :periodNodes3 :pragmaNodes2 :periodNodes4 :statementNodes |
		Array
			with: pragmaNodes1 , pragmaNodes2
			with: (self build: tempNodes sequence: periodNodes1 , periodNodes2 , periodNodes3 , periodNodes4 , statementNodes) ]