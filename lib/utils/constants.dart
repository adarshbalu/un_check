import 'package:flutter/material.dart';

const categoryDefaultTextStyle = TextStyle(fontSize: 19);

const categoryStrikeTextStyle = TextStyle(
  decorationStyle: TextDecorationStyle.dashed,
  decoration: TextDecoration.lineThrough,
  decorationThickness: 2,
  fontSize: 19,
  decorationColor: Colors.white,
  color: Colors.grey,
);

const itemStrikeTextStyle = TextStyle(
    decorationStyle: TextDecorationStyle.dashed,
    decoration: TextDecoration.lineThrough,
    decorationThickness: 2,
    fontSize: 20,
    decorationColor: Colors.white,
    color: Colors.grey,
    fontWeight: FontWeight.w600);

const itemDefaultTextStyle = TextStyle(
    decorationStyle: TextDecorationStyle.dashed,
    fontSize: 20,
    fontWeight: FontWeight.w600);

const quantityStrikeTextStyle = TextStyle(
  decorationStyle: TextDecorationStyle.dashed,
  decoration: TextDecoration.lineThrough,
  decorationThickness: 2,
  decorationColor: Colors.white,
  color: Colors.grey,
);
const quantityDefaultTextStyle = TextStyle(color: Colors.white);

const doneIcon = Icon(
  Icons.done,
  color: Colors.green,
);
const pendingIcon = Icon(
  Icons.info_outline,
  color: Colors.orange,
);

const List<String> typeChoices = [
  'pcs',
  'kg',
  'gr',
  'ltr',
  'pkg',
  'ml',
  'botl',
  'can',
];

const List<String> categoryChoices = [
  'Bakery',
  'Groceries',
  'Pantry',
  'Fruits and Vegetables',
  'Meat and Poultry',
  'Dairy and Eggs',
  'Household',
  'Books and Study items',
  'Other',
];

const String bakeryImage = 'assets/bakery.png';
const String studyImage = 'assets/books.png';
const String dairyImage = 'assets/dairy.png';
const String fruitsImage = 'assets/fruits.png';
const String groceriesImage = 'assets/groceries.png';
const String householdImage = 'assets/household.png';
const String meatImage = 'assets/meat.png';
const String pantryImage = 'assets/pantry.png';
const String otherImage = 'assets/other.png';

const String bakery = 'bakery';
const String study = 'study';
const String dairy = 'dairy';
const String fruits = 'fruits';
const String groceries = 'groceries';
const String household = 'household';
const String meat = 'meat';
const String pantry = 'pantry';
const String other = 'other';

const String itemsBoxName = 'items';

const Map<String, String> categoryToIcon = {
  bakery: bakeryImage,
  study: studyImage,
  dairy: dairyImage,
  fruits: fruitsImage,
  groceries: groceriesImage,
  household: householdImage,
  meat: meatImage,
  pantry: pantryImage,
  other: otherImage
};
