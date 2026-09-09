import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list_app_fire2/auth/auth_page.dart';
import 'package:to_do_list_app_fire2/screen/home.dart';

class Main_page extends StatelessWidget {
  const Main_page({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Home_Screen();
            }else{
              return Auth_Page();
            }
          }
      ),
    );
  }
}
