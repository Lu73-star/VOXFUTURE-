# Deployment Guide for VOXFUTURE

This guide covers deploying the VOXFUTURE app to Google Play Store and deploying the FastAPI backend.

## Table of Contents
1. [Preparing for Release](#preparing-for-release)
2. [Creating Signing Keys](#creating-signing-keys)
3. [Building Release APK/AAB](#building-release-apkaab)
4. [Google Play Store Deployment](#google-play-store-deployment)
5. [Backend Deployment](#backend-deployment)

---

## Preparing for Release

### 1. Update Version
Edit `pubspec.yaml`:
```yaml
version: 1.0.0+1  # version+build_number
```

### 2. Update App Icons
- Use [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- Or manually update icons in `android/app/src/main/res/mipmap-*/`

### 3. Review Permissions
Check `android/app/src/main/AndroidManifest.xml` for necessary permissions only.

---

## Creating Signing Keys

### Generate Keystore

```bash
keytool -genkey -v -keystore ~/voxfuture-keystore.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias voxfuture
```

Fill in the prompted information. **Keep this file secure!**

### Configure Signing in Android

1. Create `android/key.properties`:
```properties
storePassword=your-store-password
keyPassword=your-key-password
keyAlias=voxfuture
storeFile=/path/to/voxfuture-keystore.jks
```

2. Update `android/app/build.gradle`:
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    // ... existing config
    
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
        }
    }
}
```

3. Add to `.gitignore`:
```
android/key.properties
*.jks
*.keystore
```

---

## Building Release APK/AAB

### Build AAB (Recommended for Play Store)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

### Build APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### Build Split APKs (Smaller size)
```bash
flutter build apk --split-per-abi --release
```

---

## Google Play Store Deployment

### 1. Create Google Play Console Account
- Go to [Google Play Console](https://play.google.com/console)
- Pay one-time $25 registration fee

### 2. Create New Application
- Click "Create app"
- Fill in app details:
  - App name: VOXFUTURE
  - Default language: English (or your preference)
  - App type: Application
  - Free or Paid: Free

### 3. Complete Store Listing
Required information:
- App name and description
- Screenshots (phone, tablet, etc.)
- Feature graphic (1024x500)
- App icon (512x512)
- Category
- Contact details
- Privacy policy URL

### 4. Content Rating
- Complete the questionnaire
- Get rating certificate

### 5. Upload App Bundle
- Go to Production > Releases
- Create new release
- Upload the `.aab` file
- Fill in release notes
- Submit for review

### 6. Setup GitHub Actions for Automated Deployment

Update `.github/workflows/build-android.yml` to include Play Store deployment:

```yaml
- name: Deploy to Play Store
  uses: r0adkll/upload-google-play@v1
  with:
    serviceAccountJsonPlainText: ${{ secrets.SERVICE_ACCOUNT_JSON }}
    packageName: com.voxfuture.app
    releaseFiles: build/app/outputs/bundle/release/app-release.aab
    track: production
    status: completed
```

### Required Secrets:
- `SERVICE_ACCOUNT_JSON`: Service account credentials from Google Play Console
- `KEYSTORE_BASE64`: Base64 encoded keystore file
- `KEY_PROPERTIES`: Keystore properties

---

## Backend Deployment

### Option 1: Deploy to Heroku

1. **Install Heroku CLI**
```bash
curl https://cli-assets.heroku.com/install.sh | sh
```

2. **Login**
```bash
heroku login
```

3. **Create App**
```bash
cd backend
heroku create voxfuture-api
```

4. **Create Procfile**
```
web: uvicorn main:app --host 0.0.0.0 --port $PORT
```

5. **Deploy**
```bash
git push heroku main
```

### Option 2: Deploy to Google Cloud Run

1. **Build Docker Image**
```dockerfile
FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD exec uvicorn main:app --host 0.0.0.0 --port $PORT
```

2. **Deploy**
```bash
gcloud run deploy voxfuture-api \
  --source . \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
```

### Option 3: Deploy to AWS EC2

1. **Launch EC2 Instance**
   - Ubuntu Server 22.04
   - t2.micro (free tier)
   - Configure security group (allow ports 80, 443, 22)

2. **SSH into Instance**
```bash
ssh -i your-key.pem ubuntu@your-ec2-ip
```

3. **Setup Server**
```bash
sudo apt update
sudo apt install python3-pip python3-venv nginx -y

cd /home/ubuntu
git clone your-repo
cd your-repo/backend

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

4. **Configure Nginx**
```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

5. **Setup Systemd Service**
Create `/etc/systemd/system/voxfuture.service`:
```ini
[Unit]
Description=VOXFUTURE FastAPI
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/home/ubuntu/your-repo/backend
Environment="PATH=/home/ubuntu/your-repo/backend/venv/bin"
ExecStart=/home/ubuntu/your-repo/backend/venv/bin/uvicorn main:app --host 0.0.0.0 --port 8000

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl enable voxfuture
sudo systemctl start voxfuture
```

### Option 4: Deploy to Railway

1. Go to [Railway.app](https://railway.app/)
2. Connect GitHub repository
3. Select backend directory
4. Deploy automatically

---

## Post-Deployment

### Update Flutter App with Backend URL

In `lib/services/api_service.dart`:
```dart
static const String baseUrl = 'https://your-backend-url.com';
```

### Monitor and Maintain

- Set up error tracking (Sentry, Firebase Crashlytics)
- Monitor backend logs
- Set up alerts for downtime
- Regular security updates

---

## Continuous Deployment

The GitHub Actions workflow automatically:
- Builds APK/AAB on push to main
- Creates releases for tags
- Can be extended to auto-deploy to Play Store

To trigger release:
```bash
git tag v1.0.0
git push origin v1.0.0
```

---

## Troubleshooting

### Common Issues

**Build fails on GitHub Actions:**
- Check if all secrets are properly configured
- Verify keystore is properly encoded in base64

**App rejected by Play Store:**
- Review policy violations
- Update privacy policy
- Complete all required sections

**Backend deployment fails:**
- Check logs: `heroku logs --tail` or cloud provider logs
- Verify all environment variables are set
- Check firewall/security group settings
