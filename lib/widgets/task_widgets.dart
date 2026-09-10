import 'package:flutter/material.dart';
import 'package:to_do_list_app_fire2/const/colors.dart';

class Task_Widget extends StatefulWidget {
  const Task_Widget({super.key});

  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

bool isDone = false;

class _Task_WidgetState extends State<Task_Widget> {
  @override
  Widget build(BuildContext context) {
    return get();
  }

  Widget get() {
    return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            //image
            imagee(),
            SizedBox(width: 20),
            //title and subtitles

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: isDone,
                        onChanged: (value) {
                          setState(() {
                            isDone = !isDone;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'subtitle',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 28,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: custom_green,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/icon_time.png'),
                                SizedBox(width: 10),
                                Text(
                                  'Time',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 28,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Color(0xffE2F6F1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/icon_edit.png'),
                                SizedBox(width: 10),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }

  Widget imagee() {
    return Container(
      width: 100,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/play.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
