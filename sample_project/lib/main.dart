import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/screens/home/addreview.dart';
import 'package:sample_project/screens/home/chatbot.dart';
import 'package:sample_project/screens/home/home-screen.dart';
import 'package:sample_project/screens/home/reviewform.dart';
import 'package:sample_project/screens/home/welcome.dart';
import 'package:sample_project/screens/sign_up.dart';
import 'models/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:sample_project/services/auth_service.dart';
import 'package:sample_project/widgets/provider_widget.dart';
final firestoreInstance = FirebaseFirestore.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth:AuthService(),
      child: MaterialApp(
        title: 'Food Highway',
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.greenAccent,

        ),
        home: Welcome(),
        routes: {
          'welcome' : (ctx) => Welcome(),
          'signupview' : (BuildContext context) => SignUpView(authFormType:AuthFormType.signUp),
          'HomeScreen': (ctx) => HomeScreen(),
          'addreview': (ctx) => Addreview(),
          'reviewform': (ctx) => Reviewform(),
          'chatbot' : (ctx) => ChatBot(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomeScreen(): SignUpView(authFormType:AuthFormType.signUp);
        }
        return CircularProgressIndicator();
      },
    );
  }
}






