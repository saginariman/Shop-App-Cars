import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_cars/models/Cart.dart';
import 'package:shop_app_cars/models/Product.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_cars/pages/item_page.dart';
class ItemCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(int.parse(product.color)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) =>
                    ItemPage(productId: product.id,)),);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(product.imgUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Container(
                  child: Text(
                    '${product.title}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                  ),
                ),
              ],
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${product.price}'),
                IconButton(
                  icon: Icon(Icons.add_circle_outline,color: Colors.black,),
                  onPressed: (){
                    Provider.of<CartDataProvider>(context, listen: false)
                        .addItem(
                          productId: product.id,
                          price: product.price,
                          title: product.title,
                          imgUrl: product.imgUrl,
                        );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}