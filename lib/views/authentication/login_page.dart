import 'package:flutter/material.dart';
import 'package:onboarding_screen/views/welcome_page.dart';
import '../../app_styles.dart';
import '../../size_configs.dart';
import '../../validators.dart';
import '../../widgets/buttons/large_icon_button.dart';
import '../../widgets/buttons/small_text_buttons.dart';
import '../pages.dart';
import '../../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  void onSubmit() {
    _loginKey.currentState!.validate();
  }

  List<FocusNode> _loginFocusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  @override
  void initState() {
    super.initState();
    _loginFocusNodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.blockSizeV!;
    return Stack(
      children: [
        Positioned(
          bottom: height * 3,
          child: Container(
            child: Text("Hyy"),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Text(
                          //
                          //   style: kTitle,
                          //   textAlign: TextAlign.center,
                          // ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                LargeIconButton(
                                  buttonName: 'Continue with Google',
                                  iconImage:
                                      'assets/images/auth/google_icon.png',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                LargeIconButton(
                                  buttonName: 'Continue with Facebook',
                                  iconImage:
                                      'assets/images/auth/facebook_icon.png',
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text(
                                    'Login with email',
                                    style: kBodyText3,
                                  ),
                                  Divider(
                                    height: 30,
                                    color: kPrimaryColor.withOpacity(0.5),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Form(
                                      key: _loginKey,
                                      child: Column(
                                        children: [
                                          MyTextFormField(
                                            hint: 'Email',
                                            icon: Icons.email_outlined,
                                            fillColor: kScaffoldBackground,
                                            inputType:
                                                TextInputType.emailAddress,
                                            inputAction: TextInputAction.next,
                                            focusNode: _loginFocusNodes[0],
                                            validator: emailValidator,
                                          ),
                                          MyPasswordField(
                                            fillColor: kScaffoldBackground,
                                            focusNode: _loginFocusNodes[1],
                                            validator: passwordValidator,
                                          ),
                                          SizedBox(
                                            height:
                                                SizeConfig.blockSizeH! * 15.5,
                                            width: SizeConfig.blockSizeH! * 100,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          WelcomePage()),
                                                );
                                              },
                                              child: Text(
                                                "Login",
                                                style: kBodyText1,
                                              ),
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      kPrimaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPasswordPage()));
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: kBodyText3.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account? "),
                                      SmallTextButton(
                                        buttonText: 'Sign up',
                                        page: SignUpPage(),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
