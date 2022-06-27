import 'dart:core';

class DashboardResponse {
  String? status;
  String? message;
  Data? data;

  DashboardResponse({this.status, this.message, this.data});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? examResult;
  int? feeDue;
  List<Timetable>? timetable;

  Data({this.examResult, this.feeDue, this.timetable});

  Data.fromJson(Map<String, dynamic> json) {
    examResult = json['exam_result'];
    feeDue = json['fee_due'];
    if (json['timetable'] != null) {
      timetable = <Timetable>[];
      json['timetable'].forEach((v) {
        timetable!.add(Timetable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exam_result'] = examResult;
    data['fee_due'] = feeDue;
    if (timetable != null) {
      data['timetable'] = timetable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timetable {
  int? id;
  String? staffId;
  String? campusId;
  String? classId;
  String? sectionId;
  String? sessionId;
  String? subjectId;
  String? createdAt;
  String? updatedAt;
  String? timeId;
  TimeCrud? timeCrud;
  Subject? subject;

  Timetable(
      {this.id,
      this.staffId,
      this.campusId,
      this.classId,
      this.sectionId,
      this.sessionId,
      this.subjectId,
      this.createdAt,
      this.updatedAt,
      this.timeId,
      this.timeCrud,
      this.subject});

  Timetable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    staffId = json['staff_id'];
    campusId = json['campus_id'];
    classId = json['class_id'];
    sectionId = json['section_id'];
    sessionId = json['session_id'];
    subjectId = json['subject_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    timeId = json['time_id'];
    timeCrud = json['time_crud'] != null ? TimeCrud.fromJson(json['time_crud']) : null;
    subject = json['subject'] != null ? Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['staff_id'] = staffId;
    data['campus_id'] = campusId;
    data['class_id'] = classId;
    data['section_id'] = sectionId;
    data['session_id'] = sessionId;
    data['subject_id'] = subjectId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['time_id'] = timeId;
    if (timeCrud != null) {
      data['time_crud'] = timeCrud!.toJson();
    }
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    return data;
  }
}

class TimeCrud {
  int? id;
  String? campusId;
  String? startTime;
  String? endTime;
  String? sequence;
  String? breakTime;
  String? active;
  String? createdAt;
  String? updatedAt;

  TimeCrud(
      {this.id,
      this.campusId,
      this.startTime,
      this.endTime,
      this.sequence,
      this.breakTime,
      this.active,
      this.createdAt,
      this.updatedAt});

  TimeCrud.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    campusId = json['campus_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    sequence = json['sequence'];
    breakTime = json['break'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['campus_id'] = campusId;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['sequence'] = sequence;
    data['break'] = breakTime;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Subject {
  int? id;
  String? campusId;
  String? name;
  String? active;
  String? totalMarks;
  String? createdAt;
  String? updatedAt;

  Subject({this.id, this.campusId, this.name, this.active, this.totalMarks, this.createdAt, this.updatedAt});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    campusId = json['campus_id'];
    name = json['name'];
    active = json['active'];
    totalMarks = json['total_marks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['campus_id'] = campusId;
    data['name'] = name;
    data['active'] = active;
    data['total_marks'] = totalMarks;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
