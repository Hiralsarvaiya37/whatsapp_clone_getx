class LoginState {
  final bool isLoading;

  LoginState ({this.isLoading= false});
  LoginState copywith({bool? isLoading}){
    return LoginState(isLoading: isLoading?? this.isLoading);
  }
}