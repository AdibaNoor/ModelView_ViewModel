import 'package:flutter/material.dart';
import 'package:mvvm_app/resources/Components/round_btn.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_names.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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

    final authviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Join Us Now!!',style: TextStyle(color: Colors.red,fontSize: 30),),
                SizedBox(height: 30,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailEditingController,
                  focusNode: emailFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email_outlined,color: Colors.red,),
                    labelStyle: TextStyle(color: Colors.red),
                    // border: InputBorder.none,
                    hoverColor: Colors.red,
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
                          prefixIcon: Icon(Icons.lock_outline,color: Colors.red,),
                          suffixIcon: InkWell(
                              onTap: (){
                                _passwordnotifier.value = !_passwordnotifier.value;
                              },
                              child: Icon(_passwordnotifier.value?
                              Icons.visibility_off: Icons.visibility)),
                          labelStyle: TextStyle(color: Colors.red),
                          // border: InputBorder.none,
                          hoverColor: Colors.red,
                        ),
                      );
                    }),
                SizedBox(height: 20,),
                ButtonCustom(title: 'SignUp',
                    loading: authviewmodel.signupLoading,
                    onPressed: (){
                      if(_emailEditingController.text.isEmpty){
                        Utils.toastMessage("Please enter Email!");
                      }else if(_passwordEditingController.text.isEmpty){
                        Utils.toastMessage("Please enter Password!");
                      }else if(_passwordEditingController.text.length<6){
                        Utils.toastMessage("Password needs to be more than 6 characters!");
                      }else{
                        Map data ={
                          'email' : _emailEditingController.text.toString(),
                          'password': _passwordEditingController.text.toString()
                        };
                        authviewmodel.RegisterApi(data , context);
                      }

                    }),
                SizedBox(height: 10,),
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RouteNames.login);
                    },
                    child: Text("Already have an account? LogIn here!" )),

              ],
            ),
          ),
        )
    );
  }
}
