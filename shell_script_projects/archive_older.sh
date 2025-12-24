#!/bin/bash
#
#!/bin/bash

BASE="/root"
DEPTH=1
RUN=0
HH="/boot"

# Check if directory is present (Corrected spaces)
if [[ ! -d "$BASE" ]]
then
    echo "Directory does not exist: $BASE"
    exit 1
fi

# Create archive if not present (Corrected spaces)
if [[ ! -d "$BASE/archive" ]]
then
    mkdir -p "$BASE/archive"
fi

# Find files larger than 10MB (Corrected syntax and loop)
for i in $(find "$HH" -maxdepth "$DEPTH" -type f -size +10M)
do
    # Corrected if-statement spaces
    if [[ $RUN -eq 0 ]]
    then
        # Compress and move
        gzip -c "$i" > "$BASE/archive/$(basename "$i").gz" || exit 1
    fi
done


