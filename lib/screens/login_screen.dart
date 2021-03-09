import 'package:flutter/material.dart';
import 'package:login_bloc/blocs/bloc.dart';

final bloc = Bloc();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          emailField(),
          SizedBox(height: 10.0),
          passwordField(),
          SizedBox(height: 12.0),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          // onChanged: (value) {
          //   bloc.changeEmail(value);
          // },
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@gmail.com',
            labelText: 'Email',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          //  obscureText: true ,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
