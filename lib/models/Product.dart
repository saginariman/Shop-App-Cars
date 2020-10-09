import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{

  final String id;
  final String title;
  final String description;
  final String imgUrl;
  final color;
  final int price;


  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imgUrl,
    @required this.color,
    @required this.price,
  });
}

class ProductDataProvider with ChangeNotifier{
  List<Product> _items = [
    Product(
      id: 'p3',
      title: 'Желтый мустанг',
      description: 'Желатая скорость машины',
      price: 250,
      imgUrl:'http://art-if.ru/images/joomgallery/thumbnails/_17/_45/ford_101/05676_ford_mustang_gt_r_concept_20160425_1856778839.jpg',
      color: '0xFFFFF59D'
    ),

    Product(
        id: 'p1',
        title: 'Синий мустанг',
        description: 'Синий скорость машины',
        price: 430,
        imgUrl:'https://i.ebayimg.com/images/g/6FQAAOSwzI5bbCIV/s-l300.jpg',
        color: '0xFFBBDEFB'
    ),

    Product(
        id: 'p2',
        title: 'Красный мустанг',
        description: 'Красная скорость машины',
        price: 360,
        imgUrl:'https://ksb-poslovanje.hr/lib/plugins/thumb.php?src=https://ksb-poslovanje.hr/upload_data/site_photos/1818747293797214863496820317_thumb.php.jpg&w=250&h=300&zc=1',
        color: '0xFFF8BBD0'
    ),

    Product(
        id: 'p4',
        title: 'Зеленый мустанг',
        description: 'Зеленая скорость машины',
        price: 510,
        imgUrl:'https://sun9-13.userapi.com/c847121/v847121245/16da1f/QJVUkrHVZS8.jpg?ava=1',
        color: '0xFFCCFF90'
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id)
  => _items.singleWhere((element) => element.id == id);
}