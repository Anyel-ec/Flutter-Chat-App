import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  // intancia de Dio
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    // obtener la respuesta de la API
  
    final yesNoModel = YesNoModel.fromJson(response.data);
    return yesNoModel.toMessageEntity();
    


  }
}
