
import 'package:flutter/cupertino.dart';
import 'package:flutter_excercises/services/model/covid_model.dart';

class CovidRepo with ChangeNotifier{

  CovidModel covidModel;

  updateState(CovidModel covidModel){
    this.covidModel=covidModel;
  }

}