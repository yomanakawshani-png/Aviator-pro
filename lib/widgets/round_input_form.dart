import 'package:flutter/material.dart';

class RoundInputForm extends StatelessWidget {
  final int roundNumber;
  final double multiplier;
  final DateTime timestamp;

  RoundInputForm({required this.roundNumber, required this.multiplier, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Round Number',
              border: OutlineInputBorder(),
            ),
            controller: TextEditingController(text: roundNumber.toString()),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Multiplier',
              border: OutlineInputBorder(),
            ),
            controller: TextEditingController(text: multiplier.toString()),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Timestamp',
              border: OutlineInputBorder(),
            ),
            controller: TextEditingController(text: timestamp.toUtc().toString()),
          ),
        ],
      ),
    );
  }
}