import 'dart:convert';
import 'package:dgprod/core/res/color.dart';
import 'package:dgprod/models/PFModel.dart';
import 'package:dgprod/network_utils/api.dart';
import 'package:flutter/material.dart';
import 'package:dgprod/widgets/PFDetailWidget.dart';

import '../models/warehouseModel.dart';

class WarehouseDetails extends StatefulWidget {
  int? id ;
  WarehouseDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<WarehouseDetails> createState() => _WarehouseDetailsState();
}

class _WarehouseDetailsState extends State<WarehouseDetails> {
  bool _isLoading = true;
  bool _nodata = false;
  pfModel? depotDetail ;
  getWarhous() async { 
  var body = await Network().getData('/depots-app/${widget.id}');

  if(body == 'error'){
   print('error');
   setState(() {
   _isLoading = false;
   _nodata = true;
 });
 return;
 }
 Map data = jsonDecode(body);


 setState(() {
  depotDetail = pfModel.fromJson(data['data'][0])  ;
   _isLoading = false;
 });
 print(depotDetail!.produitFinis![0].nom);

}

@override
  void initState() {
    // TODO: implement initState
    getWarhous();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
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
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: AppColors.bgbodyColor,
              ),
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                color: AppColors.bgcardColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Color.fromARGB(255, 233, 241, 249),
                  width: 2,

                ),
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
                
                ],),)
                : (
                  _isLoading ?
                      Center(child: CircularProgressIndicator())
                      :Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.warehouse_rounded,
                        color: Colors.orange,
                        size: 40,),
                        Text("widget.warehouse.name",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                          fontSize: 16.0,
                    ),),
                    ],
                  ),
                  
              Row(
                children: [
                  Text("            "),
                  Expanded(
                    child: Text("text kkdk dkdjdjd jdjddn jk cjnz dncjz dcnzd dchzjcnz czoicz kjdcnjzkdcn ",
                      style: TextStyle(
                      fontStyle: FontStyle.italic,
                        fontFamily: 'Times New Roman',
                        color: Colors.grey[700],
                      fontSize: 16.0,
                    ),),
                  ),
                ],
            ),
            SingleChildScrollView(
              scrollDirection : Axis.horizontal,
              child: Container(

              ),
              /*child: PFDetailContainer(
                //widget.warhouse.produits_finis
                nom: "Nom Article",
                details: "Any Operating System (MacOS, Linux, Windows Any IDE with Flutter SDK installed (Android Studio, VSCode etc"),*/
            ),
            
                ],
              )),
              ),
          ),
        ],
      ),
    ) ; 

  }
}