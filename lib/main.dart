import 'package:flutter/material.dart';
import './Models/Meal.dart';
import './dummy_data.dart';
import './Screens/filters_screen.dart';
import './Screens/tabs_screen.dart';
import './Screens/meal_details_screen.dart';
import 'Screens/category_meals_screen.dart';
import 'Screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouritedMeals = [];

  void updateFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filterData['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filterData['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filterData['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (filterData['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouritedMeals.indexWhere((meal) => meal.id == mealId);
    print(existingIndex);

    if (existingIndex >= 0) {
      setState(() {
        _favouritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavourite(String id) {
    return _favouritedMeals.any((meal) => meal.id == id);
  }

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
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouritedMeals),
        CategoriesMealsScreen.routeName: (_) =>
            CategoriesMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (_) =>
            MealDetailsScreen(_toggleFavourite, isMealFavourite),
        FilterScreen.routeName: (_) => FilterScreen(updateFilters, _filters),
      },
    );
  }
}
