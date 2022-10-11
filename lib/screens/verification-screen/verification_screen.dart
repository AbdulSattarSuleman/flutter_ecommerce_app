import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/route_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';
import 'package:icebox_cafe/resources/text_manager.dart';
import 'package:icebox_cafe/utils/elevated_button.dart';

class OTPVerificationScreen extends StatelessWidget {
  OTPVerificationScreen({Key? key, this.phoneNumber}) : super(key: key);
  final phoneNumber;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 50, 24, 30),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                    text: TextManger.codeSent,
                    style: StyleManager().customTextStyle(
                        18, ColorManager.textColorDark, FontWeight.w400),
                    children: [
                      TextSpan(
                          text: " +${phoneNumber}",
                          style: StyleManager().customTextStyle(
                              18, ColorManager.primaryColor, FontWeight.w400))
                    ]),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              TextManger.digitCode,
              textAlign: TextAlign.center,
              style: StyleManager().customTextStyle(
                  16, ColorManager.textColorDark, FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),

            // Verification/OTP Input Field
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 5,
              direction: Axis.horizontal,
              runSpacing: 50,
              children: [
                OtpTextField(context, true),
                OtpTextField(context, false),
                OtpTextField(context, false),
                OtpTextField(context, false),
              ],
            ),

            SizedBox(
              height: 100,
            ),
            // Receive code text
            Text(
              TextManger.receiveCode,
              textAlign: TextAlign.center,
              style: StyleManager().customTextStyle(
                  14, ColorManager.textColorDark, FontWeight.w400),
            ),
            SizedBox(
              height: 15,
            ),
            // RoundedButtonWidget(
            //   buttonText: "Resend",
            //   borderRadius: 20.0,
            //   bgColor: Colors.white,
            //   txtColor: ColorManager.primaryColor,
            //   fontSize: 14,
            //   routeName: Routes.verificationRoute,
            //   p_top: 10.0,
            //   p_bot: 10.0,
            //   p_left: 30.0,
            //   p_right: 30.0,
            // )

            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.4,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: ColorManager.primaryColor,
                        width: 1.0,
                        style: BorderStyle.solid)),
                child: Center(
                  child: Text(
                    "Resend",
                    style: StyleManager().customTextStyle(
                        14, ColorManager.primaryColor, FontWeight.w500),
                  ),
                ),
              ),
            ),
            // Spacer(
            //   flex: 1,
            // ),
            SizedBox(
              height: screenSize.height * 0.245,
            ),
            // verify Button
            RoundedButtonWidget(
              buttonText: "Verify",
              routeName: Routes.registerInfopRoute,
              bgColor: ColorManager.primaryColor,
              txtColor: Colors.white,
              fontSize: 18,
              p_left: 130.0,
              p_top: 12.0,
              p_right: 130.0,
              p_bot: 12.0,
              borderRadius: 30.0,
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

Widget OtpTextField(BuildContext context, bool autoFocus) {
  return Container(
    height: MediaQuery.of(context).size.shortestSide * 0.13,
    decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffFFE6DA),
        ),
        borderRadius: BorderRadius.circular(5),
        color: Color(0xffFFF7F4),
        // gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Color(0xffFFE6DA),
        //       Color(0xffFFF7F4),
        //     ]),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.1,
            spreadRadius: 0.4,
            color: Color.fromARGB(255, 231, 92, 27),
            blurStyle: BlurStyle.inner,
            offset: const Offset(
              1.0,
              1.0,
            ),
          ),
        ],
        shape: BoxShape.rectangle),
    child: AspectRatio(
      aspectRatio: 1,
      child: TextField(
        textInputAction: TextInputAction.next,
        cursorColor: ColorManager.primaryColor,
        autofocus: autoFocus,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,

        // style: StyleManager()
        //     .customTextStyle(15, ColorManager.textColorDark, FontWeight.w500),
        maxLines: 1,
        // maxLength: 1,
        minLines: 1,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    ),
  );
}
