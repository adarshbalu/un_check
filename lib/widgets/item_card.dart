import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:un_check/models/item.dart';
import 'package:un_check/utils/constants.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final int index;
  const ItemCard({
    Key key,
    this.item,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemBox = Hive.box(itemsBoxName);
    return InkWell(
      onLongPress: () {
        itemBox.deleteAt(index);
      },
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
                          'Uncheck ${item.name} ?',
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
                              Item newItem = item.copy(done: true);
                              itemBox.putAt(index, newItem);
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
                              Item newItem = item.copy(done: false);
                              itemBox.putAt(index, newItem);
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
                Text(item.name, style: itemDefaultTextStyle),
                SizedBox(
                  height: 8,
                ),
                Text(item.quantity.toString() + ' ' + item.type,
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
