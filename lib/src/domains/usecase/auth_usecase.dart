import 'package:smart_health_care/src/data/repository/auth_repositoryImp.dart';
import 'package:smart_health_care/src/model/login_response.dart';
import 'package:smart_health_care/src/model/registration.dart';
import 'package:smart_health_care/src/model/registration_response.dart';

class AuthUsecase {
  AuthRepositoryimp authRepository;

  AuthUsecase({required this.authRepository});

  Future<RegistrationResponse> saveRegistration(
    Registration registration,
  ) async {
    return await authRepository
        .saveRegistration(registration)
        .then((value) {
          if (value != null && value > 0) {
            return RegistrationResponse(
              success: true,
              message: "Registration successful",
            );
          } else {
            return RegistrationResponse(
              success: false,
              message: "Registration failed",
            );
          }
        })
        .catchError((error) {
          return RegistrationResponse(
            success: false,
            message: "Error: ${error.toString()}",
          );
        });
  }

  Future<LoginResponse> getlogin(String email, String password) async {
    var user = await authRepository.getlogin(email, password);

    if (user != null) {
      return LoginResponse(
        id: user.id,
        email: user.email,
        firstName: user.first_name ?? '',
        lastName: user.last_name,
        userphone: user.user_phone ?? '',
        usertype: user.user_type,
        logname: user.first_name,
        logpass: user.userPass,
        securPass: user.password,
        username: user.first_name,
        gender: user.gender ?? '',
        userdob: '',
        address: user.address ?? '',
        userid: user.email ?? '',
        roleid: 'admin',
        isActive: true,
        createdBy: '',
        createdTime: null,
        updatedBy: '',
        updatedTime: null,
        lastLogin: null,
        queryFlag: '',
        confirmPass: '',
        success: true,
        message: 'successfully login',
      );
    } else {
      return LoginResponse(
        success: false,
        message: "Invalid email or password",
        id: 0,
        email: '',
        firstName: '',
        lastName: '',
        userphone: '',
        usertype: '',
        logname: '',
        logpass: '',
        securPass: '',
        username: '',
        gender: '',
        userdob: '',
        address: '',
        userid: '',
        roleid: '',
        isActive: false,
        createdBy: '',
        createdTime: null,
        updatedBy: '',
        updatedTime: null,
        lastLogin: null,
        queryFlag: '',
        confirmPass: '',
      );
    }
  }
}
