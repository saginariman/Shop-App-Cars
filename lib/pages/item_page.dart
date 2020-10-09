import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_cars/models/Cart.dart';
import 'package:shop_app_cars/models/Product.dart';

import 'cart_page.dart';

class ItemPage extends StatelessWidget{
  final String productId;

  const ItemPage({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProductDataProvider>(context)
        .getElementById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title, style: GoogleFonts.marmelad(),),
      ),
      body: Container(
        child: ListView(
          children: [
            Hero(
              tag: data.imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Card(
              elevation: 5.0,
              margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text(data.title, style: TextStyle(fontSize: 26.0),),
                    Divider(),
                    Row(
                      children: [
                        Text("Worth", style: TextStyle(fontSize: 24.0),),
                        Text('${data.price}', style: TextStyle(fontSize: 26.0),),
                      ],
                    ),
                    Divider(),

                    Text(data.description),

                    SizedBox(
                      height: 20.0,
                    ),

                    Provider.of<CartDataProvider>(context)
                        .cartItems.containsKey(productId)
                    ? Column(
                      children: [
                        MaterialButton(
                          color:Colors.amber,
                          child:Text("Go to Basket"),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartPage(),
                            ));
                          },
                        ),
                      ],
                    )
                        : MaterialButton(
                      color:Colors.lightBlue,
                      child:Text("Add to Basket"),
                      onPressed: (){
                        Provider.of<CartDataProvider>(context,
                            listen: false).addItem(
                          productId: data.id,
                          imgUrl: data.imgUrl,
                          title: data.title,
                          price:data.price,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}