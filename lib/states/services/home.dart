import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class HomeService {
  static Future<dynamic> getPolicy() async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kWebHtml,
    );
    return response;
  }
}
