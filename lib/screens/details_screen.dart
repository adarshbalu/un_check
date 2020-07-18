import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:un_check/models/item.dart';
import 'package:un_check/screens/add_item_screen.dart';
import 'package:un_check/utils/constants.dart';
import 'package:un_check/widgets/item_card.dart';

class DetailsScreen extends StatefulWidget {
  final String title, category;

  const DetailsScreen({Key key, this.title, this.category}) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int totalItems, completedItems;
  Box itemsBox;
  List<Widget> itemCardWidgets;
  @override
  void initState() {
    totalItems = completedItems = 0;
    itemCardWidgets = List<Widget>();
    itemsBox = Hive.box(itemsBoxName);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    return ValueListenableBuilder(
      valueListenable: itemsBox.listenable(),
      builder: (context, Box box, _) {
        getCount();
        if (box.isOpen) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(widget.title),
              actions: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text(
                      '$completedItems/$totalItems',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
            body: Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff3A3940),
                    ),
                    child: itemCardWidgets.length > 0
                        ? ListView(
                            shrinkWrap: true,
                            children: getAllItems(),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.5,
                                margin: EdgeInsets.only(left: 8, right: 8),
                                child: SvgPicture.asset(emptyImage,
                                    semanticsLabel: 'Empty'),
                              ),
                              Text(
                                'Add items to list',
                                style: itemDefaultTextStyle,
                              ),
                            ],
                          ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddItemScreen(
                            category: widget.category,
                          ),
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else
          return SizedBox();
      },
    );
  }

  List<Widget> getAllItems() {
    itemCardWidgets = [];

    for (int i = 0; i < itemsBox.length; i++) {
      Item item = itemsBox.getAt(i);

      if (item.category == widget.category) {
        if (item.done) {
          itemCardWidgets.add(
            ItemCard(
              item: item,
              index: i,
            ),
          );
        } else {
          itemCardWidgets.insert(
            0,
            ItemCard(
              item: item,
              index: i,
            ),
          );
        }
      }
    }

    return itemCardWidgets;
  }

  getCount() {
    totalItems = completedItems = 0;
    for (int i = 0; i < itemsBox.length; i++) {
      Item item = itemsBox.getAt(i);
      if (item.category == widget.category) {
        totalItems++;
        if (item.done) completedItems++;
      }
    }
  }
}
