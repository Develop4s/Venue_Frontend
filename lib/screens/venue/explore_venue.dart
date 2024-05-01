import 'package:flutter/material.dart';
import 'package:venue/components/navigator.dart';
import 'package:venue/screens/overlay_filter.dart';
import 'package:venue/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:venue/screens/venue/order_screen.dart';

class VenueExplore extends StatefulWidget {
  const VenueExplore({super.key});

  @override
  State<VenueExplore> createState() => _VenueExploreState();
}

class _VenueExploreState extends State<VenueExplore> {
  bool isContainer1Clicked = false;
  bool isContainer2Clicked = false;
  bool isContainer3Clicked = false;
  bool isContainer4Clicked = false;

  Widget buildContainerListView() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        buildContainer(
          isContainer1Clicked,
          'Caterers',
          'assets/images/birthday.png',
          () {
            setState(() {
              isContainer1Clicked = true;
              isContainer2Clicked = false;
              isContainer3Clicked = false;
              isContainer4Clicked = false;
            });
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        buildContainer(
          isContainer2Clicked,
          'Sounds',
          'assets/images/wedding.png',
          () {
            setState(() {
              isContainer1Clicked = false;
              isContainer2Clicked = true;
              isContainer3Clicked = false;
              isContainer4Clicked = false;
            });
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        buildContainer(
          isContainer3Clicked,
          'Decorators',
          'assets/images/music.png',
          () {
            setState(() {
              isContainer1Clicked = false;
              isContainer2Clicked = false;
              isContainer3Clicked = true;
              isContainer4Clicked = false;
            });
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        buildContainer(
          isContainer4Clicked,
          'Entertainers',
          'assets/images/wedding.png',
          () {
            setState(() {
              isContainer1Clicked = false;
              isContainer2Clicked = false;
              isContainer3Clicked = false;
              isContainer4Clicked = true;
            });
          },
        ),
      ],
    );
  }

  Widget buildContainer(
    bool isClicked,
    String title,
    String imagePath,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          color: isClicked ? Color.fromRGBO(46, 138, 250, 1) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isClicked ? Colors.white : Colors.grey.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            SizedBox(height: 7),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: isClicked ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        // Profile icon index
        // Navigate to the profile page
        NavigationUtils.navigateToPage(context, OverlayFilter());
      } else if (_selectedIndex == 3) {
        // Profile icon index
        // Navigate to the profile page
        NavigationUtils.navigateToPage(context, ProfileScreen());
      } else if (_selectedIndex == 0) {
        // Profile icon index
        // Navigate to the profile page
        NavigationUtils.navigateToPage(context, VenueExplore());
      } else if (_selectedIndex == 2) {
        // Profile icon index
        // Navigate to the profile page
        NavigationUtils.navigateToPage(context, OrderScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double paddingleft = screenSize.width * 0.05;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0),
          elevation: 0,
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current Location',
                style: TextStyle(
                  color: Color.fromRGBO(138, 189, 252, 1),
                  fontSize: 12,
                ),
              ),
              Text(
                'New York, USA',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.widgets_rounded), // Your left side icon
            onPressed: () {
              // Add your onPressed logic here
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications), // Another right side icon
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(55, 75, 248, 1),
                  Color.fromRGBO(46, 138, 250, 1),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: paddingleft,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back,',
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(138, 189, 252, 1),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Text(
                        'Discover Amazing Event Places',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                      left: paddingleft,
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Container(
                    padding: EdgeInsets.only(left: paddingleft),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(46, 138, 250, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 230, 228, 228)
                            .withOpacity(0.4),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search here...",
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              // errorText: _emailValidationError,
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              // Call the validation method when the text changes
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: paddingleft),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: paddingleft),
                      child: GestureDetector(
                        onTap: () {
                          // NavigationUtils.navigateToPage(
                          //   context,
                          //   DemoScreen(),
                          // );
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color.fromRGBO(138, 189, 252, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Container(
                    // color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(right: 5, left: 5),

                        // color: Colors.black,
                        child: buildContainerListView(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: paddingleft),
                  child: Text(
                    'Popular Vendors',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.020,
                ),
                Container(
                  // color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: 260,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(right: 5, left: 5),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            height: 230,
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 230, 228, 228),
                                  width: 1),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 230,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        // color: Colors.red,
                                      ),
                                      child: Image.asset(
                                        'assets/images/lorem.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Lorem Ipsum',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 20,
                                            color:
                                                Color.fromRGBO(55, 75, 248, 1),
                                          ),
                                          Text(
                                            '36 Guild Street London,UK',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.people_alt_rounded,
                                          size: 20,
                                          color: Color.fromRGBO(55, 75, 248, 1),
                                        ),
                                        Text(
                                          '36',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                        Spacer(),
                                        Text('Book Now',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Container(
                            height: 230,
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 230, 228, 228),
                                  width: 1),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 230,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        // color: Colors.red,
                                      ),
                                      child: Image.asset(
                                        'assets/images/lorem.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Lorem Ipsum',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 20,
                                            color:
                                                Color.fromRGBO(55, 75, 248, 1),
                                          ),
                                          Text(
                                            '36 Guild Street London,UK',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 9),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.people_alt_rounded,
                                          size: 20,
                                          color: Color.fromRGBO(55, 75, 248, 1),
                                        ),
                                        Text(
                                          '36',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                        Spacer(),
                                        Text('Book Now',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue, // Color when selected
        unselectedItemColor: Colors.grey, // Color when not selected
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
