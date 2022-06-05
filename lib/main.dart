import 'package:device_preview/device_preview.dart';

import 'routing.dart';
import 'package:dgprod/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'methodes/sharedpreferences.dart';
import 'pages/login.dart';


Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
print(SharedPreference.pref!.getString('token'));
  //runApp(const MyApp());
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your applicatio
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DGProduction',
      
      home: CheckAuth(),
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Routerr.generateRoute ,
      initialRoute: SharedPreference.pref!.getString('token') == null? 'login' : 'home',
      
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = MyHome();
    } else {
      child = myLogin();
    }
    return Scaffold(
      body: child,
    );
  }
}

