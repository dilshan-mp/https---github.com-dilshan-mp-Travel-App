import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "brandon-mcdonald-_oU62drqdho-unsplash.jpg":"Kayaking",
    "farshad-rezvanian-Eelegt4hFNc-unsplash.jpg":"Balloning",
    "ibrahim-razzan-3wb4KYqGXLU-unsplash.jpg":"Snorkling",
    "toomas-tartes-Yizrl9N_eDA-unsplash.jpg":"Hiking"
  };
  @override
  Widget build(BuildContext context) {
      TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context,State) {
          if (State is LoadedState){
           // var state;
           // var state;
            var info = State.places;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu text
              Container(
                padding: EdgeInsets.only(top: 70,left: 20,right:20 ),
                child: Row(
                   children: [
                    const Icon(Icons.menu,size: 30,color:Colors.black,),
                    Expanded(child:Container() ),
                    Container(
                      //margin:const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
          
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)
                      )
                    ),
                   ],
                ),
              ),
              const SizedBox(height: 30,),
              //discover text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Discover"),
              ),
              const SizedBox(height: 20,),
              //tabbar
              Container(
                child:  Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    padding: const EdgeInsets.only(left: 10,right: 20),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.label,
                    //indicator:CircleTabIndicator(color:AppColors.buttonBackground,radius: 4 ) ,
                    tabs: const [
                      Tab(text: "Places",),
                       Tab(text: "Inspiration",),
                        Tab(text: "Emotions",),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child:  TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) { 
                        return GestureDetector(
                          onTap: (){
                          BlocProvider.of<AppCubits>(context)..DetailsPage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15,top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(
                                "http://mark.bslmeiyu.com/uploads/"+info[index].img
                              ),
                              fit: BoxFit.cover
                              )
                          ),
                                                ),
                        );
                      SizedBox(height: 5,);
                      Container(
                        child: AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor2,
                         ),
                      );
                     },        
                    ),
                    Text('hi'),
                    Text('hello')
                  ]
                 ),              
              ),
              const SizedBox(height: 30,),
               Container(
                margin: const EdgeInsets.only(left: 20,right: 20),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(text: "Explore more",size: 22,),
                    AppText(text: "Sea all",color: AppColors.textColor1,)
                  ],
                 ),
               ),       
              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left:20),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_,index){
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          //  margin: const EdgeInsets.only(right: 50),
                          width: 80,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image:  DecorationImage(
                              image: AssetImage(
                                "assets/img/"+images.keys.elementAt(index)
                              ),
                              fit: BoxFit.cover
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                            child: AppText(
                              text: images.values.elementAt(index),
                               color: AppColors.textColor2,
                    ),
                              )
                    
                    
                      ],
                    ),
                  );
                }),
              ),
              
            ],
          );

          }else{
            return Container();
          }
       
        }
      ),
    );
  }
}


class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({
    required this.color,required this.radius
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    throw _CirclePainter(color:color,radius:radius); 
  }

}

  class _CirclePainter extends BoxPainter { 
    final Color color;
    double radius;
   _CirclePainter({
     required this.color, required this.radius
  });
   @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias=true;
    final Offset circleOffset = Offset(configuration.size!.width/2 -radius/2,configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
}
