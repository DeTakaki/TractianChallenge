// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Location {
  const Location({
    required this.id,
    required this.name,
    this.parentId,
  });

  final String id;
  final String name;
  final String? parentId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'parentId': parentId,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id'],
      name: map['name'],
      parentId: map['parentId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.parentId == parentId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ parentId.hashCode;
}
