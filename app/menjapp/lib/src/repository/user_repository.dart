import 'package:menjapp/src/data_Provider/user_data.dart';
import 'package:meta/meta.dart';
import 'package:menjapp/src/models/user_model.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<void> createUser(UserModel user) async {
    return await dataProvider.createUser(user);
  }

  Future<List<UserModel>> getUsers() async {
    print(dataProvider.getUsers());
    return await dataProvider.getUsers();
    
  }

  Future<void> updateUser(UserModel user) async {
    await dataProvider.updateUser(user);
  }

  Future<void> deleteUser(String id) async {
    await dataProvider.deleteUser(id);
  }
}
