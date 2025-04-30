class Api {
  static const String baseUrl = 'http://172.17.15.119:8015/web/api';
  static const String basePortalUrl = 'http://192.168.51.36:3000';

  static const String loginUrl = '${baseUrl}/login';
  static const String generateOTP = '${baseUrl}/generate_otp';
  static const String registerNow = '${baseUrl}/register';
  static const String dashboard_data = '${baseUrl}/dashboard_data';
  static const String claimUrl = '${baseUrl}/claim_an_installation';
  static const String newInstall = '${baseUrl}/new_installation';

  static const String signUpStep2 = '${baseUrl}/confirm_otp';
  static const String getChildAccountList = '${baseUrl}/api/get-account';
  static const String getProfileData =
      '${baseUrl}/api/portfolio-statement-dashboard';
  static const String investor_activity_log =
      '${baseUrl}/api/investor-activity';
  static const String submitProfileData =
      '${baseUrl}/api/update-personal-information';
  static const String getPersonalInfo = '${baseUrl}/api/personal-information';
  static const String fiscalYear = '${baseUrl}/api/report/fiscal-year';
  static const String recentIpoList = '${baseUrl}/api/ordered-ipo-list';
  static const String purchasePower = '${baseUrl}/api/purchasepower';
  static const String availableIpo = '${baseUrl}/api/available-ipo-list';
  static const String accountList = '${baseUrl}/api/deposit-account-list';
  static const String withdrawList = '${baseUrl}/api/withdraw-list';
  static const String withdrawSubmit = '${baseUrl}/api/withdraw-submit';
  static const String changePassword = '${baseUrl}/api/change-password';
  static const String submitIpo = '${baseUrl}/api/submit-ipo';
  static const String complainGet = '${baseUrl}/api/complain-list';
  static const String complainSubmit = '${baseUrl}/api/complain-submit';
  static const String bankList = '${baseUrl}/api/bank-list';
  static const String depositList = '${baseUrl}/api/depost-list';
  static const String depositSubmit = '${baseUrl}/api/deposit-submit';
  static const String availableBalance = '${baseUrl}/api/available-balance';
  static const String companybranch = '${baseUrl}/api/companybranch';
  static const String getBranchName = '${baseUrl}/api/branch-list';
  static const String getProductName = '${baseUrl}/api/product-list';
  static const String getGenderName = '${baseUrl}/api/gender-list';
  static const String getResidentName = '${baseUrl}/api/resident-list';
  static const String getOccupationName = '${baseUrl}/api/occupation-list';
  static const String getNationalityName = '${baseUrl}/api/nationality-list';
  static const String getRelationshipName = '${baseUrl}/api/relationship-list';
  static const String boSubmitStep1 = '${baseUrl}/api/registration/1';
  static const String boSubmitStep2 = '${baseUrl}/api/registration/2';
  static const String boSubmitStep3 = '${baseUrl}/api/registration/3';
  static const String boSubmitStep4 = '${baseUrl}/api/registration/4';
  static const String boSubmitStep5 = '${baseUrl}/api/registration/5';
  static const String boSubmitStep6 = '${baseUrl}/api/registration/6';
  static const String boSubmitStep7 = '${baseUrl}/api/registration/7';
  static const String boSubmitStep9 = '${baseUrl}/api/registration/9';
  static const String boSubmitStep8 = '${baseUrl}/api/registration/8';
  static const String boResendOtp = '${baseUrl}/api/otp-resend';
  static const String signUpStep1 = '${baseUrl}/api/sign-up/1';

  static const String signUpStep3 = '${baseUrl}/api/sign-up/3';
  static const String forgotPwSendOtp = '${baseUrl}/api/v1/send-otp';
  static const String forgotPwVerifyOtp = '${baseUrl}/api/v1/verify-otp';
  static const String cityApi2 = '${baseUrl}/api/city-list';
  static const String forgotPass = '${baseUrl}/api/v1/forgot-password';
  static const String forgotPw1 = '${baseUrl}/api/forgot-password/1';
  static const String forgotPw2 = '${baseUrl}/api/forgot-password/2';
  static const String forgotPw3 = '${baseUrl}/api/forgot-password/3';
}
