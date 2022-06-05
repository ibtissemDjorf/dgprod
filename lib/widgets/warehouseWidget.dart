import 'package:flutter/material.dart';
import 'package:dgprod/core/res/color.dart';

import '../models/warehouseModel.dart';



class WarehouseContainer extends StatelessWidget {

  WarehouseModel warehouseInst;

  WarehouseContainer({
    Key? key,
    required this.warehouseInst,
    
   
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
          
          margin: EdgeInsets.all(10),
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
        child: Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warehouse_rounded,
                    color: Colors.orange,
                    size: 40,),
                  Text("warehouseInst.name" ,
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
            // ignore: prefer_const_constructors
            Row(
              children: [
                Text("            "),
                Expanded(
                  child: Text("warehouseInst.details",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                    fontStyle: FontStyle.italic,
                      fontFamily: 'Times New Roman',
                      color: Colors.grey[700],
                    fontSize: 16.0,
                  ),),
                ),
              ],
            ),
                        ],
        )),
        );;
  }
}