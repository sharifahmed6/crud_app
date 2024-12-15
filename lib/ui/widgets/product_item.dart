import 'package:crud_app/models/product.dart';
import 'package:crud_app/ui/screen/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {

    return ListTile(
       leading: Image.network(widget.product.Img ?? 'Null',width: 70,height: 70,),
      title: Text(widget.product.ProductName ?? ''),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${widget.product.ProductCode ?? ''}'),
          Text('Quantity: ${widget.product.Qty ?? ''}'),
          Text('Unit Price: ${widget.product.UnitPrice ?? ''}'),
          Text('Total Price: ${widget.product.TotalPrice ?? ''}'),
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
                                _deleteProduct();
                                Navigator.pop(
                                  context,
                                );
                              },
                              child: Text('Yes')),
                        ],
                      );
                    });

              },
              icon: Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, UpdateProductScreen.name,
                    arguments: widget.product);
              },
              icon: Icon(Icons.edit)),
        ],
      ),
    );
  }

  Future<void> _deleteProduct() async {
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/${widget.product.id}');
    Response response = await get(uri);

    if(response.statusCode == 200){
    delete(uri);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product Item Deleted')),
    );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product Item Delete Failed')),
      );
    }

  }
}
