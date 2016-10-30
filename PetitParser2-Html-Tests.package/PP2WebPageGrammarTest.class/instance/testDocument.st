tests - document
testDocument
	input := '<html>
		<body>
			<script type="text/javascript">alert("hello world")</script>
		</body>
	</html>'.
	
	self parse: input rule: #document