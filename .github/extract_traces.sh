#!/bin/bash

echo "Extracting .trace files from ZIP archives..."
mkdir __traces__

# Extract .trace files from all ZIP archives in the test-results directory to the __traces__ directory
find test-results -type f -name "*.zip" -exec unzip -o {} "*.trace" -d __traces__ \;
