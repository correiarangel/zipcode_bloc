abstract class SearchZipCodeState {}

class SearchZipCodeSuccess implements SearchZipCodeState {
  final  Map data;

   SearchZipCodeSuccess(this.data);
}

class SearchZipCodeLoading implements SearchZipCodeState {
  const SearchZipCodeLoading();
}

class SearchZipCodeError implements SearchZipCodeState {
  final String message;
  const SearchZipCodeError(this.message);
}