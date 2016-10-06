*PetitParser2-GUI-Morphic
newRowMorph
	^ AlignmentMorph newRow
		cellPositioning: #topLeft;
		color: Color transparent;
		listCentering: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 0;
		yourself