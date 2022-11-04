import 'package:first_application/utills//item_widget.dart';
import 'package:first_application/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:first_application/models/catalog.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
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

   var productsData= decodedData[ "products"];
   CatalogueModel.items=List.from(productsData)
       .map<Item>((item)=>Item.fromMap(item))
       .toList();
   print(CatalogueModel.items);
       setState(() {});

  }
   @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App",),
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        (CatalogueModel.items!= null && CatalogueModel.items!.isNotEmpty) ?
         GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount:2,
             mainAxisSpacing:16,
               crossAxisSpacing: 16,

           ),
             itemBuilder: (context,index){

             final Item= CatalogueModel.items![index];
             return Card(
               clipBehavior: Clip.antiAlias,
               shape: RoundedRectangleBorder(
                 borderRadius:BorderRadius.circular(10)
               ),
                 child: GridTile(
                 header: Container(
                 child: Text
                 (item.name,style: TextStyle(color:Colors.white),),
                 padding: const EdgeInsets.all(12),
                   decoration: BoxDecoration(
                   color: Colors.deepPurple,
                 ),
                 ),
                     child:Image.network(item.image,),
                 footer:Container(
                  child: Text(
                  item.price.toString(),
                  style: TextStyle(color:Colors.white),),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                  color: Colors.black,
                  ),//Text(item.price.toString(),
                 ),

                 ));
             } ,
            itemCount:CatalogueModel.items?.length,)

            :Center(
          child: CircularProgressIndicator(),

      ),
      ),

      drawer: MyDrawer(),
    );
  }
}
