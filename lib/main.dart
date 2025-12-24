import 'package:flutter/material.dart';import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox('checklist');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFE8F5E9),
          appBarTheme: const AppBarTheme( backgroundColor: Color(0xFF388E3C), foregroundColor: Colors.white), ),
        home: const ChecklistScreen(),
);}
class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});
  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}
class _ChecklistScreenState extends State<ChecklistScreen> {
  final box = Hive.box('checklist');
  List<Map<String, dynamic>> get tasks {
    final rawList = box.get('tasks', defaultValue: []);
    return List<Map<String, dynamic>>.from(rawList.map((e) => Map<String, dynamic>.from(e)));
  }
  void _addTask(String title) {
    final t = tasks;
    t.add({'title': title, 'done': false});
    box.put('tasks', t);
    setState(() {});
  }
  void _toggleTask(int index) {
    final t = tasks;
    t[index]['done'] = !t[index]['done'];
    box.put('tasks', t);
    setState(() {});
  }
  void _showAddTaskDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Task'),
        content: TextField(controller: controller, autofocus: true),
        actions: [ TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton( onPressed: () {if (controller.text.trim().isNotEmpty) _addTask(controller.text.trim());
                Navigator.pop(context);
              }, child: const Text('Add'))
        ], ), ); }
  @override
  Widget build(BuildContext context) {
    final t = tasks;
    return Scaffold( appBar: AppBar(title: const Text('Daily Checklist')),
      body: Padding( padding: const EdgeInsets.all(12),
        child: Column( children: [
            Expanded( child: t.isEmpty ? const Center( child: Text( 'No tasks yet.\nAdd a task to start!',
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Color(0xFF2E7D32)),
                      ), ): ListView.builder(itemCount: t.length,itemBuilder: (_, i) => CheckboxListTile(
                      title: Text(t[i]['title'],style: TextStyle(decoration: t[i]['done'] ? TextDecoration.lineThrough : null,
                            color: t[i]['done'] ? const Color(0xFF2E7D32) : Colors.black87,),),
                        value: t[i]['done'], onChanged: (_) => _toggleTask(i),
                      ), ), ),
            SizedBox( width: double.infinity,
              child: ElevatedButton( onPressed: _showAddTaskDialog, style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF66BB6A),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    textStyle: const TextStyle(fontSize: 18)), child: const Text('Add Task'),
              ),),], ),
      ),); }
}
