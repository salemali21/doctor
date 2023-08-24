import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctor/View/component/widgets.dart';
import '../../../Model/doctor.dart';

class HomeWidget extends StatelessWidget {
  Information? doctorinfo;

   HomeWidget({required this.doctorinfo, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color.fromARGB(255, 153, 34, 34),
        ),
      ),
      child: Container(
          width: 370,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              // Colors.black45,
              Color.fromARGB(255, 49, 108, 163),
              Color.fromARGB(255, 95, 153, 252),
              // Colors.orange,
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  child: FaIcon(
                    FontAwesomeIcons.userDoctor,
                    size: 40,
                  ),
                ),
                sbox(w: 10),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sbox(h: 15),
                      text1(
                          text:doctorinfo?.name ??'Dr. zim akhtar',
                          color: Colors.white,
                          size: 30),
                      sbox(h: 5),
                      text1(
                          text: doctorinfo?.title??'cardiologist', color: Colors.white, size: 20),
                      sbox(h: 5),
                    ],
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ],
            ),
          )),
    ));
  }
}
