import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String category;
  @HiveField(2)
  String type;
  @HiveField(3)
  double quantity;
  @HiveField(4)
  bool done;

  Item({this.name, this.category, this.type, this.quantity, this.done});
  Item copy(
      {String name, String category, String type, double quantity, bool done}) {
    if (name != null) this.name = name;
    if (category != null) this.category = category;
    if (type != null) this.type = type;
    if (quantity != null) this.quantity = quantity;
    if (done != null) this.done = done;
    return this;
  }
}
