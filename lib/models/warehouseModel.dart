import 'package:flutter/cupertino.dart';

import 'PFModel.dart';

class WarehouseModel {
  final int? id;
  final String? name;
  final String? details;

  WarehouseModel(
    { this.id,
    this.name,
    this.details,
}
    );

    factory WarehouseModel.fromJson(Map element){
     
      return WarehouseModel(
       id: element['id'], 
       name: element['nom'], 
       details: element['details'],

        );
    }

   /*static List<PFModel> all(data, id) {
     List<PFModel> pfs = [];
     for(final element in data){
      pfs.add(PFModel.fromJson(element,id));
     }
    return pfs;
  }*/
  get nom => null;
}
