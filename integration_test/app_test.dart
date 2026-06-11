import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_testing/main.dart' as app;

void main() {
  group('App Test', () {
    // Add the IntegrationTestWidgetsFlutterBinding and .ensureInitialized
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    // Create your test case
    testWidgets("full app test", (tester) async {
      //  execute the app.main() function
      app.main();
      //  Wait until the app has settled
      await tester.pumpAndSettle();
      // create finders for email, password and login
      final emailFinder = find.byType(TextFormField).first;
      final passwordFinder = find.byType(TextFormField).last;
      final loginButtonFinder = find.byType(ElevatedButton);
      // Enter text for the email address and password
      await tester.enterText(emailFinder, 'test@example.com');
      await tester.enterText(passwordFinder, 'password');
      await tester.pumpAndSettle();
      // Tap on the login button and wait till it settled
      await tester.tap(loginButtonFinder);
      await tester.pumpAndSettle();
      // Find the first checkbox in the screen
      final firstCheckbox = find.byType(CheckboxListTile).first;
      // Check the semantics of the checkbox if it is not checked
      expect(
        tester.getSemantics(firstCheckbox),
        containsSemantics(
          hasTapAction: true,
          hasCheckedState: true,
          isChecked: false,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
        ),
      );
      // Tap on the checkbox and wait till it settled
      await tester.tap(firstCheckbox);
      await tester.pumpAndSettle();
      // Wait for 1 second
      await Future.delayed(const Duration(seconds: 1));
      // Check the semantics of the checkbox if it is checked
      expect(
        tester.getSemantics(firstCheckbox),
        containsSemantics(
          hasTapAction: true,
          hasCheckedState: true,
          isChecked: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
        ),
      );
    });
  });
}
