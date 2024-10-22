class OHMEntity {
  int id;
  DateTime createTime;
  int type;
  String text1;
  String text2;
  String result;

  OHMEntity({
    required this.id,
    required this.createTime,
    required this.type,
    required this.text1,
    required this.text2,
    required this.result,
  });

  factory OHMEntity.fromJson(Map<String, dynamic> json) {
    return OHMEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      type: json['type'],
      text1: json['text1'],
      text2: json['text2'],
      result: json['result'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'type': type,
      'text1': text1,
      'text2': text2,
      'result': result,
    };
  }
}