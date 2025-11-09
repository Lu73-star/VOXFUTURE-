import 'package:flutter_test/flutter_test.dart';
import 'package:voxfuture/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app name is displayed
    expect(find.text('VOXFUTURE'), findsOneOrMore);
  });
}
