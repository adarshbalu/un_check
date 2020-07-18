import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:un_check/models/item.dart';
import 'package:un_check/utils/constants.dart';

class AddItemScreen extends StatefulWidget {
  final String category;
  const AddItemScreen({Key key, this.category}) : super(key: key);
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController nameController, quantityController;
  String type, name;
  double quantity;
  int _defaultChoiceIndex;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController = TextEditingController();
    quantityController = TextEditingController();
    type = 'pcs';
    _defaultChoiceIndex = 0;
    super.initState();
  }

  showSnackBarWidget(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        'Please enter valid Values',
        style: TextStyle(color: Colors.red),
      ),
    ));
  }

  addItem() {
    final itemBox = Hive.box(itemsBoxName);
    final newItem = Item(
        name: name,
        type: type,
        quantity: quantity,
        category: widget.category,
        done: false);
    itemBox.add(newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add item to ${widget.category.toUpperCase()}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
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
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Name of the item',
                              helperText: 'Item Name',
                            ),
                            onChanged: (v) {
                              _formKey.currentState.validate();
                            },
                            controller: nameController,
                            validator: (value) {
                              if (value.isEmpty || value == '') {
                                return 'Please enter Value';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (v) {
                            _formKey.currentState.validate();
                          },
                          validator: (value) {
                            if (value.isEmpty || value == '') {
                              return 'Please enter Value';
                            }
                            double v = double.tryParse(value);
                            if (v == null) {
                              return 'Error value';
                            }
                            if (double.tryParse(value).isNaN ||
                                double.tryParse(value).isNegative) {
                              return 'Enter valid quantity';
                            }
                            return null;
                          },
                          maxLength: 10,
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Quantity',
                          ),
                          controller: quantityController,
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
                  Builder(builder: (context) {
                    return RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.green,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            type = typeChoices[_defaultChoiceIndex];
                            name = nameController.text;
                            quantity = double.parse(quantityController.text);
                            addItem();
                            Navigator.pop(context);
                          } else
                            showSnackBarWidget(context);
                        },
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Add item'));
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget choiceChips() {
    List<Widget> choiceChipWidgets = List<Widget>();
    for (int i = 0; i < typeChoices.length; i++) {
      choiceChipWidgets.add(ChoiceChip(
        label: Text(typeChoices[i]),
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

  @override
  void dispose() {
    nameController.clear();
    quantityController.clear();
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }
}
