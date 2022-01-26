import 'package:flutter/material.dart';
import 'package:new_api_with_provider/pages/stories.dart';
import 'package:provider/provider.dart';

import 'models/new_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(colorScheme: ColorScheme.light(primary: Colors.blue,secondary: Colors.yellowAccent)),
      home: ChangeNotifierProvider(
          create: (context)=> NewsData(),
          builder: (context,child)=> StoriesPage()),
    );
  }
}
