import 'package:flutter/material.dart';
import 'package:shop_app_cars/pages/catalog_page.dart';

class CatalogListTile extends StatelessWidget{
  final imgUrl;
  const CatalogListTile({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>ItemCatalog(imgUrl: imgUrl,),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover
              ),
            ),
          ),
          title: Text('Top New Cars'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('09:00 - 00:00'),
              Row(
                children: [
                  Icon(Icons.star, size: 15, color: Colors.amber,),
                  Text('4.9'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}