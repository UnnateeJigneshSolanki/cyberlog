import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );}}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final pages = const [
    HomePage(),SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });},
        items: const [BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'Settings',
          ),],),  );}}
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome Home',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),),);}}
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
  static const platform = MethodChannel('device/info');
  String deviceModel = 'Loading...';
  String androidVersion = 'Loading...';
  @override
  void initState() {
    super.initState();
    fetchDeviceInfo();
  }
  Future<void> fetchDeviceInfo() async {
    try {
      final Map result = await platform.invokeMethod('getDeviceInfo');
      setState(() {
        deviceModel = result['model'];
        androidVersion = result['version'];
      });
    } catch (e) {
      setState(() {
        deviceModel = 'Error';
        androidVersion = 'Error';
      });}}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text( 'Device Information', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
              ), ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.phone_android),title: const Text('Device Model'),subtitle: Text(deviceModel),
            ),
            ListTile(
              leading: const Icon(Icons.android),title: const Text('Android Version'),subtitle: Text(androidVersion),
            ),
          ],
        ),
      ),
    );
  }
}
