import 'package:bankbalance/screen/home/body/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(
        textScaleFactor: query.textScaleFactor.clamp(1.0, 1.4),
      ),
      child: Theme(
        data: ThemeData.light(),
        child: Body(),
      ),
    );
  }
}
