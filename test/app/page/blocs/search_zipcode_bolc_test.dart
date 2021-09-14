import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zipcode_bloc/app/page/blocs/search_zipcode_bolc.dart';
import 'package:zipcode_bloc/app/page/blocs/search_zipcode_state.dart';

class DioMock extends Mock implements DioForNative {}

void main() {
  final dio = DioMock();
  final  diOerro = DioMock();
  setUp(() {
    print("Iniciando tests SearchZipCodeBloc");
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ''), statusCode: 200, data: {}));

    when(() => diOerro.get(any())).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ''), statusCode: 400, data: null));
  });

  tearDown(() {
    print("Finalizando test SearchZipCodeBloc");
  });

  blocTest<SearchZipCodeBloc, SearchZipCodeState>(
      'Deve retornar uma cidade quando passa o CEP por paramentro corretamnete...',
      build: () => SearchZipCodeBloc(dio),
      act: (bloc) => bloc.add('13880000'),
      expect: () => [
            isA<SearchZipCodeLoading>(),
            isA<SearchZipCodeSuccess>(),
          ]);

  blocTest<SearchZipCodeBloc, SearchZipCodeState>(
      'Deve retornar um erro  quando passa o CEP por paramentro de forma errada...',
      build: () => SearchZipCodeBloc(diOerro),
      act: (bloc) => bloc.add('13880'),
      expect: () => [
            isA<SearchZipCodeLoading>(),
            isA<SearchZipCodeError>(),
          ]);
}
