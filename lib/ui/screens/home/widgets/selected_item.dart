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

  String getItemPlaceholders(ItemType selectedType) {
    switch (selectedType) {
      case ItemType.Weapon:
        return 'weapon_background';
      case ItemType.Shield:
        return 'shield_background';
      case ItemType.Gloves:
        return 'gloves_background';
      case ItemType.Weapon:
        return 'weapon_background';
      case ItemType.Weapon:
        return 'weapon_background';
      case ItemType.Weapon:
        return 'weapon_background';
      case ItemType.Weapon:
        return 'weapon_background';
      case ItemType.Weapon:
        return 'weapon_background';
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          // color: Colors.green.withOpacity(0.5),
          width: 80,
          height: 80,
          child: Image.asset(
            'assets/items/placeholders/weapon_background.png',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          // color: Colors.green.withOpacity(0.5),
          width: 80,
          height: 80,
        ),
      ],
    );
  }
}
