# Firebase Configuration

To configure Firebase for this project:

1. **Create a Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project or select an existing one
   - Register your app with package name: `com.voxfuture.app`

2. **Enable Authentication**
   - In Firebase Console, go to Authentication
   - Enable Email/Password sign-in method
   - Optionally enable other providers (Google, Facebook, etc.)

3. **Download Configuration Files**

   **For Android:**
   - Download `google-services.json`
   - Place it in `android/app/google-services.json`

   **For iOS:**
   - Download `GoogleService-Info.plist`
   - Place it in `ios/Runner/GoogleService-Info.plist`

4. **Install FlutterFire CLI**
   ```bash
   dart pub global activate flutterfire_cli
   ```

5. **Configure Firebase for Flutter**
   ```bash
   flutterfire configure
   ```
   
   This will:
   - Create `firebase_options.dart` in `lib/`
   - Configure Firebase for all platforms
   - Link your Flutter app to Firebase project

6. **Update main.dart**
   
   The main.dart file already includes Firebase initialization:
   ```dart
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   ```

7. **Cloud Firestore (Optional)**
   - In Firebase Console, go to Firestore Database
   - Create database in test mode or production mode
   - Set up security rules as needed

## Security Rules Example

### Firestore Rules
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

### Storage Rules
```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /users/{userId}/{allPaths=**} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

## Environment-Specific Configuration

For different environments (dev, staging, production), you can:

1. Create multiple Firebase projects
2. Use different configuration files
3. Set up build flavors in Android/iOS

Example for Android flavors in `android/app/build.gradle`:
```gradle
flavorDimensions "environment"
productFlavors {
    dev {
        dimension "environment"
        applicationIdSuffix ".dev"
    }
    prod {
        dimension "environment"
    }
}
```

## Troubleshooting

- **Firebase initialization error**: Make sure `google-services.json` is in the correct location
- **Authentication error**: Verify that Email/Password is enabled in Firebase Console
- **Build error**: Run `flutter clean && flutter pub get`
