import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_cars/models/Product.dart';
import 'package:shop_app_cars/widgets/ItemCard.dart';
import 'package:shop_app_cars/widgets/bottom_bar.dart';
import 'package:shop_app_cars/widgets/catalog.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            )
          ),
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              Container(
                child: ListTile(
                  title: Text("New Cars", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  subtitle: Text("More than 100 cars", style: TextStyle(fontSize: 16) ,),
                  trailing: Icon(Icons.directions_car),
                ),
              ),

              Container(
                padding: EdgeInsets.all(5.0),
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.items.length,
                  itemBuilder: (context, int index)=>
                    ChangeNotifierProvider.value(
                        value: productData.items[index],
                        child: ItemCard(),
                    ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Catalog Cars"),
              ),

              ...productData.items.map((value) {
                return CatalogListTile(imgUrl: value.imgUrl);
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

}