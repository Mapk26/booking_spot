

import 'package:flutter/material.dart' show Color, Colors;

enum SpotStatus {
  disabled(Colors.grey),
  selected(Colors.blue),
  available(Colors.green),
  occupied(Color(0xffEB4444)),
  reserved(Color(0xFF932A2A)),
  partiallyFree(Colors.amber),
  optioned(Colors.purple),
  overbooking(Color(0xFF344055));
  
  const SpotStatus(this.color);
  
  final Color color;

}