class UserModel {
  const UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
  });

  final String name;
  final String email;
  final String phone;
  final String imageUrl;

  factory UserModel.empty() {
    return const UserModel(
      name: '',
      email: '',
      phone: '',
      imageUrl: '',
    );
  }
}
