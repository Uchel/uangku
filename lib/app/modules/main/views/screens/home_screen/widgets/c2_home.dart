import 'package:flutter/material.dart';

class C2Home extends StatelessWidget {
  const C2Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        "Transaction",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
