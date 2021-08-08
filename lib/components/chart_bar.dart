import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                // ignore: unnecessary_string_interpolations
                child: Text('${value.toStringAsFixed(2)}'),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: constraints.maxHeight * 0.05),
            // ignore: sized_box_for_whitespace
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      // ignore: prefer_const_constructors
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: constraints.maxHeight * 0.05),
            // ignore: sized_box_for_whitespace
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
