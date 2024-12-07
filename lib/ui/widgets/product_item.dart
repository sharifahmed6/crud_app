import 'package:crud_app/models/product.dart';
import 'package:crud_app/ui/screen/update_product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network(product.Img ?? 'Null'),
      title: Text(product.ProductName ?? 'N'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.ProductCode ?? 'N'}'),
          Text('Quantity: ${product.Qty ?? ''}'),
          Text('Unit Price: ${product.UnitPrice ?? ''}'),
          Text('Total Price: ${product.TotalPrice ?? ''}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete'),
                        content: Text('Are You Sure! Your product delete?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Yes')),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, UpdateProductScreen.name);
              },
              icon: Icon(Icons.edit)),
        ],
      ),
    );
  }
}
