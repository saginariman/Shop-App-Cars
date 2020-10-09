import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_cars/models/Cart.dart';
import 'package:shop_app_cars/widgets/cart_list_item.dart';

class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Basket'),
      ),
      body: cartData.cartItems.isEmpty
        ? Card(
        elevation: 5.0,
        margin: const EdgeInsets.all(30.0),
        child: Container(
          height: 100,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text('Basket is Empty',),
        ),
      )
            : Column(
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Worth: ' + cartData.totalAmount.toString(),
                style: TextStyle(fontSize: 20.0),
              ),

              MaterialButton(
                onPressed: (){
                  cartData.clear();
                },
                color: Colors.amberAccent,
                child: Text('Buy Now'),
              ),
            ],
          ),
          Divider(),

          Expanded(
              child: CartItemList(cartData: cartData)
          ),
        ],
      )
    );
  }


}