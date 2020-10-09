import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_cars/models/Cart.dart';
import 'package:shop_app_cars/pages/cart_page.dart';
import 'package:shop_app_cars/pages/item_page.dart';

class BottomBar extends StatelessWidget{
  BottomBar({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    final cartItems = cartData.cartItems;

    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
        ),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width /2 + 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                itemCount: cartItems.length,
                itemBuilder: (context, index) =>
                  Hero(
                    tag: cartItems.values.toList()[index].imgUrl,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) =>
                            ItemPage(productId: cartItems.keys.toList()[index],)),);

                      },

                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4.0,
                                  spreadRadius: 5.0,
                                  offset: Offset(-2, 2),
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(cartItems.values.toList()[index].imgUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                            right: 2,
                            bottom: 5,
                            child: Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color:Colors.black,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '${cartItems.values.toList()[index].number}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ),

            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 - 50,
              child: Row(
                children: [
                  Text(cartData.totalAmount.toString()),
                  IconButton(
                    icon: Icon(Icons.shopping_basket, color: Colors.black26,),
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        )
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}