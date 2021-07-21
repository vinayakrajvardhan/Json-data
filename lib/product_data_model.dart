class PostModel {
  String firstName;
  String lastName;
  String dateOfBirth;
  String gender;
  String address;
  String state;
  String country;
  String pincode;

  PostModel(
      {this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.address,
      this.state,
      this.country,
      this.pincode});

  PostModel.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    dateOfBirth = json['DateOfBirth'];
    gender = json['Gender'];
    address = json['Address'];
    state = json['State'];
    country = json['Country'];
    pincode = json['Pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['DateOfBirth'] = this.dateOfBirth;
    data['Gender'] = this.gender;
    data['Address'] = this.address;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Pincode'] = this.pincode;
    return data;
  }
}