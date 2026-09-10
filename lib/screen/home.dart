import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do_list_app_fire2/const/colors.dart';
import 'package:to_do_list_app_fire2/widgets/task_widgets.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  bool show = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: custom_green,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),

      body: SafeArea(child: NotificationListener<UserScrollNotification>(
         onNotification: (notification){
           if( notification.direction == ScrollDirection.forward){
             setState(() {
               show = true;
             });
           }
           if( notification.direction == ScrollDirection.reverse){
             setState(() {
               show = true;
             });
           }
           return true;

         }, child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return Task_Widget();
          }
      ),

      )
      ),
    );
  }
}
