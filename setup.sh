#!/bin/bash
find . -type f -exec file --mime-type {} + | grep "text/" | cut -d: -f1 | while read -r file; do
    # Skip files in the .git directory
    if [[ "$file" == .git* ]]; then
        continue
    fi

    # Apply the substitution
    sed -i '' 's/noormetti80/'"$1"'/g' "$file" || echo "Error processing $file"
done
