import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class EmailScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final _recipientController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _recipientController,
              decoration: InputDecoration(
                labelText: 'Recipient',
              ),
            ),
            TextFormField(
              controller: _subjectController,
              decoration: InputDecoration(
                labelText: 'Subject',
              ),
            ),
            TextFormField(
              controller: _bodyController,
              decoration: InputDecoration(
                labelText: 'Body',
              ),
              maxLines: null,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _sendEmail(),
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendEmail() async {
    final recipient = _recipientController.text;
    final subject = _subjectController.text;
    final body = _bodyController.text;

    final HttpsCallable sendEmail =
        FirebaseFunctions.instance.httpsCallable('sendEmail');

    try {
      final results = await sendEmail.call(<String, dynamic>{
        'recipient': recipient,
        'subject': subject,
        'body': body,
      });
      print('Email sent successfully: ${results.data}');
    } on FirebaseFunctionsException catch (e) {
      print('Error sending email: $e');
    } catch (e) {
      print('Unexpected error sending email: $e');
    }
  }
}
