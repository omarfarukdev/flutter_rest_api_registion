
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rest_api_registion/registion_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  bool isShow=true;
  int timeleft=59;
  String  baseUrl="https://toletx.com/api";
  TextEditingController first=TextEditingController();
  TextEditingController second=TextEditingController();
  TextEditingController third=TextEditingController();
  TextEditingController fourt=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startCountDown();
  }
 /* @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    _startCountDown();
  }*/

  void _startCountDown(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(timeleft>0){
        setState(() {
          timeleft--;
          isShow=true;
        });
      }
      else{
        timer.cancel();
        isShow=true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String phone=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: Builder(builder: (context)=>IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,)),
        ),
        title: Text("OTP"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 70,),
                Text(
                  "Verification code",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  'We have sent the code verification to',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$phone',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(width: 15,),
                    GestureDetector(
                      child: Text(
                        "Change phone number?",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                      onTap: () {
                        // Write Tap Code Here.
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: first,
                          onChanged: (value){
                            if(value.length ==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: second,
                          onChanged: (value){
                            if(value.length ==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: third,
                          onChanged: (value){
                            if(value.length ==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: fourt,
                          onChanged: (value){
                            if(value.length ==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text('00:'+timeleft.toString()+'s'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't recevie the OTP?  ",style: TextStyle(fontSize: 22),),
                    GestureDetector(
                      child: Text(
                        "Resend",
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onTap: () {
                        // Write Tap Code Here.
                        timeleft=29;
                        _startCountDown();
                      },
                    )
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () async {
                      if(timeleft>0){
                        final otp=first.text+second.text+third.text+fourt.text;
                        if(otp.length==4){
                          final response=await http.post(
                              Uri.parse('$baseUrl/loginWithOtp'),
                              body:{'phone_number':phone.toString(),'otp':otp.toString()});
                          if(response.statusCode==200){

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)=>
                                        RegistionScreen(firstName: 'Omar',lastName: 'Faruk', deptName: 'SCE',)));
                          }

                        }
                        else{
                          Fluttertoast.showToast(
                              msg: "not otp",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }

                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "time out please resend otp",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    },
                    child:  Padding(
                      padding: EdgeInsets.all(15),
                        child: Text("Send",style: TextStyle(fontSize: 22),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
