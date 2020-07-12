import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meals_details_screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text("Text"),
    );
  }
}
