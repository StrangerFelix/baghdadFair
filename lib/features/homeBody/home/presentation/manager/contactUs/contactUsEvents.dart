abstract class ContactUsEvents {}

class SendEmailEvent extends ContactUsEvents {
  final String name;
  final String email;
  final String subject;
  final String message;
  SendEmailEvent({required this.name,required this.email,required this.subject,required this.message});
}