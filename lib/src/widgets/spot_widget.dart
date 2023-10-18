
import 'package:flutter/material.dart';

// ! not used...
class SpotWidget extends StatelessWidget {

  final Color color;
  final String? name;

  const SpotWidget({this.name, this.color=Colors.grey, super.key});

  @override
  Widget build(BuildContext context) {

    // return TextButton(
    //   style: TextButton.styleFrom(
    //     backgroundColor: color,
    //     foregroundColor: Colors.white,
    //     fixedSize: const Size(40, 40),
    //     maximumSize: const Size(40, 40),
    //     padding: const EdgeInsets.all(0)
    //   ),
    //   onPressed: (){},
    //   child: name!=null ? Center(child: Text(name!)) : const SizedBox(),

    // );
    
    return SizedBox(
      width: 40,
      height: 40,
      // decoration: BoxDecoration(
      //   color: color,
      //   borderRadius: const BorderRadius.all(Radius.circular(12)),
      // ),
      child: name!=null ? Center(child: Text(name!)) : const SizedBox(),
    );
  }
}
