// home_venue.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:venue/components/custom_button.dart';
import 'package:venue/components/snack_bar.dart';
import 'package:venue/screens/venue/form_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeVenue extends StatefulWidget {
  const HomeVenue({Key? key});

  @override
  State<HomeVenue> createState() => _HomeVenueState();
}

class _HomeVenueState extends State<HomeVenue> {
  TextEditingController _searchController = TextEditingController();
  String _selectedPlace = '';
  String _selectedLocation = '';
  List<String> _suggestions = [];
  String _latitude = '';
  String _longitude = '';
  bool _isSearching = false;

  final TextEditingController _venuenameController = TextEditingController();
  final TextEditingController _venueaddressController = TextEditingController();
  final TextEditingController _venuelocationController =
      TextEditingController();
  final TextEditingController _numberofhallsController =
      TextEditingController();
  int numberOfHalls = 0;
  String? selectedCity;
  String? _venuenameValidationError;
  String? _venueaddressValidationError;
  String? _venuelocationValidationError;
  String? _venuenumberofhallsValidationError;

  @override
  void dispose() {
    _searchController.dispose();
    _venuenameController.dispose();
    _venueaddressController.dispose();
    _venuelocationController.dispose();
    _numberofhallsController.dispose();
    super.dispose();
  }

  void _saveLocation(String location, String latitude, String longitude) {
    print('Location saved: $location');
    print('Latitude saved: $latitude');
    print('Longitude saved: $longitude');
  }

  String? _validateVenueName(String value) {
    // You can adjust the regular expression as per your name validation requirements
    final RegExp nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      setState(() {
        _venuenameValidationError = 'Enter Your Full Name';
      });
    } else {
      setState(() {
        _venuenameValidationError = null;
      });
    }
    return null;
  }

  String? _validatenumberofhalls(String value) {
    // Try parsing the input as an integer
    if (int.tryParse(value) == null) {
      setState(() {
        _venuenumberofhallsValidationError = 'Enter a valid number';
      });
    } else {
      setState(() {
        _venuenumberofhallsValidationError = null;
      });
    }
    return null;
  }

  String? _validateVenueAddress(String value) {
    // You can adjust the regular expression as per your name validation requirements
    final RegExp nameRegex = RegExp(r'^[a-zA-Z0-9\s\.,\-#]+$');
    if (!nameRegex.hasMatch(value)) {
      setState(() {
        _venueaddressValidationError = 'Enter Your Full Name';
      });
    } else {
      setState(() {
        _venueaddressValidationError = null;
      });
    }
    return null;
  }

  String? _validateVenuelocation(String value) {
    // Adjust the regular expression to match the format of your address
    final RegExp addressRegex = RegExp(
        r'^[a-zA-Z0-9\s\.,\-#]+$'); // Allow letters, numbers, spaces, commas, periods, hyphens, and pound signs

    if (!addressRegex.hasMatch(value)) {
      setState(() {
        _venuelocationValidationError =
            'Enter a valid location'; // Update error message as needed
      });
    } else {
      setState(() {
        _venuelocationValidationError = null;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double paddingleft = screenSize.width * 0.05;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.1),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
          title: Text(
            'Venue Details',
            style: TextStyle(color: Colors.black),
          )),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            right: 0,
            top: MediaQuery.of(context).size.height * 0.06,
            child: Image.asset(
              'assets/images/Vectorbg1.png',
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: paddingleft,
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Venue Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: paddingleft),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _venuenameValidationError != null
                                  ? Colors.red
                                  : Colors.grey.withOpacity(0.4),
                            )),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home_filled,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _venuenameController,
                                decoration: InputDecoration(
                                  hintText: "Enter Venue Name",
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  // Call the validation method when the text changes
                                  _validateVenueName(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.only(left: paddingleft),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: _venueaddressValidationError != null
                                        ? Colors.red
                                        : Colors.grey.withOpacity(0.4),
                                  )),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      controller: _venueaddressController,
                                      decoration: InputDecoration(
                                        hintText: "Enter Address",
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        // Call the validation method when the text changes
                                        _validateVenueAddress(value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            padding: EdgeInsets.only(left: paddingleft),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: _venuelocationValidationError != null
                                      ? Colors.red
                                      : Colors.grey.withOpacity(0.4),
                                )),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter Location Here",

                                      // suffixIcon: IconButton(
                                      //   icon: Icon(Icons.search),
                                      //   onPressed: () {
                                      //     _searchLocation(_searchController.text);
                                      //   },
                                      // ),
                                    ),
                                    onChanged: (value) {
                                      _validateVenuelocation(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _suggestions.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    left: paddingleft,
                                    top: 6,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: _suggestions
                                        .map((suggestion) => GestureDetector(
                                              onTap: () {
                                                _searchController.text =
                                                    suggestion;
                                              },
                                              child: Text(
                                                suggestion,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Add Number Of Halls',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: paddingleft),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: _venuenumberofhallsValidationError != null
                                ? Colors.red
                                : Colors.grey.withOpacity(0.4),
                          )),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _numberofhallsController,
                              decoration: const InputDecoration(
                                hintText: "Enter Number Of Halls",
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                setState(() {
                                  numberOfHalls = int.tryParse(value) ?? 0;
                                  _validatenumberofhalls(value);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: CustomButtonSmall(
                          onPressed: () {
                            _validateVenueName(_venuenameController.text);
                            _validateVenueAddress(_venueaddressController.text);
                            _validateVenuelocation(_searchController.text);
                            _validatenumberofhalls(
                                _numberofhallsController.text);
                            _saveLocation(
                                _selectedPlace, _latitude, _longitude);
                            if (_venuenameValidationError != null ||
                                _venueaddressValidationError != null ||
                                _venuelocationValidationError != null ||
                                _venuenumberofhallsValidationError != null) {
                              // Display a Snackbar if any validation error exists
                              showError(context, 'Enter All Feilds');
                            } else {
                              // All fields are valid, navigate to the other page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FormPage(numberOfHalls: numberOfHalls),
                                ),
                              );
                            }
                          },
                          text: 'GO',
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
    );
  }
}
