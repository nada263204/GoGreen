import 'datum.dart';

class Articles {
  String? status;
  int? length;
  List<Datum>? data;

  Articles({this.status, this.length, this.data});

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        status: json['status'] as String?,
        length: json['length'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'length': length,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
