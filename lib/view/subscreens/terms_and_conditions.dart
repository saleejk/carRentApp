import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.white70,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 600,
              width: 400,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 247, 244, 244)),
              child: const Text('''  
                       Welcome to our Car Rental App CALL TAXI. These terms and conditions Terms govern your use of the App and the services offered through it. By accessing or using the App, you agree to be bound by these Terms. Please read them carefully before using the App.
      
      1. Acceptance of Terms
      
      By accessing or using the App, you agree to be bound by these Terms. If you do not agree to these Terms, you may not access or use the App.
      
      2. Use of the App
      
      You agree to use the App only for lawful purposes and in accordance with these Terms. You may not use the App in any manner that could damage, disable, overburden, or impair the App or interfere with any other party's use of the App.
      
      3. Registration
      
      In order to access certain features of the App, you may be required to register for an account. You agree to provide accurate and complete information when registering for an account and to update your information as necessary to keep it accurate and complete.
      
      4. Rental Agreement
      
      By renting a car through the App, you agree to be bound by the terms of the rental agreement provided by the car rental company. You are responsible for reviewing and understanding the terms of the rental agreement before renting a car.
      
      5. Payment
      
      You agree to pay all fees and charges associated with your use of the App in accordance with the pricing and payment terms provided by the App. All payments are non-refundable unless otherwise specified.
      
      6. Cancellation and Refund Policy
      
      Cancellation and refund policies may vary depending on the car rental company and the terms of the rental agreement. Please review the cancellation and refund policy provided by the car rental company before renting a car.
      
      7. Disclaimer of Warranty
      
      The App is provided on an "as is" and "as available" basis, without any warranties of any kind, either express or implied. We do not warrant that the App will be uninterrupted or error-free, that defects will be corrected, or that the App or the server that makes it available are free of viruses or other harmful components.
      
      8. Limitation of Liability
      
      In no event shall we be liable for any indirect, incidental, special, consequential, or punitive damages, including without limitation, lost profits, lost revenue, lost savings, loss of data, replacement costs, or any similar damages, whether based in contract, tort (including negligence), strict liability, or otherwise, arising from your use of the App.
      
      9. Governing Law
      
      These Terms shall be governed by and construed in accordance with the laws of [Your Jurisdiction], without regard to its conflict of law provisions.
      
      10. Changes to Terms
      
      We reserve the right to modify these Terms at any time, effective upon posting of the modified Terms on the App. Your continued use of the App following the posting of the modified Terms will constitute your acceptance of the changes.
      
      11. Contact Us
      
      If you have any questions about these Terms, please contact us at [contact email or address].'''),
            ),
          ),
        ),
      ),
    );
  }
}
