import 'package:credify/dependencies/dependencie_injection.dart';
import 'package:credify/my_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Credify app launches and renders splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: AppDependencies.providers,
        child: const MyApp(),
      ),
    );

    // Initial frame renders brand text on splash screen
    expect(find.text('Credify.'), findsOneWidget);
    expect(find.text('Save with trust • Grow with confidence'), findsOneWidget);

    // Fast-forward past the splash screen timer (2.4s) into onboarding
    await tester.pump(const Duration(milliseconds: 2500));
    await tester.pumpAndSettle();

    // Verify it transitioned smoothly to OnboardScreen
    expect(find.text('Smart Automated\nSavings Goals'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('Onboarding Skip button navigates directly to Sign Up', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: AppDependencies.providers,
        child: const MyApp(),
      ),
    );

    // Fast-forward to onboarding
    await tester.pump(const Duration(milliseconds: 2500));
    await tester.pumpAndSettle();

    // Tap Skip
    expect(find.text('Skip'), findsOneWidget);
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    // Verify we arrived on the modern Sign Up screen
    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Enter your mobile number to create your account or securely sign in.'), findsOneWidget);
  });
}
