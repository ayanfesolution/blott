// To parse this JSON data, do
//
//     final newsResponseModel = newsResponseModelFromJson(jsonString);

import 'dart:convert';

List<NewsResponseModel> newsResponseModelFromJson(List<dynamic> str) =>
    List<NewsResponseModel>.from(str.map((x) => NewsResponseModel.fromJson(x)));

String newsResponseModelToJson(List<NewsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsResponseModel {
  final String? category;
  final int? datetime;
  final String? headline;
  final int? id;
  final String? image;
  final String? related;
  final String? source;
  final String? summary;
  final String? url;

  NewsResponseModel({
    this.category,
    this.datetime,
    this.headline,
    this.id,
    this.image,
    this.related,
    this.source,
    this.summary,
    this.url,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      NewsResponseModel(
        category: json["category"],
        datetime: json["datetime"],
        headline: json["headline"],
        id: json["id"],
        image: json["image"],
        related: json["related"],
        source: json["source"],
        summary: json["summary"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "datetime": datetime,
        "headline": headline,
        "id": id,
        "image": image,
        "related": related,
        "source": source,
        "summary": summary,
        "url": url,
      };
}
