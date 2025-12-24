import 'package:flutter/material.dart';import 'package:http/http.dart' as http;import 'dart:convert';
void main(){
  runApp(const MyApp());
  }
class MyApp extends StatelessWidget{
  const MyApp({super.key});
@override Widget build(BuildContext context){
  return MaterialApp(title:"Stock News",
  debugShowCheckedModeBanner:false,
  theme:ThemeData(primaryColor:const Color(0xFF0A2540),
  scaffoldBackgroundColor:const Color(0xFFF4F6FA)),
  home:const ApiDemo());
  }}
class ApiDemo extends StatefulWidget{
  const ApiDemo({super.key});
@override State<ApiDemo> createState()=>_ApiDemoState();}
class _ApiDemoState extends State<ApiDemo>{
String news="Press button to load latest AAPL news";
Future<void> fetchFact() async{
  setState((){news="Loading market sentiment...";
  });
final response=await http.get(Uri.parse("https://www.alphavantage.co/query?function=NEWS_SENTIMENT&tickers=AAPL&apikey=demo"));
final data=json.decode(response.body);
setState((){news=data['feed'][0]['title'];
});}
@override Widget build(BuildContext context){
return Scaffold(
appBar:AppBar(backgroundColor:const Color(0xFF0A2540),
title:const Text("Market News",
style:TextStyle(fontWeight:FontWeight.w600,color:Colors.white)),centerTitle:true),
body:Padding(padding:const EdgeInsets.all(24),
child:Column(
mainAxisAlignment:MainAxisAlignment.center,
children:[
Container(padding:const EdgeInsets.all(20),
decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(16)),
child:Column(
children:[
const Icon(Icons.trending_up,color:Color(0xFF16A34A),size:40),
const SizedBox(height:12),
const Text("AAPL News Headline",style:TextStyle(fontSize:16,fontWeight:FontWeight.w600,color:Color(0xFF334155))),
const SizedBox(height:12),
Text(news,textAlign:TextAlign.center,
style:const TextStyle(fontSize:18,fontWeight:FontWeight.w600,color:Colors.black)),
])),
const SizedBox(height:30),
ElevatedButton(onPressed:fetchFact,
style:ElevatedButton.styleFrom(backgroundColor:const Color(0xFF0A2540),
padding:const EdgeInsets.symmetric(horizontal:32,vertical:14),
shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12))),
child:const Text("Fetch Market News",
style:TextStyle(fontSize:16,color:Colors.white))),
])));}}
