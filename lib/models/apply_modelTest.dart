class ApplyList {
  List<Applies>? applies;
  int? page;
  int? appliesCount;
  int? pages;

  ApplyList({this.applies, this.page, this.appliesCount, this.pages});

  ApplyList.fromJson(Map<String, dynamic> json) {
    if (json['applies'] != null) {
      applies = <Applies>[];
      json['applies'].forEach((v) {
        applies!.add(new Applies.fromJson(v));
      });
    }
    page = json['page'];
    appliesCount = json['appliesCount'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.applies != null) {
      data['applies'] = this.applies!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['appliesCount'] = this.appliesCount;
    data['pages'] = this.pages;
    return data;
  }
}

class Applies {
  String? sId;
  String? resume;
  Job? job;
  User? user;
  String? letter;
  String? diploma;
  String? age;
  String? experience;
  String? spokenLanguage;
  String? formations;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Applies(
      {this.sId,
      this.resume,
      this.job,
      this.user,
      this.letter,
      this.diploma,
      this.age,
      this.experience,
      this.spokenLanguage,
      this.formations,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  Applies.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    resume = json['resume'];
    job = json['job'] != null ? new Job.fromJson(json['job']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    letter = json['letter'];
    diploma = json['diploma'];
    age = json['age'];
    experience = json['experience'];
    spokenLanguage = json['spokenLanguage'];
    formations = json['formations'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['resume'] = this.resume;
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['letter'] = this.letter;
    data['diploma'] = this.diploma;
    data['age'] = this.age;
    data['experience'] = this.experience;
    data['spokenLanguage'] = this.spokenLanguage;
    data['formations'] = this.formations;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}

class Job {
  String? sId;
  String? title;
  String? image;
  String? email;
  String? companyName;
  bool? isActive;
  String? website;
  String? category;
  String? salary;
  String? location;
  String? jobNature;
  String? applicationDate;
  String? description;
  List<Null>? requiredKnowledge;
  List<Null>? experience;
  String? user;
  List<String>? applies;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Job(
      {this.sId,
      this.title,
      this.image,
      this.email,
      this.companyName,
      this.isActive,
      this.website,
      this.category,
      this.salary,
      this.location,
      this.jobNature,
      this.applicationDate,
      this.description,
      this.requiredKnowledge,
      this.experience,
      this.user,
      this.applies,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  Job.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    email = json['email'];
    companyName = json['companyName'];
    isActive = json['isActive'];
    website = json['website'];
    category = json['category'];
    salary = json['salary'];
    location = json['location'];
    jobNature = json['jobNature'];
    applicationDate = json['applicationDate'];
    description = json['description'];
    if (json['requiredKnowledge'] != null) {
      requiredKnowledge = <Null>[];
    
    }
    if (json['experience'] != null) {
      experience = <Null>[];
      
    }
    user = json['user'];
    applies = json['applies'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['email'] = this.email;
    data['companyName'] = this.companyName;
    data['isActive'] = this.isActive;
    data['website'] = this.website;
    data['category'] = this.category;
    data['salary'] = this.salary;
    data['location'] = this.location;
    data['jobNature'] = this.jobNature;
    data['applicationDate'] = this.applicationDate;
    data['description'] = this.description;
   
  
    data['user'] = this.user;
    data['applies'] = this.applies;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? image;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? address;
  String? phone;
  String? fcmToken;
  String? id;

  User(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.image,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.address,
      this.phone,
      this.fcmToken,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    address = json['address'];
    phone = json['phone'];
    fcmToken = json['FcmToken'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['FcmToken'] = this.fcmToken;
    data['id'] = this.id;
    return data;
  }
}