// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExpenseRegisterController on _ExpenseRegisterController, Store {
  late final _$categoryValueAtom =
      Atom(name: '_ExpenseRegisterController.categoryValue', context: context);

  @override
  String get categoryValue {
    _$categoryValueAtom.reportRead();
    return super.categoryValue;
  }

  @override
  set categoryValue(String value) {
    _$categoryValueAtom.reportWrite(value, super.categoryValue, () {
      super.categoryValue = value;
    });
  }

  late final _$expenseDateTimeAtom = Atom(
      name: '_ExpenseRegisterController.expenseDateTime', context: context);

  @override
  DateTime? get expenseDateTime {
    _$expenseDateTimeAtom.reportRead();
    return super.expenseDateTime;
  }

  @override
  set expenseDateTime(DateTime? value) {
    _$expenseDateTimeAtom.reportWrite(value, super.expenseDateTime, () {
      super.expenseDateTime = value;
    });
  }

  late final _$expenseDateFormatAtom = Atom(
      name: '_ExpenseRegisterController.expenseDateFormat', context: context);

  @override
  String get expenseDateFormat {
    _$expenseDateFormatAtom.reportRead();
    return super.expenseDateFormat;
  }

  @override
  set expenseDateFormat(String value) {
    _$expenseDateFormatAtom.reportWrite(value, super.expenseDateFormat, () {
      super.expenseDateFormat = value;
    });
  }

  late final _$_ExpenseRegisterControllerActionController =
      ActionController(name: '_ExpenseRegisterController', context: context);

  @override
  void setCategoryValue(String value) {
    final _$actionInfo = _$_ExpenseRegisterControllerActionController
        .startAction(name: '_ExpenseRegisterController.setCategoryValue');
    try {
      return super.setCategoryValue(value);
    } finally {
      _$_ExpenseRegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpensaDate(DateTime? dateTime) {
    final _$actionInfo = _$_ExpenseRegisterControllerActionController
        .startAction(name: '_ExpenseRegisterController.setExpensaDate');
    try {
      return super.setExpensaDate(dateTime);
    } finally {
      _$_ExpenseRegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoryValue: ${categoryValue},
expenseDateTime: ${expenseDateTime},
expenseDateFormat: ${expenseDateFormat}
    ''';
  }
}
