import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LayoutBasicsDemo());
  }
}
class LayoutBasicsDemo extends StatelessWidget{
const LayoutBasicsDemo({super.key});

@override

Widget build(BuildContext context){

return Scaffold

appBar: AppBar(title: const Text("Layout Basics")),

body: Padding(padding: const EdgeInsets.all(20),

child: Column(

crossAxisAlignment: CrossAxisAlignment.start,

children: [

const Text("Using Coluan", style: TextStyle(fontSize: 20)),

const SizedBox(height: 10),

Container(

height:

width: double.infinity,

color: Colors.blue,

child: const Center(

child: Text("Full Width Container", style: TextStyle(color: Colors.white), 0, // Text 

), // Container

const SizedBox(height: 203,

const Text("Using Row", style: TextStyle(fontSize: 203)

const SizedBox(height: 20),

mainAxisAlignment: MainAxisAlignment.spaceBetween,

children: [
Container(width: 80, height: 80, color: Colors.red), Container(width: 80, height: 80, color: Colors.black). Container (width: 80, height: 80, color: Colors..


) 
 // Column, Padding


); //