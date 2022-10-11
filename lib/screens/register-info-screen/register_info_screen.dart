import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/route_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';
import 'package:icebox_cafe/resources/text_manager.dart';
import 'package:icebox_cafe/screens/home-screen/home_screen.dart';
import 'package:icebox_cafe/screens/register-info-screen/components/password_field.dart';
import 'package:icebox_cafe/utils/elevated_button.dart';

class RegisterInfoScreen extends StatefulWidget {
  RegisterInfoScreen({Key? key}) : super(key: key);

  @override
  State<RegisterInfoScreen> createState() => _RegisterInfoScreenState();
}

class _RegisterInfoScreenState extends State<RegisterInfoScreen> {
  // Focus Input Field
  FocusNode nameFocusNode = FocusNode();
  FocusNode lnameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode cPasswordFocusNode = FocusNode();
  FocusNode zipFocusNode = FocusNode();

  //  Input Field Controller
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Your Details"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
        child: ListView(
          children: [
            // Personal Info Text Heading
            Text(
              TextManger.personal_txt,
              textAlign: TextAlign.center,
              style: StyleManager().railwayFont(
                18,
                ColorManager.textColorDark,
                FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // FirstName
            infoTextField("First Name", TextInputType.name, fnameController,
                true, nameFocusNode),
            SizedBox(
              height: 20,
            ),
            infoTextField("Last Name", TextInputType.name, lnameController,
                false, lnameFocusNode),
            SizedBox(
              height: 20,
            ),
            infoTextField("Email Address", TextInputType.emailAddress,
                emailController, false, emailFocusNode),
            SizedBox(
              height: 20,
            ),
            // Password Field
            PasswordField(
              emailController: passwordController,
              labelText: "Password",
              visible: true,
              inputFieldIcon: Icon(Icons.visibility_off),
              focusNode: passwordFocusNode,
            ),

            SizedBox(
              height: 20,
            ),
            // Confirm Password Field
            PasswordField(
              emailController: cPasswordController,
              labelText: "Confirm Password",
              visible: true,
              inputFieldIcon: Icon(Icons.visibility_off),
              focusNode: cPasswordFocusNode,
            ),
            SizedBox(
              height: 20,
            ),
            infoTextField("ZIP Code", TextInputType.number, zipcodeController,
                false, zipFocusNode),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(120, 12, 120, 12)),
                onPressed: () {
                  // Empty Field
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HomeScreen(
                                name: fnameController.text,
                              )));
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 18),
                )),
            // RoundedButtonWidget(
            //   buttonText: "Next",
            //   bgColor: ColorManager.primaryColor,
            //   txtColor: Colors.white,
            //   routeName: Routes.homeRoute,
            //   fontSize: 18,
            //   p_left: 120.0,
            //   p_top: 12.0,
            //   p_right: 120.0,
            //   p_bot: 12.0,
            //   borderRadius: 30.0,
            // )
          ],
        ),
      ),
    );
  }

  Widget infoTextField(String labeltext, TextInputType type,
      TextEditingController controller, bool autoFocus, FocusNode focusnode) {
    return TextFormField(
        textInputAction: TextInputAction.next,
        controller: controller,
        // onTap: _requestFocus(focusnode),
        focusNode: focusnode,
        keyboardType: type,
        cursorColor: focusnode.hasFocus
            ? ColorManager.primaryColor
            : ColorManager.textColorDark,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              controller.text = '';
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Color(0xff49454F),
            ),
          ),
          labelText: labeltext,
          hintText: "Input",

          labelStyle: TextStyle(
              color: focusnode.hasFocus
                  ? ColorManager.primaryColor
                  : Color(0xff49454F)),
          // label: Text(TextManger.phoneLabel),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: ColorManager.primaryColor, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: ColorManager.primaryColor, width: 1.5)),
        ),
        onFieldSubmitted: (value) {
          if (value.length == 1) {
            // FocusScope.of(context).nextFocus();
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a pill name';
          }
          return null;
        });
  }

  _requestFocus(focusnode) {
    setState(() {
      FocusScope.of(context).requestFocus(focusnode);
    });
  }
}
