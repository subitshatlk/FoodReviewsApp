import 'dart:ui';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(
                      top: 100.0, left: 40.0, right: 20.0, bottom: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FOOD HIGHWAY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 35.0,),
                      Text(
                        'A FOOD REVIEWS APP ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 40,),
                      Image.asset("images/dining.png",height: 300,),
                    ],
                  ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FlatButton(
                minWidth: 250.0,
                height: 50.0,

                onPressed: (){
                  Navigator.pushNamed(context,'signupview');
                },
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            SizedBox(
              height: 70,
            )
          ]),
    );
  }
}
