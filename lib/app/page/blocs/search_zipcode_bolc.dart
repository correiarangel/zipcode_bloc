import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_zipcode_state.dart';

class SearchZipCodeBloc extends Bloc<String, SearchZipCodeState> {
  final Dio dio;

  SearchZipCodeBloc(this.dio) : super(SearchZipCodeSucces({}));
  @override
  Stream<SearchZipCodeState> mapEventToState(String cep) async* {
    String url = "https://viacep.com.br/ws/$cep/json/";
    yield const SearchZipCodeLoading();
    try {
      final respose = await dio.get(url);

      yield SearchZipCodeSucces(respose.data);
    } catch (e) {
      yield const SearchZipCodeError("Error search zip code " );
    }
  }
}

/*
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'search_zipcode_state.dart';

class SearchZipCodeBloc {
  final _streamController = StreamController<String>.broadcast();
  Sink<String> get searchCep => _streamController.sink;
  Stream<SearchZipCodeState> get cepResult =>
      _streamController.stream.switchMap(_searchCep);

  Stream<SearchZipCodeState> _searchCep(String cep) async* {
    String url = "https://viacep.com.br/ws/$cep/json/";
    yield const SearchZipCodeLoading();
    try {
      final respose = await Dio().get(url);

      yield  SearchZipCodeSucces(respose.data);
    } catch (e) {
      yield SearchZipCodeError("Erro ao buscar cep ERR: $e");
    }
  }

  voiddispose() {
    _streamController.close();
  }
}

 */