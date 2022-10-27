
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
class RegistionScreen extends StatefulWidget {
  const RegistionScreen({required this.firstName,required this.lastName,required this.deptName,Key? key}) : super(key: key);

  final String firstName;
  final String lastName;
  final String deptName;

  @override
  State<RegistionScreen> createState() => _RegistionScreenState();
}

class _RegistionScreenState extends State<RegistionScreen> {

  File? pickedImage;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  var obscureText = true;
  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "call",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      //Toast.show("Toast plugin app", duration: Toast.lengthShort, gravity:  Toast.bottom);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

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
        //title: Text(widget.firstName+widget.lastName+widget.deptName),
        title: Text("Registion"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20,top:10,right: 20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        //backgroundImage: AssetImage("assets/images/user.jpg"),
                        child: ClipOval(
                          child: pickedImage!=null ?
                          Image.file(pickedImage!,width: 170,height: 170,fit: BoxFit.cover,):
                              Image.asset("assets/images/user.jpg"),
                      ),
                      ),
                      Positioned(
                        right: 3,
                        bottom: 2,
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(
                              builder: ((builder) =>bottomSheet(context)),
                              context: context,
                            );
                          },
                          child: Icon(Icons.camera_alt_outlined,color: Colors.teal,size: 32,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextField(
                  cursorColor: Color(0xff000000),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.shop,
                      color: Color(0xff000000),
                    ),
                    hintText: "Shop Name",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: TextField(
                  cursorColor: Color(0xff000000),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color(0xff000000),
                    ),
                    hintText: "Shop Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
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
                  cursorColor: Color(0xff000000),
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
                  cursorColor: Color(0xff000000),
                  decoration: InputDecoration(
                    focusColor: Color(0xff000000),
                    icon: Icon(
                      Icons.location_on,
                      color: Color(0xff000000),
                    ),
                    hintText: "Shop Address",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
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
                  controller: passwordController,
                  obscureText: obscureText,
                  cursorColor: Color(0xff000000),
                  decoration: InputDecoration(
                    focusColor: Color(0xff000000),
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color(0xff000000),
                    ),
                    hintText: "Password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
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
                  controller: confirmpasswordController,
                  obscureText: obscureText,
                  cursorColor: Color(0xff000000),
                  decoration: InputDecoration(
                    focusColor: Color(0xff000000),
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color(0xff000000),
                    ),
                    hintText: "Confirm Password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    // Write Click Listener Code Here
                    setState(() {
                      obscureText=!obscureText;
                    });
                  },
                  child: Row(
                    children: [
                      obscureText
                          ? const Icon(
                        Icons.visibility_off,
                        color: Colors.black,
                      )
                          : const Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5,),
                      Text("Show Password",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Write Click Listener Code Here.
                    Fluttertoast.showToast(
                        msg: "$pickedImage",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    /* gradient: LinearGradient(colors: [(new  Color(0xffF5591F)), new Color(0xffF2861E)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight
                      ),*/
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

              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Choose Profile photo",
                style: TextStyle(
                    fontSize: 25
                ),
              ),
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.cancel,size: 26,color: Colors.black,))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: (){
                  //pickImageC();
                  pickImage(ImageSource.camera);
                },
                label: Text("Camera",style: TextStyle(fontSize: 20),),
                icon: Icon(Icons.camera,size: 50,),
              ),
              ElevatedButton.icon(
                  onPressed: (){
                    // pickImage();
                    pickImage(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image,size: 50,),
                  label: Text("Gallery",style: TextStyle(fontSize: 20),)
              ),
            ],
          ),
        ],
      ),
    );
  }
}