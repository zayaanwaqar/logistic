// import 'package:flutter/material.dart';

// class earning_tab extends StatefulWidget {
//   const earning_tab({super.key});

//   @override
//   State<earning_tab> createState() => _earning_tabState();
// }

// class _earning_tabState extends State<earning_tab> {

//   final double totalEarnings;

//   EarningsPage({required this.totalEarnings});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Earnings'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Total Earnings',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '\$$totalEarnings',
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Earnings Breakdown',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             ListTile(
//               leading: Icon(Icons.date_range),
//               title: Text('July 2023'),
//               trailing: Text('\$1500'),
//             ),
//             ListTile(
//               leading: Icon(Icons.date_range),
//               title: Text('June 2023'),
//               trailing: Text('\$1200'),
//             ),
//             ListTile(
//               leading: Icon(Icons.date_range),
//               title: Text('May 2023'),
//               trailing: Text('\$1000'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class earning_tab extends StatelessWidget {
//   final double totalEarnings;

//   earning_tab({required this.totalEarnings});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Earnings'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Total Earnings',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '\$$totalEarnings',
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Earnings Breakdown',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             ListTile(
//               leading: Icon(Icons.date_range),
//               title: Text('July 2023'),
//               trailing: Text('\$1500'),
//             ),
//             ListTile(
//               leading: Icon(Icons.date_range),
//               title: Text('June 2023'),
//               trailing: Text('\$1200'),
//             ),
//             ListTile(
//               leading: Icon(Icons.date_range),
//               title: Text('May 2023'),
//               trailing: Text('\$1000'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class earning_tab extends StatelessWidget {
  final double totalEarnings;
  final List<MonthlyEarnings> monthlyEarnings;

  earning_tab({
    required this.totalEarnings,
    required this.monthlyEarnings,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earnings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Earnings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$$totalEarnings',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Earnings Breakdown',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: monthlyEarnings.length,
                itemBuilder: (context, index) {
                  MonthlyEarnings earnings = monthlyEarnings[index];
                  return ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text(earnings.month),
                    trailing: Text('\$${earnings.earnings}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthlyEarnings {
  final String month;
  final double earnings;

  MonthlyEarnings({
    required this.month,
    required this.earnings,
  });
}
