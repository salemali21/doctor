import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:doctor/View/Doctor/Doctorscreen.dart';
import 'package:doctor/ViewModel/services/navigation.dart';
import '../component/widgets.dart';

class DoctorVerif extends StatelessWidget {
  DoctorVerif({super.key});
  TextEditingController controller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  void clear() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0.w),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                text2(
                  text: 'Enter your 5-digit code',
                  color: color1,
                ),
                SizedBox(
                  height: 100,
                ),
                PinCodeTextField(
                  cursorColor: color1,
                  onCompleted: (value) {
                    if (value == "02468") {
                      toast(
                          gravity: ToastGravity.TOP,
                          message: 'welcome doctor',
                          bcolor: Colors.green,
                          tcolor: Colors.white);
                      Navigation.gopushreplace(context, DoctorScreen());
                    } else {
                      clear();
                      toast(
                          gravity: ToastGravity.BOTTOM,
                          message: 'enter the right code',
                          bcolor: Colors.red,
                          tcolor: Colors.white);
                    }
                  },
                  appContext: context,
                  controller: controller,
                  cursorHeight: 19.h,
                  keyboardType: TextInputType.number,
                  length: 5,
                  onChanged: (value) {},
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldWidth: 40.w,
                    activeColor: color1,
                    inactiveColor: Color.fromRGBO(124, 124, 124, 1),
                    selectedColor: color1,
                  ),
                ),
                SizedBox(
                  height: 470.h,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          backgroundColor: color1,
          child: Icon(Icons.arrow_left)
          //FaIcon(FontAwesomeIcons.arrowRight),
          ),
    );
  }
}
