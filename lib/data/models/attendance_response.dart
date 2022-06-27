class AttendanceResponse {
  String? status;
  String? message;
  AttendanceData? data;

  AttendanceResponse({this.status, this.message, this.data});

  AttendanceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? AttendanceData.fromJson(json['data']) : null;
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

class AttendanceData {
  int? totalPresent;
  int? totalLeave;
  int? totalAbsent;
  int? overallAttendance;
  List<MonthWisePercentage>? monthWisePercentage;

  AttendanceData(
      {this.totalPresent,
        this.totalLeave,
        this.totalAbsent,
        this.overallAttendance,
        this.monthWisePercentage});

  AttendanceData.fromJson(Map<String, dynamic> json) {
    totalPresent = json['total_present'];
    totalLeave = json['total_leave'];
    totalAbsent = json['total_absent'];
    overallAttendance = json['overall_attendence'];
    if (json['month_wise_percentage'] != null) {
      monthWisePercentage = <MonthWisePercentage>[];
      json['month_wise_percentage'].forEach((v) {
        monthWisePercentage!.add(MonthWisePercentage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_present'] = totalPresent;
    data['total_leave'] = totalLeave;
    data['total_absent'] = totalAbsent;
    data['overall_attendence'] = overallAttendance;
    if (monthWisePercentage != null) {
      data['month_wise_percentage'] =
          monthWisePercentage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthWisePercentage {
  String? month;
  int? monthlyProgress;

  MonthWisePercentage({this.month, this.monthlyProgress});

  MonthWisePercentage.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    monthlyProgress = json['monthly_progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['monthly_progress'] = monthlyProgress;
    return data;
  }
}
