// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:password_manager/hive_DB/db_functions.dart';
// import 'package:password_manager/main.dart';
// import 'package:password_manager/models/password_model.dart';
// import 'package:password_manager/pages/Home%20page/home_page.dart';
// import 'package:password_manager/pages/add_password.dart';

// void main() async {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   Hive.registerAdapter(PasswordModelAdapter());
//   await HiveDb().init();

//   group('end-to-end test', () {
//     testWidgets('add new password successfully', (tester) async {
//       await tester.pumpWidget(const MyApp());

//       await tester.tap(find.byType(FloatingActionButton));
//       await tester.pumpAndSettle();

//       //   finds forms to add password
//       final AddPasswordPageTextField1 = find.descendant(
//         of: find.byType(AddPasswordScreen),
//         matching: find.byType(TextFormField).at(0),
//       );
//       final AddPasswordPageTextField3 = find.descendant(
//         of: find.byType(AddPasswordScreen),
//         matching: find.byType(TextFormField).at(2),
//       );
//       await tester.enterText(AddPasswordPageTextField1, 'instagram');
//       // await tester.enterText(AddPasswordPageTextField3, 'justdemopass');

//       await tester.tap(find.byKey(ValueKey('goToGeneratePasswordScreenBtn')));
//       await tester.pumpAndSettle();

//       await tester.tap(find.byKey(ValueKey('generatePasswordBtn')));
//       Future.delayed(Duration(seconds: 5), () {});

//       await tester.tap(find.byKey(ValueKey('goBackFromGeneratePassBtn')));
//       await tester.pumpAndSettle();

//       Future.delayed(Duration(seconds: 5), () {});

//       await tester.tap(find.byKey(ValueKey('addPassBtn')));
//       await tester.pumpAndSettle();

//       expect(find.byType(HomePage), findsOneWidget);
//     });
//   });
// }
