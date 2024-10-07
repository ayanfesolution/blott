import 'package:blott/api/api_client.dart';
import 'package:blott/model/new_response_model.dart';
import 'package:blott/utils/constants.dart';
import 'package:blott/utils/error_handling.dart';
import 'package:blott/utils/injector.dart';

class NewsDataSource {
  final ApiClient client = injector.apiClient;

  Future<List<NewsResponseModel>?> getAllTheNews() async {
    try {

      //client.header = {'Accept': 'application/json'};
      final result = await client.get(
          '/news?category=general&token=cs151c9r01qru183p78gcs151c9r01qru183p790');
      final output = newsResponseModelFromJson(result.data);
      return output;
    } catch (e) {
      kToastMsgPopUp(NetworkExceptions.getDioException(e));
      return null;
    }
  }
}
