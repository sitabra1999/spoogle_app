import 'dart:convert';

MediaVideoApiResModel mediaVideoApiResModelFromJson(String str) => MediaVideoApiResModel.fromJson(json.decode(str));
String mediaVideoApiResModelToJson(MediaVideoApiResModel data) => json.encode(data.toJson());
class MediaVideoApiResModel {
  MediaVideoApiResModel({
    dynamic status,
    String? message,
    Response? response,
  });
  late final int status;
  late final String message;
  late final Response response;

  MediaVideoApiResModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    response = Response.fromJson(json['response']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['response'] = response.toJson();
    return _data;
  }
}

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
    required this.genericVideos,
    required this.pageLinks,
    required this.sport,
    required this.tournamentVideo,
  });
  late final List<GenericVideos> genericVideos;
  late final String pageLinks;
  late final String sport;
  late final List<dynamic> tournamentVideo;

  Response.fromJson(Map<String, dynamic> json){
    genericVideos = List.from(json['generic_videos']).map((e)=>GenericVideos.fromJson(e)).toList();
    pageLinks = json['page_links'];
    sport = json['sport'];
    tournamentVideo = List.castFrom<dynamic, dynamic>(json['tournament_video']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['generic_videos'] = genericVideos.map((e)=>e.toJson()).toList();
    _data['page_links'] = pageLinks;
    _data['sport'] = sport;
    _data['tournament_video'] = tournamentVideo;
    return _data;
  }
}

class GenericVideos {
  GenericVideos({
    required this.videoid,
    required this.video,
    required this.poster,
    required this.title,
    required this.likes,
    required this.views,
    required this.comments,
    required this.slug,
  });
  late final int videoid;
  late final String video;
  late final String poster;
  late final String title;
  late final int likes;
  late final int views;
  late final int comments;
  late final String slug;

  GenericVideos.fromJson(Map<String, dynamic> json){
    videoid = json['videoid'];
    video = json['video'];
    poster = json['poster'];
    title = json['title'];
    likes = json['likes'];
    views = json['views'];
    comments = json['comments'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['videoid'] = videoid;
    _data['video'] = video;
    _data['poster'] = poster;
    _data['title'] = title;
    _data['likes'] = likes;
    _data['views'] = views;
    _data['comments'] = comments;
    _data['slug'] = slug;
    return _data;
  }
}