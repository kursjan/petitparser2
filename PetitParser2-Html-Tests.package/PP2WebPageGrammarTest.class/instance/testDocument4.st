tests - document
testDocument4
	input := '
<html>
	<head>
	<meta content="text/mess">
	<meta content="text/mess">
	</head>
	<body>
	</body>
</html>'.
	
	self parse: input rule: #document