import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotpasswordpage extends StatefulWidget {
  const forgotpasswordpage({super.key});

  @override
  State<forgotpasswordpage> createState() => _forgotpasswordpageState();
}

class _forgotpasswordpageState extends State<forgotpasswordpage> {
  final _emailcntrl = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailcntrl.clear();
    super.dispose();
  }

  Future passwordreset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailcntrl.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                  "Password reset link sent successfully! check your mail"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(
          e); // exception will occur whenever we do not have those mails in our db.
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter your email and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailcntrl,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                  border: InputBorder.none,
                  hintText: 'Email',
                  fillColor: Colors.grey[200],
                  filled: true),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: passwordreset,
            child: Text('Reset Password'),
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }
}
