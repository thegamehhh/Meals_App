import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  void selectedIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Meal> _favoriteMeals = [];
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget selectPage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      selectPage = MealsScreen(
        meals: [],
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: selectPage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectedIndex,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal_rounded), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded), label: 'Favorites')
          ]),
    );
  }
}
