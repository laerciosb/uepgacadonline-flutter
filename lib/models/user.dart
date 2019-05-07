import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class User {

  User(this.academicRegister, this.address, this.addressNumber, this.agente,
      this.birthCity, this.birthCountry, this.birthDate, this.birthState,
      this.birthCategory, this.cep, this.city, this.complement,
      this.completeName, this.course, this.cpf, this.date, this.degree,
      this.documentAgent, this.documentState, this.electionTitleNumber,
      this.electionTitleZone, this.email, this.fatherName, this.firstName,
      this.genre, this.institution, this.institutionCountry,
      this.institutionState, this.institutionCity, this.lattes, this.motherName,
      this.nacionality, this.neighborhood, this.number, this.rg,
      this.socialName, this.state, this.telephone, this.type, this.year);

  @JsonKey(name: 'academic_register') String academicRegister;
  @JsonKey(name: 'address') String address;
  @JsonKey(name: 'address_number') String addressNumber;
  @JsonKey(name: 'agente') String agente;
  @JsonKey(name: 'birth_city') String birthCity;
  @JsonKey(name: 'birth_country') String birthCountry;
  @JsonKey(name: 'birth_date') String birthDate;
  @JsonKey(name: 'birth_state') String birthState;
  @JsonKey(name: 'birth_category') String birthCategory;
  @JsonKey(name: 'cep') String cep;
  @JsonKey(name: 'city') String city;
  @JsonKey(name: 'complement') String complement;
  @JsonKey(name: 'complete_name') String completeName;
  @JsonKey(name: 'course') String course;
  @JsonKey(name: 'cpf') String cpf;
  @JsonKey(name: 'date') String date;
  @JsonKey(name: 'degree') int degree;
  @JsonKey(name: 'document_agent') String documentAgent;
  @JsonKey(name: 'document_state') String documentState;
  @JsonKey(name: 'election_title_number') String electionTitleNumber;
  @JsonKey(name: 'election_title_zone') String electionTitleZone;
  @JsonKey(name: 'email') String email;
  @JsonKey(name: 'father_name') String fatherName;
  @JsonKey(name: 'first_name') String firstName;
  @JsonKey(name: 'genre') String genre;
  @JsonKey(name: 'institution') String institution;
  @JsonKey(name: 'institution_country') String institutionCountry;
  @JsonKey(name: 'institution_state') String institutionState;
  @JsonKey(name: 'institution_city') String institutionCity;
  @JsonKey(name: 'lattes') String lattes;
  @JsonKey(name: 'mother_name') String motherName;
  @JsonKey(name: 'nacionality') String nacionality;
  @JsonKey(name: 'neighborhood') String neighborhood;
  @JsonKey(name: 'number') String number;
  @JsonKey(name: 'rg') String rg;
  @JsonKey(name: 'social_name') String socialName;
  @JsonKey(name: 'state') String state;
  @JsonKey(name: 'telephone') String telephone;
  @JsonKey(name: 'type') String type;
  @JsonKey(name: 'year') int year;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}