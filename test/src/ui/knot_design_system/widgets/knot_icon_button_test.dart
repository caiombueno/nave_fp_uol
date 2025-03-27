import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nave_fp_uol/src/ui/knot_design_system/widgets/knot_icon_button.dart';

void main() {
  group('KnotIconButton', () {
    testWidgets('renders correctly with default settings', (tester) async {
      // Arrange
      const widget = MaterialApp(
        home: Scaffold(
          body: KnotIconButton(
            icon: Icons.add,
          ),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.byType(KnotIconButton), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Verify default size (medium = 24)
      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.size, 24);
    });

    testWidgets('renders with small size', (tester) async {
      // Arrange
      const widget = MaterialApp(
        home: Scaffold(
          body: KnotIconButton(
            icon: Icons.home,
            size: KnotIconButtonSize.small,
          ),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.size, 20);
    });

    testWidgets('renders with large size', (tester) async {
      // Arrange
      const widget = MaterialApp(
        home: Scaffold(
          body: KnotIconButton(
            icon: Icons.settings,
            size: KnotIconButtonSize.large,
          ),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.size, 32);
    });

    testWidgets('renders with custom color', (tester) async {
      // Arrange
      const customColor = Colors.red;
      const widget = MaterialApp(
        home: Scaffold(
          body: KnotIconButton(
            icon: Icons.favorite,
            color: customColor,
          ),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.color, customColor);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      // Arrange
      bool wasPressed = false;
      final widget = MaterialApp(
        home: Scaffold(
          body: KnotIconButton(
            icon: Icons.add,
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      );

      // Act
      await tester.pumpWidget(widget);
      await tester.tap(find.byType(KnotIconButton));
      await tester.pump();

      // Assert
      expect(wasPressed, true);
    });

    testWidgets('is disabled when onPressed is null', (tester) async {
      // Arrange
      const widget = MaterialApp(
        home: Scaffold(
          body: KnotIconButton(
            icon: Icons.add,
            onPressed: null,
          ),
        ),
      );

      // Act
      await tester.pumpWidget(widget);

      // Assert
      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.onPressed, null);

      // Verify the button is disabled (doesn't trigger interaction)
      await tester.tap(find.byType(KnotIconButton), warnIfMissed: false);
      // No need to verify any state change since the button is disabled
    });
  });
}
