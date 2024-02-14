import 'package:booking_spot/booking_spot.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: const Text('Bookin Spot'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: BookingSpot(
            onSpotTap: (id){
              print('tapped $id');
            },
            matrix: [
              ...List.generate(20, (index) => 
              [ 
                Spot(id: 1, name: 'A', number: 1, row: 1 ), 
                SpotGap(),
                Spot(id: 2, name: 'B', number: 2, row: 1, status: SpotStatus.occupied), 
                Spot(id: 3, name: 'C', number: 2, row: 1 ), 
                Spot(id: 4, name: 'D', number: 2, row: 1 ), 
                ...List.generate(40, (index) => Spot(id: index, name: '', number: 2, row: 1 ), )
              ]
              )

            ],
          ),
        ),
      ),
    );
  }
}