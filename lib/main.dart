import 'package:flutter/material.dart';
import './Screens/filters_screen.dart';
import './Screens/tabs_screen.dart';
import './Screens/meal_details_screen.dart';
import 'Screens/category_meals_screen.dart';
import 'Screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontFamily: "RobotoCondensed",
                  fontSize: 24,
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoriesMealsScreen.routeName: (_) => CategoriesMealsScreen(),
        MealDetailsScreen.routeName: (_) => MealDetailsScreen(),
        FilterScreen.routeName: (_) => FilterScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.name);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
