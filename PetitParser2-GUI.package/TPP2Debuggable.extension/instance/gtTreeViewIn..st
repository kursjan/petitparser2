*PetitParser2-GUI
gtTreeViewIn: composite
	composite tree
		title: 'Execution Traces';
		display: [ :context | context debugResult children first ];
		format: [:debuggerResult | debuggerResult  formattedText ];
		selectionAct: [ :presentation | presentation selection inspect ] entitled: 'Inspect';
		children: [:debuggerResult | debuggerResult children ]