import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  TransactionList(this.transactions, this.onRemove);
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  // ignore: prefer_const_constructors
                  SizedBox(height: 20),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: constraints.maxHeight * 0.30,
                    child: Text(
                      'Nenhuma Transação Cadastrada!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(height: 20),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'lib/assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                // ignore: prefer_const_constructors
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 300
                      ? ElevatedButton.icon(
                          onPressed: () => onRemove(tr.id),
                          // ignore: prefer_const_constructors
                          icon: Icon(Icons.delete),
                          // ignore: prefer_const_constructors
                          label: Text('Excluir'),
                        )
                      : IconButton(
                          // ignore: prefer_const_constructors
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => onRemove(tr.id),
                        ),
                ),
              );
            },
          );
  }
}
