import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_project/screens/home/reviewform.dart';
class Reviewform extends StatefulWidget {

  @override
  _ReviewformState createState() => _ReviewformState();
}

class _ReviewformState extends State<Reviewform> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),

        title: Text(
          'Food Reviews',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Architects',
            fontWeight: FontWeight.w700,
          ),
        ),

      ),
      body: StreamBuilder(
        // ignore: deprecated_member_use
        stream: Firestore.instance.collection("review").snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data.documents[index];
                return Card(
                  elevation: 10.0,
                  margin: EdgeInsets.all(9.0),
                  child: Container(
                      padding: EdgeInsets.all(9.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.person_outline_rounded, size: 20,),
                                SizedBox(width: 6.0,),
                                Text(data['Name'] + ', ' + data['Food'],
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                  textAlign: TextAlign.left,),
                              ]
                          ),
                          Divider(
                            height: 10.0,
                            indent: 0.0,
                            color: Colors.black,
                          ),
                          SizedBox(height: 8.0,),
                          Row(
                              children: <Widget>[
                                Icon(Icons.corporate_fare, size: 20,),
                                Text(' Price : ' +data['Price'], style: TextStyle(fontSize: 15.0), textAlign: TextAlign.left),
                              ]
                          ),
                          SizedBox(height: 8.0,),
                          Column(
                              children: <Widget>[
                                SizedBox(width: 50.0,),
                                Text(data['Review'], style: TextStyle(fontSize: 15.0), textAlign: TextAlign.left),
                              ]
                          )
                        ],
                      )
                  ),
                );
              },
            );
          }else{
            return Center(child : Text('Loading...'));
          }
        },
      ),
    );
  }
}
