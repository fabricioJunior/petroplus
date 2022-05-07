import 'package:dio/dio.dart';
import 'package:petroplus/pages/dashboard_page/controles/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoRepository {
  Dio get dio => Dio();

  Future<List<TodoModel>> getTodos() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.getString("token");

      final response = await dio.get(
          'https://petroplus-api-dev.herokuapp.com/v1/orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      final data = response.data['items'] as List;
      final todos = data.map(
        (map) {
          return TodoModel.fromMap(map);
        },
      ).toList();
      return todos;
    } on DioError catch (e) {
      rethrow;
    }
  }
}
