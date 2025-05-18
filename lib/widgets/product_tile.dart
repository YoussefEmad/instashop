import 'package:flutter/material.dart';

import '../models/product.dart';
import '../screens/product/product_details_screen.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final bool isInCart;
  final VoidCallback onTap;

  const ProductTile({
    required this.product,
    required this.isInCart,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(product.image, width: 50),
            SizedBox(height: 8),
            Text('£${product.price.toInt()}'),
            TextButton(
              onPressed: onTap,
              child: Text(isInCart ? 'Remove' : 'Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
