curl -L https://get.pharo.org/64/ | bash
./pharo --headless Pharo.image ./scripts/runTest.st

FILE=/tmp/result.txt
if [ ! -f "$FILE" ]; then
    echo "ERROR: $FILE does not exists!"
    exit 1
fi


cat $FILE

if grep -q ERROR "$FILE"; then
		echo "SOME ERRORS!"
		exit 1
else
		echo "ALL TEST PASSED"
		exit 0
fi
