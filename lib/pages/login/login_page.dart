import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
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
          _SignInForm(
            onSign: () {},
          ),
        ],
      ),
    );
  }
}

class _SignInForm extends StatelessWidget {
  Function() onSign;

  _SignInForm({
    required this.onSign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      color: Colors.white,
      child: Column(
        children: [
          TextFormField(
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
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
