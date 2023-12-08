
abstract class RegisterStates {}
class RegisterInitialState extends RegisterStates {}
class PasswordChangState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {}
class RegisterErrorState extends RegisterStates {
final String error;
RegisterErrorState(this.error);
}
class LogInSuccessState extends RegisterStates {}
class LogInErrorState extends RegisterStates {
final String error;
LogInErrorState(this.error);
}

class AddRoomSuccessState extends RegisterStates {}
class AddRoomErrorState extends RegisterStates {
final String error;
AddRoomErrorState(this.error);
}
class GetRoomSuccessState extends RegisterStates {}
class GetRoomErrorState extends RegisterStates {
final String error;
GetRoomErrorState(this.error);
}