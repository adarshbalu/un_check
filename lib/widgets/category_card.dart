import 'package:flutter/material.dart';
import 'package:un_check/screens/details_screen.dart';
import 'package:un_check/utils/constants.dart';

class CategoryCard extends StatelessWidget {
  final String title, icon, category;
  final int total, completed;
  final bool done;
  const CategoryCard({
    Key key,
    this.title,
    this.icon,
    this.total,
    this.category,
    this.done,
    this.completed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon ic = Icon(Icons.add);
    Color backgroundColor = Colors.grey;
    Color textColor = Colors.white;
    Color titleColor = Colors.white;
    bool empty = false;
    if (total == 0) {
      empty = true;
    }
    if (done) {
      backgroundColor = Colors.green;
      textColor = Colors.white;
      ic = Icon(Icons.arrow_forward);
    } else if (!empty) {
      backgroundColor = Colors.orangeAccent;
      textColor = Colors.white;
      ic = Icon(Icons.arrow_forward);
    } else {
      titleColor = Colors.grey;
    }

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailsScreen(
                    title: title,
                    category: category,
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
                      child: Image.asset(icon)),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      title,
                      style:
                          categoryDefaultTextStyle.copyWith(color: titleColor),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.only(left: 5),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      completed.toString() + '/' + total.toString(),
                      style: TextStyle(color: textColor),
                    ),
                  )
                ],
              ),
              ic
            ],
          ),
        ),
      ),
    );
  }
}
