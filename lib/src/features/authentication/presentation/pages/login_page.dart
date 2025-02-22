import 'package:book_review/src/core/route/routes_name.dart';
import 'package:book_review/src/core/styles/app_colors.dart';
import 'package:book_review/src/core/utils/loading_dialog.dart';
import 'package:book_review/src/core/utils/show_snackbar.dart';
import 'package:book_review/src/core/utils/validators/form_validator.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:book_review/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:book_review/src/features/authentication/presentation/widgets/custom_labeled_text_field.dart';
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
            authBloc.close();
            Navigator.of(context).pushNamedAndRemoveUntil(
              RoutesName.home,
              (route) => false,
            );
          } else if (state is AuthenticationError) {
            Navigator.of(context).pop();
            ShowSnackbar.showSnackBar(context,
                title: state.message, backgroundColor: AppColors.errorColor);
          } else if (state is AuthenticationLoading) {
            LoadingDialog.showLoadingDialog(context,
                loadingTitle: 'Logging you in....');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Form(
              key: authBloc.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello there 👋',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 16),
                  CustomLabeledTextField(
                    controller: authBloc.loginEmailController,
                    hintText: 'example@xyz.com',
                    label: 'Email',
                    validator: TextFieldValidator.validateEmptyField,
                  ),
                  const SizedBox(height: 16),
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
                            color: AppColors.accentColor,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        checkColor: AppColors.white,
                        activeColor: AppColors.accentColor,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Remember Me',
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  ),
                  const SizedBox(height: 28),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: AppColors.secondaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
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
