
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery(
        data: MediaQueryData(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        text: "Orange",
                        style: TextStyle(color: Colors.red, fontSize: 40),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Digital Center ',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10,
                    left: MediaQuery.of(context).size.width / 60,
                    bottom: MediaQuery.of(context).size.height / 100),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Login',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 30)),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 60,
                      MediaQuery.of(context).size.height / 60,
                      MediaQuery.of(context).size.width / 60,
                      MediaQuery.of(context).size.height / 40),
                  child: defaultFormField(
                    controller: TextEditingController(),
                    type: TextInputType.text,
                    label: "E-mail",
                    isPassword: false,
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 60,
                      MediaQuery.of(context).size.height / 150,
                      MediaQuery.of(context).size.width / 60,
                      MediaQuery.of(context).size.height / 150),
                  child: defaultFormField(
                      controller: TextEditingController(),
                      type: TextInputType.text,
                      label: "Password",
                      isPassword: true,
                      suffixIcon: Icons.remove_red_eye_sharp)),
              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 60,
                    MediaQuery.of(context).size.height / 150,
                    MediaQuery.of(context).size.width / 60,
                    MediaQuery.of(context).size.height / 18),
                child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 60,
                    MediaQuery.of(context).size.height / 150,
                    MediaQuery.of(context).size.width / 60,
                    MediaQuery.of(context).size.height / 150),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  onPressed: () {},
                  child: Text("Login"),
                ),
              ),
              Container(
                  margin:
                  EdgeInsets.all(MediaQuery.of(context).size.width / 60),
                  child: Row(children: const <Widget>[
                    Expanded(child: Divider(height: 2, color: Colors.black)),
                    Text("  OR  "),
                    Expanded(child: Divider(height: 2, color: Colors.black)),
                  ])),
              Container(
                margin: EdgeInsets.all(MediaQuery.of(context).size.width / 60),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.red,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  onPressed: () {},
                  child: Text("Sign Up"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  String? label,
  IconData? prefixIcon,
  IconData? suffixIcon,
  onSubmit,
  onChange,
  onTap,
  // required validator,
  function,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      obscureText: isPassword,
      //  validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        // control your hints text size
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(
            suffixIcon,
          ),
          onPressed: function,
        )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
