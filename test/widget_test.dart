import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('MyApp builds successfully', (WidgetTester tester) async {
    final mockClient = MockClient((request) async {
      return http.Response('[]', 200);
    });

    await tester.pumpWidget(MyApp(apiClient: ApiClient(client: mockClient)));

    await tester.pumpAndSettle();

    expect(find.byType(MyApp), findsOneWidget);
  });
}
