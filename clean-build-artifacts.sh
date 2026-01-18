#!/bin/bash

set -o pipefail

TARGET_DIR="${1:-.}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "ERROR: Directory '$TARGET_DIR' does not exist"
    exit 1
fi

TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
cd "$TARGET_DIR"

echo "Cleaning build artifacts and dependencies in: $TARGET_DIR"
echo ""

FOLDERS_TO_REMOVE=(
    "bin"
    "obj"
    "node_modules"
    "dist"
    "build"
    "packages"
    ".angular"
)

FILES_TO_REMOVE=(
)


remove_folders_parallel() {
    local folders=("$@")
    local pids=()
    local any_found=false
    
    for folder in "${folders[@]}"; do
        (
            local found=false
            while IFS= read -r dir; do
                [ -z "$dir" ] && continue
                if rm -rf "$dir" 2>/dev/null; then
                    echo "  [OK] Removed: $dir"
                    found=true
                fi
            done < <(find . -type d -name "$folder" -not -path "*/\.git/*" 2>/dev/null)
            [ "$found" = true ]
        ) &
        pids+=($!)
    done
    
    for pid in "${pids[@]}"; do
        wait "$pid" 2>/dev/null && any_found=true || true
    done
    
    if [ "$any_found" = false ]; then
        echo "  [INFO] No matching folders found"
    fi
}

remove_files_parallel() {
    local files=("$@")
    local pids=()
    local any_found=false
    
    for file in "${files[@]}"; do
        (
            local found=false
            while IFS= read -r filepath; do
                [ -z "$filepath" ] && continue
                if rm -f "$filepath" 2>/dev/null; then
                    echo "  [OK] Removed: $filepath"
                    found=true
                fi
            done < <(find . -type f -name "$file" -not -path "*/\.git/*" 2>/dev/null)
            [ "$found" = true ]
        ) &
        pids+=($!)
    done
    
    for pid in "${pids[@]}"; do
        wait "$pid" 2>/dev/null && any_found=true || true
    done
    
    if [ "$any_found" = false ]; then
        echo "  [INFO] No matching files found"
    fi
}

echo "Removing folders..."
remove_folders_parallel "${FOLDERS_TO_REMOVE[@]}"

echo ""
echo "Removing files..."
remove_files_parallel "${FILES_TO_REMOVE[@]}"

echo ""
echo "Cleanup complete!"
