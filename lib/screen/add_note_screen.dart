import 'package:flutter/material.dart';
import 'package:to_do_list_app_fire2/const/colors.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final title = TextEditingController();
  final subtitle = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: Column(
          children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: title,
            focusNode: _focusNode1,
            style: TextStyle(color: Colors.black, fontSize: 18),
            decoration: InputDecoration(
              hintText: 'Title',
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: grey1,
                      width: 2.0,
                    ),
                ), focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: custom_green,
                    width: 2.0,
                  ),
                )
            ),
          ),
        ),
      ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: title,
                  focusNode: _focusNode1,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                      hintText: 'Subtitle',
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: grey1,
                          width: 2.0,
                        ),
                      ), focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: custom_green,
                      width: 2.0,
                    ),
                  )
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
