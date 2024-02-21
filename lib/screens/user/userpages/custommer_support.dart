import 'package:flutter/material.dart';

class CustommerSupport extends StatelessWidget {
  const CustommerSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color.fromARGB(255, 245, 242, 242),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 600,
              width: 420,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Text('''CALL TAXI Customer Support
        
        Welcome to CALL TAXI Customer Support! We're here to assist you with any questions, concerns, or issues you may have regarding our app.
        
        Contact Information:
        
        Phone: 2345678990
        Email: abc@gmail.com
        Live Chat: liveChat.com
        Mailing Address: abc@gmail.com
        Support Hours:
        
        Our customer support team is available to assist you during the following hours:
        
        Monday to Friday: full time
        Saturday: 9am to 5pm
        Sunday: no contact.
        FAQs:
        
        Before reaching out to our support team, you might find the answer to your question in our frequently asked questions section. Check it out here.
        
        Submit a Request:
        
        If you couldn't find the answer to your question in the FAQs or need further assistance, you can submit a support request using our online form. Click [here](Support Request Form) to fill out the form.
        
        Community Forums:
        
        Join our community forums to connect with other users, share tips, and get advice. Click [here](Community Forums) to access our forums.
        
        Social Media:
        
        Follow us on social media for news, updates, and support. Connect with us on Facebook, Twitter, and Instagram.
        
        Feedback:
        
        We value your feedback! Help us improve our app by sharing your thoughts and suggestions. Click [here](Feedback Form) to submit feedback.
        
        Privacy Policy:
        
        Your privacy is important to us. Read our privacy policy [here](Privacy Policy).
        
        If you require immediate assistance, please don't hesitate to contact our customer support team using the information provided above.
        
        Thank you for using call taxi app!'''),
            ),
          ),
        ),
      ),
    );
  }
}
