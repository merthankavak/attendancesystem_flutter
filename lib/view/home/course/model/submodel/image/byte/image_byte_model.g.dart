// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_byte_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageByteModel _$ImageByteModelFromJson(Map<String, dynamic> json) =>
    ImageByteModel(
      type: json['type'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$ImageByteModelToJson(ImageByteModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };
