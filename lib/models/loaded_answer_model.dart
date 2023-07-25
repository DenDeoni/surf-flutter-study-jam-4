import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class LoadedAnswerModel {

  const LoadedAnswerModel({
    required this.reading,
    required this.isSuccess,
  });

  final String reading;
  final bool isSuccess;

  factory LoadedAnswerModel.fromJson(Map<String,dynamic> json) => LoadedAnswerModel(
    reading: json['reading'].toString(),
    isSuccess: json['isSuccess'] as bool
  );
  
  Map<String, dynamic> toJson() => {
    'reading': reading,
    'isSuccess': isSuccess
  };

  LoadedAnswerModel clone() => LoadedAnswerModel(
    reading: reading,
    isSuccess: isSuccess
  );


  LoadedAnswerModel copyWith({
    String? reading,
    bool? isSuccess
  }) => LoadedAnswerModel(
    reading: reading ?? this.reading,
    isSuccess: isSuccess ?? this.isSuccess,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is LoadedAnswerModel && reading == other.reading && isSuccess == other.isSuccess;

  @override
  int get hashCode => reading.hashCode ^ isSuccess.hashCode;
}
