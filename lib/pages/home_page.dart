import 'package:first_application/utills/item_widget.dart';
import 'package:first_application/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:first_application/models/catalog.dart';



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var days = 30;

  var name = "codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
  await Future.delayed(Duration (seconds:2));
     final  catalogueJson= await rootBundle.loadString("assets/files/catalogue.json");
   final  decodedData = jsonDecode(catalogueJson);
  print("abc " +decodedData);
   var productsData= decodedData[ "products"];
   CatalogueModel.items=List.from(productsData)
       .map<Item>((item)=>item.fromMap(item))
       .toList();
   print(CatalogueModel.items);
       setState(() {});

  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogueModel.items!= null && CatalogueModel.items!.isNotEmpty)? ListView.builder(
          itemCount: CatalogueModel.items?.length,
          itemBuilder: (context, index) =>
             ItemWidget(
            item: CatalogueModel.items![index],
            ),

        ):Center(
          child: CircularProgressIndicator(),

      ),
      ),

      drawer: MyDrawer(),
    );
  }
}
