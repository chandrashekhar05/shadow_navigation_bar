import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int selectedIndex = 0;
  List<Widget> _activity = <Widget>[
    Text('Home'),
    Text('Search'),
    Text('Add'),
    Text('Favorite'),
    Text('Profile'),
  ];

  List<NavigationItem> items = [
    NavigationItem(
      Stack(
        children: <Widget>[
          Tab(icon: Image.asset("images/White_pix.png",fit: BoxFit.cover,),),
          Positioned(
              left: 8.0,
              top: 8.0,
            child: Icon(Icons.home,color: Color(0xFF858585),size: 30,)
          ),
        ],
      ),
      Stack(
        children: <Widget>[
          Tab(icon: Image.asset("images/New_logo.png",fit: BoxFit.cover),),
          Positioned(
              left: 8.0,
              top: 16.0,
              child: IconShadowWidget(Icon(Icons.home,size: 30,color: Colors.black54,))
          ),
          Positioned(
              left: 8.0,
              top: 8.0,
              child: IconShadowWidget(Icon(Icons.home,size: 30,color: Colors.white,))
          ),
        ],
      ),
    ),
    NavigationItem(
      Stack(
        children: <Widget>[
          Tab(icon: Image.asset("images/White_pix.png",fit: BoxFit.cover,),),
          Positioned(
              left: 8.0,
              top: 8.0,
            child: Icon(Icons.search,color: Color(0xFF858585),size: 30,)
          )
        ],
      ),
      Stack(
          children: <Widget>[
            Tab(icon: Image.asset("images/New_logo.png",fit: BoxFit.cover,),),
            Positioned(
              left: 8.0,
              top: 16.0,
              child: IconShadowWidget(Icon(Icons.search,size: 30,color: Colors.black54,))
            ),
            Positioned(
                left: 8.0,
                top: 8.0,
                child: IconShadowWidget(Icon(Icons.search,size: 30,color: Colors.white,)),),

          ],
        ),
    ),
    NavigationItem(
      Stack(
        children: <Widget>[
          Tab(icon: Image.asset("images/White_pix.png",fit: BoxFit.cover,),),
          Positioned(
              left: 8.0,
              top: 8.0,
            child: Icon(Icons.add_circle_outline,size: 30,color: Color(0xFF858585),)
          )
        ],
      ),
      Stack(
          children: <Widget>[
            Tab(icon: Image.asset("images/New_logo.png",fit: BoxFit.cover,),),
            Positioned(
                left: 8.0,
                top: 16.0,
                child: IconShadowWidget(Icon(Icons.add_circle_outline,size: 30,color: Colors.black54,))
            ),
            Positioned(
                left: 8.0,
                top: 8.0,
                child: IconShadowWidget(Icon(Icons.add_circle_outline,size: 30,color: Colors.white,))),

          ],
        ),
    ),
    NavigationItem(
      Stack(
        children: <Widget>[
          Tab(icon: Image.asset("images/White_pix.png",fit: BoxFit.cover,),),
          Positioned(
            left: 8.0,
            top: 8.0,
            child: Icon(Icons.favorite_border,color: Color(0xFF858585),size: 30,)
          )
        ],
      ),
      Stack(
          children: <Widget>[
            Tab(icon: Image.asset("images/New_logo.png",fit: BoxFit.cover,),),
            Positioned(
                left: 8.0,
                top: 16.0,
                child: IconShadowWidget(Icon(Icons.favorite_border,size: 30,color: Colors.black54,))
            ),
            Positioned(
                left: 8.0,
                top: 8.0,
                child: IconShadowWidget(Icon(Icons.favorite_border,size: 30,color: Colors.white,))),

          ],
        ),
    ),
    NavigationItem(
      Stack(
        children: <Widget>[
          Tab(icon: Image.asset("images/White_pix.png",fit: BoxFit.cover,),),
          Positioned(
            left: 8.0,
            top: 8.0,
            child:Icon(Icons.person_outline,size: 30,color: Color(0xFF858585),)
          ),
        ],
      ),
      Stack(
          children: <Widget>[
            Tab(icon: Image.asset("images/New_logo.png",fit: BoxFit.cover,),),
            Positioned(
                left: 8.0,
                top: 16.0,
                child: IconShadowWidget(Icon(Icons.person_outline,size: 30,color: Colors.black54,))
            ),
            Positioned(
                left: 8.0,
                top: 8.0,
                child: IconShadowWidget(Icon(Icons.person_outline,size: 30,color: Colors.white,))),

          ],
        ),
      ),
  ];
  Widget _buildItem(NavigationItem item,bool isSelected){
    return IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              isSelected ? Container() : item.icon,
              isSelected ? item.iconStack : Container(),
            ]
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("flutter app",
            style: TextStyle(
                fontFamily: 'Poppins'
            )
        ),
        backgroundColor: Color(0xFF2D2D2D),
      ),
      body:  Center(
        child: _activity.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFF2D2D2D),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
          ),
        ),
        padding: EdgeInsets.only(left: 20.0,right: 20.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item){
              var itemIndex = items.indexOf(item);
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedIndex = itemIndex;
                  });
                },
              child: _buildItem(item, selectedIndex == itemIndex),
            );
          }).toList()
        ),
      ),
    );
  }
}

class NavigationItem {
  final Stack icon;
  final Stack iconStack;
  NavigationItem(this.icon, this.iconStack,);
}