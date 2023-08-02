import 'package:flutter/material.dart';
import 'package:uangku_getx/app/modules/main/views/screens/home_screen/widgets/c3_home_card_history.dart';

// ignore: must_be_immutable
class C3Home extends StatelessWidget {
  C3Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CardHistoryHome(),
            CardHistoryHome(),
            CardHistoryHome(),
            CardHistoryHome(),
            CardHistoryHome(),
            CardHistoryHome(),
            CardHistoryHome(),
            CardHistoryHome(),
            CardHistoryHome(),
            CardHistoryHome(),
          ],
        ),
      ),
    );
  }
}
