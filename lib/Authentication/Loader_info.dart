import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logistic_app/globalfolder/global.dart';
import 'package:logistic_app/splashscreen/splash_screen.dart';

class Loader_info extends StatefulWidget {
  const Loader_info({super.key});

  @override
  State<Loader_info> createState() => _Loader_infoState();
}

class _Loader_infoState extends State<Loader_info> {
  TextEditingController modeltextEditingController = TextEditingController();
  TextEditingController numbertextEditingController = TextEditingController();
  TextEditingController colortextEditingController = TextEditingController();
  //TextEditingController passwordtextEditingController = TextEditingController();

  List<String> truckTypeList = [
    "Small_truck",
    "Big_truck_15ft",
    "Big_truck_20ft",
    "small_pickup",
  ];
  String? selectedTruckType;

  savetruckinfo() {
    Map drivertruckInfoMap = {
      "loader color": colortextEditingController.text.trim(),
      "loader number": numbertextEditingController.text.trim(),
      "loader model": modeltextEditingController.text.trim(),
      "type": selectedTruckType,
    };

          DatabaseReference driversRef =
          FirebaseDatabase.instance.ref().child("drivers");
      driversRef.child(currentfirebaseUser!.uid).child("Loader Details").set(drivertruckInfoMap);
      Fluttertoast.showToast(msg: "Loader info have been saved configraton");
      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) => MySplash(),
                          ),
                        );
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
                "Enter Truck Information",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: modeltextEditingController,
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    hintText: "Enter Truck Model",
                    labelText: "Model",
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
                  controller: numbertextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    hintText: "Enter Truck Number",
                    labelText: "Number",
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
                  controller: colortextEditingController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    hintText: "Enter Truck color",
                    labelText: "Color",
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
              //   Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     controller: passwordtextEditingController,
              //     keyboardType: TextInputType.text,
              //     obscureText: true,
              //     style: TextStyle(
              //       color: Colors.grey
              //     ),
              //     decoration: InputDecoration(
              //       hintText: "Enter Password",
              //       labelText: "Password",
              //       hintStyle: TextStyle(
              //         color: Colors.grey,
              //         fontSize: 10,
              //       ),
              //       labelStyle:TextStyle(
              //         color: Colors.grey,
              //         fontSize: 10,
              //       ),
              //       enabledBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       focusedBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey),
              //         borderRadius: BorderRadius.circular(10),
              //     ),

              //   ),
              //         ),
              // ),
              SizedBox(
                height: 10,
              ),
              DropdownButton(
                hint: Text(
                  "Press to choose Truck category",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                value: selectedTruckType,
                onChanged: (newValue) {
                  setState(() {
                    selectedTruckType = newValue.toString();
                  });
                },
                items: truckTypeList.map((Truck) {
                  return DropdownMenuItem(
                    child: Text(
                      Truck,
                      style: TextStyle(color: Colors.grey),
                    ),
                    value: Truck,
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      "Submit Info",
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

                        if(colortextEditingController.text.isNotEmpty && modeltextEditingController.text.isNotEmpty
                        && numbertextEditingController.text.isNotEmpty && selectedTruckType != null
                        )
                        {
                          savetruckinfo()
                        },
                        


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) => Loader_info(),
                          ),
                        )
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
