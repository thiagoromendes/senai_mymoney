import 'package:flutter/material.dart';
import 'package:my_money/src/modules/home/components/expense_register_modal.dart';
import 'package:my_money/src/shared/components/app_modal.dart';

class ExpenseButton {
  static Widget? add(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () {
        AppModal.show(
          context,
          const ExpenseRegisterModal(),
          expand: false,
        );
      },
      tooltip: 'Nova despesa',
      child: const Icon(Icons.paid, color: Colors.white, size: 45),
    );
  }
}
