class SubObject {
  int? id;
  String? date;

  SubObject({
    this.id,
    this.date,
  });

  factory SubObject.fromJson(Map<String, dynamic> json) => SubObject(
        id: json['id'] as int?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
      };
}
