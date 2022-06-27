class LoginResponse {
  String? status;
  String? message;
  LoginData? data;

  LoginResponse({this.status, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
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

class LoginData {
  int? id;
  String? rollNo;
  String? status;
  String? isActive;
  String? campusId;
  String? classId;
  String? sectionId;
  String? sessionId;
  String? name;
  String? cnic;
  int? gender;
  int? martialStatus;
  String? mobile;
  String? dateOfBirth;
  String? religion;
  String? bloodGroup;
  String? nationality;
  String? city;
  String? address;
  String? fatherName;
  String? fatherCnic;
  String? fatherOccupation;
  String? fatherMobile;
  String? fatherMonthlyIncome;
  String? createdAt;
  String? updatedAt;
  String? scholarshipType;
  String? discountAmount;
  int? tutionFee;
  String? email;
  String? regNo;
  String? profilePhoto;
  String? dropout;
  String? accessToken;
  Campus? campus;
  Class? classData;
  Section? section;
  Session? session;

  LoginData({this.id, this.rollNo, this.status, this.isActive, this.campusId, this.classId, this.sectionId, this.sessionId, this.name, this.cnic, this.gender, this.martialStatus, this.mobile, this.dateOfBirth, this.religion, this.bloodGroup, this.nationality, this.city, this.address, this.fatherName, this.fatherCnic, this.fatherOccupation, this.fatherMobile, this.fatherMonthlyIncome, this.createdAt, this.updatedAt, this.scholarshipType, this.discountAmount, this.tutionFee, this.email, this.regNo, this.profilePhoto, this.dropout, this.accessToken, this.campus, this.classData, this.section, this.session});

  LoginData.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  rollNo = json['roll_no'];
  status = json['status'];
  isActive = json['is_active'];
  campusId = json['campus_id'];
  classId = json['class_id'];
  sectionId = json['section_id'];
  sessionId = json['session_id'];
  name = json['name'];
  cnic = json['cnic'];
  gender = json['gender'];
  martialStatus = json['martial_status'];
  mobile = json['mobile'];
  dateOfBirth = json['date_of_birth'];
  religion = json['religion'];
  bloodGroup = json['blood_group'];
  nationality = json['nationality'];
  city = json['city'];
  address = json['address'];
  fatherName = json['father_name'];
  fatherCnic = json['father_cnic'];
  fatherOccupation = json['father_occupation'];
  fatherMobile = json['father_mobile'];
  fatherMonthlyIncome = json['father_monthly_income'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  scholarshipType = json['scholarship_type'];
  discountAmount = json['discount_amount'];
  tutionFee = json['tution_fee'];
  email = json['email'];
  regNo = json['reg_no'];
  profilePhoto = json['profile_photo'];
  dropout = json['dropout'];
  accessToken = json['access_token'];
  campus = json['campus'] != null ? Campus.fromJson(json['campus']) : null;
  classData = json['class'] != null ? Class.fromJson(json['class']) : null;
  section = json['section'] != null ? Section.fromJson(json['section']) : null;
  session = json['session'] != null ? Session.fromJson(json['session']) : null;
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = id;
  data['roll_no'] = rollNo;
  data['status'] = status;
  data['is_active'] = isActive;
  data['campus_id'] = campusId;
  data['class_id'] = classId;
  data['section_id'] = sectionId;
  data['session_id'] = sessionId;
  data['name'] = name;
  data['cnic'] = cnic;
  data['gender'] = gender;
  data['martial_status'] = martialStatus;
  data['mobile'] = mobile;
  data['date_of_birth'] = dateOfBirth;
  data['religion'] = religion;
  data['blood_group'] = bloodGroup;
  data['nationality'] = nationality;
  data['city'] = city;
  data['address'] = address;
  data['father_name'] = fatherName;
  data['father_cnic'] = fatherCnic;
  data['father_occupation'] = fatherOccupation;
  data['father_mobile'] = fatherMobile;
  data['father_monthly_income'] = fatherMonthlyIncome;
  data['created_at'] = createdAt;
  data['updated_at'] = updatedAt;
  data['scholarship_type'] = scholarshipType;
  data['discount_amount'] = discountAmount;
  data['tution_fee'] = tutionFee;
  data['email'] = email;
  data['reg_no'] = regNo;
  data['profile_photo'] = profilePhoto;
  data['dropout'] = dropout;
  data['access_token'] = accessToken;
  if (campus != null) {
  data['campus'] = campus!.toJson();
  }
  if (classData != null) {
  data['class'] = classData!.toJson();
  }
  if (section != null) {
  data['section'] = section!.toJson();
  }
  if (session != null) {
  data['session'] = session!.toJson();
  }
  return data;
  }
}

class Campus {
  int? id;
  String? name;
  String? phone;
  String? website;
  String? bankName;
  String? bankAccountNo;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? password;
  String? startTime;
  String? endTime;
  String? breakTimeStart;
  String? breakTimeEnd;

  Campus({this.id, this.name, this.phone, this.website, this.bankName, this.bankAccountNo, this.createdAt, this.updatedAt, this.email, this.password, this.startTime, this.endTime, this.breakTimeStart, this.breakTimeEnd});

  Campus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    website = json['website'];
    bankName = json['bank_name'];
    bankAccountNo = json['bank_account_no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    email = json['email'];
    password = json['password'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    breakTimeStart = json['break_time_start'];
    breakTimeEnd = json['break_time_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['website'] = website;
    data['bank_name'] = bankName;
    data['bank_account_no'] = bankAccountNo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['email'] = email;
    data['password'] = password;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['break_time_start'] = breakTimeStart;
    data['break_time_end'] = breakTimeEnd;
    return data;
  }
}

class Class {
  int? id;
  String? campusId;
  String? name;
  List<String>? subjectId;
  String? createdAt;
  String? updatedAt;
  String? tutionFee;
  String? lastPart;
  String? active;
  String? dueDate;
  String? validity;
  String? dueDateFee;

  Class({this.id, this.campusId, this.name, this.subjectId, this.createdAt, this.updatedAt, this.tutionFee, this.lastPart, this.active, this.dueDate, this.validity, this.dueDateFee});

  Class.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    campusId = json['campus_id'];
    name = json['name'];
    subjectId = json['subject_id'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tutionFee = json['tution_fee'];
    lastPart = json['last_part'];
    active = json['active'];
    dueDate = json['due_date'];
    validity = json['validity'];
    dueDateFee = json['due_date_fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['campus_id'] = campusId;
    data['name'] = name;
    data['subject_id'] = subjectId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['tution_fee'] = tutionFee;
    data['last_part'] = lastPart;
    data['active'] = active;
    data['due_date'] = dueDate;
    data['validity'] = validity;
    data['due_date_fee'] = dueDateFee;
    return data;
  }
}

class Section {
  int? id;
  String? name;
  String? classId;
  String? campusId;
  String? createdAt;
  String? updatedAt;

  Section({this.id, this.name, this.classId, this.campusId, this.createdAt, this.updatedAt});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    classId = json['class_id'];
    campusId = json['campus_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['class_id'] = classId;
    data['campus_id'] = campusId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Session {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? campusId;
  String? active;

  Session({this.id, this.name, this.createdAt, this.updatedAt, this.campusId, this.active});

  Session.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    campusId = json['campus_id'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['campus_id'] = campusId;
    data['active'] = active;
    return data;
  }
}
