abstract class ApodObject {
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;  
  final String title;
  final String url;

  ApodObject({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,  
    required this.serviceVersion,  
    required this.title,
    required this.url,
  });
}