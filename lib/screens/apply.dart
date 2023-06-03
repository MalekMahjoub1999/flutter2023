import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:erecrutement/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplyPage extends StatefulWidget {
  final String jobId;

  ApplyPage({required this.jobId, required this.context});
  final BuildContext context;

  @override
  _ApplyPageState createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String coverLetter;
  TextEditingController coverController = TextEditingController();
  File? resumeFile;
  bool isUploading = false;

  Future<void> applyApi() async {
    final prefs = await SharedPreferences.getInstance();
      final token =  prefs.getString('token');

var headers = {
  'Authorization': 'Bearer $token',
  
  
};
var request = http.MultipartRequest('POST', Uri.parse(Constants.apiUrl+'/api/apply'));

request.fields['jobId'] = widget.jobId;
    request.fields['formations'] = "flutter";
    request.fields['experience'] = "mobile";
    request.fields['userId'] = "64791bbd34437e8516b3a21d";
    request.fields['age'] = "28";
    request.fields['spokenLanguage'] = "23frfr";
    request.fields['letter'] = coverController.text;
    request.fields['diploma'] = "gggggggg";
    request.headers['Content-Type'] = 'multipart/form-data';
     request.headers['Authorization'] = 'Bearer $token';
request.files.add(await http.MultipartFile.fromPath('file', resumeFile!.path,));
//request.headers.addAll(headers);


http.StreamedResponse response = await request.send();
print(response.statusCode);
if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
  }

  Future<void> _applyJob(BuildContext context) async {
   
    if (true) {
      //_formKey.currentState!.save();

      setState(() {
        isUploading = true;
      });

      try {
        // Upload the resume file
        String resumeUrl = '';
        if (resumeFile != null) {
          print("beforeupload");
          FormData formData = FormData.fromMap({
            // 'file': await MultipartFile.fromFile(
            //   resumeFile!.path,
            //   filename: basename(resumeFile!.path),
            // ),'job': widget.jobId,
          'letter': coverLetter,
          
          'formations':'IA',
          'experience':'java',
  'spokenLanguage':'francais',
  'diploma':'systéme informatique',

'age':'23'
          });

         print(formData.fields);
        final filemap = MapEntry('file', await MultipartFile.fromFile(
              resumeFile!.path,
              filename: basename(resumeFile!.path),
            ));
         formData.files.add(filemap);

          final response = await Dio().post(
            Constants.apiUrl + '/api/apply',
            data: formData,
          );
          

           if (response.statusCode == 200) {
          Navigator.push(
            widget.context,
            MaterialPageRoute(
              builder: (context) => ApplySuccessPage(),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Application submitted successfully'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          
          throw Exception('Failed to submit application');
        }
        }

        // Send the application details to the API
        final applicationData = {
          'job': widget.jobId,
          'letter': coverLetter,
          
          'formations':'IA',
          'experience':'java',
  'spokenLanguage':'francais',
  'diploma':'systéme informatique',

'age':'23'
          };

        // final response = await Dio().post(
        //   Constants.apiUrl + '/api/apply',
        //   data: applicationData,
        // );

       
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit application'),
            duration: Duration(seconds: 2),
          ),
        );
      } finally {
        setState(() {
          isUploading = false;
        });
      }
    }
  }

  Future<void> pickPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;
      if (file.extension == 'pdf') {
        File pickedFile = File(file.path!);
        resumeFile = pickedFile;
      }
    }

   // return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply'),
        backgroundColor: const Color(0xFF21899C),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Job ID: ${widget.jobId}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: coverController,
                  decoration: InputDecoration(
                    labelText: 'Cover Letter',
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a cover letter';
                    }
                    return null;
                  },
                  
                ),
                SizedBox(height: 16.0),
                Text('Resume'),
                resumeFile != null
                    ? Text(basename(resumeFile!.path))
                    : Container(),
                ElevatedButton(
                  onPressed: () => pickPdfFile(),
                  child: Text('Select Resume'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF21899C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                isUploading
                    ? CircularProgressIndicator()
                    : Center(
                        child: ElevatedButton(
                          onPressed: () => applyApi(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF21899C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text('Submit Application'),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ApplySuccessPage extends StatelessWidget {
  const ApplySuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Success"),
      ),
    );
  }
}
