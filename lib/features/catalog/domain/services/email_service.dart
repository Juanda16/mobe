import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  static Future<void> sendEmail({
    required String name,
    required String phoneNumber,
    required String email,
  }) async {
    const String username = 'mobeapp.contact@gmail.com';
    const String password = 'foaogrbdaqlcwlas';
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username)
      ..recipients.add('mobeapp.contact@gmail.com') // Replace with the recipient email address
      ..subject = 'Contact Form Submission'
      ..text = '''
      Name: $name
      Phone Number: $phoneNumber
      Email: $email
      ''';

    try {
      await send(message, smtpServer);
    } catch (e) {
      // Handle the email sending failure
      throw Exception('Failed to send email.');
    }
  }
}
