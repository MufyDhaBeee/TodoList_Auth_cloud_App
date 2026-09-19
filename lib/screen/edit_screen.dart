import 'package:flutter/material.dart';
import 'package:to_do_list_app_fire2/const/colors.dart';
import 'package:to_do_list_app_fire2/data/firestore.dart';
import 'package:to_do_list_app_fire2/model/notes_model.dart';

class EditScreen extends StatefulWidget {
  Note _note;
   EditScreen( this._note, {super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController? title;
  TextEditingController? subtitle;

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
  void initState() {
    super.initState();
    title = TextEditingController(text: widget._note.title);
    subtitle = TextEditingController(text: widget._note.subtitle);
  }
  Widget build(BuildContext context) {
    return  Scaffold(
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
            button()



          ],
        ),
      ),

    );
  }
  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: custom_green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            minimumSize: Size(170, 48),
          ),
          onPressed: (){
            Firestore_Datasource().Update_Note(widget._note.id, indexx, title!.text, subtitle!.text);
            Navigator.pop(context);

          },
          child: Text('Add Task', style: TextStyle(
            color: Colors.white,
          ),),

        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            minimumSize: Size(170, 48),
          ),
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Cancel', style: TextStyle(
            color: Colors.white,
          ),),

        )

      ],
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


