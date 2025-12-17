import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    scaffoldBackgroundColor: const Color(0xFF0B0F14),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0E1621),
      foregroundColor: Color(0xFF00F6FF),
      centerTitle: true ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF0E1621),
      selectedItemColor: Color(0xFF00F6FF),
      unselectedItemColor: Color(0xFF9AA4B2),
      showUnselectedLabels: true ),),
  home: const BottomNavDemo(),
);}}
class BottomNavDemo extends StatefulWidget {
  const BottomNavDemo({super.key});
  @override
  State<BottomNavDemo> createState() => _BottomNavDemoState();
}
class _BottomNavDemoState extends State<BottomNavDemo> {
  int currentIndex = 0;
  final List<Widget> screens = const [HomeScreen(),LogsScreen(),SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CyberLog App"),centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: "Logs"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],),);}}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          dashboardCard("Daily Log", Icons.today),
          dashboardCard("Cyber Tips", Icons.security),
          dashboardCard("Device Security", Icons.devices),
          dashboardCard("Notes", Icons.note),
        ],),);}
Widget dashboardCard(String title, IconData icon) {
  return Container(
    decoration: BoxDecoration(color: const Color(0xFF151A22),borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow( color: const Color(0xFF00F6FF),blurRadius: 8,spreadRadius: 1 )],
      border: Border.all(color: const Color(0xFF00F6FF)), ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: const Color(0xFF00F6FF), size: 40),
        const SizedBox(height: 10),
        Text(title,style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500,
          ), ),],),);}}
class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});
  final List<String> logs = const [
    "Logged in successfully",
    "Password updated",
    "New device detected",
    "Security scan completed",
    "Notes added",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: logs.length,
      itemBuilder: (context, index) {
    return ListTile(
      leading: const Icon(Icons.history, color: Color(0xFF00F6FF)),
      title: Text(logs[index],
        style: const TextStyle(color: Colors.white),
      ),
      trailing: const Icon(Icons.arrow_forward_ios,size: 16,color: Color(0xFF7C4DFF)),
    );},);}}
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 12),
              Text("Unnatee Solanki",style: TextStyle(fontSize: 18, color: Colors.white),
              ),], ),),
        const Divider(),
        settingsTile(Icons.settings, "Account Settings"),
        settingsTile(Icons.notifications, "Notifications"),
        settingsTile(Icons.lock, "Privacy"),
        settingsTile(Icons.help_outline, "Help & Support"),
        settingsTile(Icons.info_outline, "About"),
      ], );}
Widget settingsTile(IconData icon, String title) {
  return Column(
    children: [
      ListTile(
        leading: Icon(icon, color: const Color(0xFF00F6FF)),
        title: Text(title,style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF7C4DFF)),
      ),
      const Divider(color: Color(0xFF1F2933), height: 1),
    ],);}}
