class SubjectWiseResultResponse {
  String? status;
  String? message;
  List<Data>? data;

  SubjectWiseResultResponse({this.status, this.message, this.data});

  SubjectWiseResultResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? campusId;
  String? name;
  String? active;
  String? totalMarks;
  String? createdAt;
  String? updatedAt;
  List<MarkSheets>? markSheets;

  Data(
      {this.id,
        this.campusId,
        this.name,
        this.active,
        this.totalMarks,
        this.createdAt,
        this.updatedAt,
        this.markSheets});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    campusId = json['campus_id'];
    name = json['name'];
    active = json['active'];
    totalMarks = json['total_marks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['mark_sheets'] != null) {
      markSheets = <MarkSheets>[];
      json['mark_sheets'].forEach((v) {
        markSheets!.add(MarkSheets.fromJson(v));
      });
    }
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
    if (markSheets != null) {
      data['mark_sheets'] = markSheets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MarkSheets {
  int? id;
  String? studentId;
  String? subjectId;
  String? campusId;
  String? classId;
  String? sectionId;
  String? sessionId;
  int? obtainedMarks;
  String? absent;
  int? totalMarks;
  ExamTerm? examTerm;
  String? createdAt;
  String? updatedAt;
  String? notes;

  MarkSheets(
      {this.id,
        this.studentId,
        this.subjectId,
        this.campusId,
        this.classId,
        this.sectionId,
        this.sessionId,
        this.obtainedMarks,
        this.absent,
        this.totalMarks,
        this.examTerm,
        this.createdAt,
        this.updatedAt,
        this.notes});

  MarkSheets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    subjectId = json['subject_id'];
    campusId = json['campus_id'];
    classId = json['class_id'];
    sectionId = json['section_id'];
    sessionId = json['session_id'];
    obtainedMarks = json['obtained_marks'];
    absent = json['absent'];
    totalMarks = json['total_marks'];
    examTerm = json['exam_term'] != null
        ? ExamTerm.fromJson(json['exam_term'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_id'] = studentId;
    data['subject_id'] = subjectId;
    data['campus_id'] = campusId;
    data['class_id'] = classId;
    data['section_id'] = sectionId;
    data['session_id'] = sessionId;
    data['obtained_marks'] = obtainedMarks;
    data['absent'] = absent;
    data['total_marks'] = totalMarks;
    if (examTerm != null) {
      data['exam_term'] = examTerm!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['notes'] = notes;
    return data;
  }
}

class ExamTerm {
  int? id;
  String? campusId;
  String? name;
  String? active;
  String? createdAt;
  String? updatedAt;

  ExamTerm(
      {this.id,
        this.campusId,
        this.name,
        this.active,
        this.createdAt,
        this.updatedAt});

  ExamTerm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    campusId = json['campus_id'];
    name = json['name'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['campus_id'] = campusId;
    data['name'] = name;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
