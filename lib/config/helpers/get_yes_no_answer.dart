import 'package:dio/dio.dart';
import 'package:practica2/presentation/domain/entities/message.dart';
import 'package:practica2/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('http://yesno.wtf/api');
    final YesNoModel ynmodel = YesNoModel.fromJson(response.data);
    return ynmodel.toMessageEntity();
  }
}
