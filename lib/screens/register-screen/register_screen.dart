import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/route_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';
import 'package:icebox_cafe/resources/text_manager.dart';
import 'package:icebox_cafe/screens/home-screen/tabs/recent_order_screen.dart';
import 'package:icebox_cafe/screens/verification-screen/verification_screen.dart';
import 'package:icebox_cafe/utils/elevated_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FocusNode myFocusNode = FocusNode();
  final TextEditingController phoneFieldController = TextEditingController();
  var phoneNumber = '';

  var countryCode = "+92";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register"),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_new,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
        child: Column(
          children: [
            // Input Field Text Description
            Text(
              TextManger.r1_txt,
              style: StyleManager().customTextStyle(
                  16, ColorManager.textColorDark, FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),

            // Input Field
            TextFormField(
                onChanged: ((value) {
                  phoneNumber = value;
                }),
                controller: phoneFieldController,
                onTap: _requestFocus,
                focusNode: myFocusNode,
                keyboardType: TextInputType.phone,
                cursorColor: myFocusNode.hasFocus
                    ? ColorManager.primaryColor
                    : ColorManager.textColorDark,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      phoneFieldController.text = '';
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Color(0xff49454F),
                    ),
                  ),
                  labelText: TextManger.phoneLabel,
                  hintText: "Input",

                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus
                          ? ColorManager.primaryColor
                          : Color(0xff49454F)),
                  // label: Text(TextManger.phoneLabel),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: ColorManager.primaryColor, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: ColorManager.primaryColor, width: 1.5)),
                )),
            SizedBox(
              height: 10,
            ),

            // 4 digit code text display
            Align(
              alignment: Alignment.bottomLeft,
              child: RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                    text: TextManger.r2_txt + " ",
                    style: StyleManager().customTextStyle(
                        14, ColorManager.textColorDark, FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: TextManger.r3_txt + " ",
                        style: StyleManager().customTextStyle(
                            14, ColorManager.primaryColor, FontWeight.w400),
                      ),
                      TextSpan(
                        text: TextManger.r4_txt,
                        style: StyleManager().customTextStyle(
                            14, ColorManager.textColorDark, FontWeight.w400),
                      ),
                    ]),
              ),
            ),
            Spacer(),

            // terms condition text
            Text(
              TextManger.r5_txt,
              style: StyleManager().customTextStyle(
                  14, ColorManager.greyColor, FontWeight.w400,
                  lineHeight: 1.5),
            ),
            Text(
              TextManger.r6_txt,
              style: StyleManager().customTextStyle(
                  14, ColorManager.accentColor, FontWeight.w400,
                  lineHeight: 1.5),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(120, 12, 120, 12)),
                onPressed: () async {
                  // Empty Field
                  if (phoneFieldController.text.isEmpty) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(fontSize: 18),
                                  ))
                            ],
                            title: Text(
                              "Please Enter Phone Number",
                              style: StyleManager().customTextStyle(
                                  18, ColorManager.greyColor, FontWeight.w500),
                            ),
                          );
                        });
                  } else {
                    await auth.verifyPhoneNumber(
                      phoneNumber: '${countryCode + phoneNumber}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        // ANDROID ONLY!

                        // Sign the user in (or link) with the auto-generated credential
                        await auth.signInWithCredential(credential);
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                      codeSent:
                          (String verificationId, int? forceResendingToken) {
                        Future.error(forceResendingToken.toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => OTPVerificationScreen(
                                      phoneNumber: phoneFieldController.text,
                                    )));
                      },
                      verificationFailed: (FirebaseAuthException error) {
                        if (error.code == 'invalid-phone-number') {
                          print('The provided phone number is not valid.');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RecentOrderScreen()));
                        }
                        Future.error(error);
                      },
                    );
                  }
                  ;
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 18),
                )),
            // Register Button
            // RoundedButtonWidget(
            //   buttonText: "Register",
            //   routeName: Routes.verificationRoute,
            //   bgColor: ColorManager.primaryColor,
            //   txtColor: Colors.white,
            //   fontSize: 18,
            //   p_left: 120.0,
            //   p_top: 12.0,
            //   p_right: 120.0,
            //   p_bot: 12.0,
            //   borderRadius: 30.0,
            // ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }
}
