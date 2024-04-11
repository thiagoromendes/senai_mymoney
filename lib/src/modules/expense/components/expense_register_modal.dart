import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:my_money/src/modules/expense/controller/expense_register_controller.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/components/app_button.dart';
import 'package:my_money/src/shared/components/app_title.dart';
import 'package:my_money/src/shared/components/bar_modal.dart';
import 'package:my_money/src/shared/helpers/input_mask.dart';
import 'package:my_money/src/shared/helpers/text_input_formatter.dart';

class ExpenseRegisterModal extends StatefulWidget {
  const ExpenseRegisterModal({super.key});

  @override
  State<ExpenseRegisterModal> createState() => _ExpenseRegisterModalState();
}

class _ExpenseRegisterModalState extends State<ExpenseRegisterModal> {
  final ExpenseRegisterController controller = ExpenseRegisterController();
  final TextInputFormatter moneyFormatter = InputMask.moneyFormatter;
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
  late TextEditingController? moneyTextEditingController =
      TextEditingController(text: moneyFormatter.formatText("0,00"));

  String dropdownValue = '';
  String dropdownFirstValue = '';

  @override
  void initState() {
    super.initState();
  }

  void handleSelectCategory(String value) {
    setState(() {
      dropdownValue = value;
      dropdownFirstValue = value;
    });
  }

  Future<void> handleSetDate(BuildContext context) async {
    controller.setExpensaDate(await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 10,
      theme: ThemeData(primarySwatch: Colors.green),
      height: MediaQuery.of(context).size.height * 0.35,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = <String>[
      'Alimentação',
      'Casa',
      'Dívidas',
      'Educaçao',
      'Lazer',
      'Pessoal',
      'Saúde',
      'Serviço',
      'Transporte'
    ];

    if (dropdownFirstValue.isEmpty) dropdownFirstValue = categories.first;

    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Observer(builder: (_) {
          return Scaffold(
            backgroundColor: AppColors.appPageBackground,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const BarModal(),
                  const AppTitle(title: 'Nova despesa'),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                            inputFormatters: [moneyFormatter],
                            controller: moneyTextEditingController,
                            enabled: true,
                            textAlign: TextAlign.start,
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.green,
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                focusColor: Colors.white,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              enabled: true,
                              textAlign: TextAlign.start,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: descriptionTextEditingController,
                              decoration: const InputDecoration(
                                  label: Text(
                                    'Descrição',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  focusColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                  prefixIcon: Icon(
                                    Icons.description_outlined,
                                    color: Colors.green,
                                  )),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 10),
                            child: DropdownButton<String>(
                              icon: const Icon(Icons.category_outlined,
                                  color: Colors.green),
                              enableFeedback: true,
                              isExpanded: true,
                              value: categories.first == dropdownFirstValue
                                  ? dropdownFirstValue
                                  : dropdownValue,
                              style: const TextStyle(
                                color: Colors.green,
                              ),
                              underline: Container(
                                height: 1,
                                color: Colors.green,
                              ),
                              onChanged: (String? value) {
                                handleSelectCategory(value ?? dropdownValue);
                              },
                              items: categories.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          GestureDetector(
                              onTap: () => handleSetDate(context),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  right: 5,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        controller.expenseDateFormat.isNotEmpty
                                            ? Text(controller.expenseDateFormat,
                                                style: const TextStyle(
                                                  color: Colors.green,
                                                ))
                                            : const Text("Data",
                                                style: TextStyle(
                                                  color: Colors.green,
                                                )),
                                        const Icon(
                                          Icons.calendar_month,
                                          color: Colors.green,
                                        )
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.green,
                                      thickness: 1,
                                    )
                                  ],
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: AppButton(
                                action: () {
                                  controller.sendData(
                                    value: moneyTextEditingController!.text,
                                    description:
                                        descriptionTextEditingController.text,
                                    category: dropdownValue,
                                    registrationDate:
                                        controller.expenseDateFormat,
                                  );
                                  Navigator.pop(context);
                                },
                                label: 'Cadastrar Despesa'),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
