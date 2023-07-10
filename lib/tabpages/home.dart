// import 'package:flutter/material.dart';

// class home_tab extends StatefulWidget {
//   const home_tab({super.key});

//   @override
//   State<home_tab> createState() => _home_tabState();
// }

// class _home_tabState extends State<home_tab> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("View here the User Requests"),
//       ),
//       body: Container(),
//     );
//   }
// }

import 'package:flutter/material.dart';

class home_tab extends StatelessWidget {
  final String clientName;
  final String requestDetails;

  home_tab({required this.clientName, required this.requestDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Client Request'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Client Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              clientName,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Request Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              requestDetails,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
