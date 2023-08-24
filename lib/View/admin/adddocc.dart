import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor/ViewModel/bloc/admin/admincubit.dart';
import '../../ViewModel/bloc/admin/adminstate.dart';
import '../component/widgets.dart';

class AddDoctor extends StatelessWidget {
  const AddDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AdminCubit, AdminState>(
        listener: (context, state) {
          if (state is AdminsuccessState) {
            Navigator.pop(context);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AdminCubit.get(context);
          return Padding(
            padding: EdgeInsets.only(left: 12.0.w, right: 12.w),
            child: Stack(
              children: [
                Positioned(
                  bottom: 4.h,
                  top: 150.h,
                  right: 0.w,
                  left: 0.w,
                  child: SingleChildScrollView(
                    child: Container(
                      height: 540.h,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                // Colors.black45,
                                Color.fromARGB(255, 49, 108, 163),
                                Color.fromARGB(255, 95, 153, 252),
                                // Colors.orange,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: Form(
                        key: cubit.key1,
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 25.sp,
                                )),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 12.0.w, right: 12.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add',
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 4),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    'New Doctor',
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 2),
                                  ),
                                  SizedBox(height: 25.h),
                                  Textfield(
                                    controller: cubit.title2,
                                    label: 'patirnt name',
                                    type: TextInputType.name,
                                    prefix: Icons.person,
                                    validate: (value) {
                                      if (value!.trim().isEmpty)
                                        return 'enter your name';
                                      return null;
                                    },
                                  ),
                                  sbox(h: 20.h),
                                  Textfield(
                                    controller: cubit.address,
                                    label: 'address',
                                    type: TextInputType.text,
                                    prefix: Icons.description,
                                    validate: (value) {
                                      if (value!.trim().isEmpty)
                                        return 'enter description';
                                      return null;
                                    },
                                  ),
                                  sbox(h: 20.h),
                                  Textfield(
                                    controller: cubit.title2,
                                    label: 'title',
                                    type: TextInputType.text,
                                    prefix: Icons.description,
                                    validate: (value) {
                                      if (value!.trim().isEmpty)
                                        return 'enter title';
                                      return null;
                                    },
                                  ),
                                  sbox(h: 20.h),
                                  Textfield(
                                    controller: cubit.type,
                                    label: ' type',
                                    type: TextInputType.text,
                                    prefix: Icons.home_outlined,
                                    validate: (value) {
                                      if (value!.trim().isEmpty)
                                        return 'enter type';
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (cubit.key1.currentState!.validate()) {
                                        cubit.AddDoctor();
                                      }
                                    },
                                    child: Center(
                                      child: Container(
                                        height: 60.h,
                                        width: 80.w,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(30),
                                              bottomRight: Radius.circular(30),
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            )),
                                        child: Center(
                                            child: Text(
                                          'ADD',
                                          style: TextStyle(
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.bold,
                                              color: color1),
                                        )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
