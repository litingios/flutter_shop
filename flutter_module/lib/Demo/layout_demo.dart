import 'package:flutter/material.dart';


class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Icon(Icons.ac_unit,color: Colors.white,size: 32.0,),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: 100,
            height: 100,
            child: Container(
              alignment: Alignment(0.0,0.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Icon(Icons.add_a_photo,color: Colors.white,size: 32.0,),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: 100,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Icon(Icons.search,color: Colors.white,size: 32.0,),
            ),
          ),
        ],
      ),
    );
  }
}

class IconBrdge extends StatelessWidget{
  final IconData icon;
  final double size;
  IconBrdge(this.icon,{
    this.size = 32.0
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(icon,size: size,color: Colors.white,),
      width: size+60,
      height: size+60,
      color: Color.fromRGBO(3, 53, 255, 1.0),
    );
  }
}