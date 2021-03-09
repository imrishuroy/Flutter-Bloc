import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_bloc/models/email_sign_in_model.dart';
import 'package:login_bloc/services/auth_service.dart';

class EmailSignInBloc {
  final AuthBase auth;
  EmailSignInBloc({@required this.auth});

  final StreamController<EmailSignInModel> _modelController =
      StreamController<EmailSignInModel>();

  Stream<EmailSignInModel> get modelStream => _modelController.stream;
  EmailSignInModel _model = EmailSignInModel();

  void toggleFormType() {
    final formType = _model.formType == EmailSignInFormType.signIn
        ? EmailSignInFormType.register
        : EmailSignInFormType.signIn;
    updateWith(
      email: '',
      password: '',
      formType: formType,
      isLoading: false,
      submitted: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    // update model
    _model = _model.copyWith(
      email: email,
      password: password,
      formType: formType,
      isLoading: isLoading,
      submitted: submitted,
    );
    // add updated model to _modelcontroller
    _modelController.add(_model);
  }

  void dispose() {
    _modelController.close();
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      await auth.createUserWithEmailAndPassword(_model.email, _model.password);
    } catch (error) {
      updateWith(isLoading: false);
      rethrow;
    }
  }
}
