import 'package:book_review/src/core/utils/loading_dialog.dart';
import 'package:book_review/src/features/account/presentation/bloc/account_bloc.dart';
import 'package:book_review/src/features/account/presentation/bloc/account_event.dart';
import 'package:book_review/src/features/account/presentation/bloc/account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/route/routes_name.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state.isLoggingOut) {
          LoadingDialog.showLoadingDialog(context,
              loadingTitle: 'Logging out...');
        } else if (state.logoutSuccessful) {
          context.read<AccountBloc>().close();
          Navigator.of(context).pushNamedAndRemoveUntil(
            RoutesName.login,
            (route) => false,
          );
        }
      },
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(RoutesName.myList);
                },
                title: 'My List',
                icon: Icons.folder,
              ),
              const Divider(),
              _buildListTile(
                onTap: () {
                  context.read<AccountBloc>().add(LogoutEvent());
                },
                title: 'Log Out',
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildListTile({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    onTap: onTap,
    contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
    leading: Icon(
      icon,
      color: Colors.blueAccent,
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.black87,
      ),
    ),
  );
}
