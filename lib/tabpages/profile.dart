import 'package:flutter/material.dart';
import 'package:logistic_app/globalfolder/global.dart';
import 'package:logistic_app/splashscreen/splash_screen.dart';

class profile_tab extends StatefulWidget {
  const profile_tab({super.key});

  @override
  State<profile_tab> createState() => _profile_tabState();
}

class _profile_tabState extends State<profile_tab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/cargo.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Asim Mujahid',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Software Developer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('j70067144@student.uol.edu.pk'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('03064551988'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Lahore Pakistan'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality here
              },
              child: Text('Edit Profile'),
            ),

            SizedBox(height: 20,),
            ElevatedButton(
          child: Text("Logout"),
          onPressed: () {
            fAuth.signOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => MySplash()));
          },
        ),
          ],
        ),
      ),
    );
    // 
    // 
    // 
    // 
    // Container(
    //   child: Center(
    //     child: ElevatedButton(
    //       child: Text("Logout"),
    //       onPressed: () {
    //         fAuth.signOut();
    //         Navigator.push(
    //             context, MaterialPageRoute(builder: (c) => MySplash()));
    //       },
    //     ),
    //   ),
    // );
  }
}
