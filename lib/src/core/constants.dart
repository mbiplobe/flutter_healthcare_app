abstract class SplashConstants {
  static const String splashRoute = '/splash';
  static const String yourHealth = 'Your health';
  static const String byHssTechnovation = 'By HSS technovation';
}

abstract class AssetConstants {
  static const String doctorFace = 'assets/doctor_face.jpg';
  static const String heartBeat = 'assets/heartbeat.png';
  static const String loadingGif = 'assets/loading.gif';
  static const String appLogo = 'assets/app_logo.png';
  static const String userPlaceholder = 'assets/user_placeholder.png';
  static const String googleLogo = 'assets/google_logo.png';
  static const String facebookLogo = 'assets/facebook_logo.png';
  static const String appleLogo = 'assets/apple_logo.png';
  static const String labTest = 'assets/lab_test.png';
  static const String appointment = 'assets/appointment.png';
  static const String pharmacy = 'assets/pharmacy.png';
  static const String ambulance = 'assets/ambulance.png';
  static const String bloodBank = 'assets/blood_bank.png';
  static const String chat = 'assets/chat.png';
  static const String covid = 'assets/covid.png';
  static const String diabetes = 'assets/diabetes.png';
  static const String heartDisease = 'assets/heart_disease.png';
  static const String hypertension = 'assets/hypertension.png';
  static const String obesity = 'assets/obesity.png';
  static const String profile = 'assets/profile.png';
  static const String settings = 'assets/settings.png';
  static const String logout = 'assets/logout.png';
  static const String backArrow = 'assets/back_arrow.png';
  static const String calendar = 'assets/calendar.png';
  static const String clock = 'assets/clock.png';
  static const String location = 'assets/location.png';
  static const String phone = 'assets/phone.png';
  static const String email = 'assets/email.png';
  static const String message = 'assets/message.png';
  static const String videoCall = 'assets/video_call.png';
  static const String call = 'assets/call.png';
  static const String chatBubble = 'assets/chat_bubble.png';
  static const String verified = 'assets/verified.png';
  static const String star = 'assets/star.png';
  static const String emptyBox = 'assets/empty_box.png';
  static const String addToCart = 'assets/add_to_cart.png';
  static const String cart = 'assets/cart.png';
  static const String emptyCart = 'assets/empty_cart.png';
  static const String orderPlaced = 'assets/order_placed.png';
  static const String orderFailed = 'assets/order_failed.png';
  static const String prescription = 'assets/prescription.png';
  static const String upload = 'assets/upload.png';
  static const String camera = 'assets/camera.png';
  static const String gallery = 'assets/gallery.png';
  static const String pdf = 'assets/pdf.png';
}

abstract class AppConfigurations {
  static const String appTitle = 'Health Care';
}

abstract class AppLoginConstants {
  static const String welcomeBack = 'Welcome';
  static const String signInToContinue = 'Please login to access';
  static const String userName = 'User name or email or phone';

  static const String email = 'Email';
  static const String password = 'Password';
  static const String forgotPassword = 'Forgot Password?';
  static const String orSignInWith = 'Or sign in with';
  static const String dontHaveAccount = "Don't have account?";
  static const String clickHere = ' Login';

  static const String clickForRegister = 'Register';
  static const String invalidUserName = "Invalid username or password";
  static const String inputEmail = "Please input your emai";
  static const String inputPassword = "Please input your password";
}

abstract class AppRegistrationConstants {
  static const String firstName = 'First Name';
  static const String lastName = 'Last Name';
  static const String phoneNumber = 'Phone Number';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String location = 'Location';
  static const String age = 'Age';
  static const String userType = 'Type of User';
  static const String alreadyHaveAccount = 'Already have account?';
}

abstract class TypeofUserConstants {
  static const String doctor = 'doctor';
  static const String patient = 'patient';
  static const String deliveryman = 'deliveryman';
}

abstract class AppRegisterConstants {
  static const String createAccount = 'Create Account';
  static const String signUpToContinue = 'Sign up to continue';
  static const String firstName = 'First Name';
  static const String lastName = 'Last Name';
  static const String phoneNumber = 'Phone Number';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String alreadyHaveAccount = "Already have account?";
  static const String clickHere = ' Click here';
}

abstract class ValidationConstants {
  static const String invalidEmail = 'Please enter a valid email';
  static const String invalidPassword =
      'Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number and one special character';
  static const String passwordMismatch = 'Passwords do not match';
  static const String emptyfirstName = 'Enter first name';
  static const String emptylastName = 'Enter last name';
  static const String emptyphoneNumber = 'Enter phone number';
  static const String eemptyvalidPhoneNumber = 'Enter valid phone number';
  static const String emptyemail = 'Enter email';
  static const String emptypassword = 'Enter password';
  static const String minPasswordLength = 'Enter at least 6 digit password';
  static const String emptyLocation = 'Enter location';
  static const String emptyage = 'Enter your age';
  static const String emptyvalidAge = 'Enter a valid age (1-120)';
}

abstract class RegexPatterns {
  static const String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      static const String phonePattern = r'^(?:[+0]9)?[0-9]{10,13}$';
       
}
