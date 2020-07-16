import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filters-screen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
        ),
        drawer: MainDrawer(),
        body: Center(
          child: Text("data"),
        ),
      ),
    );
  }
}
