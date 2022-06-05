import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network{
  final String _url = 'http://192.168.1.240:8082/api';
  //if you are using android studio emulator, change localhost to 10.0.2.2
  String token = '';

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? tokenexist = localStorage.getString('token');
    if(tokenexist != null)
    token = tokenexist;
  }
  
  authData(data, apiUrl) async {
    Uri fullUrl = Uri.parse(_url + apiUrl);
    http.Response res = await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders());
          //print('raa'+res.body);

          if(res.statusCode == 401){
            //signOut();
          }
          if(res.statusCode == 999){
            return 999;
          }
          print(res.body);
    return res.body;

  }

  getData(apiUrl) async {
    Uri fullUrl = Uri.parse(_url + apiUrl);
    await _getToken();
    http.Response res = await http.get(
        fullUrl,
        headers: _setHeaders()).timeout(const Duration(seconds: 10),onTimeout: (){
    return http.Response('Error', 999);
  });
  //print('raa'+res.body);

  if(res.statusCode == 401){
    //signOut();
  }
  if(res.statusCode == 999){
    return 'error';
      }
  return res.body;
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

}