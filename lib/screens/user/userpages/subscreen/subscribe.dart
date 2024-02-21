import 'package:flutter/material.dart';

class Subscribe extends StatelessWidget {
  Subscribe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Thank you For the support.',
              style: TextStyle(
                  color: Color.fromARGB(198, 7, 22, 153),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
                '''The essential elements of an excellent Contact Us page include a clear call to action, easy navigation, and a message that resonates with visitors.                                       
              The essential elements of an excellent Contact Us page include a clear call to action, easy navigation, and a message that resonates with visitors.
          
          Keep these things in mind when designing a Contact Us page: Don’t overload visitors with too much information, use readable text, and create a landing page that converts.
          
          A well-designed contact page should include several elements, such as a phone number, email address, and social media links.
          
          In addition, a Contact Us page must be easily visible on your navigation bar. It can be frustrating for a consumer to hunt through a website to find out how to contact
           a consumer to hunt through a website to find out how to contact...!'''),
          )
        ],
      ),
    );
  }
}
