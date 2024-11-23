import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../../state.dart';

class CreditCalculatorWidget extends StatelessWidget {
  textWidget(name, credit, maxCredit) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(
              fontSize: 15
          ),
        ),
        SizedBox(width: 5,),
        Text (
          credit.toString(),
          style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
        Text(
          " / ${maxCredit.toString()}",
          style: TextStyle(
              color: Colors.grey
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
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
                  "학점계산기",
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
                            Icons.edit_outlined,
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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          textWidget("평균 학점", 4.09, 4.5),
                          SizedBox(width: 15,),
                          textWidget("취득 학점", 35, 150)
                        ],
                      )
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}