// Simple c;ass for user data.
class User {
  int id;
  String name;
  String email;
  String passward;
  List<String> _favorite_folder = new List<String>();
  var _favorite = new Map();

  User(this.id, this.name, this.email, this.passward);

  get favorite => _favorite;
  get favorite_folder => _favorite_folder;
}

class Users {
  static Users instance;
  List<User> _listUser = new List<User>();
  List<User> get listUser => _listUser;

  static Users getInstance() {
    if (instance == null) {
      instance = new Users();
    }
    return instance;
  }

  static void setInstance(Users newInstance) {
    instance = newInstance;
  }

  Users() {
    setInstance(this);
    addUser();
  }

  void addUser() {
    listUser.add(new User(0, "測試一", "test@gmail.com", "123"));
  }
}