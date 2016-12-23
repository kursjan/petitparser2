tests
testStructuredDocumentSimple
	| input |
	input := '<html>
		<body>
			<script>alert("hello world")</script>
		</body>
	</html>'.
	
	self parse: input rule: #structuredDocument