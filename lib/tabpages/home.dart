import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/add_item_model.dart';
import '../models/constants.dart';

class home_tab extends StatelessWidget {
  final String clientName;
  final String requestDetails;

  Stream<List<AddItemModel>> readItems() {
    return FirebaseFirestore.instance.collection('Requests').snapshots().map(
        (snapShot) => snapShot.docs
            .map((doc) => AddItemModel.fromJson(doc.data()))
            .toList());
  }

  home_tab({required this.clientName, required this.requestDetails});

  final CollectionReference products =
      FirebaseFirestore.instance.collection('Requests');

  Future<void> delete(String productId) async {
    await products.doc(productId).delete();
  }

  Future<void> update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      // documentSnapshot['email'] = 'abc';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Client Request'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              StreamBuilder(
                // stream: readItems(),
                stream: products.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  // if (!snapshot.hasData) {
                  if (!streamSnapshot.hasData) {
                    return const Text('there is no data  ');
                  } else if (streamSnapshot.hasData) {
                    // final List<AddItemModel> users = snapshot.data!;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          return documentSnapshot['is_accepted'] == 'yes'
                              ? const SizedBox.shrink()
                              : Container(
                                  width: 150,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 12),
                                          Text(documentSnapshot['email']),
                                          const SizedBox(height: 3),
                                          Text(
                                              documentSnapshot['selectedSize']),
                                          const SizedBox(height: 3),
                                          Text(documentSnapshot['noOfTrucks']),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          products
                                              .doc(documentSnapshot!.id)
                                              .update(
                                            {
                                              "driverName":
                                                  Constants.driverEmail,
                                              "truckColor": 'Silver',
                                              "truckNumber": 'Leu 123',
                                              "is_accepted": 'yes'
                                            },
                                          );
                                          // delete(documentSnapshot.id);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text("Request Accepted"),
                                          ));
                                        },
                                        child: Text('Accept'),
                                      ),
                                    ],
                                  ),
                                );
                          //   Card(
                          //   margin: const EdgeInsets.all(10),
                          //   child:
                          //   ListTile(
                          //     title: Text(documentSnapshot['selectedSize']),
                          //     subtitle: Text(documentSnapshot['noOfTrucks']),
                          //   ),
                          // );
                        });
                    //   Container(
                    //   width: 150,
                    //   color: Colors.white,
                    //   child: Column(
                    //     children: [
                    //       const SizedBox(height: 12),
                    //       Text('abc@gmail.com'
                    //         // users[1].email,
                    //       ),
                    //       const SizedBox(height: 3),
                    //       Text('12'
                    //         // users[1].noOfLabors,
                    //       ),
                    //       const SizedBox(height: 3),
                    //       Text('large'
                    //         // users[1].selectedSize,
                    //       ),
                    //       const SizedBox(height: 20),
                    //     ],
                    //   ),
                    // );
                    //   ListView.builder(
                    //   itemCount: users.length,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Container(
                    //       width: 150,
                    //       color: Colors.white,
                    //       child: Column(
                    //         children: [
                    //           const SizedBox(height: 12),
                    //           Text(
                    //             users[index].email,
                    //           ),
                    //           const SizedBox(height: 3),
                    //           Text(
                    //             users[index].noOfLabors,
                    //           ),
                    //           const SizedBox(height: 3),
                    //           Text(
                    //             users[index].selectedSize,
                    //           ),
                    //           const SizedBox(height: 20),
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      // Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const Text(
      //         'Client Name:',
      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //       ),
      //       Text(
      //         clientName,
      //         style: const TextStyle(fontSize: 16),
      //       ),
      //       const SizedBox(height: 16),
      //       const Text(
      //         'Request Details:',
      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //       ),
      //       Text(
      //         requestDetails,
      //         style: TextStyle(fontSize: 16),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
