class User {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;

  User(this.id, this.username, this.email, this.firstName, this.lastName);

  User.fromJson(Map json) {
    this.id = json['pk'];
    this.email = json['email'];
    this.username = json['username'];
    this.firstName = json['first_name'];
    this.lastName = json['last_name'];
  }
}