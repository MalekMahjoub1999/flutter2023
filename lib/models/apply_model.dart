
    // resume:
    // jobId
    // user
    
    // letter: 
    // diploma: 
    // age: 
    // experience: 
    // spokenLanguage:
    // formations: 
    
class Apply {
  final String resume;
  final String jobId;
  final String letter;
  final String diploma;
  final String age;
  final String experience;
  final String spokenLanguage;
  final String formations;
 

  


  Apply({
    required this.jobId,
    required this.resume,
    required this.letter,
    required this.diploma,
    required this.age,
    required this.experience,
    required this.spokenLanguage,
    required this.formations,
   
  });

  factory Apply.fromJson(Map<String, dynamic> json) {
    return Apply(
      jobId: json['job']['_id'],
      resume: json['resume'],
      age: json['age'],
      letter: json['letter'],
      diploma: json['diploma'],
      spokenLanguage: json['spokenLanguage'],
      formations: json['formations'],
      experience: json['experience'],
     
    );
  }
}
