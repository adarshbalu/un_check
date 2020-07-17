import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController name, quantity;
  String type;
  List<String> _choices;
  int _defaultChoiceIndex;
  @override
  void initState() {
    name = TextEditingController();
    quantity = TextEditingController();
    type = 'pcs';
    _defaultChoiceIndex = 0;
    _choices = [
      'pcs',
      'kg',
      'gr',
      'ltr',
      'pkg',
      'ml',
      'botl',
      'can',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add item'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
              color: Color(0xff3A3940),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Name of the item',
                              helperText: 'Item Name',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(),
                              disabledBorder: OutlineInputBorder(),
                              focusedErrorBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder()),
                          controller: name,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Quantity',
                            helperText: 'Quantity',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(),
                            disabledBorder: OutlineInputBorder(),
                            focusedErrorBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder()),
                        controller: quantity,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                choiceChips(),
                SizedBox(
                  height: 16,
                ),
                RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.green,
                    onPressed: () {
                      type = _choices[_defaultChoiceIndex];
                      print(type);
                    },
                    icon: Icon(Icons.add_shopping_cart),
                    label: Text('Add item'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget choiceChips() {
    List<Widget> choiceChipWidgets = List<Widget>();
    for (int i = 0; i < _choices.length; i++) {
      choiceChipWidgets.add(ChoiceChip(
        label: Text(_choices[i]),
        selected: _defaultChoiceIndex == i,
        selectedColor: Colors.green,
        onSelected: (bool selected) {
          setState(() {
            _defaultChoiceIndex = selected ? i : 0;
          });
        },
        backgroundColor: Colors.blueGrey,
        labelStyle: TextStyle(color: Colors.white),
      ));
    }
    return Wrap(
      children: choiceChipWidgets,
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 0,
    );
  }
}
