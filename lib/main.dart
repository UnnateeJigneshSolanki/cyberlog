import 'package:flutter/material.dart';
void main() {
  runApp(const CyberLogApp());
}
class CyberLogApp extends StatelessWidget {
  const CyberLogApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CyberLog',
      home: const SecurityChecklistScreen(),
    ); }}
class SecurityChecklistScreen extends StatelessWidget {
  const SecurityChecklistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( title: const Text('Security Checklist'),
        centerTitle: true,),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SecurityItem( title: 'Screen Lock Enabled',
            description: 'Your device has a lock screen enabled.',icon: Icons.lock, status: SecurityStatus.safe),
          SecurityItem(title: 'Dangerous Permissions',
            description: 'Camera and Storage permissions granted.', icon: Icons.warning_amber_rounded,status: SecurityStatus.warning),
          SecurityItem(title: 'Root / Emulator Check',
            description: 'Potential root or emulator detected.',icon: Icons.security,status: SecurityStatus.danger),
          SecurityAwarenessCard(), ], ),); }}
enum SecurityStatus { safe, warning, danger }
class SecurityItem extends StatelessWidget {
  final String title; final String description;final IconData icon;
  final SecurityStatus status;
  const SecurityItem({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.status,
  });
  Color get statusColor {
    switch (status) {
      case SecurityStatus.safe:
        return Colors.green;
      case SecurityStatus.warning:
        return Colors.orange;
      case SecurityStatus.danger:
        return Colors.red;
    }  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        leading: Icon(icon, size: 32, color: statusColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Icon(Icons.circle, size: 14, color: statusColor,
        ),),);}}
class SecurityAwarenessCard extends StatelessWidget {
  const SecurityAwarenessCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      elevation: 2,
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Security Awareness Tips',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), ),
            SizedBox(height: 10),
            Text('• Enable PIN, pattern, or biometric lock'),
            Text('• Avoid granting unnecessary permissions'),
            Text('• Do not install apps from unknown sources'),
            Text('• Keep your OS and apps updated'),
            Text('• Avoid using rooted or emulated devices'),
          ],
        ),
      ),
    );
  }
}
