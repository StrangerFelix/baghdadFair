import 'package:baghdad_fair/features/homeBody/home/data/repository/homeRepo.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/manager/contactUs/contactUsEvents.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/manager/contactUs/contactUsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsBloc extends Bloc<ContactUsEvents,ContactUsStates> {
  final HomeRepository _homeRepository;
  ContactUsBloc(this._homeRepository) : super(ContactUsInitial()) {
    on<ContactUsEvents>((event,emit) async {
      if (event is SendEmailEvent) {
        emit(SendEmailLoading());
        var data = await _homeRepository.sendReport(
          name: event.name, 
          email: event.email,
          subject: event.subject, 
          message: event.message
        );
        data.fold(
          (failure) => emit(SendEmailFailure(failure.errorMessage)), 
          (success) => emit(SendEmailSuccess(success))
        );
      }
    });
  }
}