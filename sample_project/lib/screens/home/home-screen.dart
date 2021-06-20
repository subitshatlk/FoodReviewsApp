import 'package:flutter/material.dart';
import 'package:sample_project/components/bottom_nav_bar.dart';
import 'package:sample_project/screens/home/components/app_bar.dart';
import 'package:sample_project/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child:
              Center(
                child: Text("Hello User!",style: TextStyle(
                  fontSize:20.0,
                ),),
              ),

            ),


            ListTile(
                leading: Icon(Icons.playlist_add_check_rounded),
                title: Text('Home',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'HomeScreen');
                }
            ),
            ListTile(
                leading: Icon(Icons.rate_review_outlined),
                title: Text(' Add Reviews',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'addreview');
                }
            ),
            ListTile(
                leading: Icon(Icons.rate_review_outlined),
                title: Text('Reviews',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'reviewform');
                }
            ),
            ListTile(
                leading: Icon(Icons.rate_review_outlined),
                title: Text('Chatbot',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'chatbot');
                }
            ),


            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out',style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'Architects',

              ),),
              onTap: () {

                Navigator.pushNamedAndRemoveUntil(context, 'signupview', (route) => false);
              },
            ),

          ],
        ),
      ),
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body1(),
    );
  }
}
