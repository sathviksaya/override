import 'package:intl/intl.dart';

class Event {
  late String eventName;
  late String tag;
  late DateTime? date;
  late String info;
  late String addedBy;
  late String eventId;

  Event(
    String eventName,
    String tag,
    DateTime? date,
    String info,
    String addedBy,
  ) {
    this.eventName = eventName;
    this.tag = tag;
    this.date = date;
    this.info = info;
    this.addedBy = addedBy;

    this.eventId =
        this.date!.microsecondsSinceEpoch.toString() + '###' + this.addedBy;
  }

  Map<String, dynamic> toJson() {
    return {
      'eventName': eventName,
      'eventId': eventId,
      'addedBy': addedBy,
      'date': date,
      'tag': tag,
      'info': info.trim(),
      'queryDate': DateFormat('dd-MM-y').format(date ?? DateTime.now()),
    };
  }
}
