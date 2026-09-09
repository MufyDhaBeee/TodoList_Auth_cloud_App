import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_list_app_fire2/auth/auth_page.dart';
import 'package:to_do_list_app_fire2/auth/main_page.dart';
import 'package:to_do_list_app_fire2/firebase_options.dart';
import 'package:to_do_list_app_fire2/screen/login.dart';
import 'package:to_do_list_app_fire2/screen/signUp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do-List-App',
      debugShowCheckedModeBanner: false,

      home: Main_page(),
    );
  }
}

