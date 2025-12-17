/// Definition of data holder of form data file.
class CodepoHttpFormDataFile {
  const CodepoHttpFormDataFile(
    this.fileName,
    this.contentType,
    this.length,
  );

  final String? fileName;
  final String contentType;
  final int length;
}
