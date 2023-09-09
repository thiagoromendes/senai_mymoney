import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_money/src/modules/login/components/register_link.dart';
import 'package:my_money/src/modules/login/controller/login_controller.dart';
import 'package:my_money/src/router/app_router.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/components/app_button.dart';
import 'package:my_money/src/shared/components/app_loading.dart';
import 'package:my_money/src/shared/components/app_logo_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = LoginController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ReactionDisposer sendDataReactionDisposer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reactsToSendDataSuccess();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void reactsToSendDataSuccess() {
    sendDataReactionDisposer =
        reaction((_) => controller.isSuccess, (bool success) async {
      if (success) {
        controller.setSucess();
        await controller.verifyFirstAcess();
        controller.isFirstAcess
            ? await Navigator.of(context).pushNamed(AppRouter.personalRegister)
            : await Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRouter.home, (route) => false);
        controller.setLoading();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return controller.isLoading
          ? const AppLoading()
          : Scaffold(
              backgroundColor: AppColors.appPageBackground,
              body: SingleChildScrollView(
                child: SafeArea(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 140,
                      left: 25,
                      right: 25,
                    ),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const AppLogoTitle(
                            title: 'Login My Money',
                            iconSize: 80,
                            titleSize: 20,
                          ),
                          TextFormField(
                            enabled: true,
                            controller: loginController,
                            textAlign: TextAlign.start,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            decoration:
                                const InputDecoration(label: Text('Login')),
                          ),
                          TextFormField(
                            enabled: true,
                            controller: passwordController,
                            textAlign: TextAlign.start,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration:
                                const InputDecoration(label: Text('Senha')),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: AppButton(
                                  action: () {
                                    controller.checkData(
                                      emailController: loginController.text,
                                      passwordController:
                                          passwordController.text,
                                      buildContext: context,
                                    );
                                  },
                                  label: "Login")),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRouter.register);
                              },
                              child: const RegisterLink()),
                        ]),
                  ),
                )),
              ));
    });
  }
}
