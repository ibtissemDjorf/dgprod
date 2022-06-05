import 'dart:convert';
import 'package:dgprod/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../methodes/sharedpreferences.dart';
import 'home.dart';
 
final Uri _app_url = Uri.parse('https://www.dgsoftwareplus.com/developpements/5');


void _launch_app_Url() async {
  if (!await launchUrl(_app_url)) throw 'Could not launch $_app_url';
}

/*import 'package:dg_prod/Utilities/routes.dart';*/

class myLogin extends StatefulWidget {
  const myLogin({Key? key}) : super(key: key);
  
  @override
  _myLoginState createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    SnackBar snackBar = SnackBar(
  content: Text(msg),
);
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor:Colors.white,
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 30,),
              Image.asset(
                'assets/images/version_control.png',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 25,),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('DGProduction',
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 35,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(
                        milliseconds: 450,
                      )),
                ],
                onTap: () {
                  debugPrint("Welcome back!");
                },
                isRepeatingAnimation: true,
                totalRepeatCount: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: "Entrez votre email / nom d'utilisateur",
                          labelText: 'Email ou nom utilisateur',
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (emailValue) {
                          if (emailValue != null && emailValue.isEmpty) {
                            return 'Please enter email';
                          }
                          email = emailValue;
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'Entrer votre mot de passe',
                          labelText: 'Mot de passe',
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (passwordValue){
                          if (passwordValue != null && passwordValue.isEmpty) {
                            return 'Please enter some text';
                          }
                          password = passwordValue;
                          return null;
                        },
                      ),
                      SizedBox(height: 25,),
                      _isLoading ?
                      CircularProgressIndicator()
                      :
                      TextButton.icon(
                        onPressed: (() {
                          if ( _formKey.currentState!.validate()) {
                                          _login();
                        }}),
                        icon: const Icon(Icons.login),
                        label: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 35,
                          child: const Text(
                            'Connexion',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Text("Veuillez télécharcher l'application pour créer un compte!", 
                        style: 
                          TextStyle(
                            color: Colors.red,
                            ),
                            textAlign: TextAlign.center,),
                      Row(
                        children: [
                          TextButton(
                            
                            onPressed: _launch_app_Url,
                            child: const Text(
                              'Créer compte',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),],
      ),
    );
  }



void _login() async{
    setState(() {
      _isLoading = true;
    });
 //await Future.delayed(const Duration(seconds: ), (){});
    Map data = {
      'email' : email,
      'password' : password
    };

    var body = await Network().authData(data, '/login');
    
    switch(body){
      case '0':
      _showMsg("Session éxpirée! Veuillez contacter votre administrateur");
          break;
      case '1':
      _showMsg("Email bloqué! Veuillez contacter votre administrateur");
          break;
      case '3':
      _showMsg('Email ou mot de passe incorrecte');
          break;
      case '999':
      _showMsg('Pas de connexion');
          break;
     default :
     print('login');
     Map data = jsonDecode(body);
    /// print(SharedPreference.pref!.getString('token'));
     //print(data['token']); 
      SharedPreference.pref!.setString('token', data['token']);
      SharedPreference.pref!.setString('user', data['data']);
      Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
          break;
    }
    
    setState(() {
      _isLoading = false;
    });

  }
}