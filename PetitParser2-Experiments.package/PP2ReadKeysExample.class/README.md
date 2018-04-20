Parses a keyboard input stream. The parser is very simple: it detect occurences of 'petit' in the input stream and shows a notifiaction. Start with:

PP2ReadKeysExample example

Note that we do not store stream of keyboard characters and do not re-parser on every keystroke. We just read stream and proceed as the characters come.