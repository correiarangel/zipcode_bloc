import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zipcode_bloc/app/page/blocs/search_zipcode_bolc.dart';
import 'package:zipcode_bloc/app/page/home_page.dart';

class AppWidGet extends StatelessWidget {
  const AppWidGet({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_)=> Dio()),//inject Dio
        BlocProvider(create: (context)=> SearchZipCodeBloc(context.read())),
      ], 
      child:MaterialApp(
      title: "Bloc Zip Code",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    ),);

    
  }
}
