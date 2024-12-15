import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../models/product.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product});

  static const String name = '/update_product';

  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _nameTEControlar = TextEditingController();
  final TextEditingController _priceTEControlar = TextEditingController();
  final TextEditingController _totalTEControlar = TextEditingController();
  final TextEditingController _imageTEControlar = TextEditingController();
  final TextEditingController _quantityTEControlar = TextEditingController();
  final TextEditingController _codeTEControlar = TextEditingController();

  bool _updateProductIndicator = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTEControlar.text = widget.product.ProductName ?? '';
    _priceTEControlar.text = widget.product.UnitPrice ?? '';
    _totalTEControlar.text = widget.product.TotalPrice ?? '';
    _imageTEControlar.text = widget.product.Img ?? '';
    _quantityTEControlar.text = widget.product.Qty ?? '';
    _codeTEControlar.text = widget.product.ProductCode ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: Visibility(
        visible: _updateProductIndicator == false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _buildProductForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildProductForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _nameTEControlar,
            decoration:
                InputDecoration(hintText: 'Name', labelText: 'Product Name: '),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your Product Name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _priceTEControlar,
            decoration: InputDecoration(
                hintText: 'Price', labelText: 'Product Price: '),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your Product Price';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalTEControlar,
            decoration: InputDecoration(
                hintText: 'Total Price', labelText: 'Product Total Price: '),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your Product Total Price';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityTEControlar,
            decoration: InputDecoration(
                hintText: 'Quantity', labelText: 'Product Quantity: '),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your Product Quantity';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _codeTEControlar,
            decoration:
                InputDecoration(hintText: 'Code', labelText: 'Product Code: '),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your Product Code';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageTEControlar,
            decoration: InputDecoration(
                hintText: 'Image', labelText: 'Product Image Url: '),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your Product Image Url';
              }
              return null;
            },
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                 _updateProduct();
              },
              child: Text('Update'))
        ],
      ),
    );
  }

  Future<void> _updateProduct() async {
_updateProductIndicator = true;
setState(() {

});
    Uri uri = Uri.parse(
        'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}');
    Map<String, dynamic> requestBody = {
      "ProductName": _nameTEControlar.text.trim(),
      "ProductCode": _codeTEControlar.text.trim(),
      "Img": _imageTEControlar.text.trim(),
      "UnitPrice": _priceTEControlar.text.trim(),
      "Qty": _quantityTEControlar.text.trim(),
      "TotalPrice": _totalTEControlar.text.trim(),
    };
    Response response = await post(
      uri,
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(requestBody),
    );
    if (response.statusCode == 200) {
      _cleatTextFeild();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product Update Success')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product Update Failed')),
      );
    }
    _updateProductIndicator= false;
    setState(() {

    });
  }

  void _cleatTextFeild(){
    _nameTEControlar.clear();
    _priceTEControlar.clear();
    _totalTEControlar.clear();
    _imageTEControlar.clear();
    _quantityTEControlar.clear();
    _codeTEControlar.clear();
  }
  @override
  void dispose() {
    _nameTEControlar.dispose();
    _priceTEControlar.dispose();
    _totalTEControlar.dispose();
    _imageTEControlar.dispose();
    _quantityTEControlar.dispose();
    _codeTEControlar.dispose();
    super.dispose();
  }
}
