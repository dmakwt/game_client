import 'package:flutter/material.dart';

enum ItemType {
  Helmet,
  Chest,
  Pants,
  Shoes,
  Gloves,
  Weapon,
  Shield,
  Ring,
  Food,
  Potion,
}

class SelectedItem extends StatelessWidget {
  final ItemType type;

  SelectedItem({@required this.type});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.green.withOpacity(0.5),
          width: 70,
          height: 70,
          child: Image.asset(
            'assets/items/placeholders/melee_background.png',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          color: Colors.green.withOpacity(0.5),
          width: 70,
          height: 70,
        ),
      ],
    );
  }
}
