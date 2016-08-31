*PetitParser2-GUI
treeViewIn: composite
	composite tree
		title: 'Execution Traces';
		format: [:resultNode | resultNode formattedText ];
		children: [:resultNode | resultNode children ]. 