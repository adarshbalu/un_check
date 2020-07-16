import 'package:flutter/material.dart';
import 'package:un_check/widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SHOPPING LIST',
        ),
      ),
      body: ListView(
        children: <Widget>[
          CategoryCard(
            title: 'Bakery',
            number: 5,
          ),
          CategoryCard(
            title: 'Groceries',
            number: 3,
          ),
          CategoryCard(
            title: 'Pantry',
            number: 7,
          ),
        ],
      ),
    );
  }
}
