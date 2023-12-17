
import 'package:bookapp/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/screens/homescreen.dart';
import 'package:bookapp/user/login.dart';
import 'package:bookapp/user/register.dart';
import 'package:firebase_core/firebase_core.dart';


late FirebaseApp app;
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyANY28zmhMGiyHRu8bowASxJfz_Mazb3DQ", 
      appId: "1:701868772085:android:dcc1d33d68da7bed14d3bc", 
      messagingSenderId: "701868772085", 
      projectId: "my-bookapp11"));
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey.shade200),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}


