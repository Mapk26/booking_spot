
import 'package:booking_spot/src/models/spot.dart';
import 'package:booking_spot/src/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'blocs/size_bloc.dart';

typedef SpotsBuilder = Widget Function(BuildContext context, int spotNumber, int rowNumber);

class BookingSpot extends StatelessWidget {

  final bool showNumber;
  final bool reversed;
  final List<List<BaseSpot>> matrix;
  final SpotsBuilder? spotBuilder;
  final Function(int id) onSpotTap;

  const BookingSpot({
    this.showNumber=true, 
    this.reversed=false,
    required this.matrix,
    this.spotBuilder,
    required this.onSpotTap,
    super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => SizeBloc()..init(),
      child: LayoutBuilder(
          builder: (context, constraints){
    
            return Theme(
              data: ThemeData(
              scrollbarTheme: const ScrollbarThemeData().copyWith(
                thumbColor: MaterialStateProperty.all(DarkTheme.action),
                trackVisibility: const MaterialStatePropertyAll(true)
                ),
              ),
              child: Stack(
                children: [
                
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight - 54,
                      child: CustomScrollView(
                        slivers: [
                  
                          SliverToBoxAdapter(
                            child: Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                reverse: reversed,
                                child: BlocBuilder<SizeBloc, double>(
                                  builder: (context, state) {
                                    
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: reversed ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                      children: [
                                        
                                        for(var row in matrix)
                                        _BuildWidgetSpots(
                                          spots: row, 
                                          size: state,
                                          onSpotTap: onSpotTap,
                                        ),
                                        
                                        
                                        
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: ButtonBar(
                      children: [
                
                        Material(
                          color: const Color(0xFF003049),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          child: InkWell(
                            onTap: (){
                              context.read<SizeBloc>().increment();
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.add, color: Colors.white,),
                            ),
                          ),
                        ),
                
                        Material(
                          color: const Color(0xFF668392),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          child: InkWell(
                            onTap: (){
                              context.read<SizeBloc>().decrement();
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.remove, color: Colors.white,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
    );
  }

}


class _BuildWidgetSpots extends StatelessWidget {

  final List<BaseSpot> spots;
  final  double size;
  final Function(int id) onSpotTap;

  const _BuildWidgetSpots({required this.spots, required this.size, required this.onSpotTap});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for(var spot in spots){
      if(spot is Spot && spot.offsetSX>0){
        children.add(const Gap(30));
      }

      if(spot is Spot) {
        children.add(Container(
          width: size,
          height: size,
          margin: const EdgeInsets.only(right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: spot.isSelected 
              ? spot.status.color.withOpacity(0.7) 
              : spot.status.color,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: spot.isSelected ? Border.all(width: 2, color: const Color(0xFF003049)) : null
          ),
          
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onSpotTap(spot.id),
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: spot.name!=null
                ? Center(
                    child: Text(spot.name!, style: const TextStyle(color: Colors.white),)
                  ) 
                : const SizedBox(),
            ),
          ),
        ));
      }

      if(spot is Spot && spot.offsetDX>0){
        children.add(const Gap(30));
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
   
  }
}


// GridView.builder(
//             scrollDirection: Axis.horizontal,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 6,
//                 childAspectRatio: 1,
//                 crossAxisSpacing: 36,
//                 mainAxisSpacing: 18),
//             itemBuilder: (_, index) {

//               return SpotWidget(
//                 name: showNumber ? '$index' : null,
//                 color: 
//                   index%10==0 
//                   ? DarkTheme.reserved : DarkTheme.available,
//               );
//             },
//             itemCount: 200,
//           ),