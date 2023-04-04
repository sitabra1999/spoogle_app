import 'package:flutter/material.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppbarIcBack.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBack(context: context, text: "Edit Profile", bgColor: Colors.white, isCenterTitle: true),
      body: Container(
        padding: const EdgeInsets.only(left: 24, top: 25, right: 24),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Hero(
                      tag: "UserProfileImg",
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10),
                              )
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(Strings.imgUrlPersonSmileCall1),
                            ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: AppColor.primaryColor,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              buildTextField("Full Name", "Dor Alex", false),
              buildTextField("E-mail", "alexd@gmail.com", false),
              buildTextField("Phone", "98764563543", false),
              buildTextField("Password", "********", true),
              buildTextField("Confirm Password", "********", true),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 40)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 14)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppColor.appCornerRadius))),
                    ),
                    onPressed: () {},
                    child: const Text("CANCEL", style: TextStyle(fontSize: 14, letterSpacing: 2.2, color: Colors.black)),
                  ),


                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 14)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppColor.appCornerRadius))),
                      elevation: MaterialStateProperty.all(2),
                      backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
                    ),
                    child: const Text(
                      "SAVE",
                      style: TextStyle(fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                    ),
                    onPressed: (){},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: SizedBox(
        height: 42,
        child: TextField(
          obscureText: isPasswordTextField ? showPassword : false,
          decoration: InputDecoration(
              suffixIcon: isPasswordTextField
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                    )
                  : null,
              contentPadding: const EdgeInsets.only(left: 16),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade800,
              ),
          ),
        ),
      ),
    );
  }
}
