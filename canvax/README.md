# Image Optimization Guide for Canvax

## Image Optimization Script

1. Make the script executable:
```bash
chmod +x Scripts/optimize_images.sh
```

2. Place your original images in the same directory as the script

3. Run the script:
```bash
./Scripts/optimize_images.sh
```

4. The optimized images will be created in the `OptimizedImages` directory

## Asset Catalog Setup

1. Open your Xcode project
2. In the asset catalog, create a new image set for each image
3. For each image set:
   - Drag the 1x image to the "1x" slot
   - Drag the @2x image to the "2x" slot
   - Drag the @3x image to the "3x" slot
   - Set "Render As" to "Default"
   - Set "Scales" to "All"
   - Set "Compression" to "Automatic"

## Best Practices

1. Image Sizes:
   - 1x: Base size (e.g., 1242x2688)
   - 2x: Double the base size
   - 3x: Triple the base size

2. File Formats:
   - Use PNG for images with transparency
   - Use JPEG for photographs
   - Use PDF for vector graphics

3. Compression:
   - JPEG quality: 80-85%
   - PNG: Use "Automatic" compression in asset catalog

4. Memory Management:
   - The app now uses progressive loading
   - Images are cached with a 100MB limit
   - Memory is automatically cleared when images are no longer visible

## Troubleshooting

If you still experience memory issues:
1. Check image sizes in the asset catalog
2. Ensure all images are properly optimized
3. Monitor memory usage in Xcode's Debug Navigator
4. Use Instruments to profile memory usage

## Additional Resources

- [Apple's Asset Catalog Documentation](https://developer.apple.com/documentation/xcode/adding-images-to-your-asset-catalog)
- [Image Optimization Best Practices](https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/image-size-and-resolution/) 