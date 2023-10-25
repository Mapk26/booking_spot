

import 'package:flutter/material.dart' show Color, Colors;

enum SpotStatus {
  disabled(Colors.grey),
  selected(Colors.blue),
  available(Color(0xFF3DD06D)),
  occupied(Color(0xffEB4444)),
  reserved(Color(0xFF932A2A)),
  partiallyFree(Color(0xffFFB703)),
  optioned(Color(0xff7F39FB)),
  overbooking(Color(0xFF344055));
  
  const SpotStatus(this.color);
  
  final Color color;

}