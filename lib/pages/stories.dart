import 'package:flutter/material.dart';
import 'package:new_api_with_provider/Cards/news_card.dart';
import 'package:new_api_with_provider/models/new_data.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            context.read<NewsData>().fetchData();
          }, icon: Icon(Icons.refresh))
        ],
        centerTitle: true,
        title: Text("Top News Stories"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<NewsData>().fetchData();
        },
        child:
            Center(
                child: Consumer<NewsData>(
                    builder: (context, value, child) {
          return value.map.length == 0
              ? CircularProgressIndicator()
              : ListView.builder(
              itemCount: value.map["articles"].length,
              itemBuilder: (context, index) {
                  return NewsCard(
                    map: value.map["articles"][index],
                  );
                });
        })),
      ),
    );
  }
}
