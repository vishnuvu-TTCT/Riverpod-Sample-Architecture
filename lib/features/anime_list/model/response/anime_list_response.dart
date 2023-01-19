// To parse this JSON data, do
//
//     final animeListResponse = animeListResponseFromJson(jsonString);

import 'dart:convert';

List<AnimeListResponse?>? animeListResponseFromJson(String str) => json.decode(str) == null ? [] : List<AnimeListResponse?>.from(json.decode(str)!.map((x) => AnimeListResponse.fromJson(x)));

String animeListResponseToJson(List<AnimeListResponse?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class AnimeListResponse {
  AnimeListResponse({
    this.anime,
    this.character,
    this.quote,
  });

  String? anime;
  String? character;
  String? quote;

  factory AnimeListResponse.fromJson(Map<String, dynamic> json) => AnimeListResponse(
    anime: json["anime"],
    character: json["character"],
    quote: json["quote"],
  );

  Map<String, dynamic> toJson() => {
    "anime": anime,
    "character": character,
    "quote": quote,
  };
}
