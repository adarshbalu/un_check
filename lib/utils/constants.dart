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
