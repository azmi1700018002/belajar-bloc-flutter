import 'dart:convert';
import 'package:http/http.dart';
import 'package:kiriminaja_test/models/users_model.dart';

class UserRepository {
  String userUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      // Jika type data seperti dibawah tambahkan ["data"] disamping (response.body) untuk fetch data tersebut
      //{"page":2,"per_page":6,"total":12,"total_pages":2,"data":[
      //{"id":7,"email":"michael.lawson@reqres.in","first_name":"Michael",
      final List result = jsonDecode(response.body);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
