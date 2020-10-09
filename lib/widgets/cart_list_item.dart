import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_cars/models/Cart.dart';

import 'cart_items.dart';

class CartItemList extends StatelessWidget{
  final cartData;

  const CartItemList({Key key, this.cartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: cartData.cartItemsCount,
          itemBuilder: (context, index){
            return Dismissible(
              key: ValueKey(cartData.cartItems.keys.toList()[index]),
              background: Container(
                child: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                  size: 30.0,
                ),
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                padding: const EdgeInsets.only(right: 10.0),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction)=>
                  Provider.of<CartDataProvider>(context, listen: false)
                    .deleteItem(cartData.cartItems.keys.toList()[index]),
              child: CartItem(
                  cartData: cartData,
                  index: index),
            );
          },
      ),
    );
  }

}