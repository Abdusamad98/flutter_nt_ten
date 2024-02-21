import 'package:flutter_nt_ten/data/network/api_provider.dart';
import 'package:flutter_nt_ten/data/models/network_response.dart';

class UserRepository {
  Future<NetworkResponse> getUserDataById(int id) =>
      ApiProvider.fetchSingleUserData(id);

  Future<NetworkResponse> getAllUsers() => ApiProvider.fetchUsers();

}
