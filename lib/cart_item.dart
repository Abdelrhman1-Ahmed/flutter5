import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Product image
      leading: Image.asset('assets/image/Group 6858.png'),

      // Product name
      title: const Text('Bell Pepper Red'),

      // Details (weight & price selector)
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('1kg, Price'),
          // Simple quantity selector
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.remove),
              SizedBox(width: 10),
              Text('1'), // static placeholder; replace with a real value later
              SizedBox(width: 10),
              Icon(Icons.add),
            ],
          ),
        ],
      ),

      // Delete icon and total price
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.delete),
          Text('\$4.99'),
        ],
      ),
    );
  }
}
