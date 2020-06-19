import 'dart:convert';

class UserSkills {
  final double strength;
  final double defence;
  final double agility;
  final double constitution;
  final double intelligence;
  final double luck;
  UserSkills({
    this.strength,
    this.defence,
    this.agility,
    this.constitution,
    this.intelligence,
    this.luck,
  });

  UserSkills copyWith({
    double strength,
    double defence,
    double agility,
    double constitution,
    double intelligence,
    double luck,
  }) {
    return UserSkills(
      strength: strength ?? this.strength,
      defence: defence ?? this.defence,
      agility: agility ?? this.agility,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      luck: luck ?? this.luck,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'strength': strength,
      'defence': defence,
      'agility': agility,
      'constitution': constitution,
      'intelligence': intelligence,
      'luck': luck,
    };
  }

  static UserSkills fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserSkills(
      strength: map['strength']?.toDouble(),
      defence: map['defence']?.toDouble(),
      agility: map['agility']?.toDouble(),
      constitution: map['constitution']?.toDouble(),
      intelligence: map['intelligence']?.toDouble(),
      luck: map['luck']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  static UserSkills fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserSkills(strength: $strength, defence: $defence, agility: $agility, constitution: $constitution, intelligence: $intelligence, luck: $luck)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UserSkills &&
      o.strength == strength &&
      o.defence == defence &&
      o.agility == agility &&
      o.constitution == constitution &&
      o.intelligence == intelligence &&
      o.luck == luck;
  }

  @override
  int get hashCode {
    return strength.hashCode ^
      defence.hashCode ^
      agility.hashCode ^
      constitution.hashCode ^
      intelligence.hashCode ^
      luck.hashCode;
  }
}