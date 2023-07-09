import 'package:flutter/material.dart';

class progress_dialog extends StatelessWidget {

  String? message;
  progress_dialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      child: Container(
        child: Padding(padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(width: 6,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),

            SizedBox(width: 26,),
            Text(message!, style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),)
          ],
        ),
        ),
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
