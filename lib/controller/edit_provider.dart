import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final startingDateController = TextEditingController();
  final endingDateController = TextEditingController();
  final lisenceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> selectEndingDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      endingDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }
}
