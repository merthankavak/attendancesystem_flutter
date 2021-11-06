import 'package:vexana/vexana.dart';

class CustomErrorModel extends INetworkModel<CustomErrorModel> {
  String? message;

  CustomErrorModel({this.message});

  CustomErrorModel.fromJson(Map<String, dynamic>? json) {
    message = json!['message'] as String?;
  }

  @override
  Map<String, Object> toJson() {
    final data = <String, Object>{};
    data['message'] = message ?? '';
    return data;
  }

  @override
  CustomErrorModel fromJson(Map<String, dynamic>? json) => CustomErrorModel.fromJson(json);
}
