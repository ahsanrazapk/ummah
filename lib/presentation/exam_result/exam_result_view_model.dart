import 'package:rxdart/rxdart.dart';
import 'package:ummah/application/core/usecases/usecase.dart';
import 'package:ummah/data/models/subject_wise_result_response.dart';
import 'package:ummah/data/models/test_wise_result.dart';
import 'package:ummah/domain/repo_interfaces/result_interface.dart';
import 'package:ummah/domain/use_case/subject_wise_result_usecase.dart';
import 'package:ummah/domain/use_case/test_wise_result_usecase.dart';
import 'package:ummah/presentation/base/base_mixin.dart';
import 'package:ummah/presentation/exam_result/model/exam_term_local.dart';
import 'package:ummah/presentation/exam_result/model/marks_sheet_local.dart';
import 'package:ummah/presentation/exam_result/model/type_index.dart';

class ExamResultViewModel with BaseMixin {
  IResult repo;

  ExamResultViewModel({required this.repo});

  final BehaviorSubject<TestWiseResultResponse> _testWiseResultSubject = BehaviorSubject<TestWiseResultResponse>();
  final BehaviorSubject<SubjectWiseResultResponse> _subjectWiseResultSubject = BehaviorSubject<SubjectWiseResultResponse>();

  Stream<Map<TypeIndex, List<MarksSheetLocal>>> get testWiseResultStream =>
      _testWiseResultSubject.asyncMap((event) => event.data).asyncMap((event) {
        final data = event!;
        Map<TypeIndex, List<MarksSheetLocal>> map = {};
        List<MarksSheetLocal> list = [];
        for (int i = 0; i < data.length; i++) {
          for (var element in data[i].markSheets!) {
            list.add(MarksSheetLocal(
                subject: element.subject!.name!,
                totalMarks: element.totalMarks!,
                obtainedMarks: element.obtainedMarks!,
                percentage: utils.getPercentage(element.obtainedMarks!, element.totalMarks!),
                index: i));
          }
          map[TypeIndex(name: data[i].name!, index: i)] = list;
        }
        return map;
      });

  Stream<Map<TypeIndex, List<ExamTermLocal>>> get subjectWiseResultStream =>
      _subjectWiseResultSubject.asyncMap((event) => event.data).asyncMap((event) {
        final data = event!;
        Map<TypeIndex, List<ExamTermLocal>> map = {};
        List<ExamTermLocal> list = [];
        for (int i = 0; i < data.length; i++) {
          for (var element in data[i].markSheets!) {
            list.add(ExamTermLocal(
                term: element.examTerm!.name!,
                totalMarks: element.totalMarks!,
                obtainedMarks: element.obtainedMarks!,
                percentage: utils.getPercentage(element.obtainedMarks!, element.totalMarks!),
                index: i));
          }
          map[TypeIndex(name: data[i].name!, index: i)] = list;
        }
        return map;
      });

  getTestWiseResult() async {
    final _testResult = TestWiseResultUseCase(repo);
    final result = await _testResult(NoParams());
    result.fold((error) {
      _testWiseResultSubject.addError(error);
    }, (event) {
      _testWiseResultSubject.sink.add(event);
    });
  }

  getSubjectWiseResult() async {
    final _subjectResult = SubjectWiseResultUseCase(repo);
    final result = await _subjectResult(NoParams());
    result.fold((error) {
      _subjectWiseResultSubject.addError(error);
    }, (event) {
      _subjectWiseResultSubject.sink.add(event);
    });
  }
}
