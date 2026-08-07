import 'package:flutter_test/flutter_test.dart';
import 'package:gri/main.dart';

void main() {
  testWidgets('GRI App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const GriApp());
    expect(find.byType(GriApp), findsOneWidget);
  });
}
