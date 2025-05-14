import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final total = ref.read(cartProvider.notifier).totalprice;

    return Scaffold(
      appBar: AppBar(title: Text('Your cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (_, index) {
                final item = cart[index];
                return ListTile(
                  leading: Image.asset(item.image, width: 40),
                  title: Text(item.title),
                  trailing: Text('£${item.price.toInt()}'),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Total Price - £${total.toInt()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
