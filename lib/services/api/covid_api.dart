import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_excercises/services/model/covid_model.dart';

class CovidApi{

final String baseUrl="https://coronavirus-19-api.herokuapp.com";

  Future<CovidModel> getCovidInfo() async{
    final response = await http.get('$baseUrl/all');
    print(response.body);

    if(response.statusCode == 200){
      return CovidModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Impossible de charger les données');
    }
  }
}