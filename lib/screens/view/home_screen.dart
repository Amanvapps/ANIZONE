import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutteramazonclone/screens/view/all_products_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Color> colorList = [
    Colors.red[200],
    Colors.yellow[200],
    Colors.blue[200],
    Colors.green[200]
  ];

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.green[300]
    ));
    return Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text('Hello, user' , style: TextStyle(fontSize: 30 , color: Colors.black , fontWeight: FontWeight.w300),),
                    color: Colors.green[200],
                  ),
                ),

              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
                return <Widget>[
                  createSilverAppBar1(),
                  createSilverAppBar2(context),
                ];
              },
              body: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  Container(

                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Icon(Icons.location_on),
                        SizedBox(width: 10,),
                        Text('Select a location to see product availability', style: TextStyle(fontSize: 14 , color: Colors.black),)
                      ],
                    ),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green[300]
                    ),
                  ),
                  categoryLayout(),
                  sliderLayout(),
                  topBrands(),
                  topDeals()
                ],
              ),
          ),
        );
  }

  categoryLayout()
  {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(top: 15 , bottom: 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (BuildContext ctx , int index){
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10 , right: 10 , bottom: 10),
                  height: 50,
                  width: 50,
                  child: Image.asset("images/mobile_icon.png" , scale: 15,),
                  decoration: BoxDecoration(
                      color: colorList[index % 4],
                      shape: BoxShape.circle
                  ),
                ),
                Text('Mobiles' , style: TextStyle(fontSize : 13 , color: Colors.black),)
              ],
            );
          }),
    );
  }


  sliderLayout(){
    return Container(
      height: 200,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height/4,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 450),
//          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int itemIndex) =>
            Container(
              height: MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(5),
//                color: Colors.white,
              ),
              child: Image.asset("images/banner.jpg",fit: BoxFit.cover,
//                loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
//                  if (loadingProgress == null) return child;
//                  return Center(
//                    child: CircularProgressIndicator(
//                    ),
//                  );
//                },
              ),

            ),
      ),
    );
  }

  topBrands() {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AllProductsScreen()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(top: 20),
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[200]
            ),
            child: Text('Soft drinks, juices and other beverages' , style: TextStyle(fontSize: 23 , fontWeight: FontWeight.w500 , color: Colors.black),),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset("images/drink_a.jpeg" , fit: BoxFit.cover,),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text('Freezer' , style: TextStyle(color: Colors.black , fontSize: 18),))
                        ],
                      ),
                    ),
                    Expanded(child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Image.asset("images/drinks_b.jpg" , fit: BoxFit.cover,),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text('Coke' , style: TextStyle(color: Colors.black , fontSize: 18),))
                      ],
                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Image.asset("images/drink_c.png" , fit: BoxFit.cover,),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text('Juices' , style: TextStyle(color: Colors.black , fontSize: 18),))
                        ],
                      ),
                    ),
                    Expanded(
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Image.asset("images/drink_d.jpg" , fit: BoxFit.cover,)),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('Cream Juices' , style: TextStyle(color: Colors.black , fontSize: 18),))
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top : 10 , bottom : 10 ,left: 10 , right: 10 ,),
            color: Colors.grey[400],
            height: 1,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllProductsScreen()),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 15 , bottom: 20),
              child: Text('View All Offers' , style: TextStyle(fontSize : 16 , color: Colors.blue , fontWeight: FontWeight.w300),),
            ),
          )
        ],
      ),
    );
  }



  topDeals() {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AllProductsScreen("deals")),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(top: 20),
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[200]
            ),
            child: Text('Best Deals | Upto 70 % Off' , style: TextStyle(fontSize: 23 , fontWeight: FontWeight.w500 , color: Colors.black),),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromRGBO(218,165,32 , 1) , width: 5)
                            ),
                            margin: EdgeInsets.all(10),
                            child: Image.asset("images/drink_a.jpeg" , fit: BoxFit.cover,),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text('Freezer' , style: TextStyle(color: Colors.black , fontSize: 18),))
                        ],
                      ),
                    ),
                    Expanded(child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color.fromRGBO(218,165,32 , 1) , width: 5)
                          ),
                          margin: EdgeInsets.all(10),
                          child: Image.asset("images/drinks_b.jpg" , fit: BoxFit.cover,),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text('Coke' , style: TextStyle(color: Colors.black , fontSize: 18),))
                      ],
                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(218,165,32 , 1) , width: 5)
                            ),
                            margin: EdgeInsets.all(10),
                            child: Image.asset("images/drink_c.png" , fit: BoxFit.cover,),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text('Juices' , style: TextStyle(color: Colors.black , fontSize: 18),))
                        ],
                      ),
                    ),
                    Expanded(
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color.fromRGBO(218,165,32 , 1) , width: 5)
                                ),
                                margin: EdgeInsets.all(10),
                                child: Image.asset("images/drink_d.jpg" , fit: BoxFit.cover,)),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text('Cream Juices' , style: TextStyle(color: Colors.black , fontSize: 18),))
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top : 10 , bottom : 10 ,left: 10 , right: 10 ,),
            color: Colors.grey[400],
            height: 1,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllProductsScreen("deals")),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 15 , bottom: 20),
              child: Text('View All Deals' , style: TextStyle(fontSize : 16 , color: Colors.blue , fontWeight: FontWeight.w300),),
            ),
          )
        ],
      ),
    );
  }


}


SliverAppBar createSilverAppBar1() {


  return SliverAppBar(
    automaticallyImplyLeading: false,
    expandedHeight: 80,
    floating: false,
    flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 0 , top: 20),
              child: Image.asset("images/logo1.png" ,),
            ),
          );
        }),
  );
}

SliverAppBar createSilverAppBar2(context) {
  return SliverAppBar(
    pinned: true,
    title: Container(
      margin: EdgeInsets.only(bottom: 5 , top: 5),
      padding: EdgeInsets.only(left: 6),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 0),
              child: TextField(
                onTap: (){
                  print("here");
                },
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  hintText: "Search",
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Icon(Icons.search),
          SizedBox(width: 15,),
        ],
      ),
    ),
  );






}