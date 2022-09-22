import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class AuthService {
  // Login Function
  static Future<dynamic> login({
    required String email,
    required String pass,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kSupplierLogin,
      body: {
        "userName": email,
        "password": pass,
      },
    );
    return response;
  }

  // Login Function
  static Future<dynamic> updateProfile({
    required dynamic payload,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kUpdateSupplier,
      body: payload,
    );
    return response;
  }
}
