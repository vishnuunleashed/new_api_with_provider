
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {

  NewsCard({this.map});

  final Map<String,dynamic>? map;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('${map!['urlToImage']}'),
            SizedBox(height: 10,),
            Text("${map!["title"]}",
              style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15 ),),
            SizedBox(height: 10,),
            Text("${map!["description"]}",
              style: TextStyle(fontSize: 10 ),)
          ],
        ),
      ),
    );
  }
}
