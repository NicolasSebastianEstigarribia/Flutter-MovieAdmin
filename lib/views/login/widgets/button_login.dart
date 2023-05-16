import 'package:flutter/material.dart';
import 'package:movie_admin/utils/colors.dart';
import 'package:movie_admin/view_models/auth_model.dart';
import 'package:movie_admin/widgets/spinner_widget.dart';
import 'package:provider/provider.dart';

class ButtonLogin extends StatelessWidget {
  final String textLogin;
  final Function() onPressed;

  const ButtonLogin({
    Key? key,
    required this.onPressed,
    required this.textLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: authViewModel.loading
              ? const SpinnerWidget() // Mostrar indicador de carga
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: lightBlue,
                  ),
                  child: Semantics(
                    button: true,
                    enabled: true,
                    onTapHint: 'Log in',
                    child: TextButton(
                      onPressed: () async {
                        authViewModel.isLoading(!authViewModel.loading);
                        await onPressed();
                        authViewModel.isLoading(!authViewModel.loading);
                      },
                      child: Text(
                        textLogin,
                        style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
