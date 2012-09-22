#library('dart_koans');

#import('package:unittest/unittest.dart');
#import('colors.dart', prefix: 'colors');
#import('dart:io');

class ConfigKoans extends Configuration {
  final PATH = 'lib/src/';
  
  String get name => 'Koans';
  
  void onStart() {
    print('Beginning the path to enlightenment...');
  }
  
  void onDone(int passed, int failed, int errors, List<TestCase> results,
              String uncaughtError) {
    var total = passed + failed + errors;
    print('Process: ${colors.DK_GREEN('$passed tests have been passed')}. '
        '${colors.DK_RED('${total - passed} remain.')}');
    
    if(failed > 0) {
      var fail;
      for(var test in results) {
        if(test.result == 'fail' || test.result == 'error') {
          fail = test;
          break;
        }
      }
      
      var failLine = fail.stackTrace.split('\n')[3];
      var components = failLine.split('/').last();
      components = components.split(':');
      
      print('Failed at: ${fail.description}');
      print(fail.message);
      print('Seek your answers in File:');
      print('${colors.DK_MAGENTA('$PATH${components[0]}')} ' 
        '(Line: ${components[1]} Column: ${components[2]}\n');
    }
    
    
    if(errors + failed != 0) {
      print('You have not yet reached enlightenment.');
    }
    
    exit(0);
  }
  
}
