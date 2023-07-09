import 'package:flutter/material.dart';

class rating_tab extends StatefulWidget {
  const rating_tab({super.key});

  @override
  State<rating_tab> createState() => _rating_tabState();
}

class _rating_tabState extends State<rating_tab> {
  double _rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rate the User ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 1.0;
                    });
                  },
                  icon: Icon(
                    _rating >= 1.0 ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 2.0;
                    });
                  },
                  icon: Icon(
                    _rating >= 2.0 ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 3.0;
                    });
                  },
                  icon: Icon(
                    _rating >= 3.0 ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 4.0;
                    });
                  },
                  icon: Icon(
                    _rating >= 4.0 ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 5.0;
                    });
                  },
                  icon: Icon(
                    _rating >= 5.0 ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                ),
              ],
            ),
             SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Perform rating submission logic here
            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return AlertDialog(
            //           title: Text('Rating Submitted'),
            //           content: Text('Thank you for your feedback!'),
            //           actions: [
            //             TextButton(
            //               onPressed: () {
            //                 Navigator.pop(context);
            //               },
            //               child: Text('OK'),
            //             ),
            //           ],
            //         );
            //       },
            //     );
            //   },
            //   child: Text('Submit Rating'),
            // ),
            Text(
              'Rate the App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 1.0;
                    });
                  },
                  icon: Icon(
                    _rating >= 1.0 ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 2.0;
                    });
                  },
                  icon: Icon(
                    _rating >= 2.0 ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 3.0;
                    });
                  },
                  icon: Icon(
                    _rating >= 3.0 ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 4.0;
                    });
                  },
                  icon: Icon(
                    _rating >= 4.0 ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rating = 5.0;
                    });
                  },
                  icon: Icon(
                    _rating >= 5.0 ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform rating submission logic here
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Rating Submitted'),
                      content: Text('Thank you for your feedback!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Submit Rating'),
            ),
          ],
        ),
      ),
    );
  }
}
