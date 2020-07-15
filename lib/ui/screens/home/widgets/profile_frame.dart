import 'package:flutter/material.dart';

import 'selected_item.dart';

class ProfileFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
          ),
          SizedBox(
            height: 550,
            width: 500,
            child: Stack(
              children: <Widget>[
                Container(
                  // color: Colors.yellow.withOpacity(0.3),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/frames/Inventory_bar.png',
                    fit: BoxFit.fill,
                    // scale: 0.4,
                    width: 700,
                    height: 490,
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 30,
                  right: 40,
                  child: Image.asset(
                    'assets/characters/assassin_silhouette_man.png',
                    fit: BoxFit.contain,
                    // scale: 0.2,
                    width: 500,
                    height: 450,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 18,
                  child: Column(
                    children: <Widget>[
                      SelectedItem(
                        type: ItemType.Weapon,
                      ),
                      SizedBox(height: 20),
                      SelectedItem(
                        type: ItemType.Shield,
                      ),
                      SizedBox(height: 20),
                      SelectedItem(
                        type: ItemType.Gloves,
                      ),
                      SizedBox(height: 20),
                      SelectedItem(
                        type: ItemType.Ring,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 18,
                  child: Column(
                    children: <Widget>[
                      SelectedItem(
                        type: ItemType.Helmet,
                      ),
                      SizedBox(height: 20),
                      SelectedItem(
                        type: ItemType.Chest,
                      ),
                      SizedBox(height: 20),
                      SelectedItem(
                        type: ItemType.Pants,
                      ),
                      SizedBox(height: 20),
                      SelectedItem(
                        type: ItemType.Shoes,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/frames/field.png',
                    fit: BoxFit.fill,
                    // scale: 0.4,
                    width: 350,
                    height: 65,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
