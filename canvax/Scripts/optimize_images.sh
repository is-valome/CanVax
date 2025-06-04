#!/bin/bash

# Configuration
MAX_WIDTH=1242
MAX_HEIGHT=2688
QUALITY=0.8
OUTPUT_DIR="OptimizedImages"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Function to process a single image
process_image() {
    local input_file="$1"
    local filename=$(basename "$input_file")
    local output_file="$OUTPUT_DIR/$filename"
    
    echo "Processing $filename..."
    
    # Get original dimensions
    width=$(sips -g pixelWidth "$input_file" | tail -n1 | cut -d' ' -f4)
    height=$(sips -g pixelHeight "$input_file" | tail -n1 | cut -d' ' -f4)
    
    # Calculate new dimensions maintaining aspect ratio
    if [ $width -gt $MAX_WIDTH ] || [ $height -gt $MAX_HEIGHT ]; then
        if [ $((width * MAX_HEIGHT)) -gt $((height * MAX_WIDTH)) ]; then
            new_width=$MAX_WIDTH
            new_height=$((height * MAX_WIDTH / width))
        else
            new_height=$MAX_HEIGHT
            new_width=$((width * MAX_HEIGHT / height))
        fi
        
        # Resize image
        sips -z $new_height $new_width "$input_file" --out "$output_file"
    else
        cp "$input_file" "$output_file"
    fi
    
    # Optimize JPEG quality
    if [[ "$filename" == *.jpg ]] || [[ "$filename" == *.jpeg ]]; then
        sips -s format jpeg -s formatOptions $((QUALITY * 100)) "$output_file" --out "$output_file"
    fi
    
    # Create @2x and @3x versions
    base_name="${filename%.*}"
    extension="${filename##*.}"
    
    # @2x version
    sips -z $((new_height * 2)) $((new_width * 2)) "$output_file" --out "$OUTPUT_DIR/${base_name}@2x.$extension"
    
    # @3x version
    sips -z $((new_height * 3)) $((new_width * 3)) "$output_file" --out "$OUTPUT_DIR/${base_name}@3x.$extension"
    
    echo "Created optimized versions of $filename"
}

# Process all images in the current directory
for img in *.jpg *.jpeg *.png; do
    [ -f "$img" ] || continue
    process_image "$img"
done

echo "Image optimization complete! Check the $OUTPUT_DIR directory for results." 