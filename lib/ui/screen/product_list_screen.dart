import 'dart:convert';
import 'package:crud_app/ui/screen/add_new_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../models/product.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatefulWidget{
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>{

  List<Product> productList=[];
  bool _getProductListProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List') ,
      ),
      body: Visibility(
        visible: _getProductListProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context,index){
              return ProductItem(
                product: productList[index],
              );
            }

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, AddNewProductScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _getProductList() async {
    _getProductListProgress= true;
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Response response = await get(uri);
    if(response.statusCode == 200){
      final decodeData= jsonDecode(response.body);
      for( Map<String,dynamic> p in decodeData['data']){
        Product product = Product(
          id: p['_id'],
          ProductName: p['ProductName'],
          ProductCode: p['ProductCode'],
          Img: p['Img'],
          UnitPrice: p['UnitPrice'],
          TotalPrice: p['TotalPrice'],
          CreatedDate: p['CreatedDate'],
          Qty: p['Qty'],
        );
        productList.add(product);
      }
      setState(() {});
    }
    _getProductListProgress= false;
    setState(() {});
  }
}