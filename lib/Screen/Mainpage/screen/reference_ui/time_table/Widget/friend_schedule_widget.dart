import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../../state.dart';

class FriendScheduleWidget extends StatelessWidget {
  final data = ["홍길동","홍길동","홍길동","홍길동","홍길동"];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: EdgeInsets.only(top: 5, bottom: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "친구 시간표",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),

                ),
                ClipOval(
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                      },
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.add_box_outlined,
                            color: Colors.black,
                            size: 23,
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  for ( var i in data )
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        width: double.infinity,
                        child: Text(i, style: TextStyle(
                            fontSize: 15
                        ),),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                      ),
                    )
                ],
              )
          ),
        ],
      ),
    );
  }
}