// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Asset {
  const Asset({
    required this.id,
    required this.name,
    this.parentId,
    this.sensorId,
    this.sensorType,
    required this.status,
    this.gatewayId,
    this.locationId,
  });

  final String id;
  final String name;
  final String? parentId;
  final String? sensorId;
  final String? sensorType;
  final String status;
  final String? gatewayId;
  final String? locationId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'parentId': parentId,
      'sensorId': sensorId,
      'sensorType': sensorType,
      'status': status,
      'gatewayId': gatewayId,
      'locationId': locationId,
    };
  }

  factory Asset.fromMap(Map<String, dynamic> map) {
    return Asset(
      id: map['id'],
      name: map['name'],
      parentId: map['parentId'],
      sensorId: map['sensorId'],
      sensorType: map['sensorType'],
      status: map['status'],
      gatewayId: map['gatewayId'],
      locationId: map['locationId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Asset.fromJson(String source) =>
      Asset.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Asset other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.parentId == parentId &&
        other.sensorId == sensorId &&
        other.sensorType == sensorType &&
        other.status == status &&
        other.gatewayId == gatewayId &&
        other.locationId == locationId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        parentId.hashCode ^
        sensorId.hashCode ^
        sensorType.hashCode ^
        status.hashCode ^
        gatewayId.hashCode ^
        locationId.hashCode;
  }
}
