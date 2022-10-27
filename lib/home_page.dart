
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_registion/registion_screen.dart';
import 'package:flutter_rest_api_registion/verify_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
            MaterialPageRoute(
                builder: (context)=> VerifyScreen()
            ),
          );
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );

  }
}
