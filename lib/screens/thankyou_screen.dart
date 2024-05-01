import 'package:flutter/material.dart';
import 'package:venue/components/custom_button.dart';
import 'package:venue/components/navigator.dart';
import 'package:venue/screens/choose_screen.dart';

class ThankyouScreen extends StatefulWidget {
  const ThankyouScreen({super.key});

  @override
  State<ThankyouScreen> createState() => _ThankyouScreenState();
}

class _ThankyouScreenState extends State<ThankyouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/thankyous.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'THANK YOU',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'Lorem Ipsum is simply a dummy text ',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'for the printing and typesetting ',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'industry.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomButton(
              onPressed: () {
                // If no validation error, proceed with signing in
                // NavigationUtils.navigateToPage(
                //     context, AddItems());
              },
              text: 'VIEW ORDERS',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            GestureDetector(
              onTap: () {
                NavigationUtils.navigateToPage(context, ChooseScreen());
              },
              child: Text(
                'Back To Home',
                style: TextStyle(
                    fontSize: 15, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
