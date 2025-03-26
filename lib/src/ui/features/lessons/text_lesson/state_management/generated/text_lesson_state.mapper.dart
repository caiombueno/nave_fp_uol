// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of '../text_lesson_state.dart';

class TextLessonStateMapper extends ClassMapperBase<TextLessonState> {
  TextLessonStateMapper._();

  static TextLessonStateMapper? _instance;
  static TextLessonStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextLessonStateMapper._());
      TextLessonLoadingMapper.ensureInitialized();
      TextLessonLoadedMapper.ensureInitialized();
      TextLessonFailedMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TextLessonState';

  @override
  final MappableFields<TextLessonState> fields = const {};

  static TextLessonState _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'TextLessonState', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static TextLessonState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextLessonState>(map);
  }

  static TextLessonState fromJson(String json) {
    return ensureInitialized().decodeJson<TextLessonState>(json);
  }
}

mixin TextLessonStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  TextLessonStateCopyWith<TextLessonState, TextLessonState, TextLessonState>
      get copyWith;
}

abstract class TextLessonStateCopyWith<$R, $In extends TextLessonState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  TextLessonStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class TextLessonLoadingMapper extends SubClassMapperBase<TextLessonLoading> {
  TextLessonLoadingMapper._();

  static TextLessonLoadingMapper? _instance;
  static TextLessonLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextLessonLoadingMapper._());
      TextLessonStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TextLessonLoading';

  @override
  final MappableFields<TextLessonLoading> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TextLessonLoading';
  @override
  late final ClassMapperBase superMapper =
      TextLessonStateMapper.ensureInitialized();

  static TextLessonLoading _instantiate(DecodingData data) {
    return TextLessonLoading();
  }

  @override
  final Function instantiate = _instantiate;

  static TextLessonLoading fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextLessonLoading>(map);
  }

  static TextLessonLoading fromJson(String json) {
    return ensureInitialized().decodeJson<TextLessonLoading>(json);
  }
}

mixin TextLessonLoadingMappable {
  String toJson() {
    return TextLessonLoadingMapper.ensureInitialized()
        .encodeJson<TextLessonLoading>(this as TextLessonLoading);
  }

  Map<String, dynamic> toMap() {
    return TextLessonLoadingMapper.ensureInitialized()
        .encodeMap<TextLessonLoading>(this as TextLessonLoading);
  }

  TextLessonLoadingCopyWith<TextLessonLoading, TextLessonLoading,
          TextLessonLoading>
      get copyWith => _TextLessonLoadingCopyWithImpl(
          this as TextLessonLoading, $identity, $identity);
  @override
  String toString() {
    return TextLessonLoadingMapper.ensureInitialized()
        .stringifyValue(this as TextLessonLoading);
  }

  @override
  bool operator ==(Object other) {
    return TextLessonLoadingMapper.ensureInitialized()
        .equalsValue(this as TextLessonLoading, other);
  }

  @override
  int get hashCode {
    return TextLessonLoadingMapper.ensureInitialized()
        .hashValue(this as TextLessonLoading);
  }
}

extension TextLessonLoadingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextLessonLoading, $Out> {
  TextLessonLoadingCopyWith<$R, TextLessonLoading, $Out>
      get $asTextLessonLoading =>
          $base.as((v, t, t2) => _TextLessonLoadingCopyWithImpl(v, t, t2));
}

abstract class TextLessonLoadingCopyWith<$R, $In extends TextLessonLoading,
    $Out> implements TextLessonStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  TextLessonLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TextLessonLoadingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextLessonLoading, $Out>
    implements TextLessonLoadingCopyWith<$R, TextLessonLoading, $Out> {
  _TextLessonLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextLessonLoading> $mapper =
      TextLessonLoadingMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  TextLessonLoading $make(CopyWithData data) => TextLessonLoading();

  @override
  TextLessonLoadingCopyWith<$R2, TextLessonLoading, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextLessonLoadingCopyWithImpl($value, $cast, t);
}

class TextLessonLoadedMapper extends SubClassMapperBase<TextLessonLoaded> {
  TextLessonLoadedMapper._();

  static TextLessonLoadedMapper? _instance;
  static TextLessonLoadedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextLessonLoadedMapper._());
      TextLessonStateMapper.ensureInitialized().addSubMapper(_instance!);
      TextLessonVMMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TextLessonLoaded';

  static TextLessonVM _$lesson(TextLessonLoaded v) => v.lesson;
  static const Field<TextLessonLoaded, TextLessonVM> _f$lesson =
      Field('lesson', _$lesson);

  @override
  final MappableFields<TextLessonLoaded> fields = const {
    #lesson: _f$lesson,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TextLessonLoaded';
  @override
  late final ClassMapperBase superMapper =
      TextLessonStateMapper.ensureInitialized();

  static TextLessonLoaded _instantiate(DecodingData data) {
    return TextLessonLoaded(lesson: data.dec(_f$lesson));
  }

  @override
  final Function instantiate = _instantiate;

  static TextLessonLoaded fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextLessonLoaded>(map);
  }

  static TextLessonLoaded fromJson(String json) {
    return ensureInitialized().decodeJson<TextLessonLoaded>(json);
  }
}

mixin TextLessonLoadedMappable {
  String toJson() {
    return TextLessonLoadedMapper.ensureInitialized()
        .encodeJson<TextLessonLoaded>(this as TextLessonLoaded);
  }

  Map<String, dynamic> toMap() {
    return TextLessonLoadedMapper.ensureInitialized()
        .encodeMap<TextLessonLoaded>(this as TextLessonLoaded);
  }

  TextLessonLoadedCopyWith<TextLessonLoaded, TextLessonLoaded, TextLessonLoaded>
      get copyWith => _TextLessonLoadedCopyWithImpl(
          this as TextLessonLoaded, $identity, $identity);
  @override
  String toString() {
    return TextLessonLoadedMapper.ensureInitialized()
        .stringifyValue(this as TextLessonLoaded);
  }

  @override
  bool operator ==(Object other) {
    return TextLessonLoadedMapper.ensureInitialized()
        .equalsValue(this as TextLessonLoaded, other);
  }

  @override
  int get hashCode {
    return TextLessonLoadedMapper.ensureInitialized()
        .hashValue(this as TextLessonLoaded);
  }
}

extension TextLessonLoadedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextLessonLoaded, $Out> {
  TextLessonLoadedCopyWith<$R, TextLessonLoaded, $Out>
      get $asTextLessonLoaded =>
          $base.as((v, t, t2) => _TextLessonLoadedCopyWithImpl(v, t, t2));
}

abstract class TextLessonLoadedCopyWith<$R, $In extends TextLessonLoaded, $Out>
    implements TextLessonStateCopyWith<$R, $In, $Out> {
  TextLessonVMCopyWith<$R, TextLessonVM, TextLessonVM> get lesson;
  @override
  $R call({TextLessonVM? lesson});
  TextLessonLoadedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TextLessonLoadedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextLessonLoaded, $Out>
    implements TextLessonLoadedCopyWith<$R, TextLessonLoaded, $Out> {
  _TextLessonLoadedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextLessonLoaded> $mapper =
      TextLessonLoadedMapper.ensureInitialized();
  @override
  TextLessonVMCopyWith<$R, TextLessonVM, TextLessonVM> get lesson =>
      $value.lesson.copyWith.$chain((v) => call(lesson: v));
  @override
  $R call({TextLessonVM? lesson}) =>
      $apply(FieldCopyWithData({if (lesson != null) #lesson: lesson}));
  @override
  TextLessonLoaded $make(CopyWithData data) =>
      TextLessonLoaded(lesson: data.get(#lesson, or: $value.lesson));

  @override
  TextLessonLoadedCopyWith<$R2, TextLessonLoaded, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextLessonLoadedCopyWithImpl($value, $cast, t);
}

class TextLessonVMMapper extends ClassMapperBase<TextLessonVM> {
  TextLessonVMMapper._();

  static TextLessonVMMapper? _instance;
  static TextLessonVMMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextLessonVMMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TextLessonVM';

  static String? _$title(TextLessonVM v) => v.title;
  static const Field<TextLessonVM, String> _f$title = Field('title', _$title);
  static quill.Delta _$lessonContent(TextLessonVM v) => v.lessonContent;
  static const Field<TextLessonVM, quill.Delta> _f$lessonContent =
      Field('lessonContent', _$lessonContent);

  @override
  final MappableFields<TextLessonVM> fields = const {
    #title: _f$title,
    #lessonContent: _f$lessonContent,
  };

  static TextLessonVM _instantiate(DecodingData data) {
    return TextLessonVM(
        title: data.dec(_f$title), lessonContent: data.dec(_f$lessonContent));
  }

  @override
  final Function instantiate = _instantiate;

  static TextLessonVM fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextLessonVM>(map);
  }

  static TextLessonVM fromJson(String json) {
    return ensureInitialized().decodeJson<TextLessonVM>(json);
  }
}

mixin TextLessonVMMappable {
  String toJson() {
    return TextLessonVMMapper.ensureInitialized()
        .encodeJson<TextLessonVM>(this as TextLessonVM);
  }

  Map<String, dynamic> toMap() {
    return TextLessonVMMapper.ensureInitialized()
        .encodeMap<TextLessonVM>(this as TextLessonVM);
  }

  TextLessonVMCopyWith<TextLessonVM, TextLessonVM, TextLessonVM> get copyWith =>
      _TextLessonVMCopyWithImpl(this as TextLessonVM, $identity, $identity);
  @override
  String toString() {
    return TextLessonVMMapper.ensureInitialized()
        .stringifyValue(this as TextLessonVM);
  }

  @override
  bool operator ==(Object other) {
    return TextLessonVMMapper.ensureInitialized()
        .equalsValue(this as TextLessonVM, other);
  }

  @override
  int get hashCode {
    return TextLessonVMMapper.ensureInitialized()
        .hashValue(this as TextLessonVM);
  }
}

extension TextLessonVMValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextLessonVM, $Out> {
  TextLessonVMCopyWith<$R, TextLessonVM, $Out> get $asTextLessonVM =>
      $base.as((v, t, t2) => _TextLessonVMCopyWithImpl(v, t, t2));
}

abstract class TextLessonVMCopyWith<$R, $In extends TextLessonVM, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? title, quill.Delta? lessonContent});
  TextLessonVMCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TextLessonVMCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextLessonVM, $Out>
    implements TextLessonVMCopyWith<$R, TextLessonVM, $Out> {
  _TextLessonVMCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextLessonVM> $mapper =
      TextLessonVMMapper.ensureInitialized();
  @override
  $R call({Object? title = $none, quill.Delta? lessonContent}) =>
      $apply(FieldCopyWithData({
        if (title != $none) #title: title,
        if (lessonContent != null) #lessonContent: lessonContent
      }));
  @override
  TextLessonVM $make(CopyWithData data) => TextLessonVM(
      title: data.get(#title, or: $value.title),
      lessonContent: data.get(#lessonContent, or: $value.lessonContent));

  @override
  TextLessonVMCopyWith<$R2, TextLessonVM, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextLessonVMCopyWithImpl($value, $cast, t);
}

class TextLessonFailedMapper extends SubClassMapperBase<TextLessonFailed> {
  TextLessonFailedMapper._();

  static TextLessonFailedMapper? _instance;
  static TextLessonFailedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextLessonFailedMapper._());
      TextLessonStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TextLessonFailed';

  @override
  final MappableFields<TextLessonFailed> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TextLessonFailed';
  @override
  late final ClassMapperBase superMapper =
      TextLessonStateMapper.ensureInitialized();

  static TextLessonFailed _instantiate(DecodingData data) {
    return TextLessonFailed();
  }

  @override
  final Function instantiate = _instantiate;

  static TextLessonFailed fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextLessonFailed>(map);
  }

  static TextLessonFailed fromJson(String json) {
    return ensureInitialized().decodeJson<TextLessonFailed>(json);
  }
}

mixin TextLessonFailedMappable {
  String toJson() {
    return TextLessonFailedMapper.ensureInitialized()
        .encodeJson<TextLessonFailed>(this as TextLessonFailed);
  }

  Map<String, dynamic> toMap() {
    return TextLessonFailedMapper.ensureInitialized()
        .encodeMap<TextLessonFailed>(this as TextLessonFailed);
  }

  TextLessonFailedCopyWith<TextLessonFailed, TextLessonFailed, TextLessonFailed>
      get copyWith => _TextLessonFailedCopyWithImpl(
          this as TextLessonFailed, $identity, $identity);
  @override
  String toString() {
    return TextLessonFailedMapper.ensureInitialized()
        .stringifyValue(this as TextLessonFailed);
  }

  @override
  bool operator ==(Object other) {
    return TextLessonFailedMapper.ensureInitialized()
        .equalsValue(this as TextLessonFailed, other);
  }

  @override
  int get hashCode {
    return TextLessonFailedMapper.ensureInitialized()
        .hashValue(this as TextLessonFailed);
  }
}

extension TextLessonFailedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextLessonFailed, $Out> {
  TextLessonFailedCopyWith<$R, TextLessonFailed, $Out>
      get $asTextLessonFailed =>
          $base.as((v, t, t2) => _TextLessonFailedCopyWithImpl(v, t, t2));
}

abstract class TextLessonFailedCopyWith<$R, $In extends TextLessonFailed, $Out>
    implements TextLessonStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  TextLessonFailedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TextLessonFailedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextLessonFailed, $Out>
    implements TextLessonFailedCopyWith<$R, TextLessonFailed, $Out> {
  _TextLessonFailedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextLessonFailed> $mapper =
      TextLessonFailedMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  TextLessonFailed $make(CopyWithData data) => TextLessonFailed();

  @override
  TextLessonFailedCopyWith<$R2, TextLessonFailed, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextLessonFailedCopyWithImpl($value, $cast, t);
}
