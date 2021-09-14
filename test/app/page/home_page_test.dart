import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:zipcode_bloc/app/page/blocs/search_zipcode_bolc.dart';

import 'package:zipcode_bloc/app/page/home_page.dart';

class DioMock extends Mock implements DioForNative {}

void main() {
  final dio = DioMock();
    setUp(() {
    print("Iniciando tests HomePage");
     when(() => dio.get(any())).thenAnswer((_) async => Response(
      requestOptions: RequestOptions(path: ''), statusCode: 200, data: {}));
  });

  tearDown(() {
    print("Finalizando test HomePage");
  });

 
  testWidgets('Deve encotra Titulo, TextField, ElevatedButton icon',
      (WidgetTester tester) async {
    await tester.pumpWidget(Provider(
      create: (context) => SearchZipCodeBloc(dio),
      child: const MaterialApp(
        home: HomePage(),
      ),
    ));


    var textTitle = find.text("Search Zip Code");
    expect(textTitle, findsOneWidget);
    
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, '13880000');
    expect(find.text("Zip Code:"), findsOneWidget);
 
    var button = find.text("Search");
    expect(button, findsOneWidget);
 
    await tester.tap(button);
    await tester.pump();
    expect(find.text("Search"), findsOneWidget);

 
  });
}
