import 'package:flutter/material.dart';

void main() {
  runApp(const myfirstapp());
}
class myfirstapp extends StatelessWidget{
  const myfirstapp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("IF LOST, CONTACT"),
        ),
        body: const Center(
          child: Text("Name : Unnatee\nPhone : 9137533261 ", textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 6, 48, 83),
            ), ),
        )
      )
    );
  }
}
