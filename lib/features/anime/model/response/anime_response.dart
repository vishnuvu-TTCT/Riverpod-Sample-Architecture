// To parse this JSON data, do
//
//     final animeListResponse = animeListResponseFromJson(jsonString);

import 'dart:convert';

List<AnimeResponse> animeResponseFromJson(String str) => List<AnimeResponse>.from(json.decode(str).map((x) => AnimeResponse.fromJson(x)));

String animeListResponseToJson(List<AnimeResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimeResponse {
  AnimeResponse({
    required this.anime,
    required this.character,
    required this.quote,
  });

  String anime;
  String character;
  String quote;

  factory AnimeResponse.fromJson(Map<String, dynamic> json) => AnimeResponse(
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
