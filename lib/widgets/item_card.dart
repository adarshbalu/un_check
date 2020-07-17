import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:un_check/utils/constants.dart';

class ItemCard extends StatelessWidget {
  final String name, type;
  final double quantity;
  const ItemCard({
    Key key,
    this.name,
    this.type,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            builder: (context) => Container(
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Uncheck $name ?',
                          style: TextStyle(color: Colors.black, fontSize: 19),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            iconSize: 40,
                            color: Colors.green,
                            icon: Icon(
                              Icons.done,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          IconButton(
                            iconSize: 40,
                            color: Colors.red,
                            icon: Icon(Icons.info_outline),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(name, style: itemDefaultTextStyle),
                SizedBox(
                  height: 8,
                ),
                Text(quantity.toString() + ' ' + type,
                    style: quantityDefaultTextStyle)
              ],
            ),
            pendingIcon
          ],
        ),
      ),
    );
  }
}
