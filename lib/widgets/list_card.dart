import 'package:flutter/material.dart';
import 'package:un_check/screens/details_screen.dart';

class ListCard extends StatelessWidget {
  final String title;
  final Icon icon;
  final int number;

  const ListCard({
    Key key,
    this.title,
    this.icon,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailsScreen(
                    title: title,
                  ))),
      child: Card(
        margin: EdgeInsets.symmetric(
            vertical: 8, horizontal: MediaQuery.of(context).size.width / 15),
        color: Color(0xff3A3940),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            (15),
          ),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 16,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8),
                    child: Icon(
                      Icons.assignment,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.only(left: 5),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      number.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }
}
