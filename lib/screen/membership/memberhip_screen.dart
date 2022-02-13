import 'package:flutter/material.dart';
import 'package:fusia/screen/membership/component/appbar.dart';
import 'package:fusia/screen/membership/component/body.dart';

class membership extends StatelessWidget {
  const membership({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: body(),
    );
  }
}
