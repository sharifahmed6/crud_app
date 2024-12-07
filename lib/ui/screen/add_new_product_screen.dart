import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  static const String name= '/add_new_product';

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _nameTEControlar = TextEditingController();
  final TextEditingController _priceTEControlar = TextEditingController();
  final TextEditingController _totalTEControlar = TextEditingController();
  final TextEditingController _imageTEControlar = TextEditingController();
  final TextEditingController _quantityTEControlar = TextEditingController();
  final TextEditingController _codeTEControlar = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _addProductInprogress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Product'),),
      body: Visibility(
        visible: _addProductInprogress == false,
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
      key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameTEControlar,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
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
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                _addNewProduct();
              }

            }, child: Text('Submit'))
          ],
        ),
      );
  }

  Future<void> _addNewProduct() async{
    _addProductInprogress = true;
    setState(() {

    });
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');

    Map<String,dynamic> requestBody ={
      "ProductName": _nameTEControlar.text.trim(),
      "ProductCode": _codeTEControlar.text.trim(),
      "Img": _imageTEControlar.text.trim(),
      "UnitPrice": _priceTEControlar.text.trim(),
      "Qty": _quantityTEControlar.text.trim(),
      "TotalPrice": _totalTEControlar.text.trim(),

    };

    Response response = await post(
      uri,
      headers: {'content-type': 'application/json'},
      body: jsonEncode(requestBody),
    );
    _addProductInprogress= false;
    setState(() {

    });
    if(response.statusCode == 200){
      _cleatTextFeild();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Success')),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('feaild')),
      );
    }
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
