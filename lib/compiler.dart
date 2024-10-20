import 'dart:io';

Future<String> compileCode(String language, String code) async {
  String output = '';

  // Create a temporary file to save the user's code
  var tempDir = Directory.systemTemp;
  var tempFile = File('${tempDir.path}/temp_code.${language.toLowerCase()}');

  await tempFile.writeAsString(code);

  try {
    switch (language) {
      case 'Python':
        var result = await Process.run('python', [tempFile.path]);
        output = result.stdout + result.stderr;
        break;
      case 'Java':
        var compileResult = await Process.run('javac', [tempFile.path]);
        if (compileResult.stderr.isNotEmpty) {
          output = compileResult.stderr;
        } else {
          var className = tempFile.uri.pathSegments.last.replaceFirst('.java', '');
          var runResult = await Process.run('java', [className, '-cp', tempDir.path]);
          output = runResult.stdout + runResult.stderr;
        }
        break;
      case 'C++':
        var cppFile = tempFile.path.replaceAll('.py', '.cpp');
        await tempFile.rename(cppFile);
        var compileResult = await Process.run('g++', [cppFile, '-o', '${tempDir.path}/temp_code.exe']);
        if (compileResult.stderr.isNotEmpty) {
          output = compileResult.stderr;
        } else {
          var runResult = await Process.run('${tempDir.path}/temp_code.exe', []);
          output = runResult.stdout + runResult.stderr;
        }
        break;
      case 'C':
        var cFile = tempFile.path.replaceAll('.py', '.c');
        await tempFile.rename(cFile);
        var compileResult = await Process.run('gcc', [cFile, '-o', '${tempDir.path}/temp_code.exe']);
        if (compileResult.stderr.isNotEmpty) {
          output = compileResult.stderr;
        } else {
          var runResult = await Process.run('${tempDir.path}/temp_code.exe', []);
          output = runResult.stdout + runResult.stderr;
        }
        break;
      case 'C#':
        var result = await Process.run('dotnet', ['run', tempFile.path]);
        output = result.stdout + result.stderr;
        break;
      default:
        output = 'Unsupported language';
    }
  } catch (e) {
    output = 'Error: $e';
  } finally {
    // Clean up temporary files
    await tempFile.delete();
  }

  return output;
}
