import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(1),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(strokeAlign: 1),
            ),
            child: const Text(
              'Cart',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
