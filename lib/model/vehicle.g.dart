// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      vehicle_name: json['vehicle_name'] as String?,
      vehicle_image: json['vehicle_image'] as String?,
      vehicle_company: json['vehicle_company'] as String?,
      vehicle_desc: json['vehicle_desc'] as String?,
      booking_cost: json['booking_cost'] as String?,
      vehicle_sku: json['vehicle_sku'] as String?,
      vehicle_category: json['vehicle_category'] as String?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      '_id': instance.id,
      'vehicle_name': instance.vehicle_name,
      'vehicle_image': instance.vehicle_image,
      'vehicle_company': instance.vehicle_company,
      'vehicle_desc': instance.vehicle_desc,
      'booking_cost': instance.booking_cost,
      'vehicle_sku': instance.vehicle_sku,
      'vehicle_category': instance.vehicle_category,
    };
