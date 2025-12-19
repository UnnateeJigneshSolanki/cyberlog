import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
runApp(MultiProvider(
providers:[ChangeNotifierProvider(create:(_)=>LogsProvider()),
ChangeNotifierProvider(create:(_)=>SettingsProvider())],
child:const MyApp(),
),);}
class LogsProvider extends ChangeNotifier{
final List<String> logs=["Logged in successfully","Password updated","Security scan completed"];
void addLog(String log){
logs.insert(0,log);
notifyListeners();
}}
class SettingsProvider extends ChangeNotifier{
bool notifications=true;
bool privacy=true;
bool darkMode=true;
void toggleNotifications(BuildContext context){
notifications=!notifications;
context.read<LogsProvider>().addLog(
notifications?"Notifications enabled":"Notifications disabled"
); notifyListeners();
}
void togglePrivacy(BuildContext context){
privacy=!privacy;
context.read<LogsProvider>().addLog(
privacy?"Privacy enabled":"Privacy disabled"
) ;notifyListeners();
}
void toggleDarkMode(BuildContext context){
darkMode=!darkMode;
context.read<LogsProvider>().addLog(
darkMode?"Dark mode enabled":"Dark mode disabled"
); notifyListeners();
}}
class MyApp extends StatelessWidget{
const MyApp({super.key});
@override
Widget build(BuildContext context){
return MaterialApp(
debugShowCheckedModeBanner:false,
theme:ThemeData(
scaffoldBackgroundColor:const Color(0xFF0A0D12),
appBarTheme:const AppBarTheme(backgroundColor:Color(0xFF111827),foregroundColor:Color(0xFF38BDF8),
centerTitle:true,),
bottomNavigationBarTheme:const BottomNavigationBarThemeData(backgroundColor:Color(0xFF111827),selectedItemColor:Color(0xFF38BDF8),
unselectedItemColor:Color(0xFF9CA3AF),showUnselectedLabels:true),
listTileTheme:const ListTileThemeData(textColor:Colors.white,iconColor:Color(0xFF38BDF8),),),
home:const BottomNavDemo(),
);}}
class BottomNavDemo extends StatefulWidget{
const BottomNavDemo({super.key});
@override
State<BottomNavDemo> createState()=>_BottomNavDemoState();
}
class _BottomNavDemoState extends State<BottomNavDemo>{
int currentIndex=0;
final screens=[const LogsScreen(),const SettingsScreen()];
@override
Widget build(BuildContext context){
return Scaffold(
appBar:AppBar(title:Text(currentIndex==0?"Logs":"Settings")),
body:screens[currentIndex],
bottomNavigationBar:BottomNavigationBar(
currentIndex:currentIndex,
onTap:(index){setState((){currentIndex=index;});},
items:const[
BottomNavigationBarItem(icon:Icon(Icons.history),label:"Logs"),
BottomNavigationBarItem(icon:Icon(Icons.settings),label:"Settings"),
],),);}}
class LogsScreen extends StatelessWidget{
const LogsScreen({super.key});
@override
Widget build(BuildContext context){
final logs=context.watch<LogsProvider>().logs;
return ListView.builder(
itemCount:logs.length,
itemBuilder:(context,index){
return ListTile(
leading:const Icon(Icons.history),
title:Text(logs[index]),
);},);}}
class SettingsScreen extends StatelessWidget{
const SettingsScreen({super.key});
@override
Widget build(BuildContext context){
final settings=context.watch<SettingsProvider>();
return Column(children:[ListTile(leading:const Icon(Icons.notifications),
title:const Text("Notifications"),
trailing:Text(settings.notifications?"ON":"OFF"),
onTap:(){context.read<SettingsProvider>().toggleNotifications(context);},
),
ListTile(leading:const Icon(Icons.lock),
title:const Text("Privacy"),
trailing:Text(settings.privacy?"ON":"OFF"),
onTap:(){context.read<SettingsProvider>().togglePrivacy(context);},
),
ListTile(leading:const Icon(Icons.dark_mode),
title:const Text("Dark Mode"),
trailing:Text(settings.darkMode?"ON":"OFF"),
onTap:(){context.read<SettingsProvider>().toggleDarkMode(context);},
),],);}}
