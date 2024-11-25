import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget{
  const Signuppage({Key? key}): super(key: key);

  @override
  State<Signuppage> createState() => _Signuppage();
}

class _Signuppage extends State<Signuppage>{
  final PageController signupPageController = PageController();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController schoolNumController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  final GlobalKey<FormState> _formKeyName = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyNumber = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyPW = GlobalKey<FormState>();

  int _currentPage = 0;
  //index: 0=name / 1=SchoolNum / 2=Email / 3=PW
  List<String> userInfo = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //pagecontroller를 사용해서 다음 페이지로 넘어가게 하는 함수 & 해당 페이지의 텍스트컨트롤러를 리스트에 저장
  void nextPage(GlobalKey<FormState> currentInfoFormkey, TextEditingController currentTextField){
    if(_currentPage < 7){

      //버튼을 누르면 해당 텍스트필드에 있는 값을 검등하고 해당 페이지번호를 인덱스로 하여 userinfo 리스트에 값으로 저장
      if(currentInfoFormkey.currentState!.validate()){
        userInfo[_currentPage] = currentTextField.text.trim();
      }

      //페이지 이동
      signupPageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
    setState(() {
      //페이지 번호 변경
      _currentPage++;
    });
  }

  //pagecontroller를 사용해서 이전 페이지로 넘어가게 하는 함수
  void previousPage(){
    if(_currentPage>0){
      signupPageController.previousPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
    setState(() {
      _currentPage--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              controller: signupPageController,
              onPageChanged: (index){
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                
                //InputCard(step: 'STEP 3', title: '해당 이메일에서\n인증을 완료해주세요', label: '', controller: ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SignupForm({
    required GlobalKey<FormState> formkey,
    required String step,
    required String title,
    required String label,
    required TextEditingController controller,
  }){
    return Form(
      key: formkey,
      child: Column(
        children: [
          Text(step),
          Text(title),
          SignupTextfield(label: label, textfieldController: controller),
          userInfo.isEmpty ? Container()
              :ListView.builder(
                itemCount: userInfo.length,
                itemBuilder: (context, index){
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0x1A000000),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(userInfo[index], style: TextStyle(color: Color(0xFF2A2A2A)),),
                  );
                },
              ),
          Row(
            children: [
              Container(
                child: SignupButton(buttonText: '이전단계', onPressed: previousPage, backColor: Color(0xFFFFFF), foreColor: Color(0xFF2B57E8),),
              ),
              Container(
                child: SignupButton(buttonText: '다음단계', onPressed: ()=>nextPage(formkey, controller), backColor: Color(0xFF2B57E8), foreColor: Color(0xFFFFFF),),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget SignupTextfield({
    required String label,
    required TextEditingController textfieldController,
  }){
    return Container(
    height: 46,
    alignment: Alignment.center,
    child: TextField(
      controller: textfieldController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Color(0x1A000000),
      ),
      ),
    );
}

Widget SignupButton({
  required String buttonText,
  required VoidCallback onPressed,
  required Color backColor,
  required Color foreColor,
}){
    return SizedBox(
      height: 46,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backColor),
          foregroundColor: WidgetStatePropertyAll(foreColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: foreColor),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            color: foreColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
}


  // Widget InputCard ({
  //   required String step,
  //   required String title,
  //   required String label,
  //   required TextEditingController controller,
  // }) {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Text(step),
  //         Text(title),
  //
  //         Row(
  //           children: [
  //             Container(
  //               width: 80,
  //               child: FilledButton(onPressed: previousPage, child: Text('이전')),
  //             ),
  //             Container(
  //               width: 80,
  //               child: FilledButton(onPressed: nextPage, child: Text('다음')),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

}

