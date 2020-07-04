import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(
    // printer: PrettyPrinter(
    //     methodCount: 2, // number of method calls to be displayed
    //     errorMethodCount: 8, // number of method calls if stacktrace is provided
    //     lineLength: 120, // width of the output
    //     colors: true, // Colorful log messages
    //     printEmojis: true, // Print an emoji for each log message
    //     printTime: false // Should each log print contain a timestamp
    //     ),
    printer: SimpleLogPrinter(className),
  );
}

class SimpleLogPrinter extends LogPrinter {
  final String className;
  SimpleLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    var msg = event.message;
    return [(color('$emoji $className - $msg'))];
  }
}
