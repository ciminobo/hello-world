 #!/bin/bash

out="$(./hello)"
if [ "$out" == "hello world!" ]
then
    echo PASS
    exit 0
else
    echo FAILURE
    exit 1
fi
