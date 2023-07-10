import 'package:flutter/material.dart';
import 'package:logistic_app/tabpages/earning.dart';
//import 'package:logistic_app/tabpages/home.dart';
import 'package:logistic_app/tabpages/profile.dart';
import 'package:logistic_app/tabpages/rating.dart';

import '../tabpages/home.dart';
// import 'package:payload/tabpages/earning_tab.dart';
// import 'package:payload/tabpages/home_tab.dart';
// import 'package:payload/tabpages/profile_tab.dart';
// import 'package:payload/tabpages/rating_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedindex = 0;

  onitemclicked(int index) {
    setState(() {
      selectedindex = index;
      tabController!.index = selectedindex;
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          home_tab(
            clientName: "",
            requestDetails: "",
          ),
          earning_tab(
            totalEarnings: 200,
            monthlyEarnings: [],
          ),
          profile_tab(),
          rating_tab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Earning",),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account",),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Ratings",),
        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 16),
        showUnselectedLabels: true,
        currentIndex: selectedindex,
        onTap: onitemclicked,
      ),
    );
  }
}
