import 'package:book_review/src/core/utils/loading_dialog.dart';
import 'package:book_review/src/core/utils/validators/form_validator.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:book_review/src/features/authentication/presentation/widgets/custom_labeled_text_field.dart';
import 'package:book_review/src/features/homepage/presentation/pages/homepage.dart';
import 'package:book_review/src/shared/presentation/widgets/base_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Handle successful authentication, e.g., navigate to home screen
            Navigator.of(context).pop();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          } else if (state is AuthenticationError) {
            // Show error message
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            Navigator.of(context).pop();
          } else if (state is AuthenticationLoading) {
            LoadingDialog.showLoadingDialog(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: authBloc.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  CustomLabeledTextField(
                    controller: authBloc.loginEmailController,
                    hintText: 'example@xyz.com',
                    label: 'Email',
                    validator: TextFieldValidator.validateEmptyField,
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<AuthBloc, AuthenticationState>(
                    builder: (context, state) {
                      return CustomLabeledTextField(
                        controller: authBloc.loginPasswordController,
                        hintText: '*********',
                        label: 'Password',
                        validator: TextFieldValidator.validateEmptyField,
                        isObscure: !authBloc.isLoginPasswordVisible,
                        suffixIcon: IconButton(
                          onPressed: () {
                            authBloc.add(ToggleLoginPasswordVisibilityEvent());
                          },
                          icon: Icon(
                            authBloc.isLoginPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  BasePrimaryButton(
                    label: 'Login',
                    onPressed: () {
                      if (authBloc.loginFormKey.currentState?.validate() ??
                          false) {
                        context.read<AuthBloc>().add(LoginEvent());
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
