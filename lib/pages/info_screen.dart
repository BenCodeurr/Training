import 'package:flutter/material.dart';
import 'package:flutter_excercises/widgets/casesDisplay.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<CovidInfo> getCovidInfo() async{
  final response = await http.get('https://coronavirus-19-api.herokuapp.com/all');

  if(response.statusCode == 200){
    return CovidInfo.fromJson(json.decode(response.body));
  }else{
    throw Exception('Impossible de charger les données');
  }
}

class CovidInfo {
  int cases;
  int deaths;
  int recovered;

  CovidInfo({this.cases, this.deaths, this.recovered});

  CovidInfo.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
  }
}

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
Future<CovidInfo> worldData;

  @override
  void initState() {
    super.initState();
    worldData = getCovidInfo();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF27243f),
      body: Column(
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top:20, left:5),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF800000),
                            Color(0xFFf50000)
                          ],
                          ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back_ios, 
                            color:Colors.white,
                            ),

                          Text(
                            'covid-19'.toUpperCase(),
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width:20),
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: -80,
                      child: Container(
                        width: 300,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            color: Colors.white
                          ),
                          ],
                        ),
                        
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          children: [TextSpan(
                                            text: 'Dernière mise à jour\n',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          TextSpan(
                                            text: '17 Mai à 09:00\n',
                                            style: TextStyle(
                                              color: Color(0xFFc70000)
                                            ),
                                          ),

                                          TextSpan(
                                            text: '_______________________________________',
                                            style: TextStyle(
                                              color: Color(0xFFc480607)
                                            ),
                                          ),
                                          ],
                                        ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 10)
                                ],
                              ),
                              ),
                            ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              StatusPanel(
                                color: Colors.blue,
                                cases: "1026" ,
                                title: 'Cas confirmés',
                              ),

                              StatusPanel(
                                color: Colors.red,
                                cases: "1028",
                                title: 'Décès',
                              ),

                              StatusPanel(
                                color: Colors.green,
                                cases: "10292",
                                title: 'Guéris',
                              ),
                            ],
                          ),

                          ],
                        ),
                      ),
                      ),
                ],
              ),
            ],
          ),
        //),
    );
  }
}
