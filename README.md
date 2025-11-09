# VOXFUTURE

A modern Flutter application with Firebase authentication, FastAPI backend integration, and multi-language support.

## Features

- ✅ **Firebase Authentication** - Secure email/password authentication
- 🌍 **Multi-language Support** - English, Portuguese, Spanish, French, and German
- 🎨 **Material Design 3** - Modern and clean UI
- 🔗 **FastAPI Backend** - RESTful API integration ready
- 📱 **Android Support** - APK and AAB builds via GitHub Actions
- 🏗️ **Modular Architecture** - Clean code structure with separate folders for models, screens, services, and widgets

## Project Structure

```
VOXFUTURE/
├── lib/
│   ├── l10n/                   # Localization
│   │   └── app_localizations.dart
│   ├── models/                 # Data models
│   │   └── user_model.dart
│   ├── screens/                # UI screens
│   │   └── auth/
│   │       ├── login_screen.dart
│   │       ├── register_screen.dart
│   │       └── home_screen.dart
│   ├── services/               # Business logic
│   │   ├── auth_service.dart
│   │   └── api_service.dart
│   ├── widgets/                # Reusable widgets
│   │   ├── custom_button.dart
│   │   └── custom_text_field.dart
│   └── main.dart
├── assets/
│   └── translations/           # Translation files
│       ├── en.json
│       ├── pt.json
│       ├── es.json
│       ├── fr.json
│       └── de.json
├── backend/                    # FastAPI backend
│   ├── app/
│   │   ├── api/
│   │   ├── core/
│   │   ├── models/
│   │   └── schemas/
│   ├── main.py
│   └── requirements.txt
├── android/                    # Android configuration
└── .github/
    └── workflows/
        └── build-android.yml   # CI/CD for APK/AAB builds
```

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Firebase account
- Python 3.8+ (for backend)

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/Lu73-star/VOXFUTURE-.git
   cd VOXFUTURE-
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Enable Email/Password authentication
   - Download `google-services.json` and place it in `android/app/`
   - Run `flutterfire configure` to generate Firebase options

4. **Run the app**
   ```bash
   flutter run
   ```

### Backend Setup

1. **Navigate to backend directory**
   ```bash
   cd backend
   ```

2. **Create virtual environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your Firebase credentials
   ```

5. **Run the FastAPI server**
   ```bash
   uvicorn main:app --reload
   ```

   The API will be available at `http://localhost:8000`

## Building for Production

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle (AAB)
```bash
flutter build appbundle --release
```

## Continuous Integration

The project includes GitHub Actions workflow that automatically:
- Builds debug and release APKs
- Builds release AAB for Google Play
- Uploads artifacts for download
- Creates GitHub releases for tagged versions

To trigger a build:
- Push to `main` or `master` branch
- Create a tag (e.g., `v1.0.0`)
- Manually trigger via GitHub Actions

## Supported Languages

- 🇬🇧 English (en)
- 🇧🇷 Portuguese (pt)
- 🇪🇸 Spanish (es)
- 🇫🇷 French (fr)
- 🇩🇪 German (de)

## API Endpoints

### Health Check
```
GET /api/health
```

### Users
```
GET    /api/users          # Get all users
GET    /api/users/{id}     # Get specific user
POST   /api/users          # Create user
PUT    /api/users/{id}     # Update user
DELETE /api/users/{id}     # Delete user
```

## Dependencies

### Flutter
- `firebase_core` - Firebase initialization
- `firebase_auth` - Authentication
- `cloud_firestore` - Cloud database
- `provider` - State management
- `http` / `dio` - HTTP client
- `intl` - Internationalization
- `shared_preferences` - Local storage
- `google_fonts` - Custom fonts

### Backend
- `fastapi` - Modern web framework
- `uvicorn` - ASGI server
- `pydantic` - Data validation
- `firebase-admin` - Firebase SDK
- `python-jose` - JWT tokens
- `passlib` - Password hashing

## License

This project is licensed under the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

For issues and questions, please open an issue on GitHub.
