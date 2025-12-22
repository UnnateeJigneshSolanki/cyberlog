

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CartModel(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CartScreen(),
    );
  }
}
class CartModel extends ChangeNotifier {
  int qty = 0;
  final int unitPrice = 50;
  int get totalPrice => qty * unitPrice;
  void add() {
    qty++;
    notifyListeners();
  }
  void remove() {
    if (qty > 0) {
      qty--;
      notifyListeners();
}}}
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart'),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: const Color(0xFFF4F6FA),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Card( elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding( padding: const EdgeInsets.all(16),
            child: Column( mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ const Text('Notebook', style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold,color: Colors.indigo),),
              const SizedBox(height: 4),
              const Text('₹50 per item',style: TextStyle(color: Colors.grey) ),
              const SizedBox(height: 12),
              const Divider(),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ Text( 'Quantity: ${cart.qty}',
                      style: const TextStyle(fontSize: 16)),
            Row( children: [IconButton(icon: const Icon(Icons.remove_circle_outline),color: Colors.redAccent,
                 onPressed: () => context.read<CartModel>().remove()),
            IconButton(icon: const Icon(Icons.add_circle_outline),color: Colors.green,
            onPressed: () =>context.read<CartModel>().add(),
 ), ], ),],),
const SizedBox(height: 12),
const Divider(),
                Container(padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EBFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text( 'Total Amount',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo), ),
                      Text('₹${cart.totalPrice}',style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
