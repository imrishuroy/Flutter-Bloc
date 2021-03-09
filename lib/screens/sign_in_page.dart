import 'package:flutter/material.dart';
import 'package:login_bloc/screens/email_sigin_form_bloc_based.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: EmailSignInFormBlocBased.create(context),
        ),
      ),
    );
  }
}
