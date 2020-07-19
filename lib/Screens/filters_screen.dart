import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  Function saveFilters;
  Map<String, bool> fiters;

  FilterScreen(this.saveFilters, this.fiters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;
  Map<String, bool> selectedFilter;

  @override
  initState() {
    isGlutenFree = widget.fiters['gluten'];
    isVegan = widget.fiters['vegan'];
    isVegetarian = widget.fiters['vegetarian'];
    isLactoseFree = widget.fiters['lactose'];

    super.initState();
  }

  Widget _filtersList(
      {String title, String subtitle, bool value, Function updateValue}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Title"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilter = {
                    'gluten': isGlutenFree,
                    'lactose': isLactoseFree,
                    'vegan': isVegan,
                    'vegetarian': isVegetarian,
                  };

                  widget.saveFilters(selectedFilter);
                },
              )
            ],
          ),
          drawer: MainDrawer(),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Text("Adjust your Meal",
                    style: Theme.of(context).textTheme.title),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    _filtersList(
                        title: "Gluten Free",
                        subtitle: 'Only includes gluten free meals',
                        value: isGlutenFree,
                        updateValue: (newValue) {
                          setState(() {
                            isGlutenFree = newValue;
                          });
                        }),
                    _filtersList(
                      title: "Vegan",
                      subtitle: 'Only includes Vegan meals',
                      value: isVegan,
                      updateValue: (newValue) {
                        setState(() {
                          isVegan = newValue;
                        });
                      },
                    ),
                    _filtersList(
                      title: "Lactose Free",
                      subtitle: 'Only includes Lactose Free meals',
                      value: isLactoseFree,
                      updateValue: (newValue) {
                        setState(() {
                          isLactoseFree = newValue;
                        });
                      },
                    ),
                    _filtersList(
                      title: "Vegetarian",
                      subtitle: 'Only includes Vegetarian meals',
                      value: isVegetarian,
                      updateValue: (newValue) {
                        setState(() {
                          isVegetarian = newValue;
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
