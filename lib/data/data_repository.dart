import 'package:surf_practice_magic_ball/data/data_api_provider.dart';
import 'package:surf_practice_magic_ball/models/loaded_answer_model.dart';
import 'package:surf_practice_magic_ball/utils/constants.dart';

class DataRepository {
  Future<LoadedAnswerModel> fetchAnswer() async {
    try {
      final Map<String, dynamic> loadedData = await _retrieveData(baseUrl);

      return LoadedAnswerModel(reading: loadedData['reading'], isSuccess: true);
    } catch (e) {
      return const LoadedAnswerModel(reading: '', isSuccess: false);
    }
  }

  Future<Map<String, dynamic>> _retrieveData(final String url) async {
    final Map<String, dynamic> loadedData = await DataApiProvider().getDataFromNetwork(url);
    return loadedData;
  }
}
