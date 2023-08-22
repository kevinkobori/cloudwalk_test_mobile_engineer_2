import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';

class PictureViewModel extends ApodObject {
  PictureViewModel({
    required super.date,
    required super.explanation,
    required super.hdurl,
    required super.mediaType,  
    required super.serviceVersion,  
    required super.title,
    required super.url,
  });

  PictureViewModel copyWith({
    String? date,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? serviceVersion,
    String? title,
    String? url,
  }) {
    return PictureViewModel(
      date: date ?? this.date,
      explanation: explanation ?? this.explanation,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      serviceVersion: serviceVersion ?? this.serviceVersion,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  @override
  String toString() {
    return 'PictureViewModel(date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, serviceVersion: $serviceVersion, title: $title, url: $url)';
  }

  @override
  bool operator ==(covariant PictureViewModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.date == date &&
      other.explanation == explanation &&
      other.hdurl == hdurl &&
      other.mediaType == mediaType &&
      other.serviceVersion == serviceVersion &&
      other.title == title &&
      other.url == url;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      explanation.hashCode ^
      hdurl.hashCode ^
      mediaType.hashCode ^
      serviceVersion.hashCode ^
      title.hashCode ^
      url.hashCode;
  }
}
