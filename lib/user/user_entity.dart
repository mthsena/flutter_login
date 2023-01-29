import '../common/common_entity.dart';
import 'user_model.dart';

class UserEntity extends CommonEntity {
  const UserEntity({
    required super.uuid,
    required super.updatedAt,
    required super.createdAt,
    required this.user,
  });

  final UserModel user;
}
