import 'package:flutter_excercises/pages/cas_global.dart';
import 'package:flutter_excercises/pages/cas_reginal.dart';
import 'package:flutter_excercises/pages/rdc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excercises/services/api/covid_api.dart';
import 'package:flutter_excercises/services/model/covid_model.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

   Future <CovidModel> futureCovid;
  @override
  void initState() {
    super.initState();
    futureCovid = CovidApi().getCovidInfo();
  }

  //Properties
  int currentTab = 0;

  final List<Widget> screens = [
    GlobalInfo(),
    RegionalInfo(),
    DrcInfo(),
  ];

  //Page active
  Widget currentScreen = GlobalInfo();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, 
      child: currentScreen
      ),

        //Bottom App bar
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                  FutureBuilder(
                      future: futureCovid,
                      builder:(context, snapshot){
                        if(!snapshot.hasData){

                        }
                        return  Row(
                          children: <Widget>[
                            //Mondial
                            MaterialButton(
                              minWidth: 34,
                              onPressed: () {
                                setState(() {
                                  currentScreen = GlobalInfo(covidModel: snapshot.data);
                                  currentTab = 0;
                                },);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.vpn_lock,
                                  color: currentTab == 0 ? Color(0xFF8b0000) : Colors.black,),
                                  Text('Monde', style: TextStyle(color:currentTab == 0 ? Color(0xFF8b0000) : Colors.black,),)
                                ],
                              ),
                            ),

                            //Regional
                            MaterialButton(
                              minWidth: 34,
                              onPressed: () {
                                setState(() {
                                  currentScreen = RegionalInfo();
                                  currentTab = 1;
                                },);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.language,
                                  color: currentTab == 1 ? Color(0xFF8b0000) : Colors.black,),
                                  Text('Regional', style: TextStyle(color:currentTab == 1 ? Color(0xFF8b0000) : Colors.black,),)
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                     ),

                //Second group of tabs
                Row(
                  children: <Widget>[

                    //Rdc
                    MaterialButton(
                      minWidth: 34,
                      onPressed: () {
                        setState(() {
                          currentScreen = DrcInfo();
                          currentTab = 2;
                        },);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.flag,
                          color: currentTab == 2 ? Color(0xFF8b0000) : Colors.black,),
                          Text('RDC', style: TextStyle(color:currentTab == 2 ? Color(0xFF8b0000) : Colors.black,),)
                        ],
                      ),
                    ),

                    //Configurations
                    MaterialButton(
                      minWidth: 34,
                      onPressed: () {
                        setState(() {
                          currentScreen = DrcInfo();
                          currentTab = 3;
                        },);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.settings,
                          color: currentTab == 3 ? Color(0xFF8b0000) : Colors.black,),
                          Text('Config', style: TextStyle(color:currentTab == 3 ? Color(0xFF8b0000) : Colors.black,),)
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
    );
  }
}