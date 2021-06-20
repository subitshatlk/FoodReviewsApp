import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Addreview extends StatefulWidget {
  const Addreview({Key key, this.shopname, this.food,this.price, this.review}) : super(key: key);

  @override
  AddreviewState createState() => AddreviewState();
  final shopname;
  final food;
  final price;
  final review;
}

class AddreviewState extends State<Addreview> {
  TextEditingController _nameController,_foodController,_priceController,_revController;
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _foodController=TextEditingController();
    _priceController=TextEditingController();
    _revController=TextEditingController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Food Review', style: TextStyle(fontSize: 20 ,color: Colors.white)),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 40),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) =>
                  (value.isEmpty) ? "Please enter name of restaurant" : null,
                  decoration: InputDecoration(
                      labelText: "Name",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:Icon(Icons.corporate_fare,size: 30,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _foodController,
                  validator: (value) =>
                  (value.isEmpty) ? "Please enter name of food" : null,
                  decoration: InputDecoration(
                      labelText: "Food",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:Icon(Icons.fastfood_sharp,size: 30,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _priceController,
                  validator: (value) =>
                  (value.isEmpty) ? "Please enter price" : null,
                  decoration: InputDecoration(
                      labelText: "Price",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:Icon(Icons.price_change_sharp,size: 30,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _revController,
                  minLines: 2,
                  maxLines: 5,
                  validator: (value) =>
                  (value.isEmpty) ? "Please type review" : null,
                  decoration: InputDecoration(
                      labelText: "Write up",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:Icon(Icons.fact_check_sharp,size: 30,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: Text('Post it !',style: TextStyle(fontSize: 20 ,color: Colors.white)),
                  onPressed: (){
                    saveData();
                    //Navigator.pushNamedAndRemoveUntil(context, 'reviewform', (route) => false);
                  },
                  color: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 25,),
            ],
          ),
        ),
      ),
    );
  }
  void saveData(){
    String name = _nameController.text;
    String food = _foodController.text;
    String price = _priceController.text;
    String rev = _revController.text;

    Map<String,String> data = {
      'name':name,
      'food' :food,
      'price' :price,
      'rev' : rev,
    };

    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference = FirebaseFirestore.instance.collection('review');

      await reference.add({"Name": "$name","Food": "$food","Price": "$price","Review": "$rev"});
    });
  }
}