class Locker {
  final int lockerID;
  final String address;

  Locker({
    required this.lockerID,
    required this.address,
  });

  factory Locker.fromJson(Map<String, dynamic> json) {
    return Locker(
      lockerID: json['lockerid'],
      address: json['address'],
    );
  }
}
