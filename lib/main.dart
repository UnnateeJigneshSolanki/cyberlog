import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CyberLogDashboard(),
    );
  }
}

class CyberLogDashboard extends StatelessWidget {
  const CyberLogDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 145, 167),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 145, 167),
        title: const Text("CyberLog Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _dashboardCard("Daily Log", Icons.today),
            _dashboardCard("Cyber Tips", Icons.security),
            _dashboardCard("Device Security", Icons.devices),
            _dashboardCard("Notes", Icons.note),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 66, 65, 65),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 36),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
