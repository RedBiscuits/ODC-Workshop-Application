import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:login/ui/screens/login/login_cubit.dart';
import 'package:login/ui/screens/register/register.dart';

import '../../../utils/constants.dart';
import '../components/text_field.dart';
import '../home/home.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: RichText(
            text: const TextSpan(
              text: "Orange",
              style: TextStyle(color: appColor, fontSize: 22 , fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: ' Digital Center ',
                    style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Form(
          key: formKey,
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessful) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              } else if (state is LoginError) {
                Fluttertoast.showToast(
                    msg: "Bad Credentials try again.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            builder: (context, state) {
              LoginCubit loginCubit = LoginCubit.get(context);
              return 
                MediaQuery(
                data: const MediaQueryData(),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width / 10),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Login',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width / 20),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.text,
                      label: "E-mail",
                      isPassword: false,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width / 20),
                    defaultFormField(
                        controller: passwordController,
                        type: TextInputType.text,
                        label: "Password",
                        isPassword: true,
                        suffixIcon: Icons.remove_red_eye_sharp),
                    SizedBox(height: MediaQuery.of(context).size.width / 20),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: appColor),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.width / 20),
                    (state is LoginLoading)
                        ? LoadingAnimationWidget.prograssiveDots(
                            color: appColor, size: 50)
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 40)
                                ),
                                primary: appColor,
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width / 1.1,
                                    MediaQuery.of(context).size.height / 16),
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                loginCubit.loginUser(
                                    emailController.text.toString(),
                                    passwordController.text.toString());
                              }
                            },
                            child: Text("Login"),
                          ),
                    SizedBox(height: MediaQuery.of(context).size.width / 20),
                    Row(children: const <Widget>[
                      Expanded(child: Divider(height: 2, color: Colors.black)),
                      Text("  OR  "),
                      Expanded(child: Divider(height: 2, color: Colors.black)),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.width / 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 40),
                          border: Border.all(color: appColor, width: 2)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 40)
                          ),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width / 1.1,
                                MediaQuery.of(context).size.height / 16),
                            primary: Colors.white,
                            onPrimary: appColor,
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
