abstract class CommonEntity {
  const CommonEntity({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
  });

  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
}
