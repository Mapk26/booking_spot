import 'dart:convert';
import 'package:flutter/widgets.dart';

import 'base_spot.dart';
import 'spot_enum.dart';

export 'base_spot.dart';
export 'spot_enum.dart';

class Spot extends BaseSpot {

  final SpotStatus status;
  final int id, number, row;
  final String? suffix, name;
  final bool isSelected;
  final int offsetSX, offsetDX, offsetUP, offsetDOWN;
  
  Spot({
    required this.id,
    this.suffix,
    this.status = SpotStatus.available,
    this.isSelected=false,
    required this.name, 
    required this.number, 
    required this.row,
    this.offsetUP=0,
    this.offsetDOWN=0,
    this.offsetDX=0,
    this.offsetSX=0
  });



  Spot copyWith({
    SpotStatus? status,
    int? id,
    ValueGetter<String?>? suffix,
    bool? isSelected,
    String? name,
    int? number,
    int? row,
  }) {
    return Spot(
      status: status ?? this.status,
      id: id ?? this.id,
      suffix: suffix != null ? suffix() : this.suffix,
      isSelected: isSelected ?? this.isSelected,
      name: name ?? this.name,
      row: row ?? this.row,
      number: number ?? this.number,
    );
  }

  factory Spot.fromJson(String str) => Spot.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Spot.fromMap(Map<String, dynamic> json) => Spot(
        name: json["name"],
        number: json["number"],
        suffix: json["suffix"],
        id: json["id"], 
        row: json['row'],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "number": number,
        "suffix": suffix,
        "id": id,
    };
}
