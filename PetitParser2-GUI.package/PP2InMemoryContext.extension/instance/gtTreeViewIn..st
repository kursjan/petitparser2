*PetitParser2-GUI
gtTreeViewIn: composite
	composite tree
		title: 'Execution Traces';
		display: [ :context | context debugResult children first ];
		format: [:debuggerResult | debuggerResult  formattedText ];
		children: [:debuggerResult | debuggerResult children ]