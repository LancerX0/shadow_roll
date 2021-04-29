class GlobalVariables {

  static final GlobalVariables _instance = GlobalVariables._internal();

  // passes the instantiation to the _instance object
  factory GlobalVariables() => _instance;

  //initialize variables in here
  GlobalVariables._internal() {
  }

  bool _houseRuleCountGlitch = false;

  //short getter for my variable
  bool get getHouseRuleCountGlitch => _houseRuleCountGlitch;

  //short setter for my variable
  set setHouseRuleCountGlitch(bool value) => _houseRuleCountGlitch = value;

  
}
