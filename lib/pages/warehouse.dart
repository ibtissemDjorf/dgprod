import 'dart:convert';

import 'package:dgprod/core/res/color.dart';
import 'package:dgprod/widgets/warehouseWidget.dart'; 
import 'package:flutter/material.dart';
import '../models/warehouseModel.dart';
import '../network_utils/api.dart';


class MyWarehouse extends StatefulWidget {
  const MyWarehouse( {Key? key}) : super(key: key);

  @override
  State<MyWarehouse> createState() => _MyWarehouseState();
}
class _MyWarehouseState extends State<MyWarehouse> {
bool _isLoading = true;
bool _nodata = false;
List<WarehouseModel> warehouses = [];
List  produitsFinis = [];

getWarhous() async { 
  var body = await Network().getData('/depots-app');
  
  if(body == 'error'){
   print('error');
   setState(() {
    _isLoading = false;
    _nodata = true;
 });
 return;
 }
 Map data = jsonDecode(body);
 List depots = data["data"];
 //add warehouses to lise
 for(final element in depots){
   warehouses.add(WarehouseModel.fromJson(element));
   //add products to lise
  }
 setState(() {
   _isLoading = false;
 });

}

@override
  void initState() {
    
    getWarhous();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryColor,),
        title: Text("Dépots produits",
        style: TextStyle(
          fontSize: 20,
          color: AppColors.primaryColor,
          fontStyle: FontStyle.italic,
          fontFamily: 'Times New Roman',
          fontWeight: FontWeight.bold,
        ),),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
         SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: AppColors.bgbodyColor,
              ),
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    
                    padding: EdgeInsets.symmetric(
                      vertical: 24.0,
                    ),
                    child: _nodata ? Center(
                      child: Column(children: [
                        Icon(Icons.error_outline,
                      color: Colors.red[400],
                      size: 50,),
                        Text('Erreur de connexion serveur',
                        style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[400],
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                      ),),
                      
                      ],),
                    ) :(_isLoading ?
                      Center(child: CircularProgressIndicator())
                      : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: warehouses.length,
                    itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            //print(warehouses.elementAt(index).name);
                            Navigator.of(context).pushNamed("warehouseDetails", arguments: 
                              warehouses[index].id
                            );
                          }, 
                          child: WarehouseContainer(
                          warehouseInst: warehouses[index]
                          ));
                      
                    }))
                    
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }}
