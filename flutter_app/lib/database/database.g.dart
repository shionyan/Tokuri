// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _usersNumMeta =
      const VerificationMeta('usersNum');
  @override
  late final GeneratedColumn<int> usersNum = GeneratedColumn<int>(
      'users_num', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _periodMeta = const VerificationMeta('period');
  @override
  late final GeneratedColumn<int> period = GeneratedColumn<int>(
      'period', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [usersNum, studentId, password, year, period];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('users_num')) {
      context.handle(_usersNumMeta,
          usersNum.isAcceptableOrUnknown(data['users_num']!, _usersNumMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    }
    if (data.containsKey('period')) {
      context.handle(_periodMeta,
          period.isAcceptableOrUnknown(data['period']!, _periodMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {usersNum};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      usersNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}users_num'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id']),
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password']),
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year']),
      period: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int usersNum;
  final int? studentId;
  final String? password;
  final int? year;
  final int? period;
  const User(
      {required this.usersNum,
      this.studentId,
      this.password,
      this.year,
      this.period});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['users_num'] = Variable<int>(usersNum);
    if (!nullToAbsent || studentId != null) {
      map['student_id'] = Variable<int>(studentId);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || period != null) {
      map['period'] = Variable<int>(period);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      usersNum: Value(usersNum),
      studentId: studentId == null && nullToAbsent
          ? const Value.absent()
          : Value(studentId),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      period:
          period == null && nullToAbsent ? const Value.absent() : Value(period),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      usersNum: serializer.fromJson<int>(json['usersNum']),
      studentId: serializer.fromJson<int?>(json['studentId']),
      password: serializer.fromJson<String?>(json['password']),
      year: serializer.fromJson<int?>(json['year']),
      period: serializer.fromJson<int?>(json['period']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'usersNum': serializer.toJson<int>(usersNum),
      'studentId': serializer.toJson<int?>(studentId),
      'password': serializer.toJson<String?>(password),
      'year': serializer.toJson<int?>(year),
      'period': serializer.toJson<int?>(period),
    };
  }

  User copyWith(
          {int? usersNum,
          Value<int?> studentId = const Value.absent(),
          Value<String?> password = const Value.absent(),
          Value<int?> year = const Value.absent(),
          Value<int?> period = const Value.absent()}) =>
      User(
        usersNum: usersNum ?? this.usersNum,
        studentId: studentId.present ? studentId.value : this.studentId,
        password: password.present ? password.value : this.password,
        year: year.present ? year.value : this.year,
        period: period.present ? period.value : this.period,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      usersNum: data.usersNum.present ? data.usersNum.value : this.usersNum,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      password: data.password.present ? data.password.value : this.password,
      year: data.year.present ? data.year.value : this.year,
      period: data.period.present ? data.period.value : this.period,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('usersNum: $usersNum, ')
          ..write('studentId: $studentId, ')
          ..write('password: $password, ')
          ..write('year: $year, ')
          ..write('period: $period')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(usersNum, studentId, password, year, period);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.usersNum == this.usersNum &&
          other.studentId == this.studentId &&
          other.password == this.password &&
          other.year == this.year &&
          other.period == this.period);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> usersNum;
  final Value<int?> studentId;
  final Value<String?> password;
  final Value<int?> year;
  final Value<int?> period;
  const UsersCompanion({
    this.usersNum = const Value.absent(),
    this.studentId = const Value.absent(),
    this.password = const Value.absent(),
    this.year = const Value.absent(),
    this.period = const Value.absent(),
  });
  UsersCompanion.insert({
    this.usersNum = const Value.absent(),
    this.studentId = const Value.absent(),
    this.password = const Value.absent(),
    this.year = const Value.absent(),
    this.period = const Value.absent(),
  });
  static Insertable<User> custom({
    Expression<int>? usersNum,
    Expression<int>? studentId,
    Expression<String>? password,
    Expression<int>? year,
    Expression<int>? period,
  }) {
    return RawValuesInsertable({
      if (usersNum != null) 'users_num': usersNum,
      if (studentId != null) 'student_id': studentId,
      if (password != null) 'password': password,
      if (year != null) 'year': year,
      if (period != null) 'period': period,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? usersNum,
      Value<int?>? studentId,
      Value<String?>? password,
      Value<int?>? year,
      Value<int?>? period}) {
    return UsersCompanion(
      usersNum: usersNum ?? this.usersNum,
      studentId: studentId ?? this.studentId,
      password: password ?? this.password,
      year: year ?? this.year,
      period: period ?? this.period,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (usersNum.present) {
      map['users_num'] = Variable<int>(usersNum.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (period.present) {
      map['period'] = Variable<int>(period.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('usersNum: $usersNum, ')
          ..write('studentId: $studentId, ')
          ..write('password: $password, ')
          ..write('year: $year, ')
          ..write('period: $period')
          ..write(')'))
        .toString();
  }
}

class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _subjectsNumMeta =
      const VerificationMeta('subjectsNum');
  @override
  late final GeneratedColumn<int> subjectsNum = GeneratedColumn<int>(
      'subjects_num', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subject_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subjectNameMeta =
      const VerificationMeta('subjectName');
  @override
  late final GeneratedColumn<String> subjectName = GeneratedColumn<String>(
      'subject_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dayOfweekMeta =
      const VerificationMeta('dayOfweek');
  @override
  late final GeneratedColumn<int> dayOfweek = GeneratedColumn<int>(
      'day_ofweek', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _periodMeta = const VerificationMeta('period');
  @override
  late final GeneratedColumn<int> period = GeneratedColumn<int>(
      'period', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [subjectsNum, subjectId, subjectName, dayOfweek, period];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(Insertable<Subject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('subjects_num')) {
      context.handle(
          _subjectsNumMeta,
          subjectsNum.isAcceptableOrUnknown(
              data['subjects_num']!, _subjectsNumMeta));
    }
    if (data.containsKey('subject_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta));
    }
    if (data.containsKey('subject_name')) {
      context.handle(
          _subjectNameMeta,
          subjectName.isAcceptableOrUnknown(
              data['subject_name']!, _subjectNameMeta));
    }
    if (data.containsKey('day_ofweek')) {
      context.handle(_dayOfweekMeta,
          dayOfweek.isAcceptableOrUnknown(data['day_ofweek']!, _dayOfweekMeta));
    }
    if (data.containsKey('period')) {
      context.handle(_periodMeta,
          period.isAcceptableOrUnknown(data['period']!, _periodMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {subjectsNum};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      subjectsNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subjects_num'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id']),
      subjectName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_name']),
      dayOfweek: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day_ofweek']),
      period: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period']),
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final int subjectsNum;
  final int? subjectId;
  final String? subjectName;
  final int? dayOfweek;
  final int? period;
  const Subject(
      {required this.subjectsNum,
      this.subjectId,
      this.subjectName,
      this.dayOfweek,
      this.period});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['subjects_num'] = Variable<int>(subjectsNum);
    if (!nullToAbsent || subjectId != null) {
      map['subject_id'] = Variable<int>(subjectId);
    }
    if (!nullToAbsent || subjectName != null) {
      map['subject_name'] = Variable<String>(subjectName);
    }
    if (!nullToAbsent || dayOfweek != null) {
      map['day_ofweek'] = Variable<int>(dayOfweek);
    }
    if (!nullToAbsent || period != null) {
      map['period'] = Variable<int>(period);
    }
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      subjectsNum: Value(subjectsNum),
      subjectId: subjectId == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectId),
      subjectName: subjectName == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectName),
      dayOfweek: dayOfweek == null && nullToAbsent
          ? const Value.absent()
          : Value(dayOfweek),
      period:
          period == null && nullToAbsent ? const Value.absent() : Value(period),
    );
  }

  factory Subject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      subjectsNum: serializer.fromJson<int>(json['subjectsNum']),
      subjectId: serializer.fromJson<int?>(json['subjectId']),
      subjectName: serializer.fromJson<String?>(json['subjectName']),
      dayOfweek: serializer.fromJson<int?>(json['dayOfweek']),
      period: serializer.fromJson<int?>(json['period']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'subjectsNum': serializer.toJson<int>(subjectsNum),
      'subjectId': serializer.toJson<int?>(subjectId),
      'subjectName': serializer.toJson<String?>(subjectName),
      'dayOfweek': serializer.toJson<int?>(dayOfweek),
      'period': serializer.toJson<int?>(period),
    };
  }

  Subject copyWith(
          {int? subjectsNum,
          Value<int?> subjectId = const Value.absent(),
          Value<String?> subjectName = const Value.absent(),
          Value<int?> dayOfweek = const Value.absent(),
          Value<int?> period = const Value.absent()}) =>
      Subject(
        subjectsNum: subjectsNum ?? this.subjectsNum,
        subjectId: subjectId.present ? subjectId.value : this.subjectId,
        subjectName: subjectName.present ? subjectName.value : this.subjectName,
        dayOfweek: dayOfweek.present ? dayOfweek.value : this.dayOfweek,
        period: period.present ? period.value : this.period,
      );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      subjectsNum:
          data.subjectsNum.present ? data.subjectsNum.value : this.subjectsNum,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      subjectName:
          data.subjectName.present ? data.subjectName.value : this.subjectName,
      dayOfweek: data.dayOfweek.present ? data.dayOfweek.value : this.dayOfweek,
      period: data.period.present ? data.period.value : this.period,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('subjectsNum: $subjectsNum, ')
          ..write('subjectId: $subjectId, ')
          ..write('subjectName: $subjectName, ')
          ..write('dayOfweek: $dayOfweek, ')
          ..write('period: $period')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(subjectsNum, subjectId, subjectName, dayOfweek, period);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.subjectsNum == this.subjectsNum &&
          other.subjectId == this.subjectId &&
          other.subjectName == this.subjectName &&
          other.dayOfweek == this.dayOfweek &&
          other.period == this.period);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> subjectsNum;
  final Value<int?> subjectId;
  final Value<String?> subjectName;
  final Value<int?> dayOfweek;
  final Value<int?> period;
  const SubjectsCompanion({
    this.subjectsNum = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.subjectName = const Value.absent(),
    this.dayOfweek = const Value.absent(),
    this.period = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.subjectsNum = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.subjectName = const Value.absent(),
    this.dayOfweek = const Value.absent(),
    this.period = const Value.absent(),
  });
  static Insertable<Subject> custom({
    Expression<int>? subjectsNum,
    Expression<int>? subjectId,
    Expression<String>? subjectName,
    Expression<int>? dayOfweek,
    Expression<int>? period,
  }) {
    return RawValuesInsertable({
      if (subjectsNum != null) 'subjects_num': subjectsNum,
      if (subjectId != null) 'subject_id': subjectId,
      if (subjectName != null) 'subject_name': subjectName,
      if (dayOfweek != null) 'day_ofweek': dayOfweek,
      if (period != null) 'period': period,
    });
  }

  SubjectsCompanion copyWith(
      {Value<int>? subjectsNum,
      Value<int?>? subjectId,
      Value<String?>? subjectName,
      Value<int?>? dayOfweek,
      Value<int?>? period}) {
    return SubjectsCompanion(
      subjectsNum: subjectsNum ?? this.subjectsNum,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      dayOfweek: dayOfweek ?? this.dayOfweek,
      period: period ?? this.period,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (subjectsNum.present) {
      map['subjects_num'] = Variable<int>(subjectsNum.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (subjectName.present) {
      map['subject_name'] = Variable<String>(subjectName.value);
    }
    if (dayOfweek.present) {
      map['day_ofweek'] = Variable<int>(dayOfweek.value);
    }
    if (period.present) {
      map['period'] = Variable<int>(period.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('subjectsNum: $subjectsNum, ')
          ..write('subjectId: $subjectId, ')
          ..write('subjectName: $subjectName, ')
          ..write('dayOfweek: $dayOfweek, ')
          ..write('period: $period')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoriesNumMeta =
      const VerificationMeta('categoriesNum');
  @override
  late final GeneratedColumn<int> categoriesNum = GeneratedColumn<int>(
      'categories_num', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subject_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [categoriesNum, categoryName, subjectId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('categories_num')) {
      context.handle(
          _categoriesNumMeta,
          categoriesNum.isAcceptableOrUnknown(
              data['categories_num']!, _categoriesNumMeta));
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    }
    if (data.containsKey('subject_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoriesNum};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      categoriesNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}categories_num'])!,
      categoryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name']),
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int categoriesNum;
  final String? categoryName;
  final int? subjectId;
  const Category(
      {required this.categoriesNum, this.categoryName, this.subjectId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['categories_num'] = Variable<int>(categoriesNum);
    if (!nullToAbsent || categoryName != null) {
      map['category_name'] = Variable<String>(categoryName);
    }
    if (!nullToAbsent || subjectId != null) {
      map['subject_id'] = Variable<int>(subjectId);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      categoriesNum: Value(categoriesNum),
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
      subjectId: subjectId == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectId),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      categoriesNum: serializer.fromJson<int>(json['categoriesNum']),
      categoryName: serializer.fromJson<String?>(json['categoryName']),
      subjectId: serializer.fromJson<int?>(json['subjectId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoriesNum': serializer.toJson<int>(categoriesNum),
      'categoryName': serializer.toJson<String?>(categoryName),
      'subjectId': serializer.toJson<int?>(subjectId),
    };
  }

  Category copyWith(
          {int? categoriesNum,
          Value<String?> categoryName = const Value.absent(),
          Value<int?> subjectId = const Value.absent()}) =>
      Category(
        categoriesNum: categoriesNum ?? this.categoriesNum,
        categoryName:
            categoryName.present ? categoryName.value : this.categoryName,
        subjectId: subjectId.present ? subjectId.value : this.subjectId,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      categoriesNum: data.categoriesNum.present
          ? data.categoriesNum.value
          : this.categoriesNum,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('categoriesNum: $categoriesNum, ')
          ..write('categoryName: $categoryName, ')
          ..write('subjectId: $subjectId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(categoriesNum, categoryName, subjectId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.categoriesNum == this.categoriesNum &&
          other.categoryName == this.categoryName &&
          other.subjectId == this.subjectId);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> categoriesNum;
  final Value<String?> categoryName;
  final Value<int?> subjectId;
  const CategoriesCompanion({
    this.categoriesNum = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.subjectId = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.categoriesNum = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.subjectId = const Value.absent(),
  });
  static Insertable<Category> custom({
    Expression<int>? categoriesNum,
    Expression<String>? categoryName,
    Expression<int>? subjectId,
  }) {
    return RawValuesInsertable({
      if (categoriesNum != null) 'categories_num': categoriesNum,
      if (categoryName != null) 'category_name': categoryName,
      if (subjectId != null) 'subject_id': subjectId,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? categoriesNum,
      Value<String?>? categoryName,
      Value<int?>? subjectId}) {
    return CategoriesCompanion(
      categoriesNum: categoriesNum ?? this.categoriesNum,
      categoryName: categoryName ?? this.categoryName,
      subjectId: subjectId ?? this.subjectId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoriesNum.present) {
      map['categories_num'] = Variable<int>(categoriesNum.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('categoriesNum: $categoriesNum, ')
          ..write('categoryName: $categoryName, ')
          ..write('subjectId: $subjectId')
          ..write(')'))
        .toString();
  }
}

class $ContainersTable extends Containers
    with TableInfo<$ContainersTable, Container> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContainersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _containersNumMeta =
      const VerificationMeta('containersNum');
  @override
  late final GeneratedColumn<int> containersNum = GeneratedColumn<int>(
      'containers_num', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _containerIdMeta =
      const VerificationMeta('containerId');
  @override
  late final GeneratedColumn<String> containerId = GeneratedColumn<String>(
      'container_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subject_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _availableMeta =
      const VerificationMeta('available');
  @override
  late final GeneratedColumn<DateTime> available = GeneratedColumn<DateTime>(
      'available', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [containersNum, containerId, subjectId, title, available, categoryName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'containers';
  @override
  VerificationContext validateIntegrity(Insertable<Container> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('containers_num')) {
      context.handle(
          _containersNumMeta,
          containersNum.isAcceptableOrUnknown(
              data['containers_num']!, _containersNumMeta));
    }
    if (data.containsKey('container_id')) {
      context.handle(
          _containerIdMeta,
          containerId.isAcceptableOrUnknown(
              data['container_id']!, _containerIdMeta));
    }
    if (data.containsKey('subject_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('available')) {
      context.handle(_availableMeta,
          available.isAcceptableOrUnknown(data['available']!, _availableMeta));
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {containersNum};
  @override
  Container map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Container(
      containersNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}containers_num'])!,
      containerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}container_id']),
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      available: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}available']),
      categoryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name']),
    );
  }

  @override
  $ContainersTable createAlias(String alias) {
    return $ContainersTable(attachedDatabase, alias);
  }
}

class Container extends DataClass implements Insertable<Container> {
  final int containersNum;
  final String? containerId;
  final int? subjectId;
  final String? title;
  final DateTime? available;
  final String? categoryName;
  const Container(
      {required this.containersNum,
      this.containerId,
      this.subjectId,
      this.title,
      this.available,
      this.categoryName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['containers_num'] = Variable<int>(containersNum);
    if (!nullToAbsent || containerId != null) {
      map['container_id'] = Variable<String>(containerId);
    }
    if (!nullToAbsent || subjectId != null) {
      map['subject_id'] = Variable<int>(subjectId);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || available != null) {
      map['available'] = Variable<DateTime>(available);
    }
    if (!nullToAbsent || categoryName != null) {
      map['category_name'] = Variable<String>(categoryName);
    }
    return map;
  }

  ContainersCompanion toCompanion(bool nullToAbsent) {
    return ContainersCompanion(
      containersNum: Value(containersNum),
      containerId: containerId == null && nullToAbsent
          ? const Value.absent()
          : Value(containerId),
      subjectId: subjectId == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      available: available == null && nullToAbsent
          ? const Value.absent()
          : Value(available),
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
    );
  }

  factory Container.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Container(
      containersNum: serializer.fromJson<int>(json['containersNum']),
      containerId: serializer.fromJson<String?>(json['containerId']),
      subjectId: serializer.fromJson<int?>(json['subjectId']),
      title: serializer.fromJson<String?>(json['title']),
      available: serializer.fromJson<DateTime?>(json['available']),
      categoryName: serializer.fromJson<String?>(json['categoryName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'containersNum': serializer.toJson<int>(containersNum),
      'containerId': serializer.toJson<String?>(containerId),
      'subjectId': serializer.toJson<int?>(subjectId),
      'title': serializer.toJson<String?>(title),
      'available': serializer.toJson<DateTime?>(available),
      'categoryName': serializer.toJson<String?>(categoryName),
    };
  }

  Container copyWith(
          {int? containersNum,
          Value<String?> containerId = const Value.absent(),
          Value<int?> subjectId = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<DateTime?> available = const Value.absent(),
          Value<String?> categoryName = const Value.absent()}) =>
      Container(
        containersNum: containersNum ?? this.containersNum,
        containerId: containerId.present ? containerId.value : this.containerId,
        subjectId: subjectId.present ? subjectId.value : this.subjectId,
        title: title.present ? title.value : this.title,
        available: available.present ? available.value : this.available,
        categoryName:
            categoryName.present ? categoryName.value : this.categoryName,
      );
  Container copyWithCompanion(ContainersCompanion data) {
    return Container(
      containersNum: data.containersNum.present
          ? data.containersNum.value
          : this.containersNum,
      containerId:
          data.containerId.present ? data.containerId.value : this.containerId,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      title: data.title.present ? data.title.value : this.title,
      available: data.available.present ? data.available.value : this.available,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Container(')
          ..write('containersNum: $containersNum, ')
          ..write('containerId: $containerId, ')
          ..write('subjectId: $subjectId, ')
          ..write('title: $title, ')
          ..write('available: $available, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      containersNum, containerId, subjectId, title, available, categoryName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Container &&
          other.containersNum == this.containersNum &&
          other.containerId == this.containerId &&
          other.subjectId == this.subjectId &&
          other.title == this.title &&
          other.available == this.available &&
          other.categoryName == this.categoryName);
}

class ContainersCompanion extends UpdateCompanion<Container> {
  final Value<int> containersNum;
  final Value<String?> containerId;
  final Value<int?> subjectId;
  final Value<String?> title;
  final Value<DateTime?> available;
  final Value<String?> categoryName;
  const ContainersCompanion({
    this.containersNum = const Value.absent(),
    this.containerId = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.title = const Value.absent(),
    this.available = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  ContainersCompanion.insert({
    this.containersNum = const Value.absent(),
    this.containerId = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.title = const Value.absent(),
    this.available = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  static Insertable<Container> custom({
    Expression<int>? containersNum,
    Expression<String>? containerId,
    Expression<int>? subjectId,
    Expression<String>? title,
    Expression<DateTime>? available,
    Expression<String>? categoryName,
  }) {
    return RawValuesInsertable({
      if (containersNum != null) 'containers_num': containersNum,
      if (containerId != null) 'container_id': containerId,
      if (subjectId != null) 'subject_id': subjectId,
      if (title != null) 'title': title,
      if (available != null) 'available': available,
      if (categoryName != null) 'category_name': categoryName,
    });
  }

  ContainersCompanion copyWith(
      {Value<int>? containersNum,
      Value<String?>? containerId,
      Value<int?>? subjectId,
      Value<String?>? title,
      Value<DateTime?>? available,
      Value<String?>? categoryName}) {
    return ContainersCompanion(
      containersNum: containersNum ?? this.containersNum,
      containerId: containerId ?? this.containerId,
      subjectId: subjectId ?? this.subjectId,
      title: title ?? this.title,
      available: available ?? this.available,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (containersNum.present) {
      map['containers_num'] = Variable<int>(containersNum.value);
    }
    if (containerId.present) {
      map['container_id'] = Variable<String>(containerId.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (available.present) {
      map['available'] = Variable<DateTime>(available.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContainersCompanion(')
          ..write('containersNum: $containersNum, ')
          ..write('containerId: $containerId, ')
          ..write('subjectId: $subjectId, ')
          ..write('title: $title, ')
          ..write('available: $available, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }
}

class $ContentsTable extends Contents with TableInfo<$ContentsTable, Content> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _contentsNumMeta =
      const VerificationMeta('contentsNum');
  @override
  late final GeneratedColumn<int> contentsNum = GeneratedColumn<int>(
      'contents_num', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentIdMeta =
      const VerificationMeta('contentId');
  @override
  late final GeneratedColumn<String> contentId = GeneratedColumn<String>(
      'content_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _containerIdMeta =
      const VerificationMeta('containerId');
  @override
  late final GeneratedColumn<String> containerId = GeneratedColumn<String>(
      'container_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileMeta = const VerificationMeta('file');
  @override
  late final GeneratedColumn<String> file = GeneratedColumn<String>(
      'file', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [contentsNum, contentId, containerId, file, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contents';
  @override
  VerificationContext validateIntegrity(Insertable<Content> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('contents_num')) {
      context.handle(
          _contentsNumMeta,
          contentsNum.isAcceptableOrUnknown(
              data['contents_num']!, _contentsNumMeta));
    }
    if (data.containsKey('content_id')) {
      context.handle(_contentIdMeta,
          contentId.isAcceptableOrUnknown(data['content_id']!, _contentIdMeta));
    }
    if (data.containsKey('container_id')) {
      context.handle(
          _containerIdMeta,
          containerId.isAcceptableOrUnknown(
              data['container_id']!, _containerIdMeta));
    }
    if (data.containsKey('file')) {
      context.handle(
          _fileMeta, file.isAcceptableOrUnknown(data['file']!, _fileMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {contentsNum};
  @override
  Content map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Content(
      contentsNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}contents_num'])!,
      contentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_id']),
      containerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}container_id']),
      file: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file']),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
    );
  }

  @override
  $ContentsTable createAlias(String alias) {
    return $ContentsTable(attachedDatabase, alias);
  }
}

class Content extends DataClass implements Insertable<Content> {
  final int contentsNum;
  final String? contentId;
  final String? containerId;
  final String? file;
  final String? content;
  const Content(
      {required this.contentsNum,
      this.contentId,
      this.containerId,
      this.file,
      this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['contents_num'] = Variable<int>(contentsNum);
    if (!nullToAbsent || contentId != null) {
      map['content_id'] = Variable<String>(contentId);
    }
    if (!nullToAbsent || containerId != null) {
      map['container_id'] = Variable<String>(containerId);
    }
    if (!nullToAbsent || file != null) {
      map['file'] = Variable<String>(file);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    return map;
  }

  ContentsCompanion toCompanion(bool nullToAbsent) {
    return ContentsCompanion(
      contentsNum: Value(contentsNum),
      contentId: contentId == null && nullToAbsent
          ? const Value.absent()
          : Value(contentId),
      containerId: containerId == null && nullToAbsent
          ? const Value.absent()
          : Value(containerId),
      file: file == null && nullToAbsent ? const Value.absent() : Value(file),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
    );
  }

  factory Content.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Content(
      contentsNum: serializer.fromJson<int>(json['contentsNum']),
      contentId: serializer.fromJson<String?>(json['contentId']),
      containerId: serializer.fromJson<String?>(json['containerId']),
      file: serializer.fromJson<String?>(json['file']),
      content: serializer.fromJson<String?>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'contentsNum': serializer.toJson<int>(contentsNum),
      'contentId': serializer.toJson<String?>(contentId),
      'containerId': serializer.toJson<String?>(containerId),
      'file': serializer.toJson<String?>(file),
      'content': serializer.toJson<String?>(content),
    };
  }

  Content copyWith(
          {int? contentsNum,
          Value<String?> contentId = const Value.absent(),
          Value<String?> containerId = const Value.absent(),
          Value<String?> file = const Value.absent(),
          Value<String?> content = const Value.absent()}) =>
      Content(
        contentsNum: contentsNum ?? this.contentsNum,
        contentId: contentId.present ? contentId.value : this.contentId,
        containerId: containerId.present ? containerId.value : this.containerId,
        file: file.present ? file.value : this.file,
        content: content.present ? content.value : this.content,
      );
  Content copyWithCompanion(ContentsCompanion data) {
    return Content(
      contentsNum:
          data.contentsNum.present ? data.contentsNum.value : this.contentsNum,
      contentId: data.contentId.present ? data.contentId.value : this.contentId,
      containerId:
          data.containerId.present ? data.containerId.value : this.containerId,
      file: data.file.present ? data.file.value : this.file,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Content(')
          ..write('contentsNum: $contentsNum, ')
          ..write('contentId: $contentId, ')
          ..write('containerId: $containerId, ')
          ..write('file: $file, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(contentsNum, contentId, containerId, file, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Content &&
          other.contentsNum == this.contentsNum &&
          other.contentId == this.contentId &&
          other.containerId == this.containerId &&
          other.file == this.file &&
          other.content == this.content);
}

class ContentsCompanion extends UpdateCompanion<Content> {
  final Value<int> contentsNum;
  final Value<String?> contentId;
  final Value<String?> containerId;
  final Value<String?> file;
  final Value<String?> content;
  const ContentsCompanion({
    this.contentsNum = const Value.absent(),
    this.contentId = const Value.absent(),
    this.containerId = const Value.absent(),
    this.file = const Value.absent(),
    this.content = const Value.absent(),
  });
  ContentsCompanion.insert({
    this.contentsNum = const Value.absent(),
    this.contentId = const Value.absent(),
    this.containerId = const Value.absent(),
    this.file = const Value.absent(),
    this.content = const Value.absent(),
  });
  static Insertable<Content> custom({
    Expression<int>? contentsNum,
    Expression<String>? contentId,
    Expression<String>? containerId,
    Expression<String>? file,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (contentsNum != null) 'contents_num': contentsNum,
      if (contentId != null) 'content_id': contentId,
      if (containerId != null) 'container_id': containerId,
      if (file != null) 'file': file,
      if (content != null) 'content': content,
    });
  }

  ContentsCompanion copyWith(
      {Value<int>? contentsNum,
      Value<String?>? contentId,
      Value<String?>? containerId,
      Value<String?>? file,
      Value<String?>? content}) {
    return ContentsCompanion(
      contentsNum: contentsNum ?? this.contentsNum,
      contentId: contentId ?? this.contentId,
      containerId: containerId ?? this.containerId,
      file: file ?? this.file,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (contentsNum.present) {
      map['contents_num'] = Variable<int>(contentsNum.value);
    }
    if (contentId.present) {
      map['content_id'] = Variable<String>(contentId.value);
    }
    if (containerId.present) {
      map['container_id'] = Variable<String>(containerId.value);
    }
    if (file.present) {
      map['file'] = Variable<String>(file.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentsCompanion(')
          ..write('contentsNum: $contentsNum, ')
          ..write('contentId: $contentId, ')
          ..write('containerId: $containerId, ')
          ..write('file: $file, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ContainersTable containers = $ContainersTable(this);
  late final $ContentsTable contents = $ContentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, subjects, categories, containers, contents];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> usersNum,
  Value<int?> studentId,
  Value<String?> password,
  Value<int?> year,
  Value<int?> period,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> usersNum,
  Value<int?> studentId,
  Value<String?> password,
  Value<int?> year,
  Value<int?> period,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get usersNum => $composableBuilder(
      column: $table.usersNum, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get period => $composableBuilder(
      column: $table.period, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get usersNum => $composableBuilder(
      column: $table.usersNum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get period => $composableBuilder(
      column: $table.period, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get usersNum =>
      $composableBuilder(column: $table.usersNum, builder: (column) => column);

  GeneratedColumn<int> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get period =>
      $composableBuilder(column: $table.period, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> usersNum = const Value.absent(),
            Value<int?> studentId = const Value.absent(),
            Value<String?> password = const Value.absent(),
            Value<int?> year = const Value.absent(),
            Value<int?> period = const Value.absent(),
          }) =>
              UsersCompanion(
            usersNum: usersNum,
            studentId: studentId,
            password: password,
            year: year,
            period: period,
          ),
          createCompanionCallback: ({
            Value<int> usersNum = const Value.absent(),
            Value<int?> studentId = const Value.absent(),
            Value<String?> password = const Value.absent(),
            Value<int?> year = const Value.absent(),
            Value<int?> period = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            usersNum: usersNum,
            studentId: studentId,
            password: password,
            year: year,
            period: period,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$SubjectsTableCreateCompanionBuilder = SubjectsCompanion Function({
  Value<int> subjectsNum,
  Value<int?> subjectId,
  Value<String?> subjectName,
  Value<int?> dayOfweek,
  Value<int?> period,
});
typedef $$SubjectsTableUpdateCompanionBuilder = SubjectsCompanion Function({
  Value<int> subjectsNum,
  Value<int?> subjectId,
  Value<String?> subjectName,
  Value<int?> dayOfweek,
  Value<int?> period,
});

class $$SubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get subjectsNum => $composableBuilder(
      column: $table.subjectsNum, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subjectName => $composableBuilder(
      column: $table.subjectName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dayOfweek => $composableBuilder(
      column: $table.dayOfweek, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get period => $composableBuilder(
      column: $table.period, builder: (column) => ColumnFilters(column));
}

class $$SubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get subjectsNum => $composableBuilder(
      column: $table.subjectsNum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subjectName => $composableBuilder(
      column: $table.subjectName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dayOfweek => $composableBuilder(
      column: $table.dayOfweek, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get period => $composableBuilder(
      column: $table.period, builder: (column) => ColumnOrderings(column));
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get subjectsNum => $composableBuilder(
      column: $table.subjectsNum, builder: (column) => column);

  GeneratedColumn<int> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get subjectName => $composableBuilder(
      column: $table.subjectName, builder: (column) => column);

  GeneratedColumn<int> get dayOfweek =>
      $composableBuilder(column: $table.dayOfweek, builder: (column) => column);

  GeneratedColumn<int> get period =>
      $composableBuilder(column: $table.period, builder: (column) => column);
}

class $$SubjectsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubjectsTable,
    Subject,
    $$SubjectsTableFilterComposer,
    $$SubjectsTableOrderingComposer,
    $$SubjectsTableAnnotationComposer,
    $$SubjectsTableCreateCompanionBuilder,
    $$SubjectsTableUpdateCompanionBuilder,
    (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
    Subject,
    PrefetchHooks Function()> {
  $$SubjectsTableTableManager(_$AppDatabase db, $SubjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> subjectsNum = const Value.absent(),
            Value<int?> subjectId = const Value.absent(),
            Value<String?> subjectName = const Value.absent(),
            Value<int?> dayOfweek = const Value.absent(),
            Value<int?> period = const Value.absent(),
          }) =>
              SubjectsCompanion(
            subjectsNum: subjectsNum,
            subjectId: subjectId,
            subjectName: subjectName,
            dayOfweek: dayOfweek,
            period: period,
          ),
          createCompanionCallback: ({
            Value<int> subjectsNum = const Value.absent(),
            Value<int?> subjectId = const Value.absent(),
            Value<String?> subjectName = const Value.absent(),
            Value<int?> dayOfweek = const Value.absent(),
            Value<int?> period = const Value.absent(),
          }) =>
              SubjectsCompanion.insert(
            subjectsNum: subjectsNum,
            subjectId: subjectId,
            subjectName: subjectName,
            dayOfweek: dayOfweek,
            period: period,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubjectsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubjectsTable,
    Subject,
    $$SubjectsTableFilterComposer,
    $$SubjectsTableOrderingComposer,
    $$SubjectsTableAnnotationComposer,
    $$SubjectsTableCreateCompanionBuilder,
    $$SubjectsTableUpdateCompanionBuilder,
    (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
    Subject,
    PrefetchHooks Function()>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> categoriesNum,
  Value<String?> categoryName,
  Value<int?> subjectId,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> categoriesNum,
  Value<String?> categoryName,
  Value<int?> subjectId,
});

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get categoriesNum => $composableBuilder(
      column: $table.categoriesNum, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryName => $composableBuilder(
      column: $table.categoryName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnFilters(column));
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get categoriesNum => $composableBuilder(
      column: $table.categoriesNum,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryName => $composableBuilder(
      column: $table.categoryName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get categoriesNum => $composableBuilder(
      column: $table.categoriesNum, builder: (column) => column);

  GeneratedColumn<String> get categoryName => $composableBuilder(
      column: $table.categoryName, builder: (column) => column);

  GeneratedColumn<int> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> categoriesNum = const Value.absent(),
            Value<String?> categoryName = const Value.absent(),
            Value<int?> subjectId = const Value.absent(),
          }) =>
              CategoriesCompanion(
            categoriesNum: categoriesNum,
            categoryName: categoryName,
            subjectId: subjectId,
          ),
          createCompanionCallback: ({
            Value<int> categoriesNum = const Value.absent(),
            Value<String?> categoryName = const Value.absent(),
            Value<int?> subjectId = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            categoriesNum: categoriesNum,
            categoryName: categoryName,
            subjectId: subjectId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()>;
typedef $$ContainersTableCreateCompanionBuilder = ContainersCompanion Function({
  Value<int> containersNum,
  Value<String?> containerId,
  Value<int?> subjectId,
  Value<String?> title,
  Value<DateTime?> available,
  Value<String?> categoryName,
});
typedef $$ContainersTableUpdateCompanionBuilder = ContainersCompanion Function({
  Value<int> containersNum,
  Value<String?> containerId,
  Value<int?> subjectId,
  Value<String?> title,
  Value<DateTime?> available,
  Value<String?> categoryName,
});

class $$ContainersTableFilterComposer
    extends Composer<_$AppDatabase, $ContainersTable> {
  $$ContainersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get containersNum => $composableBuilder(
      column: $table.containersNum, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get containerId => $composableBuilder(
      column: $table.containerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get available => $composableBuilder(
      column: $table.available, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryName => $composableBuilder(
      column: $table.categoryName, builder: (column) => ColumnFilters(column));
}

class $$ContainersTableOrderingComposer
    extends Composer<_$AppDatabase, $ContainersTable> {
  $$ContainersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get containersNum => $composableBuilder(
      column: $table.containersNum,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get containerId => $composableBuilder(
      column: $table.containerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get available => $composableBuilder(
      column: $table.available, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryName => $composableBuilder(
      column: $table.categoryName,
      builder: (column) => ColumnOrderings(column));
}

class $$ContainersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContainersTable> {
  $$ContainersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get containersNum => $composableBuilder(
      column: $table.containersNum, builder: (column) => column);

  GeneratedColumn<String> get containerId => $composableBuilder(
      column: $table.containerId, builder: (column) => column);

  GeneratedColumn<int> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get available =>
      $composableBuilder(column: $table.available, builder: (column) => column);

  GeneratedColumn<String> get categoryName => $composableBuilder(
      column: $table.categoryName, builder: (column) => column);
}

class $$ContainersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContainersTable,
    Container,
    $$ContainersTableFilterComposer,
    $$ContainersTableOrderingComposer,
    $$ContainersTableAnnotationComposer,
    $$ContainersTableCreateCompanionBuilder,
    $$ContainersTableUpdateCompanionBuilder,
    (Container, BaseReferences<_$AppDatabase, $ContainersTable, Container>),
    Container,
    PrefetchHooks Function()> {
  $$ContainersTableTableManager(_$AppDatabase db, $ContainersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContainersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContainersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContainersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> containersNum = const Value.absent(),
            Value<String?> containerId = const Value.absent(),
            Value<int?> subjectId = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<DateTime?> available = const Value.absent(),
            Value<String?> categoryName = const Value.absent(),
          }) =>
              ContainersCompanion(
            containersNum: containersNum,
            containerId: containerId,
            subjectId: subjectId,
            title: title,
            available: available,
            categoryName: categoryName,
          ),
          createCompanionCallback: ({
            Value<int> containersNum = const Value.absent(),
            Value<String?> containerId = const Value.absent(),
            Value<int?> subjectId = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<DateTime?> available = const Value.absent(),
            Value<String?> categoryName = const Value.absent(),
          }) =>
              ContainersCompanion.insert(
            containersNum: containersNum,
            containerId: containerId,
            subjectId: subjectId,
            title: title,
            available: available,
            categoryName: categoryName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ContainersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContainersTable,
    Container,
    $$ContainersTableFilterComposer,
    $$ContainersTableOrderingComposer,
    $$ContainersTableAnnotationComposer,
    $$ContainersTableCreateCompanionBuilder,
    $$ContainersTableUpdateCompanionBuilder,
    (Container, BaseReferences<_$AppDatabase, $ContainersTable, Container>),
    Container,
    PrefetchHooks Function()>;
typedef $$ContentsTableCreateCompanionBuilder = ContentsCompanion Function({
  Value<int> contentsNum,
  Value<String?> contentId,
  Value<String?> containerId,
  Value<String?> file,
  Value<String?> content,
});
typedef $$ContentsTableUpdateCompanionBuilder = ContentsCompanion Function({
  Value<int> contentsNum,
  Value<String?> contentId,
  Value<String?> containerId,
  Value<String?> file,
  Value<String?> content,
});

class $$ContentsTableFilterComposer
    extends Composer<_$AppDatabase, $ContentsTable> {
  $$ContentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get contentsNum => $composableBuilder(
      column: $table.contentsNum, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contentId => $composableBuilder(
      column: $table.contentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get containerId => $composableBuilder(
      column: $table.containerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get file => $composableBuilder(
      column: $table.file, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));
}

class $$ContentsTableOrderingComposer
    extends Composer<_$AppDatabase, $ContentsTable> {
  $$ContentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get contentsNum => $composableBuilder(
      column: $table.contentsNum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contentId => $composableBuilder(
      column: $table.contentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get containerId => $composableBuilder(
      column: $table.containerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get file => $composableBuilder(
      column: $table.file, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));
}

class $$ContentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContentsTable> {
  $$ContentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get contentsNum => $composableBuilder(
      column: $table.contentsNum, builder: (column) => column);

  GeneratedColumn<String> get contentId =>
      $composableBuilder(column: $table.contentId, builder: (column) => column);

  GeneratedColumn<String> get containerId => $composableBuilder(
      column: $table.containerId, builder: (column) => column);

  GeneratedColumn<String> get file =>
      $composableBuilder(column: $table.file, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $$ContentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContentsTable,
    Content,
    $$ContentsTableFilterComposer,
    $$ContentsTableOrderingComposer,
    $$ContentsTableAnnotationComposer,
    $$ContentsTableCreateCompanionBuilder,
    $$ContentsTableUpdateCompanionBuilder,
    (Content, BaseReferences<_$AppDatabase, $ContentsTable, Content>),
    Content,
    PrefetchHooks Function()> {
  $$ContentsTableTableManager(_$AppDatabase db, $ContentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> contentsNum = const Value.absent(),
            Value<String?> contentId = const Value.absent(),
            Value<String?> containerId = const Value.absent(),
            Value<String?> file = const Value.absent(),
            Value<String?> content = const Value.absent(),
          }) =>
              ContentsCompanion(
            contentsNum: contentsNum,
            contentId: contentId,
            containerId: containerId,
            file: file,
            content: content,
          ),
          createCompanionCallback: ({
            Value<int> contentsNum = const Value.absent(),
            Value<String?> contentId = const Value.absent(),
            Value<String?> containerId = const Value.absent(),
            Value<String?> file = const Value.absent(),
            Value<String?> content = const Value.absent(),
          }) =>
              ContentsCompanion.insert(
            contentsNum: contentsNum,
            contentId: contentId,
            containerId: containerId,
            file: file,
            content: content,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ContentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContentsTable,
    Content,
    $$ContentsTableFilterComposer,
    $$ContentsTableOrderingComposer,
    $$ContentsTableAnnotationComposer,
    $$ContentsTableCreateCompanionBuilder,
    $$ContentsTableUpdateCompanionBuilder,
    (Content, BaseReferences<_$AppDatabase, $ContentsTable, Content>),
    Content,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ContainersTableTableManager get containers =>
      $$ContainersTableTableManager(_db, _db.containers);
  $$ContentsTableTableManager get contents =>
      $$ContentsTableTableManager(_db, _db.contents);
}
