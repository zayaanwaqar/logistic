import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logistic_app/Authentication/signup.dart';
import 'package:logistic_app/mainscreens/main_screen.dart';
import 'package:logistic_app/splashscreen/splash_screen.dart';

import '../globalfolder/global.dart';
import '../widgets/progress_dialog.dart';
import 'Loader_info.dart';
//import 'package:payload/mainscreens/main_screen.dart';
//import 'package:payload/tabpages/home_tab.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  validateForm() {
    if (!emailtextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Email is not valid");
    } else if (passwordtextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "correct password is required");
    } else {
      // showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (BuildContext c) {
      //       return progress_dialog(
      //         message: "Progressing, Please Wait",
      //       );
      //     }

      //     );
      // saveDriverInfoN();
      loginUserNow();
    }
  }

  loginUserNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return progress_dialog(
            message: "Login, Please Wait",
          );
        });

    // Authentication of username
    final User? firebaseUser = (await fAuth
            .signInWithEmailAndPassword(
      email: emailtextEditingController.text.trim(),
      password: passwordtextEditingController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: " + msg.toString());
    }))
        .user;

    if (firebaseUser != null) {
      // Map driverMap = {
      //   "id": firebaseUser.uid,
      //   "name": nametextEditingController.text.trim(),
      //   "email": emailtextEditingController.text.trim(),
      //   "phone": phonetextEditingController.text.trim(),
      // };

      // DatabaseReference driversRef =
      //     FirebaseDatabase.instance.ref().child("drivers");
      // driversRef.child(firebaseUser.uid).set(driverMap);

      currentfirebaseUser = firebaseUser;
      // Navigator.pop(context, MaterialPageRoute(builder: (c) => Loader_info()));
      Fluttertoast.showToast(msg: "Login Succefu");

      Navigator.push(context, MaterialPageRoute(builder: (c) => MySplash()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error occured");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Image.asset("assets/images/cargo.jpg"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login As Driver",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailtextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    labelText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordtextEditingController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      "Login Account",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    radius: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      onPressed: () => {

                        validateForm(),
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (c) => MainScreen(),
                        //   ),
                        // )
                      },
                    ),
                  ),
                ],
              ),
               SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed:() {
                      Navigator.push(context, MaterialPageRoute(builder: (c) => signup_page()));
                    }, child: Text("If you dont have account Sign up here"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
