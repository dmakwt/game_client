import 'dart:convert';

class UsedItems {
  final String helmet;
  final String chest;
  final String pants;
  final String shoes;
  final String weapon;
  final String shield;
  final String gloves;
  final String ring;
  UsedItems({
    this.helmet,
    this.chest,
    this.pants,
    this.shoes,
    this.weapon,
    this.shield,
    this.gloves,
    this.ring,
  });

  UsedItems copyWith({
    String helmet,
    String chest,
    String pants,
    String shoes,
    String weapon,
    String shield,
    String gloves,
    String ring,
  }) {
    return UsedItems(
      helmet: helmet ?? this.helmet,
      chest: chest ?? this.chest,
      pants: pants ?? this.pants,
      shoes: shoes ?? this.shoes,
      weapon: weapon ?? this.weapon,
      shield: shield ?? this.shield,
      gloves: gloves ?? this.gloves,
      ring: ring ?? this.ring,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'helmet': helmet,
      'chest': chest,
      'pants': pants,
      'shoes': shoes,
      'weapon': weapon,
      'shield': shield,
      'gloves': gloves,
      'ring': ring,
    };
  }

  static UsedItems fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UsedItems(
      helmet: map['helmet'],
      chest: map['chest'],
      pants: map['pants'],
      shoes: map['shoes'],
      weapon: map['weapon'],
      shield: map['shield'],
      gloves: map['gloves'],
      ring: map['ring'],
    );
  }

  String toJson() => json.encode(toMap());

  static UsedItems fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'UsedItems(helmet: $helmet, chest: $chest, pants: $pants, shoes: $shoes, weapon: $weapon, shield: $shield, gloves: $gloves, ring: $ring)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UsedItems &&
      o.helmet == helmet &&
      o.chest == chest &&
      o.pants == pants &&
      o.shoes == shoes &&
      o.weapon == weapon &&
      o.shield == shield &&
      o.gloves == gloves &&
      o.ring == ring;
  }

  @override
  int get hashCode {
    return helmet.hashCode ^
      chest.hashCode ^
      pants.hashCode ^
      shoes.hashCode ^
      weapon.hashCode ^
      shield.hashCode ^
      gloves.hashCode ^
      ring.hashCode;
  }
}