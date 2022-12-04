import 'package:flutter/material.dart';
import 'package:mvvm_app/resources/Components/round_btn.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/utils/utils.dart';
import 'package:mvvm_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

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

    final authviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back!!',style: TextStyle(color: Colors.red,fontSize: 32),),
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
              ButtonCustom(title: 'Login',
                  loading: authviewmodel.loading,
                  onPressed: (){
                if(_emailEditingController.text.isEmpty){
                  Utils.toastMessage("Please enter Email!");
                }else if(_passwordEditingController.text.isEmpty){
                  Utils.toastMessage("Please enter Password!");
                }else if(_passwordEditingController.text.length<6){
                  Utils.toastMessage("Password needs to be more than 6 characters!");
                }else{
                  Map data ={
                    // 'email' : _emailEditingController.text.toString(),
                    // 'password': _passwordEditingController.text.toString()
                    'email': 'eve.holt@reqres.in',
                    'password': 'cityslicka'
                  };
                  authviewmodel.LoginApi(data , context);
                }

                  }),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RouteNames.signUp);
                },
                  child: Text("Don't have an account? Sign Up here" )),

            ],
          ),
        ),
      )
    );
  }
}
