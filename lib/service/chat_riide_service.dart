import 'package:dio/dio.dart';
import 'package:sunday_training/model/chat_riide_model.dart';

abstract class ChatService {
  Dio dio = Dio();
  late Response response;
  String basurl = "https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/people";

  Future<List<ChatRiideModel>> getChat();
}

class ChatServiceImpl extends ChatService {
  @override
  Future<List<ChatRiideModel>> getChat() async {
    try {
      response = await dio.get(basurl);

      if (response.statusCode == 200) {
        List<ChatRiideModel> chat = List.generate(response.data.length,
            (index) => ChatRiideModel.fromMap(response.data[index]));
        print(chat);
        return chat;
      } else {
        return [];
      }
    } on DioException catch (e) {
      print(e.message);
      return [];
    }
  }
}
