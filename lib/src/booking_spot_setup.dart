
import 'package:flutter/material.dart';



class BookingSpotSetup extends StatelessWidget {
  const BookingSpotSetup({super.key});

  @override
  Widget build(BuildContext context) {


    return SizedBox.expand(
      child: Row(
        children: [

          Expanded(
            child: SizedBox.expand(
              child: ColoredBox(
                color: Color(0xfffafafa),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                            
                      Text('left side')
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            width: 320,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  const Text('Configurazione', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                  const Divider(),

                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('File'),
                    ),
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Posti per fila'),
                    ),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.amber.shade100
                    ),
                    onPressed: (){}, child: Text('Genera')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}