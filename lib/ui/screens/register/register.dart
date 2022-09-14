import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:login/ui/screens/register/register_cubit.dart';

import '../../../utils/constants.dart';
import '../components/sized_box.dart';
import '../components/text_field.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  static List<String> genderList = ["Male", "Female", "Engineer"];

  var genderDropdownValue = genderList.first;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> registerFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            text: "Orange",
            style: TextStyle(
                color: appColor, fontSize: 22, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: ' Digital Center ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessful) {
            Fluttertoast.showToast(msg: "Registered successfully.");
            Navigator.pop(context);
          } else if(state is RegisterValidationError){
            Fluttertoast.showToast(msg: "Email is already registered.");
          }else if(state is RegisterError){
            Fluttertoast.showToast(msg: "Connection error.");
          }
        },
        builder: (context, state) {
          RegisterCubit registerCubit = RegisterCubit.get(context);
          return (state is GettingData || state is RegisterInitial)
              ? Center(
                child: LoadingAnimationWidget.prograssiveDots(
                    color: appColor,
                    size: MediaQuery.of(context).size.width / 10,
                  ),
              )
              : MediaQuery(
                  data: const MediaQueryData(),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width / 20,
                        MediaQuery.of(context).size.height / 20,
                        MediaQuery.of(context).size.width / 20,
                        MediaQuery.of(context).size.height / 40),
                    child: SingleChildScrollView(
                      child: Form(
                        key: registerFormKey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 30,
                                  left: MediaQuery.of(context).size.width / 60,
                                  bottom:
                                      MediaQuery.of(context).size.height / 100),
                              child: const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text('Sign Up',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30)),
                              ),
                            ),
                            getSizedBox(context),
                            defaultFormField(
                              controller: nameController,
                              type: TextInputType.text,
                              label: "Name",
                              isPassword: false,
                            ),
                            getSizedBox(context),
                            defaultFormField(
                              controller: emailController,
                              type: TextInputType.text,
                              label: "E-mail",
                              isPassword: false,
                            ),
                            getSizedBox(context),
                            defaultFormField(
                                controller: passwordController,
                                type: TextInputType.text,
                                label: "Password",
                                isPassword: true,
                                suffixIcon: Icons.remove_red_eye_sharp),
                            getSizedBox(context),
                            defaultFormField(
                                controller: passwordConfirmationController,
                                type: TextInputType.text,
                                label: "Password",
                                isPassword: true,
                                suffixIcon: Icons.remove_red_eye_sharp),
                            getSizedBox(context),
                            defaultFormField(
                              controller: phoneNumberController,
                              type: TextInputType.phone,
                              label: "Phone Number",
                              isPassword: false,
                            ),
                            getSizedBox(context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Gender",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width:
                                          MediaQuery.of(context).size.height /
                                              9,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      40)),
                                          border: Border.all(color: appColor)),
                                      child: DropdownButton<String>(
                                        underline: SizedBox(),
                                        alignment: Alignment.center,
                                        value: registerCubit.genderDropDownItem,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        onChanged: (String? value) {
                                          registerCubit.setgenderDropdown(value);

                                        },
                                        items: genderList
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,
                                                textAlign: TextAlign.center),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "University",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      40)),
                                          border: Border.all(color: appColor)),
                                      child: DropdownButton<String>(
                                        underline: SizedBox(),
                                        alignment: Alignment.center,
                                        isExpanded: true,

                                        value: registerCubit.universityDropDownItem,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        elevation: 16,
                                        style: const TextStyle(color: appColor),
                                        onChanged: (String? value) {
                                          registerCubit.setUniversityDropdown(value) ;
                                        },
                                        items: registerCubit.universityList
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: SizedBox(
                                                child: Text(value,
                                                    textAlign:
                                                        TextAlign.center)),
                                          );
                                        }).toList(),

                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            getSizedBox(context),
                            Column(
                              children: [
                                const Text(
                                  "Grade",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                Container(

                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  width: MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(color: appColor)),
                                  child: DropdownButton<String>(
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    alignment: Alignment.center,
                                    // value: gradeList.first,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    elevation: 16,
                                    style: const TextStyle(color: appColor),
                                    onChanged: (String? value) {
                                      registerCubit.setGradeDropdown(value);
                                    },
                                    value: registerCubit.gradeDropDownItem,
                                    items: registerCubit.gradeList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        onTap: (){
                                          registerCubit.gradeDropDownItem = value;
                                        },
                                        child: SizedBox(
                                            child: Text(value,
                                                textAlign: TextAlign.center)),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            (state is RegisterLoading)
                                ? LoadingAnimationWidget.prograssiveDots(
                                    color: appColor,
                                    size:
                                        MediaQuery.of(context).size.width / 20)
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    40)),
                                        primary: appColor,
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                            MediaQuery.of(context).size.height /
                                                16),
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    onPressed: () {
                                      if (passwordController.text !=
                                          passwordConfirmationController.text) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Make sure passwords are the same.");
                                      } else if (registerFormKey.currentState!
                                          .validate()) {
                                        try{
                                          registerCubit.signUp(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: nameController.text,
                                              gender: (registerCubit.gradeDropDownItem == null)? 'm' : registerCubit.gradeDropDownItem![0],
                                              phoneNumber:
                                                  phoneNumberController.text,
                                              universityId:'1',
                                              gradeId: '4');
                                        }catch(error){
                                          Fluttertoast.showToast(msg: "Email is already registered.");
                                          registerCubit.submitFail();
                                        }
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Something wrong happened");
                                      }
                                    },
                                    child: Text("Sign Up"),
                                  ),
                            Container(
                                margin: EdgeInsets.all(
                                    MediaQuery.of(context).size.width / 60),
                                child: Row(children: const <Widget>[
                                  Expanded(
                                      child: Divider(
                                          height: 2, color: Colors.black)),
                                  Text("  OR  "),
                                  Expanded(
                                      child: Divider(
                                          height: 2, color: Colors.black)),
                                ])),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: appColor, width: 2)),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: appColor,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Login"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }



}
