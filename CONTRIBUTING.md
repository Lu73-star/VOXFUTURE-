# Contributing to VOXFUTURE

Thank you for your interest in contributing to VOXFUTURE! This document provides guidelines for contributing to the project.

## Code of Conduct

Be respectful and inclusive. We welcome contributions from everyone.

## Getting Started

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/your-username/VOXFUTURE-.git
   cd VOXFUTURE-
   ```
3. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Development Setup

### Flutter App

```bash
flutter pub get
flutter run
```

### Backend

```bash
cd backend
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
uvicorn main:app --reload
```

## Making Changes

### Code Style

**Flutter/Dart:**
- Follow [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter format .` before committing
- Run `flutter analyze` to check for issues

**Python:**
- Follow [PEP 8](https://pep8.org/)
- Use `black` for formatting
- Use `flake8` for linting

### Commit Messages

Follow conventional commits:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting)
- `refactor:` Code refactoring
- `test:` Adding tests
- `chore:` Maintenance tasks

Example:
```
feat: add password reset functionality
fix: resolve login screen navigation issue
docs: update README with deployment instructions
```

### Testing

**Flutter:**
```bash
flutter test
```

**Backend:**
```bash
pytest
```

Ensure all tests pass before submitting PR.

## Submitting Changes

1. Commit your changes:
   ```bash
   git add .
   git commit -m "feat: add new feature"
   ```

2. Push to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

3. Create a Pull Request:
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Fill in the PR template
   - Submit for review

## Pull Request Guidelines

- **Title**: Clear and descriptive
- **Description**: Explain what and why
- **Screenshots**: Include for UI changes
- **Tests**: Add tests for new features
- **Documentation**: Update docs if needed

## What to Contribute

### Good First Issues
- UI improvements
- Documentation updates
- Bug fixes
- Translation improvements

### Feature Suggestions
- Backend endpoints
- Authentication methods
- UI components
- Performance improvements

## Translation Contributions

To add or improve translations:

1. Edit/create files in `assets/translations/`
2. Follow the JSON structure of existing files
3. Ensure all keys from `en.json` are present

Example:
```json
{
  "app_name": "VOXFUTURE",
  "welcome": "Welcome",
  ...
}
```

## Reporting Bugs

Use GitHub Issues with:
- Clear title
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- Device/OS information

## Feature Requests

Use GitHub Issues with:
- Clear description
- Use case
- Proposed solution
- Alternatives considered

## Questions

For questions, use:
- GitHub Discussions
- GitHub Issues (label: question)

## License

By contributing, you agree that your contributions will be licensed under the project's MIT License.

## Recognition

Contributors will be acknowledged in the README and release notes.

Thank you for contributing! 🎉
