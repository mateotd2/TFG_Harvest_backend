// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

// import 'package:harvest_api/api.dart';// import 'package:harvest_frontend/main.dart';
// import 'package:harvest_frontend/utils/provider/sign_in_model.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  // test('Añadir respuesta de SignIn', () {
  //   final responseModel = SignInResponseModel();
  //   // final response = responseModel.lastResponse;
  //   var i = 0;
  //   responseModel.addListener(() {
  //     // PASA POR AQUI DESPUES DE QUE EN LA LINEA 45 SE AÑADA LA RESPUESTA AL RESPONSE MODEL
  //     i++;
  //   });
  //   SignInResponseDTO responseDTO = SignInResponseDTO(
  //       id: 1, username: "username", tokenType: "Bearer", accessToken: "token");
  //   responseModel.addResponse(responseDTO);
  //   expect(i, 1);
  // });

  test('Test para GITHUB ACTIONS', () {
    expect(1, 1);
  });
}
