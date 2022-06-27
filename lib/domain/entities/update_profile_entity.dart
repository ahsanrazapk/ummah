class UpdateProfileEntity {
  String? name;
  String? cnic;
  int? gender;
  String? martialStatus;
  String? dateOfBirth;
  String? religion;
  String? bloodGroup;
  String? nationality;
  String? city;
  String? address;
  String? fatherName;
  String? fatherCnic;
  String? fatherOccupation;

  UpdateProfileEntity(
      {this.name,
        this.cnic,
        this.gender,
        this.martialStatus,
        this.dateOfBirth,
        this.religion,
        this.bloodGroup,
        this.nationality,
        this.city,
        this.address,
        this.fatherName,
        this.fatherCnic,
        this.fatherOccupation});

  UpdateProfileEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cnic = json['cnic'];
    gender = json['gender'];
    martialStatus = json['martial_status'];
    dateOfBirth = json['date_of_birth'];
    religion = json['religion'];
    bloodGroup = json['blood_group'];
    nationality = json['nationality'];
    city = json['city'];
    address = json['address'];
    fatherName = json['father_name'];
    fatherCnic = json['father_cnic'];
    fatherOccupation = json['father_occupation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['cnic'] = this.cnic;
    data['gender'] = this.gender;
    data['martial_status'] = this.martialStatus;
    data['date_of_birth'] = this.dateOfBirth;
    data['religion'] = this.religion;
    data['blood_group'] = this.bloodGroup;
    data['nationality'] = this.nationality;
    data['city'] = this.city;
    data['address'] = this.address;
    data['father_name'] = this.fatherName;
    data['father_cnic'] = this.fatherCnic;
    data['father_occupation'] = this.fatherOccupation;
    return data;
  }
}
