import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(){runApp(const MyApp());}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override Widget build(BuildContext context){
    return MaterialApp(
      title:"CyberLog",
      debugShowCheckedModeBanner:false,
      theme:ThemeData(
        primaryColor:const Color(0xFF0F172A),
        scaffoldBackgroundColor:const Color(0xFFF1F5F9),
      ),
      home:const ApiDemo(),
    );
  }
}

class ApiDemo extends StatefulWidget{
  const ApiDemo({super.key});
  @override State<ApiDemo> createState()=>_ApiDemoState();
}

class _ApiDemoState extends State<ApiDemo>{
  String cyberTip="Press button to load Cyber Tip of the Day";

  Future<void> fetchTip() async{
    setState((){cyberTip="Loading cyber tip...";});
    final response=await http.get(Uri.parse("https://api.adviceslip.com/advice"));
    final data=json.decode(response.body);
    setState((){cyberTip=data['slip']['advice'];});
  }

  @override Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor:const Color(0xFF0F172A),
        title:const Text("CyberLog Dashboard",
          style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600)),
        centerTitle:true),
      body:Padding(
        padding:const EdgeInsets.all(24),
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            Container(
              padding:const EdgeInsets.all(20),
              decoration:BoxDecoration(
                color:Colors.white,
                borderRadius:BorderRadius.circular(16)),
              child:Column(children:[
                const Icon(Icons.security,
                  color:Color(0xFF16A34A),size:40),
                const SizedBox(height:12),
                const Text("Cyber Tip of the Day",
                  style:TextStyle(fontSize:16,
                  fontWeight:FontWeight.w600,
                  color:Color(0xFF334155))),
                const SizedBox(height:12),
                Text(cyberTip,textAlign:TextAlign.center,
                  style:const TextStyle(
                    fontSize:18,fontWeight:FontWeight.w500,
                    color:Colors.black)),
              ]),
            ),
            const SizedBox(height:30),
            ElevatedButton(
              onPressed:fetchTip,
              style:ElevatedButton.styleFrom(
                backgroundColor:const Color(0xFF0F172A),
                padding:const EdgeInsets.symmetric(
                  horizontal:32,vertical:14),
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(12))),
              child:const Text("Get Cyber Tip",
                style:TextStyle(fontSize:16,color:Colors.white)),
            ),
          ],
        ),  ), );}}
