import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding/main/main_controller.dart';

class SignInPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.grey[500],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text(
              'Sign In',
              style: GoogleFonts.fjallaOne(
                color: Colors.blue[900],
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          GetBuilder<MainController>(
            builder: (controller) {
              return _SignInForm(
                isSign: controller.isSignin.value,
                onSign: (username, password) async {
                  if (username.isEmpty || password.isEmpty) {
                    const GetSnackBar(
                      duration: Duration(seconds: 3),
                      title: 'Account',
                      message: 'Please type your username & password',
                    ).show();
                    return;
                  }
                  Map d = await controller.signIn(username, password);

                  GetSnackBar(
                    duration: const Duration(seconds: 3),
                    title: 'Account',
                    message: d['reason'],
                  ).show();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SignInForm extends StatefulWidget {
  bool isSign;
  Function(String username, String password) onSign;

  _SignInForm({
    required this.isSign,
    required this.onSign,
  });

  @override
  State<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  FocusNode usernode = FocusNode();
  FocusNode passnode = FocusNode();

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      color: Colors.white,
      child: Column(
        children: [
          TextFormField(
            controller: user,
            focusNode: usernode,
            decoration: InputDecoration(
              hintText: 'Username',
              alignLabelWithHint: true,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              labelText: 'Username',
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              floatingLabelStyle: TextStyle(color: Colors.cyan[800]),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan[800]!, width: 4),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 4),
              ),
            ),
          ),
          TextFormField(
            controller: pass,
            focusNode: passnode,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: '*******',
              alignLabelWithHint: true,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              labelText: 'Password',
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.cyan[800],
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.cyan[800]!,
                  width: 4,
                ),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black12,
                  width: 4,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        onChanged: (b) {},
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          !widget.isSign
              ? SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      usernode.unfocus();
                      passnode.unfocus();
                      widget.onSign(user.text, pass.text);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[900]),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'New User?',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.blue[900],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
