import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'blocs/search_zipcode_state.dart';

class HomeController {
  
 Widget returnContainerState(state) {
    if (state is SearchZipCodeError) {
      return Container(
        alignment: Alignment.center,
        color: Colors.deepPurple[50],
        padding: const EdgeInsets.all(18.0),
        child: Text(
          "Ops! something wrong in the zip code search :[",
          style: TextStyle(fontSize: 28.0, color: Colors.red[700]),
        ),
      );
    }
    if (state is SearchZipCodeLoading) {
      return Container(
          alignment: Alignment.center,
          color: Colors.deepPurple[50],
          padding: const EdgeInsets.all(18.0),
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey.shade300,
          ));
    }

    state = state as SearchZipCodeSucces;

    if (state.data.isEmpty) {
      return Container(
        alignment: Alignment.center,
        color: Colors.deepPurple[50],
        padding: const EdgeInsets.all(18.0),
        child: Text(
          "Awaiting Survey Data ...",
          style: TextStyle(fontSize: 28.0, color: Colors.deepPurple[700]),
        ),
      );
    }
    return Container(
      alignment: Alignment.center,
      color: Colors.deepPurple[500],
      padding: const EdgeInsets.all(18.0),
      child: Text(
        "City : ${state.data['localidade']}\n\n"
        "State : ${state.data['uf']}\n\n"
        "Population : ${int.parse(state.data['ibge']).toStringAsFixed(2)}",
        style: TextStyle(fontSize: 28.0, color: Colors.grey.shade200),
      ),
    );
  }
}
