part of 'x_models.dart';

/// status : true
/// message : "This is example data"

Example exampleFromJson(String str) => Example.fromJson(json.decode(str));
String exampleToJson(Example data) => json.encode(data.toJson());
class Example {
  Example({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  Example.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  bool? _status;
  String? _message;
Example copyWith({  bool? status,
  String? message,
}) => Example(  status: status ?? _status,
  message: message ?? _message,
);
  bool? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}