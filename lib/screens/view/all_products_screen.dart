import 'package:flutter/material.dart';
import 'package:flutteramazonclone/screens/utils/ColorConstants/color_constants.dart';

class AllProductsScreen extends StatefulWidget {

  String type = "normal";

  AllProductsScreen([this.type]);

  @override
  _AllProductsScreenState createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {

  int selectedCategoryIndex = 0;
   bool filterQuickDelivery = false , filterHighRating = false , filterLowToHigh = false , filterHighToLow = false;

  @override
  void initState() {
    // TODO: implement initState

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.5,
              margin: EdgeInsets.only(bottom: 5 , top: 8 , right: 30),
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
          ),
          GestureDetector(
            onTap: (){
              _modalBottomSheetMenu();
            },
            child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.filter_list)),
          )
        ],
      ),
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
        body: SafeArea(
          child: ListView(
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
              categoryList(),
              (widget.type == "deals") ? dealList() : itemList(),
            ],
          ),
        ),
    );
  }

  categoryList() {
    return Container(
      height: 60,
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext ctx , int index){
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: Container(
                 margin: EdgeInsets.only(left: 4),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 70,
                        child: Text('Juices' , style: TextStyle(fontSize:16 , fontWeight: FontWeight.w500,
                            color: (index==selectedCategoryIndex) ? Colors.red :  Colors.black),)),
                    (index == selectedCategoryIndex) ? Container(
                      height: 3,
                      width: 50,
                      color: Colors.red,
                    ) : Container(),
                  ],
                )),
          );
      }),
      color: Colors.grey[200],
    );
  }

  itemList() 
  {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext ctx , int index){
         return Container(
          // margin: EdgeInsets.only(bottom:  10),
           child : Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 alignment: Alignment.center,
                 height: 35,
                 width: 130,
                 decoration: BoxDecoration(
                     color: Colors.deepOrange,
                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                 ),
                 child: Text('Best Seller' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                     margin: EdgeInsets.only(top: 10 , left: 20),
                     height: 120,
                     width: 100,
                     child: Image.asset("images/product.png" , fit: BoxFit.contain,),
                   ),
                   SizedBox(width: 40,),
                   Expanded(child: Container(
                     child : Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Fruit Juice (Mango Flavour), 1 L' , style: TextStyle(color: Colors.blueAccent , fontSize: 22 , fontWeight: FontWeight.w500),)
                         ,
                         SizedBox(height: 20,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(
                                 margin : EdgeInsets.only(top: 5),
                                 child: Text('\u20B9' , style: TextStyle(color: Colors.black , fontSize: 25))),
                             SizedBox(width: 4,),
                             Text('70' , style: TextStyle(color: Colors.black , fontSize: 40)),
                             Container(
                                 margin: EdgeInsets.only(top: 20 , left: 6),
                                 child: Text('(\u{20B9}70 / L)' , style: TextStyle(color: Colors.black54 , fontSize: 18))),
                           ],
                         ),
                         SizedBox(height: 20,),
                         Container(
                           margin: EdgeInsets.only(bottom: 10),
                           padding: EdgeInsets.all(8),
                           height: 40,
                           width: 120,
                           decoration: BoxDecoration(
                             color: ColorConstants.BUTTON_ORANGE,
                             borderRadius: BorderRadius.circular(6),
                             boxShadow: [
                             BoxShadow(
                               color: Colors.black,
                               blurRadius: 2
                             )
                             ]
                           ),
                           alignment: Alignment.center,
                           child: Text('Add to Cart' , style: TextStyle(color: Colors.black , fontSize: 17),),
                         ),
                       ],
                     )
                   )
                   )
                 ],
               ),

               Container(
                 margin: EdgeInsets.only(top: 10),
                 height: 0.3,
                 color: Colors.black54,
               )
             ],
           )
         );
        });
  }




  dealList()
  {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext ctx , int index){
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
                boxShadow: [BoxShadow(
                color: Colors.black54,
                blurRadius: 0.2
              )]
            ),
            margin: EdgeInsets.all(10),
            child: Stack(
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey[100],
                            child: Image.asset("images/product.png" , fit: BoxFit.contain,),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(child: Container(
                            child : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Fruit Juice (Mango Flavour), 1 L' , style: TextStyle(color: Colors.black , fontSize: 17 , fontWeight: FontWeight.w500),)
                                ,SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin : EdgeInsets.only(top: 5),
                                        child: Text('\u20B9' , style: TextStyle(color: ColorConstants.BLOOD_RED , fontSize: 15))),
                                    SizedBox(width: 4,),
                                    Text('70' , style: TextStyle(color: ColorConstants.BLOOD_RED , fontSize: 30)),
                                    Container(
                                     margin: EdgeInsets.only(top: 5 , left: 5),
                                     child: new RichText(
                                      text: new TextSpan(
                                        children: <TextSpan>[
                                          new TextSpan(
                                            text: '\u{20B9}8.99',
                                            style: new TextStyle(
                                              color: Colors.grey,
                                              fontSize: 22,
                                              decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Text('You Save \u{20B9} 200' , style: TextStyle(color: Colors.black),),
                                SizedBox(height: 15,),
                                Container(
                                  margin: EdgeInsets.only(bottom: 0),
                                  padding: EdgeInsets.all(8),
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: ColorConstants.BUTTON_ORANGE,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 2
                                        )
                                      ]
                                  ),
                                  alignment: Alignment.center,
                                  child: Text('Add to Cart' , style: TextStyle(color: Colors.black , fontSize: 17),),
                                ),
                              ],
                            )
                        )
                        )
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                    ),
                    child: Text('20% Off' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
                  ),
                ),
              ],
            ),
          );
        });
  }


  void _modalBottomSheetMenu(){

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {

                return new Container(
                  height: 250.0,
                  color: Colors.transparent, //could change this to Color(0xFF737373),
                  //so you don't have to change MaterialApp canvasColor
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(20.0))),
                      child: Center(
                        child: Container(
                          child: new Column(
                            children: [
                              GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text('Select Filters' , style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          filterLowToHigh = !filterLowToHigh;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(20),
                                        alignment: Alignment.center,
                                        child: Text('Price Low to High' , style: TextStyle(
                                            color: Colors.black
                                        ),),
                                        decoration: BoxDecoration(
                                            color : (filterLowToHigh) ? Colors.orange[200] : Colors.white,
                                            border: Border.all(),
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        height: 40,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          filterHighRating = !filterHighRating;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(20),
                                        alignment: Alignment.center,
                                        child: Text('High Rating' , style: TextStyle(
                                            color: Colors.black
                                        ),),
                                        decoration: BoxDecoration(
                                            color : (filterHighRating) ? Colors.orange[200] : Colors.white,
                                            border: Border.all(),
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          filterHighToLow = !filterHighToLow;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(20),
                                        alignment: Alignment.center,
                                        child: Text('Price High to Low' , style: TextStyle(
                                            color: Colors.black
                                        ),),
                                        decoration: BoxDecoration(
                                            color : (filterHighToLow) ? Colors.orange[200] : Colors.white,
                                            border: Border.all(),
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          filterQuickDelivery = !filterQuickDelivery;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(20),
                                        alignment: Alignment.center,
                                        child: Text('Quick Delivery' , style: TextStyle(
                                            color: Colors.black
                                        ),),
                                        decoration: BoxDecoration(
                                            color : (filterQuickDelivery) ? Colors.orange[200] : Colors.white,
                                            border: Border.all(),
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                );

              });
        });


//
//    showModalBottomSheet(
//        context: context,
//        builder: (builder){
//
//        }
//    );
  }


}
