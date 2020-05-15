import 'package:flutter/material.dart';
import 'package:flutter_excercises/services/model/covid_model.dart';
import 'package:flutter_excercises/widgets/casesDisplay.dart';


class GlobalInfo extends StatelessWidget{

final CovidModel covidModel;

const GlobalInfo({Key key, this.covidModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF27243f),
      appBar: AppBar(
        title: Text('COVID-19'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
        backgroundColor: Color(0xFF800000),
      ),
      body: Column(
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 120,
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
                        
                        child:  Column(
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
                                    cases: "${covidModel.cases}" ,
                                    title: 'Cas confirmés',
                                  ),

                                  StatusPanel(
                                    color: Colors.red,
                                    cases: "${covidModel.deaths}",
                                    title: 'Décès',
                                  ),

                                  StatusPanel(
                                    color: Colors.green,
                                    cases: "${covidModel.recovered}",
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
    );
  }
}
