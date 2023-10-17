import 'dart:convert';

import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int rollno;
  Person({
    required this.name,
    required this.rollno,
  });

  Person copyWith({
    String? name,
    int? age,
  }) {
    return Person(
      name: name ?? this.name,
      rollno: age ?? this.rollno,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'age': rollno});
  
    return result;
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] ?? '',
      rollno: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  @override
  String toString() => 'Person(name: $name, age: $rollno)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Person &&
      other.name == name &&
      other.rollno == rollno;
  }

  @override
  int get hashCode => name.hashCode ^ rollno.hashCode;
}
