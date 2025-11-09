# VOXFUTURE - Quick Start Guide

This guide will help you get the VOXFUTURE app up and running quickly.

## Prerequisites Checklist

- [ ] Flutter SDK 3.0+ installed ([Install Flutter](https://flutter.dev/docs/get-started/install))
- [ ] Android Studio or VS Code with Flutter extension
- [ ] Firebase account ([Create account](https://firebase.google.com/))
- [ ] Python 3.8+ for backend (optional)
- [ ] Git installed

## Quick Setup (5 minutes)

### 1. Clone the Repository
```bash
git clone https://github.com/Lu73-star/VOXFUTURE-.git
cd VOXFUTURE-
```

### 2. Install Flutter Dependencies
```bash
flutter pub get
```

### 3. Run the App (Without Firebase - for testing UI only)
```bash
flutter run
```

**Note:** The app will show a Firebase error on the login screen. This is expected without Firebase setup.

## Full Setup with Firebase (15 minutes)

### 1. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Name it "VOXFUTURE" (or your choice)
4. Follow the setup wizard

### 2. Enable Email/Password Authentication

1. In Firebase Console, go to **Authentication**
2. Click **Get Started**
3. Click **Sign-in method** tab
4. Enable **Email/Password**
5. Click **Save**

### 3. Register Android App

1. In Firebase Console, click the Android icon
2. Package name: `com.voxfuture.app`
3. Download `google-services.json`
4. Place it here: `android/app/google-services.json`

### 4. Configure Firebase for Flutter

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase
flutterfire configure
```

Select your Firebase project when prompted.

### 5. Run the App with Firebase
```bash
flutter run
```

You should now be able to:
- ✅ Register a new account
- ✅ Login with email/password
- ✅ See the home screen

## Backend Setup (Optional - 5 minutes)

### 1. Navigate to Backend
```bash
cd backend
```

### 2. Create Virtual Environment
```bash
python -m venv venv

# Activate (Linux/Mac)
source venv/bin/activate

# Activate (Windows)
venv\Scripts\activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Run Backend
```bash
uvicorn main:app --reload
```

Backend will be available at: http://localhost:8000

API Documentation: http://localhost:8000/docs

## Testing Different Languages

The app supports 5 languages. To test:

1. Go to your device/emulator settings
2. Change system language to:
   - English (en) 🇬🇧
   - Portuguese (pt) 🇧🇷
   - Spanish (es) 🇪🇸
   - French (fr) 🇫🇷
   - German (de) 🇩🇪
3. Restart the app

## Building APK

### Debug Build
```bash
flutter build apk --debug
```
Output: `build/app/outputs/flutter-apk/app-debug.apk`

### Release Build
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

## Common Issues & Solutions

### Issue: Firebase initialization error
**Solution:** Make sure `google-services.json` is in `android/app/` and run `flutterfire configure`

### Issue: Build fails with Gradle error
**Solution:** 
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

### Issue: "No Firebase options" error
**Solution:** Run `flutterfire configure` to generate `firebase_options.dart`

### Issue: Backend not starting
**Solution:** Check Python version (3.8+) and make sure virtual environment is activated

### Issue: Can't create account
**Solution:** Verify Email/Password is enabled in Firebase Console > Authentication

## Next Steps

1. ✅ **Customize the app** - Edit colors, fonts, logo
2. ✅ **Add features** - Implement your business logic
3. ✅ **Deploy backend** - See [DEPLOYMENT.md](DEPLOYMENT.md)
4. ✅ **Publish to Play Store** - See [DEPLOYMENT.md](DEPLOYMENT.md)

## Useful Commands

```bash
# Check Flutter setup
flutter doctor

# Run tests
flutter test

# Format code
flutter format .

# Analyze code
flutter analyze

# Generate app bundle for Play Store
flutter build appbundle --release

# View backend logs (when running)
# The logs appear in the terminal where uvicorn is running
```

## Project Structure Overview

```
VOXFUTURE/
├── lib/
│   ├── screens/       # UI screens (Login, Register, Home)
│   ├── services/      # Firebase & API services
│   ├── models/        # Data models
│   ├── widgets/       # Reusable UI components
│   └── l10n/          # Translations
├── assets/
│   └── translations/  # Language JSON files
├── backend/           # FastAPI backend
├── android/           # Android configuration
└── .github/
    └── workflows/     # GitHub Actions for CI/CD
```

## Get Help

- 📖 Read [README.md](README.md) for detailed documentation
- 🔥 Check [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for Firebase details
- 🚀 See [DEPLOYMENT.md](DEPLOYMENT.md) for deployment
- 🤝 Read [CONTRIBUTING.md](CONTRIBUTING.md) to contribute
- 🐛 Open an issue on GitHub for bugs

## Support

For questions or issues:
1. Check documentation files
2. Search existing GitHub issues
3. Create a new issue with details

---

**Ready to build? Let's go! 🚀**
