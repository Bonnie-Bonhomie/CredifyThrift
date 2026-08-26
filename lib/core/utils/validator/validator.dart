class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  static String? validateText(String? value, String? label) {
    if (value == null || value.isEmpty) {
      return 'Your $label cannot be empty';
    } else if (value.length < 3) {
      return "Your $label is too short";
    }
    return null; // Removed space restriction for full name
  }

  static String? validateAddress(String? value, String? label) {
    if (value == null || value.isEmpty) {
      return '$label cannot be empty';
    } else if (value.length < 10) {
      return "This address seems to be too short";
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9 ]{10,13})';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    else if (value.length < 11) {
      return 'Please enter valid mobile number';
    } else if (value.length > 11) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String? validateConfirmPassword(
      {String? value, required String firstPassword}) {
    if (value != null && value != firstPassword) {
      return "Password doesn't match!";
    } else {
      return null;
    }
  }

  static String? validateDate(String val){
    if(val.isEmpty){
      return 'Enter your date of birth';
    }
    return null;
  }

  static String? validateBVN(String value){
    final pattern = RegExp(r'^[1-9][0-9]{11}$');
    RegExp regExp = pattern;
    if(value.isEmpty){
      return 'Enter your BVN';
    }else if(!regExp.hasMatch(value)){
      return 'Enter valid BVN';
    }
    return null;
  }

  static String? validatePin(String value){
    String regPat = r'^[0-9]{4}';
    RegExp regExp = RegExp(regPat);
    if(value.isEmpty){
      return 'Enter your Pin';
    }else if(!regExp.hasMatch(value)){
      return 'Enter only 4 digits';
    }return null;

  }

  static String? validateNumber(String value) {

    if (value.isEmpty) {
      return 'Please enter mobile number';
    }else if(value.length != 13){
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
