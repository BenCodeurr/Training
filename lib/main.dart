import 'package:flutter/material.dart';
import 'package:flutter_excercises/services/repo/covid_repo.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CovidRepo(),
      child: MaterialApp(
        title: 'Fight Corona',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Ubuntu",
        ),
        home: HomePage(),
      ),
    );
  }
}
