import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/tokens/knot_text_styles.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_text_button.dart';

void main() {
  group('KnotTextButton', () {
    testWidgets('renders primary variation correctly', (tester) async {
      // Arrange
      bool wasPressed = false;
      final widget = MaterialApp(
        home: Scaffold(
          body: KnotTextButton.primary(
            label: 'Primary Button',
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.text('Primary Button'), findsOneWidget);

      // Check that it's using TextButton internally
      expect(find.byType(TextButton), findsOneWidget);

      // Test interaction
      await tester.tap(find.byType(TextButton));
      expect(wasPressed, true);

      // Verify style
      final textButton = tester.widget<TextButton>(find.byType(TextButton));
      expect(textButton.style?.textStyle?.resolve({})?.fontFamily,
          KnotSemanticTextStyles.knotTextButtonPrimary.fontFamily);
      expect(textButton.style?.foregroundColor?.resolve({}),
          KnotSemanticTextStyles.knotTextButtonPrimary.color);
    });

    testWidgets('renders secondary variation correctly', (tester) async {
      // Arrange
      bool wasPressed = false;
      final widget = MaterialApp(
        home: Scaffold(
          body: KnotTextButton.secondary(
            label: 'Secondary Button',
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.text('Secondary Button'), findsOneWidget);

      // Test interaction
      await tester.tap(find.byType(TextButton));
      expect(wasPressed, true);

      // Verify style
      final textButton = tester.widget<TextButton>(find.byType(TextButton));
      expect(textButton.style?.textStyle?.resolve({})?.fontFamily,
          KnotSemanticTextStyles.knotTextButtonSecondary.fontFamily);
      expect(textButton.style?.foregroundColor?.resolve({}),
          KnotSemanticTextStyles.knotTextButtonSecondary.color);
    });

    testWidgets('factory constructors set the correct variation',
        (tester) async {
      // This test verifies that the factory constructors correctly set the variation

      // Test primary factory
      final primaryWidget = KnotTextButton.primary(
        label: 'Primary',
        onPressed: () {},
      );
      expect(primaryWidget.variation, equals(KnotTextButtonVariation.primary));

      // Test secondary factory
      final secondaryWidget = KnotTextButton.secondary(
        label: 'Secondary',
        onPressed: () {},
      );
      expect(
          secondaryWidget.variation, equals(KnotTextButtonVariation.secondary));
    });
  });
}
