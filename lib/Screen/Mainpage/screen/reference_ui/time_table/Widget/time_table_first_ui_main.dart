import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app/SchedulePage/Widget/credit_calculator_widget.dart';
// import 'package:flutter_app/SchedulePage/Widget/friend_schedule_widget.dart';

// import 'package:project_kksc_flutter_login_ui_project/ui/Widget/credit_calculator_widget.dart';
// import 'package:project_kksc_flutter_login_ui_project/ui/Widget/friend_schedule_widget.dart';

// import '../state.dart';

void main() {
  runApp(MaterialApp(
    home: SchedulePage(),
  ));
}

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0,);
  double elevation = 0.0;

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if(_scrollController.offset > 0){
        if(elevation==0.0){
          setState(() {
            elevation = 5.0;
          });
        }

      }
      else {
        if(elevation==5.0){
          setState(() {
            elevation = 0.0;
          });
        }
      }
    });
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            elevation: elevation,
            titleSpacing: 20,
            backgroundColor: Colors.white,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2021년 여름학기",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "시간표",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ],
            ),
            actions: [
              ClipOval(
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                    },
                    child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(
                          Icons.list_rounded,
                          color: Colors.black,
                          size: 28,
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5,)
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.web_outlined,
                      color: Colors.grey,
                      size: 60,
                    ),
                    Text(
                      "이번 학기 시간표를 만들어주세요",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        print("클릭");
                      },
                      borderRadius: BorderRadius.circular(36),
                      child: Container(
                        width: 130,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: Colors.black,
                        ),
                        child: Text(
                          "새 시간표 만들기",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // CreditCalculatorWidget(),
              // FriendScheduleWidget()
            ],
          ),
        )
    );
  }
}