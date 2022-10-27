
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_registion/otp_screen.dart';
import 'package:flutter_rest_api_registion/pojo/post/sendotp/SendOTP.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController phoneNumber = TextEditingController();
  String  baseUrl="https://toletx.com/api";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: Builder(builder: (context)=>IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,)),
        ),
        title: Text("Verify Phone"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20,top:10,right: 20),
          child: Center(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffEEEEEE),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 100,
                          color: Color(0xffEEEEEE)
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: phoneNumber,
                    cursorColor: Color(0xff000000),
                    maxLength: 11,

                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      focusColor: Color(0xff000000),
                      icon: Icon(
                        Icons.phone,
                        color: Color(0xff000000),
                      ),
                      hintText: "Contact Number",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,


                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    // Write Click Listener Code Here.
                    final phone=phoneNumber.text;

                    if(phone.length==11){
                      final response=await http.post(
                          Uri.parse('$baseUrl/sendotp'),
                          body:{'phone_number':phone.toString()});

                      print(response.body.toString());
                      SendOTP test=SendOTP.fromJson(jsonDecode(response.body));
                      //test.
                      if(response.statusCode==200){
                        Fluttertoast.showToast(
                            msg: response.statusCode.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(arguments: phone),
                                builder: (context)=>OtpScreen()
                            ));
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: response.statusCode.toString(),
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
                          msg: "invalied Phone Number",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)
                        ),
                      ],
                    ),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
