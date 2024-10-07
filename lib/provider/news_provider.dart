import 'package:blott/model/new_response_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../server_interaction/news_api.dart';

final newsProvider =
    StateNotifierProvider<NewsProvider, List<NewsResponseModel>>((ref) {
  return NewsProvider(
    [],
  );
});

class NewsProvider extends StateNotifier<List<NewsResponseModel>> {
  NewsProvider(super.state);

  NewsDataSource newsDataSource = NewsDataSource();

  Future<bool> getTheListOfAvailableNews() async {
    List<NewsResponseModel>? result = await newsDataSource.getAllTheNews();
    if (result != null) {
      state = result;
      return true;
    } else {
      return false;
    }
  }
}
