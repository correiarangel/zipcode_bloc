abstract class SearchZipCodeState {}

class SearchZipCodeSucces implements SearchZipCodeState {
  final  Map data;

   SearchZipCodeSucces(this.data);
}

class SearchZipCodeLoading implements SearchZipCodeState {
  const SearchZipCodeLoading();
}

class SearchZipCodeError implements SearchZipCodeState {
  final String message;
  const SearchZipCodeError(this.message);
}