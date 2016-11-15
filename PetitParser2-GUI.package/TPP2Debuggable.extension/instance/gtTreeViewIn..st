*PetitParser2-GUI
gtTreeViewIn: composite
	composite tree
		title: 'Execution Traces';
		display: [ :context | context debugResult children first ];
		format: [:debuggerResult | debuggerResult  formattedText ];
		selectionAct: [ :presentation | presentation selection inspect ] entitled: 'Inspect';
		selectionAct: [ :presentation | presentation selection asEventsMorph inspect ] entitled: 'Events' enabledWhen: [:presentation | presentation selection hasEvents ];
		children: [:debuggerResult | debuggerResult children ]