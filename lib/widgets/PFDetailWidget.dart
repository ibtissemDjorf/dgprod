import 'dart:ffi';

import 'package:flutter/material.dart';
import '../models/warehouseModel.dart';

class PFDetailContainer extends StatelessWidget {
  List<WarehouseModel>? warehouse;
  final  int? id;
  final  int? id_warehouse;
  final String nom;
  final String details;
  final String? user;
  final DateTime? date_expiration;
  final Float? quantite_actuel;
  final Float? prix_gros;
  final Float? prix_details;
  final int? limite;
  final String? categorie;


   PFDetailContainer({
    Key? key,
    this.warehouse,
    this.id,
    this.id_warehouse,
    required this.nom,
    required this.details,
    this.user,
    this.date_expiration,
    this.quantite_actuel,
    this.prix_gros,
    this.prix_details,
    this.limite,
    this.categorie,   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text("Produit",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontSize: 16.0,
              ),
            ),
            ),
            DataColumn(
            label: Text("Détail",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontSize: 16.0,
              ),
            ),
            ),
            DataColumn(
            label: Text("Qte",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontSize: 16.0,
              ),
            ),
            ),
            DataColumn(
            label: Text("Prix gros",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontSize: 16.0,
              ),
            ),
            ),
            DataColumn(
            label: Text("Prix détail",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontSize: 16.0,
              ),
            ),
            ),

            DataColumn(
            label: Text("Catégorie",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontSize: 16.0,
              ),
            ),
            ),
            DataColumn(
            label: Text("Limite",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontSize: 16.0,
              ),
            ),
            ),
            DataColumn(
            label: Text("Date Expiration",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
              fontSize: 16.0,
              ),
            ),
            )
        ],
        /////// lignes 
       
          rows:  warehouse!.map((e) {
            return  DataRow(
            cells: <DataCell>[
              DataCell(Text("nom",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("details",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("quantite_actuel",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("prix_gros",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("prix_details",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("categorie",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("limite",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("date_expiration",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
            ],
            );
          }).toList(),
        
      
        /*rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text("nom",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("details",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("quantite_actuel",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("prix_gros",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("prix_details",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("categorie",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("limite",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
                DataCell(Text("date_expiration",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Times New Roman',
                  color: Colors.grey[900],
                  fontSize: 16.0,
                  ),
                ),),
            ],
            ),
          
        ],*/

    ),
    );
  }
}
