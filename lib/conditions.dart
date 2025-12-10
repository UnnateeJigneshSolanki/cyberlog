import 'package:flutter/material.dart';
void main() {
  runApp(const OddEvenDemo());
}
class OddEvenDemo extends StatelessWidget {
  const OddEvenDemo({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String result = "";
    return MaterialApp(
      home: Scaffold(
        body: StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: controller, decoration: const InputDecoration(
                    labelText: "Enter a number",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 86, 147),    
                      foregroundColor: Colors.white,  
                    ),
                    onPressed: () {
                      int number = int.parse(controller.text);
                      if (number % 2 == 0) {
                        result = "The number $number is Even.";
                      } else {
                        result = "The number $number is Odd.";
                      }
                  setState(() {});
                    },
                    child: const Text("Check"),
                  ),
                  Text(
                    "$result",   
                    style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 134, 45, 150),),
                    
                  ),   ], ),  );
          }, ), ),  );
  }
}