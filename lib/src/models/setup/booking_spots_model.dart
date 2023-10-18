import 'dart:convert';

import '../../../booking_spot.dart';

class BookingSpotsModel {
    final List<Row>? rows;

    BookingSpotsModel({
        this.rows,
    });

    BookingSpotsModel copyWith({
        List<Row>? rows,
    }) => 
        BookingSpotsModel(
            rows: rows ?? this.rows,
        );

    factory BookingSpotsModel.fromJson(String str) => BookingSpotsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BookingSpotsModel.fromMap(Map<String, dynamic> json) => BookingSpotsModel(
        rows: json["rows"] == null ? [] : List<Row>.from(json["rows"]!.map((x) => Row.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "rows": rows == null ? [] : List<dynamic>.from(rows!.map((x) => x.toMap())),
    };
}

class Row {
    final String? name;
    final int? number;
    final List<Spot>? spots;

    Row({
        this.name,
        this.number,
        this.spots,
    });

    Row copyWith({
        String? name,
        int? number,
        List<Spot>? spots,
    }) => 
        Row(
            name: name ?? this.name,
            number: number ?? this.number,
            spots: spots ?? this.spots,
        );

    factory Row.fromJson(String str) => Row.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Row.fromMap(Map<String, dynamic> json) => Row(
        name: json["name"],
        number: json["number"],
        spots: json["spots"] == null ? [] : List<Spot>.from(json["spots"]!.map((x) => Spot.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "number": number,
        "spots": spots == null ? [] : List<dynamic>.from(spots!.map((x) => x.toMap())),
    };
}

