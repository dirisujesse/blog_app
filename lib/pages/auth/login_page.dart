import 'package:blog/components/fragments/buttons/app_button.dart';
import 'package:blog/components/fragments/spacers/app_sized_box.dart';
import 'package:blog/components/typography/app_text.dart';
import 'package:blog/models/http/requests/app_request_models.dart';
import 'package:blog/state/auth_state.dart';
import 'package:blog/style/text_styles.dart';
import 'package:blog/utils/extensions.dart';
import 'package:blog/utils/modals.dart';
import 'package:blog/utils/validators.dart';
import 'package:blog/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email;
  TextEditingController _password;
  final GlobalKey<FormState> _form = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final model = context.watch<AuthState>();

    print(model.hashCode);

    return Scaffold(
      key: _scaffKey,
      appBar: AppBar(
        title: AppText(
          "Login Page",
          style: AppTextStyle.black,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: scaler.insets.symmetric(
          vertical: 2,
          horizontal: 5,
        ),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSizedBox(height: 10),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                validator: BlogValidators.email,
                decoration: InputDecoration(
                  labelText: "Email address",
                ),
              ),
              AppSizedBox(height: 2),
              TextFormField(
                controller: _password,
                keyboardType: TextInputType.visiblePassword,
                validator: (text) {
                  return BlogValidators.minLenght(text);
                },
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              AppSizedBox(height: 5),
              AppButton(
                text: "Login",
                onPressed: () async {
                  if (_form.currentState.validate()) {
                    final data = LoginData(
                      email: _email.text,
                      password: _password.text,
                    );
                    final doRoute = await formSubmitDialog(
                      context: _scaffKey.currentContext,
                      future: model.login(data),
                      prompt: "Please wait as we log you in"
                    );
                    if (doRoute != null) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.blogs,
                        (route) => false,
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
