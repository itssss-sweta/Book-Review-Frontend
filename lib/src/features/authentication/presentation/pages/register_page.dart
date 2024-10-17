import 'package:book_review/src/core/utils/loading_dialog.dart';
import 'package:book_review/src/core/utils/validators/form_validator.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:book_review/src/features/authentication/presentation/pages/login_page.dart';
import 'package:book_review/src/features/authentication/presentation/widgets/custom_labeled_text_field.dart';
import 'package:book_review/src/shared/presentation/widgets/base_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is RegistrationSuccessful) {
            if (LoadingDialog.isLoadingDialogVisible) {
              Navigator.of(context).pop();
            }
            // Handle successful authentication, e.g., navigate to home screen
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
          } else if (state is RegistrationError) {
            if (LoadingDialog.isLoadingDialogVisible) {
              Navigator.of(context).pop();
            }
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is RegistrationLoading) {
            LoadingDialog.showLoadingDialog(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: authBloc.registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an Account',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  CustomLabeledTextField(
                    label: 'Username',
                    hintText: 'Enter your username',
                    controller: authBloc.registerFullNameController,
                    keyboardType: TextInputType.name,
                    validator: TextFieldValidator.validateNameField,
                  ),
                  const SizedBox(height: 20),
                  CustomLabeledTextField(
                    label: 'Email',
                    hintText: 'Enter your email',
                    controller: authBloc.registerEmailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: TextFieldValidator.validateEmailField,
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<AuthBloc, AuthenticationState>(
                    builder: (context, state) {
                      return CustomLabeledTextField(
                        label: 'New Password',
                        hintText: 'Enter your password',
                        controller: authBloc.registerPasswordController,
                        validator: TextFieldValidator.validatePasswordField,
                        isObscure: !authBloc.isRegisterPasswordVisible,
                        suffixIcon: IconButton(
                          onPressed: () {
                            authBloc
                                .add(ToggleRegisterPasswordVisibilityEvent());
                          },
                          icon: Icon(
                            authBloc.isRegisterPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<AuthBloc, AuthenticationState>(
                    builder: (context, state) {
                      return CustomLabeledTextField(
                        label: 'Confirm Password',
                        hintText: 'Confirm your password',
                        controller: authBloc.registerConfirmPasswordController,
                        validator: TextFieldValidator.validatePasswordField,
                        isObscure: !authBloc.isConfirmPasswordVisible,
                        suffixIcon: IconButton(
                          onPressed: () {
                            authBloc
                                .add(ToggleConfirmPasswordVisibilityEvent());
                          },
                          icon: Icon(
                            authBloc.isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  BasePrimaryButton(
                    label: 'Register',
                    onPressed: () {
                      if (authBloc.registerFormKey.currentState?.validate() ??
                          false) {
                        if (authBloc.registerPasswordController.text ==
                            authBloc.registerConfirmPasswordController.text) {
                          context.read<AuthBloc>().add(RegisterEvent());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Passwords didn't match, please recheck and try again.")));
                        }
                      }
                    },
                    buttonWidth: MediaQuery.sizeOf(context).width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
