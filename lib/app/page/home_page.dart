import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/search_zipcode_bolc.dart';
import 'home_controller.dart';
import 'blocs/search_zipcode_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textngController = TextEditingController();
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Zip Code"),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(18.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textngController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Zip Code:",
                  hintText: "Waiting for you to type; Ex.13880000"),
            ),
            const SizedBox(height: 18.0),
            ElevatedButton.icon(
              style: ButtonStyle(
                alignment: Alignment.center,
                elevation: MaterialStateProperty.all(7.0),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(40, 18, 40, 18),
                ),
                shadowColor: MaterialStateProperty.all(Colors.grey.shade800),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
                animationDuration: const Duration(milliseconds: 1500),
                overlayColor:
                    MaterialStateProperty.all(Colors.deepPurple.shade700),
              ),
              onPressed: () {
                context.read<SearchZipCodeBloc>().add(textngController.text);
              },
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade200,
                size: 28.0,
              ),
              label: Text(
                "Search",
                style: TextStyle(fontSize: 28.0, color: Colors.grey.shade200),
              ),
            ),
            const SizedBox(height: 18.0),
            BlocBuilder<SearchZipCodeBloc, SearchZipCodeState>(
              builder: (context, state) {
                return controller.returnContainerState(state);
              },
            ),
          ],
        ),
      ),
    );
  }
}
