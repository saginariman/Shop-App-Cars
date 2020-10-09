import 'package:flutter/material.dart';

class ItemCatalog extends StatelessWidget{
  final String imgUrl;

  const ItemCatalog({Key key, this.imgUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog of cars'),
      ),

      body: Container(
        margin: EdgeInsets.all(30.0),
        child: GridView.count(
            crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 1,
          children: [
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
            _buildItem(imgUrl),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String imgUrl) => Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(imgUrl),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3.0,
          blurRadius: 5.0
        ),
      ],
      color: Colors.lime,
    ),
    child: Text(
      "Car",
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        backgroundColor: Colors.black45,
      ),
    ),
  );
}