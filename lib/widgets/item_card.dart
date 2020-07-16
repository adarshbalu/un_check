import 'package:flutter/material.dart';
import 'package:un_check/utils/constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Name', style: itemDefaultTextStyle),
              SizedBox(
                height: 8,
              ),
              Text('100 pcs', style: quantityDefaultTextStyle)
            ],
          ),
          pendingIcon
        ],
      ),
    );
  }
}
