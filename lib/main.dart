import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:flutter_github_cicd/screens/homePage/fragments/updateProfilePage/update_profile_screen.dart';
import 'package:flutter_github_cicd/screens/new_install/claim_new_screen.dart';
import 'package:flutter_github_cicd/screens/new_install/new_install_screen.dart';
import 'package:flutter_github_cicd/screens/new_install/success_screen.dart';
import 'package:flutter_github_cicd/screens/profile/edit_profile_screen.dart';
import 'package:flutter_github_cicd/screens/signup_screen/password_setup.dart';

import 'package:flutter_github_cicd/utils/all_routes.dart';
import 'package:sizer/sizer.dart';
import 'bindings/all_bindings.dart';
import 'firebase_options.dart';
import 'screens/homePage/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode));
}

class MyApp extends StatelessWidget {
  var savedThemeMode;
  MyApp(this.savedThemeMode, {super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return AdaptiveTheme(
          light: lightThemeData,
          dark: darkThemeData,
          initial: savedThemeMode ?? AdaptiveThemeMode.light,
          builder:
              (theme, darkTheme) => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'eService',
                smartManagement: SmartManagement.full,
                theme: theme,
                darkTheme: darkTheme,
                builder: EasyLoading.init(),
                initialBinding: AllBindings(),
                defaultTransition: Transition.fadeIn,
                getPages: [
                  GetPage(name: '/', page: () => SplashScreen()),
                  GetPage(name: HomePage.routeName, page: () => HomePage()),
                  GetPage(
                    name: EditProfileScreen.routeName,
                    page: () => EditProfileScreen(),
                  ),
                  GetPage(name: LoginPage.routeName, page: () => LoginPage('')),
                  // GetPage(
                  //   name: AccountStatusAdmin.routeName,
                  //   page: () => AccountStatusAdmin(),
                  // ),
                  // GetPage(name: AcknAdmin.routeName, page: () => AcknAdmin()),
                  GetPage(
                    name: PromotinalAdmin.routeName,
                    page: () => PromotinalAdmin(),
                  ),
                  GetPage(
                    name: PromotinalAdminEditAdd.routeName,
                    page: () => PromotinalAdminEditAdd(),
                  ),

                  GetPage(
                    name: MyScannerScreen.routeName,
                    page: () => MyScannerScreen(),
                  ),
                  GetPage(
                    name: WithdrawScreen.routeName,
                    page: () => WithdrawScreen(),
                  ),

                  // GetPage(
                  //   name: ResetPasswordAdmin.routeName,
                  //   page: () => ResetPasswordAdmin(),
                  // ),
                  GetPage(
                    name: ComplainScreen.routeName,
                    page: () => ComplainScreen(),
                  ),
                  GetPage(
                    name: UpdateProfileScreen.routeName,
                    page: () => UpdateProfileScreen(),
                  ),
                  GetPage(
                    name: AddAccountScreen.routeName,
                    page: () => AddAccountScreen(),
                  ),
                  GetPage(
                    name: ChangePassScreen.routeName,
                    page: () => ChangePassScreen(),
                  ),
                  GetPage(
                    name: ForgotClientId.routeName,
                    page: () => ForgotClientId(),
                  ),
                  GetPage(
                    name: PasswordSetup.routeName,
                    page: () => PasswordSetup(),
                  ),
                  GetPage(
                    name: SignupScreen.routeName,
                    page: () => SignupScreen(),
                  ),
                  GetPage(
                    name: SuccessScreen.routeName,
                    page: () => SuccessScreen(),
                  ),
                  GetPage(
                    name: PersonalInfo.routeName,
                    page: () => PersonalInfo(),
                  ),
                  GetPage(
                    name: ClaimNewScreen.routeName,
                    page: () => ClaimNewScreen(),
                  ),
                ],
                initialRoute: '/',
              ),
        );
      },
    );
  }
}
