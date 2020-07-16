import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meals_details';

  Widget _buildTitleWidget(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        height: 150,
        width: 350,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String mealid = routeArgs['id'];
    final String title = routeArgs['title'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    // final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitleWidget(context, 'Ingredients'),
            _buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildTitleWidget(context, 'Steps'),
            _buildContainer(
              ListView.builder(
                  itemBuilder: (context, index) => Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${(index + 1)}'),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          Divider()
                        ],
                      ),
                  itemCount: selectedMeal.steps.length),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealid);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
