import 'package:crud_app/ui/screen/add_new_product_screen.dart';
import 'package:crud_app/ui/screen/product_list_screen.dart';
import 'package:crud_app/ui/screen/update_product_screen.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget{
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ProductListScreen(),
        AddNewProductScreen.name: (context) => const AddNewProductScreen(),
        UpdateProductScreen.name: (context) => const UpdateProductScreen(),
      },
    );

  }

}