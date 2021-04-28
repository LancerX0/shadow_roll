class GlobalVariables {

  static final GlobalVariables _instance = GlobalVariables._internal();

  // passes the instantiation to the _instance object
  factory GlobalVariables() => _instance;

  //initialize variables in here
  GlobalVariables._internal() {
    _myVariable = 0;
  }

  int _myVariable = 0;

  //short getter for my variable
  int get myVariable => _myVariable;

  //short setter for my variable
  set myVariable(int value) => myVariable = value;

  void incrementMyVariable() => _myVariable++;
}
