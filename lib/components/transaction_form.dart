import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    // ignore: avoid_print
    final title = _titleController.text;
    // ignore: avoid_print
    final value = double.tryParse(_valueController.text) ?? 0.0;

    // ignore: unnecessary_null_comparison
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            // ignore: prefer_const_constructors
            TextField(
              controller: _titleController,
              onSubmitted: (value) => _submitForm(),
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            // ignore: prefer_const_constructors
            TextField(
              controller: _valueController,
              // ignore: prefer_const_constructors
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => _submitForm(),
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  // ignore: unnecessary_null_comparison
                  Text(
                    _selectedDate == null
                        ? 'Nenhuma data selecionada!'
                        : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                  ),
                  ElevatedButton(
                    // ignore: prefer_const_constructors
                    child: Text(
                      'Selecionar Data',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[100],
                      onPrimary: Colors.purple.shade300,
                    ),
                    onPressed: _showDatePicker,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  // ignore: prefer_const_constructors
                  child: Text('Nova Transação'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple.shade300,
                    onPrimary: Theme.of(context).textTheme.button!.color,
                  ),
                  onPressed: _submitForm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
