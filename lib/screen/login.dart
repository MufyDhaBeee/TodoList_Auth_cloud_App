import 'package:flutter/material.dart';
import 'package:to_do_list_app_fire2/const/colors.dart';
import 'package:to_do_list_app_fire2/data/auth_data.dart';

class LogIn_Screen extends StatefulWidget {
  final VoidCallback show;
    LogIn_Screen(this.show, {super.key});

  @override
  State<LogIn_Screen> createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {

      });
    });
    _focusNode2.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              image(),
              SizedBox(height: 50),
              textfield(email, _focusNode1, 'Email', Icons.email),
              SizedBox(height: 10),
              textfield(password, _focusNode2, 'Password', Icons.lock),
              SizedBox(height: 20),
              account(),
              SizedBox(height: 20),
              Login_button()


            ],
          ),
        ),
      ),
    );
  }

  Widget account() {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Don't have an account?", style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,

                  ),),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap:
                      widget.show,

                    child: Text('Sign Up', style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold

                    ),),
                  )
                ],
              ),
            );
  }

  Widget Login_button() {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () async {
                  try{
                    await AuthenticationRemote().login(email.text, password.text);
                    print("Login Success");
                  } catch (e) {
                    print("Login Error : $e");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed: $e"),
                    ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: custom_green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('LogIn', style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            );
  }

  Widget textfield(TextEditingController _controller, FocusNode _focusNode, String typeName, IconData iconss) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(prefixIcon: Icon(iconss, color: _focusNode.hasFocus ? custom_green : grey1,),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    hintText: typeName,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: grey1,
                        width: 2.0,
                      )
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
            );
  }

  Widget image() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/intro.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}