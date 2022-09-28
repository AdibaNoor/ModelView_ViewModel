

import 'package:flutter/material.dart';
import 'package:mvvm_app/resources/Components/round_btn.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  ValueNotifier<bool> _passwordnotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _passwordnotifier.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailEditingController,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: "Email",
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _passwordnotifier,
                builder: (context, value , child){
                  return TextFormField(
                    obscureText: _passwordnotifier.value,
                    obscuringCharacter: "*",
                    focusNode: passwordFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    controller: _passwordEditingController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                        onTap: (){
                          _passwordnotifier.value = !_passwordnotifier.value;
                        },
                          child: Icon(_passwordnotifier.value?
                          Icons.visibility_off: Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(height: 20,),
            ButtonCustom(title: 'Login',
                onPressed: (){
              if(_emailEditingController.text.isEmpty){
                Utils.toastMessage("Please enter Email!");
              }else if(_passwordEditingController.text.isEmpty){
                Utils.toastMessage("Please enter Password!");
              }else if(_passwordEditingController.text.length<6){
                Utils.toastMessage("Password needs to be more than 6 characters!");
              }else{

              }

                }),

          ],
        ),
      )
    );
  }
}
