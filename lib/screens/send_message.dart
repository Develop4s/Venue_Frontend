import 'package:flutter/material.dart';
import 'package:venue/components/custom_button.dart';

class SendMessage extends  StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
      Size screenSize = MediaQuery.of(context).size;
    double paddingleft = screenSize.width * 0.05;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, // Use the back arrow icon
            color: Colors.black,
          ),
          onPressed: () {
            // NavigationUtils.navigateToPage(context, AddItems());
          },
        ),
        title: Text(
          'Send a Message',
          style: TextStyle(fontSize: 19, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
    child: Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2,),
    child:
    Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: paddingleft),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Subject',
                          style: TextStyle(
                              fontSize: 18, ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Container(
                          padding: EdgeInsets.only(left: paddingleft),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                          child: const Row(
                            children: [    
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Subject",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                          
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              
                     
                  Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: paddingleft),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Item',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.only(left: paddingleft),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                    child: TextFormField(
                      maxLines: null, // Allow multiple lines of text
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write a Message",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
                  
                  
                   SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                   CustomButton(
                      onPressed: () {
                        // If no validation error, proceed with signing in
                        // NavigationUtils.navigateToPage(
                        //     context, AddItems());
                      },
                      text: 'MAKE PAYMENT',
                    ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      CustomButtonSmall(onPressed: (){}, text: 'CALL US')
          ],
        
      ),
      ),
      ),
    );
  }
}