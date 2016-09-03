Suppose very minimal stream with the following interface:
- atEnd
- next

I can adapt this stream and provide the PP2SStream interface thanks to the buffer.

Note: I index everything from 0 and not from 1. The reason being the modulo arithmetics that works better when indexed from 0.