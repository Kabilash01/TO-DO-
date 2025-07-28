# KABI TODO APP - Icon Setup Guide

## Method 1: Using flutter_launcher_icons (Recommended)

### Step 1: Add your icon image
1. Create an icon image (1024x1024 PNG recommended)
2. Name it `app_icon.png`
3. Place it in `assets/icon/app_icon.png`

### Step 2: Generate icons
Run these commands in terminal:
```bash
flutter pub get
flutter pub run flutter_launcher_icons:main
```

This will automatically generate all required icon sizes for:
- Android (all densities)
- iOS (all sizes)
- Web

### Step 3: Rebuild the app
```bash
flutter clean
flutter run
```

## Method 2: Manual Icon Replacement

### For Android:
Replace these files with your custom icons (square PNG format):
- `android/app/src/main/res/mipmap-hdpi/ic_launcher.png` (72x72)
- `android/app/src/main/res/mipmap-mdpi/ic_launcher.png` (48x48)
- `android/app/src/main/res/mipmap-xhdpi/ic_launcher.png` (96x96)
- `android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png` (144x144)
- `android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png` (192x192)

### For iOS:
Replace the icon files in `ios/Runner/Assets.xcassets/AppIcon.appiconset/`

## Icon Design Tips for KABI TODO APP:
- Use your purple color: #70587B
- Consider a checklist icon (✓) or todo list icon
- Make it simple and recognizable at small sizes
- Ensure good contrast
- Consider adding "K" letter or "KABI" text

## Suggested Icon Ideas:
1. Purple square with white checklist icon
2. Stylized "K" on purple background
3. Todo list with checkmarks in your purple theme
4. Calendar with checkmark
