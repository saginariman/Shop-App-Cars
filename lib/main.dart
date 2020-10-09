import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_cars/models/Product.dart';
import 'package:shop_app_cars/pages/home_page.dart';

import 'models/Cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context)=>ProductDataProvider(),
        ),
        ChangeNotifierProvider<CartDataProvider>(
          create: (context)=>CartDataProvider(),
        ),
      ],
    child: MaterialApp(
      title: 'Car Shop',
      theme: ThemeData(
        primaryColor: Colors.black,
        backgroundColor: Colors.white,
        textTheme: GoogleFonts.marmeladTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
    ),);
  }


}
