import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  static List<String> genderList = ["Male", "Female", "Engineer"];
  static List<String> universityList = ["", "ASU", "CU", "BU", "AUC"];
  var genderDropdownValue = genderList.first;
  var universityDropdownValue = universityList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery(
        data: MediaQueryData(),
        child: Container(
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width / 20,
              MediaQuery.of(context).size.height / 20,
              MediaQuery.of(context).size.width / 20,
              MediaQuery.of(context).size.height / 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: RichText(
                    textWidthBasis: TextWidthBasis.parent,
                    text: const TextSpan(
                      text: "Orange",
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Digital Center ',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 10,
                      left: MediaQuery.of(context).size.width / 60,
                      bottom: MediaQuery.of(context).size.height / 100),
                  child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Sign Up',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black, fontSize: 30)),
                  ),
                ),
                getSizedBox(context),
                defaultFormField(
                  controller: TextEditingController(),
                  type: TextInputType.text,
                  label: "Name",
                  isPassword: false,
                ),
                getSizedBox(context),
                defaultFormField(
                  controller: TextEditingController(),
                  type: TextInputType.text,
                  label: "E-mail",
                  isPassword: false,
                ),
                getSizedBox(context),
                defaultFormField(
                    controller: TextEditingController(),
                    type: TextInputType.text,
                    label: "Password",
                    isPassword: true,
                    suffixIcon: Icons.remove_red_eye_sharp),
                getSizedBox(context),
                defaultFormField(
                    controller: TextEditingController(),
                    type: TextInputType.text,
                    label: "Password",
                    isPassword: true,
                    suffixIcon: Icons.remove_red_eye_sharp),
                getSizedBox(context),
                defaultFormField(
                  controller: TextEditingController(),
                  type: TextInputType.phone,
                  label: "Phone Number",
                  isPassword: false,
                ),
                getSizedBox(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Gender",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 100,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 20,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: Colors.orange)),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            alignment: Alignment.center,
                            value: genderDropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? value) {
                              setState(() {
                                genderDropdownValue = value!;
                              });
                            },
                            items: genderList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, textAlign: TextAlign.center),
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
                          height: MediaQuery.of(context).size.height / 100,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 30,
                          width: MediaQuery.of(context).size.width / 5,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: Colors.orange)),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            alignment: Alignment.center,
                            isExpanded: true,
                            value: universityDropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: const TextStyle(color: Colors.red),
                            onChanged: (String? value) {
                              setState(() {
                                universityDropdownValue = value!;
                              });
                            },
                            items: universityList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: SizedBox(
                                    child: Text(value,
                                        textAlign: TextAlign.center)),
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
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 30,
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width / 2.9,
                          0,
                          MediaQuery.of(context).size.width / 2.9,
                          0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: Colors.orange)),
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        isExpanded: true,
                        alignment: Alignment.center,
                        value: universityDropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: const TextStyle(color: Colors.red),
                        onChanged: (String? value) {
                          setState(() {
                            universityDropdownValue = value!;
                          });
                        },
                        items: universityList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: SizedBox(
                                child:
                                    Text(value, textAlign: TextAlign.center)),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    onPressed: () {},
                    child: Text("Sign Up"),
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
                    child: Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                    color: Colors.red,
                  ),
                  onPressed: function,
                )
              : null,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      );

  Widget getSizedBox(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 50,
    );
  }
}
