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
  List<String> imagePaths = [
    'assets/images/play.png',
    'assets/images/meditation.png',
    'assets/images/coding.png',
    'assets/images/chill.png',
  ];
  int indexx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title_widget(),
            SizedBox(height: 20),
            subtitle_widget(),
            SizedBox(height: 20),
             imagess(),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: custom_green,
                    minimumSize: Size(170, 48),
                  ),
                    onPressed: (){},
                    child: Text('Add Task', style: TextStyle(
                      color: Colors.white,
                    ),),

                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(170, 48),
                  ),
                  onPressed: (){},
                  child: Text('Cancel', style: TextStyle(
                    color: Colors.white,
                  ),),

                )

              ],
            )



          ],
        ),
      ),
    );
  }

  Widget imagess() {
    return Container(
              height: 180,
              child: ListView.builder(
                itemCount: imagePaths.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        indexx = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2,
                            color: indexx == index ? custom_green : Colors.grey),
                      ),
                      width: 140,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: [Image.asset(imagePaths[index], fit: BoxFit.fitHeight,)
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
  }

  Widget title_widget() {
    return Padding(
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
              borderSide: BorderSide(color: grey1, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: custom_green, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget subtitle_widget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: 3,
          controller: subtitle,
          focusNode: _focusNode2,
          style: TextStyle(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
            hintText: 'Subtitle',
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: grey1, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: custom_green, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
