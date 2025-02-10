import 'package:ai_sky/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String userName;
  final String email;
  final String uId;

  UserModel({
    required this.userName,
    required this.email,
    required this.uId,
  });

  factory UserModel.fromUserEntity(UserEntity user) {
    return UserModel(
      userName: user.userName,
      email: user.email,
      uId: user.uId,
    );
  }
  UserEntity toUserEntity() => UserEntity(
        userName: userName,
        email: email,
        uId: uId,
      );
}
