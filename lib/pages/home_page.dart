import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_excercises/pages/dashboard.dart';
import 'package:flutter_excercises/services/model/covid_model.dart';
import 'package:flutter_excercises/services/api/covid_api.dart';
import 'package:flutter_excercises/services/repo/covid_repo.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future <CovidModel> futureCovid;
  @override
  void initState() {
    super.initState();
    futureCovid = CovidApi().getCovidInfo();
  }
  
  @override
  Widget build(BuildContext context) {
    CovidRepo covidRepo=Provider.of<CovidRepo>(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Stack(
              children: <Widget>[
                Image.asset("assets/images/virus2.png"),
                _buildHeader(),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: TextSpan(
                text: "Symptomes du ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: "COVID 19",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                _buildSymptomItem("assets/images/1.png", "Fièvre"),
                _buildSymptomItem("assets/images/2.png", "Toux sèche"),
                _buildSymptomItem("assets/images/3.png", "Maux de tête"),
                _buildSymptomItem("assets/images/4.png", "Essoufflement"),
                _buildSymptomItem("assets/images/4.png", "Fatigue"),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Prevention",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                _buildPrevention(
                    "assets/images/a10.png", "LAVER", "souvent les mains"),
                _buildPrevention(
                    "assets/images/a4.png", "COUVRE", "toujours ta toux"),
                _buildPrevention(
                    "assets/images/a6.png", "SOIS", "toujours propre"),
                _buildPrevention(
                    "assets/images/a9.png", "UTILISE", "toujours ton masque"),
                _buildPrevention(
                    "assets/images/a9.png", "GARDE", "tes distances"),
              ],
            ),
          ),
          FutureBuilder<CovidModel>(
              future: futureCovid,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.white,),
                  );
                }
                covidRepo.updateState(snapshot.data);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ),
                    );
                  },
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1, 1),
                          spreadRadius: 1,
                          blurRadius: 1,
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/map.png"),
                        SizedBox(width: 15),
                        RichText(
                          text: TextSpan(
                            text: "CAS\n",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                            children: [
                              TextSpan(
                                text: "Aperçu mondial\n",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: "${snapshot.data.cases} confirmés",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: null,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                  ),
                );
              })
        ],
      ),
    );
  }

  Widget _buildPrevention(String path, String text1, String text2) {
    return Column(
      children: <Widget>[
        Container(
          width: 213,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              Image.asset(path),
              SizedBox(width: 10),
              RichText(
                text: TextSpan(
                    text: "$text1\n",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: text2,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ]),
              )
            ],
          ),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(height: 7),
      ],
    );
  }

  Widget _buildSymptomItem(String path, String text) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ],
          ),
          padding: EdgeInsets.only(top: 15),
          child: Image.asset(path),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(height: 7),
        Text(
          text,
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Text(
            "COVID 19",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
      ],
    );
  }
}
