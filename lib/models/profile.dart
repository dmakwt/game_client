import 'dart:convert';

import 'used_items.dart';
import 'user_skills.dart';

class Profile {
  final UserSkills userSkills;
  final UsedItems usedItems;
  final String position;
  final double hp;
  final double energy;
  final int level;
  final double xp;
  final bool showLeaderboard;
  final int skillPoints;
  final double honor;
  final double money;
  final int gems;
  final int wins;
  final int loses;
  final String username;
  final String usernameID;
  final String avatarURL;
  final String bio;
  final String createdAt;
  final String updatedAt;

  Profile({
    this.userSkills,
    this.usedItems,
    this.position,
    this.hp,
    this.energy,
    this.level,
    this.xp,
    this.showLeaderboard,
    this.skillPoints,
    this.honor,
    this.money,
    this.gems,
    this.wins,
    this.loses,
    this.username,
    this.usernameID,
    this.avatarURL,
    this.bio,
    this.createdAt,
    this.updatedAt,
  });

  Profile copyWith({
    UserSkills userSkills,
    UsedItems usedItems,
    String position,
    double hp,
    double energy,
    int level,
    double xp,
    bool showLeaderboard,
    int skillPoints,
    double honor,
    double money,
    int gems,
    int wins,
    int loses,
    String username,
    String usernameID,
    String avatarURL,
    String bio,
    String createdAt,
    String updatedAt,
  }) {
    return Profile(
      userSkills: userSkills ?? this.userSkills,
      usedItems: usedItems ?? this.usedItems,
      position: position ?? this.position,
      hp: hp ?? this.hp,
      energy: energy ?? this.energy,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      showLeaderboard: showLeaderboard ?? this.showLeaderboard,
      skillPoints: skillPoints ?? this.skillPoints,
      honor: honor ?? this.honor,
      money: money ?? this.money,
      gems: gems ?? this.gems,
      wins: wins ?? this.wins,
      loses: loses ?? this.loses,
      username: username ?? this.username,
      usernameID: usernameID ?? this.usernameID,
      avatarURL: avatarURL ?? this.avatarURL,
      bio: bio ?? this.bio,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userSkills': userSkills?.toMap(),
      'usedItems': usedItems?.toMap(),
      'position': position,
      'hp': hp,
      'energy': energy,
      'level': level,
      'xp': xp,
      'showLeaderboard': showLeaderboard,
      'skillPoints': skillPoints,
      'honor': honor,
      'money': money,
      'gems': gems,
      'wins': wins,
      'loses': loses,
      'username': username,
      'usernameID': usernameID,
      'avatarURL': avatarURL,
      'bio': bio,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  static Profile fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Profile(
      userSkills: UserSkills.fromMap(map['userSkills']),
      usedItems: UsedItems.fromMap(map['usedItems']),
      position: map['position'],
      hp: map['hp']?.toDouble(),
      energy: map['energy']?.toDouble(),
      level: map['level']?.toInt(),
      xp: map['xp']?.toDouble(),
      showLeaderboard: map['showLeaderboard'],
      skillPoints: map['skillPoints']?.toInt(),
      honor: map['honor']?.toDouble(),
      money: map['money']?.toDouble(),
      gems: map['gems']?.toInt(),
      wins: map['wins']?.toInt(),
      loses: map['loses']?.toInt(),
      username: map['username'],
      usernameID: map['usernameID'],
      avatarURL: map['avatarURL'],
      bio: map['bio'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  static Profile fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Profile(userSkills: $userSkills, usedItems: $usedItems, position: $position, hp: $hp, energy: $energy, level: $level, xp: $xp, showLeaderboard: $showLeaderboard, skillPoints: $skillPoints, honor: $honor, money: $money, gems: $gems, wins: $wins, loses: $loses,  username: $username, usernameID: $usernameID, avatarURL: $avatarURL, bio: $bio, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Profile &&
        o.userSkills == userSkills &&
        o.usedItems == usedItems &&
        o.position == position &&
        o.hp == hp &&
        o.energy == energy &&
        o.level == level &&
        o.xp == xp &&
        o.showLeaderboard == showLeaderboard &&
        o.skillPoints == skillPoints &&
        o.honor == honor &&
        o.money == money &&
        o.gems == gems &&
        o.wins == wins &&
        o.loses == loses &&
        o.username == username &&
        o.usernameID == usernameID &&
        o.avatarURL == avatarURL &&
        o.bio == bio &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return userSkills.hashCode ^
        usedItems.hashCode ^
        position.hashCode ^
        hp.hashCode ^
        energy.hashCode ^
        level.hashCode ^
        xp.hashCode ^
        showLeaderboard.hashCode ^
        skillPoints.hashCode ^
        honor.hashCode ^
        money.hashCode ^
        gems.hashCode ^
        wins.hashCode ^
        loses.hashCode ^
        username.hashCode ^
        usernameID.hashCode ^
        avatarURL.hashCode ^
        bio.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
