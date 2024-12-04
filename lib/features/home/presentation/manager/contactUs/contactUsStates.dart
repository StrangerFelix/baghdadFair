abstract class ContactUsStates {}
class ContactUsInitial extends ContactUsStates {}

class SendEmailLoading extends ContactUsStates {}
class SendEmailSuccess extends ContactUsStates {
  final String message;
  SendEmailSuccess (this.message);
}
class SendEmailFailure extends ContactUsStates {
  final String error;
  SendEmailFailure (this.error);
}