import 'package:flutter/material.dart';
import 'package:un_check/screens/add_item_screen.dart';
import 'package:un_check/widgets/item_card.dart';

class DetailsScreen extends StatefulWidget {
  final String title;

  const DetailsScreen({Key key, this.title}) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text(
                '3/10',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
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
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ItemCard(
                    name: 'Apple',
                    quantity: 10,
                    type: 'pcs',
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AddItemScreen())),
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
  }
}
