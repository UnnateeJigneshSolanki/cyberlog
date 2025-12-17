import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class Log {
  String action;
  DateTime timestamp;
  String status;
  Log({required this.action, required this.timestamp, required this.status});
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    List<Log> logs = [
      Log(action: "Sign-in", timestamp: DateTime.now(), status: "Active"),
      Log(action: "Logout", timestamp: DateTime.now().add(const Duration(minutes: 5)), status: "Success"), ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Portfolio Assignment")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text("LOGS:",
      style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple,
      ),),
    ...logs.map( (log) => Text("${log.action} -- ${log.timestamp}",
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),     ),    ),
    const SizedBox(height: 20),
    const Text("STATUS:",
      style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple,
      ),    ),
    ...logs.map((log) => Text(log.status,
        style: TextStyle(  fontSize: 16,
          color: log.status.toLowerCase() == "active" ? Colors.green : Colors.blue, 
        ),    ),   ),
    const SizedBox(height: 20),
 ],), ),  ),  ); } }
