import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dgprod/widgets/production_group.dart';
import 'package:dgprod/pages/login.dart';
import 'package:dgprod/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../methodes/sharedpreferences.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String? name;
  @override
  void initState(){
    _loadUserData();
    super.initState();
  }
  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? user = localStorage.getString('user');

    if(user != null) {
      setState(() {
        name = user;

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: IconButton(
              icon: Icon(Icons.home_filled),
              color: Colors.blue,
              onPressed: () => {
                print("Click on upload button")
              },
            ),
        actions: <Widget> [
            IconButton(
              icon: Icon(Icons.file_upload),
              color: Colors.blue,
              onPressed: () => {
                print("Click on upload button")
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications_active_rounded ),
              color: Colors.blue,
              onPressed: ()  {},
            ),
            PopupMenuButton(
              color: Colors.grey,
              icon: Icon(Icons.settings,color: Colors.blue,),
              onSelected: (index){
               index == 1 ? logout()
: print('object') ;
              },
              itemBuilder: (ctx) => [
                PopupMenuItem(
                
                  value: 1,
                  child: Text("Déconnexion"),

                ),
                PopupMenuItem(
               
                  value: 2,
                  child: Text("Langue"),
                ),
              ],
            ),
            
          ],
        elevation: 5,
        leading: Builder(
          
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu, color: Colors.blue,),
        onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),

        
      ),
      
      extendBody: true,
      body: _buildBody(),
    );
  }

  Stack _buildBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                _taskHeader(),
                const SizedBox(
                  height: 15,
                ),
                buildGrid(),
                const SizedBox(
                  height: 25,
                ),
                
              ],
            ),
          ),
        ),
        
      ],
    );
  }

  Row _taskHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectableText(
          "Production",
          style: TextStyle(
            fontSize: 22,
            color: Colors.blue,
            fontStyle: FontStyle.italic,
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        ),
        
      ],
    );
  }

  StaggeredGrid buildGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      
      children:  [
        Container(
constraints: BoxConstraints(

),
        ),
        StaggeredGridTile.count(
          
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.3,
          child: InkWell(

            onTap: () {
              setState(() {
              });
              Navigator.of(context).pushNamed("warehouse");
            },
            child: ProductionGroupContainer(
              color: Colors.blue,
              icon: Icons.warehouse_rounded,
              prodCount: 10,
              
              prodGroup: "Dépot Produits", 
             
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: ProductionGroupContainer(
            color: Colors.orange,
            isSmall: true,
            icon: Icons.warehouse_outlined,
            prodCount: 5,
            prodGroup: "Stock matières premières",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.3,
          child: ProductionGroupContainer(
            color: Colors.teal,
            icon: Icons.shopping_cart,
            prodCount: 2,
            prodGroup: "Achats",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: ProductionGroupContainer(
            color: Colors.pink,
            isSmall: true,
            icon: Icons.point_of_sale,
            prodCount: 9,
            prodGroup: "Ventes",
          ),
        ),
         StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: ProductionGroupContainer(
            color: Colors.orange,
            isSmall: true,
            icon: Icons.transform_outlined,
            prodCount: 9,
            prodGroup: "Services",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: ProductionGroupContainer(
            color: Colors.blue,
            isSmall: true,
            icon: Icons.attach_money_rounded,
            prodCount: 9,
            prodGroup: "Caisse",
          ),
        ),
      ],
    );
  }
  void logout() async{
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if(body['success']){
    //  SharedPreferences localStorage = await SharedPreferences.getInstance();
      //localStorage.remove('user');
      SharedPreference.pref!.remove('token');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>myLogin()));
    }
  }
}


