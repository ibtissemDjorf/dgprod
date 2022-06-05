 import 'package:dgprod/models/warehouseModel.dart';
import 'package:dgprod/pages/login.dart';
 import 'package:dgprod/pages/warehouse.dart';
import 'package:dgprod/pages/warehouseDatails.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';
class Routerr {
static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => MyHome());
      case 'login':
        return MaterialPageRoute(builder: (_) => myLogin());
      case 'warehouse': 
        return MaterialPageRoute(builder: (_) => MyWarehouse());
      case 'warehouseDetails':
      int mpArgs = settings.arguments as int ;
        return MaterialPageRoute(builder: (_) => WarehouseDetails(id: mpArgs,));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
  }