import 'package:flutter/material.dart';

class NotFoundNavigationWidget extends StatelessWidget {
  final String _title = 'Not Found';
  const NotFoundNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(_title),
    );
  }
}
