import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  static const String name= '/update_product';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Product'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildProductForm(),
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
            decoration: InputDecoration(
                hintText: 'Name',
                labelText: 'Product Name: '
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Your Product Name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _priceTEControlar,
            decoration: InputDecoration(
                hintText: 'Price',
                labelText: 'Product Price: '
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Your Product Price';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalTEControlar,
            decoration: InputDecoration(
                hintText: 'Total Price',
                labelText: 'Product Total Price: '
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Your Product Total Price';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityTEControlar,
            decoration: InputDecoration(
                hintText: 'Quantity',
                labelText: 'Product Quantity: '
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Your Product Quantity';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _codeTEControlar,
            decoration: InputDecoration(
                hintText: 'Code',
                labelText: 'Product Code: '
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Your Product Code';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageTEControlar,
            decoration: InputDecoration(
                hintText: 'Image',
                labelText: 'Product Image Url: '
            ),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter Your Product Image Url';
              }
              return null;
            },
          ),
          SizedBox(height: 16,),
          ElevatedButton(onPressed: (){}, child: Text('Update'))
        ],
      ),
    );
  }
  @override
  void dispose(){
    _nameTEControlar.dispose();
    _priceTEControlar.dispose();
    _totalTEControlar.dispose();
    _imageTEControlar.dispose();
    _quantityTEControlar.dispose();
    _codeTEControlar.dispose();
    super.dispose();
  }
}
