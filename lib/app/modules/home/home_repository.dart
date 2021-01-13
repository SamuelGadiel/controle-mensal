import 'dart:convert';

import 'package:gsheets/gsheets.dart';
import 'package:flutter/services.dart';

// Future<String> loadAsset() async {
//   return jsonDecode(await rootBundle.loadString('lib/config/credentials.json'));
// }

class HomeRepository {
  // final credentials = loadAsset();
  final credentials = r''' {
  "type": "service_account",
  "project_id": "api-sheets-273115",
  "private_key_id": "dd25017f5dfb941ab8026f3b94130ccbd54de0a4",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCseYo3wnV0UuwB\ndN9vM98t8qgK9XPPwzurAAieCGOUs8Dpx6MqQGkXycgvDAIbmm56Qi1FkIhJPdQn\nF0AwlW1PgdbiynDsJjROYnuY9Lc6HIqq9EXjvRACppqf/Z7XeIEdoa7k0YXiwaoQ\nKzwb+7IeaDp/rjQOV7FvylBIiQroS/l32HhxZJTLkmDB/JnrsZHXDT0J7M5/eFmi\nrQtr6umYwPy1AqpO8apQiIDHyHhy3qi11aobzAGHgrBUfl8IYIKwU9gxB2msD0dj\n0dxJLZX1QhhLXRJjBvOfnMaDPLh4uiIx+T850Fjis4dOfaVoFKL1HLFIjLOtR8c/\nmrjx+3RZAgMBAAECggEALTXSyFj95tcRrDQRmZm0R9wStoSurehUTLe+ioZSbBlO\nWTmOiLXHloe7JLH2H3w0t3F/YnvHbcN6SCDtH48bzzqOtHYycYR2M5HXKjoDiYUP\nyE4tv8vAVaGMaKHXsE2TMsw+BxbxDIaNaJ2crQ0mHJhftTZZyOSty0ryDoF1zXwm\nJ2sr7qHmNXPYLLvi1nr3G4w3hfD6G/t/e3AL3jIyXCMqZGvygsCUVvhbrei5zpBA\nbEPqZgPmLJ6nDtdpWquPpN8F4chEGtJxnojmnoVa6lxHQ9MxyD9D4pMj9pHIE/Rz\nmNd1qlS8oBb4j4OC4eBblxVh9IvjU8F93MlEiGk6/QKBgQDnL1JWfHCjaBLZHS1a\nzIFahR1jHobnvoiVbk9cl7J2sahW6pSmt8YDFv9IePtiFJpn07DfAqXqvyL62X0h\nQxtsGQnjsd35Pxk9Ac3HOjWT8RPVVRJLZt3q5oO0hCG7WajUvSWHNIrWiuuJXV7R\npxCODZIuLOFJ6Qu6IzGp5CwZJwKBgQC+/O/EYDCJVpehvkp6FU+x8LZE6bTpG9gY\nYu0y3wnP/XD6cJS+v4YILu4rtjMQvvMJyIW0nL4/533cO6ZaAizeMhhOOVvttGhY\nuPnMMlx4V36S1bWssQJclBiZrsm0PXHYBl+JM69brM17J8tirCZRvg32G3LJqmmJ\nnMI2U0V2fwKBgQDJGv8zQNjzLOuIdrsni1LTHYzs1ndgTPyfkO/0ifmzCuR3h2R8\niszzjyPPNX7oWSfgPeRUewc957tUH7GcJ7ZJGJbjvaxsz5jy2wjY0CgfY81u/KwH\nb5qIZrIXbAGz6lDVjxyAOxKzgvFV8yUyl3PtPpz1EhGAq/uJlmfzdAtwbQKBgQCS\nJy20sYdzEfjnpZ+I3VYnbXWONupimRQ9VTb/fv8bU29pt02cyyPej0tj2AIsBnQm\nQHVRScGtVZFTP7KFnrSHNP60neBjf3N6sdM3GDL7RLlv1Gs6xBpyjkJlGQTyETNV\nhUsGy66eERcN794MnICWfUJh2490FBy/Wl6lBARcMQKBgCRo+VFrXOqGmIogsCpK\nB93R2sWGCtSJ+5Qb6GgC0yibkvu3TkztRGlg+zePpUsRcXW6fYUx9AzEMfPQHJ84\nLOYd9ZpKxzsWYJV/mfmhQmrhJyPAnlYz8qk9NZ7YmXnue+3GIXEQ9l5y/csCK8Bo\nVnKeFxSH+mAuqUcFkI3HBpU0\n-----END PRIVATE KEY-----\n",
  "client_email": "controlemensal@api-sheets-273115.iam.gserviceaccount.com",
  "client_id": "116787787504608092652",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/controlemensal%40api-sheets-273115.iam.gserviceaccount.com"
} ''';
  final spreadSheetId = '1iRiCu0TzYgHRJtYVCL1v-G3jLILnoGa6puUyOZiUw2Q';

  Future<void> getData() async {
    final gsheets = GSheets(credentials);
    final ss = await gsheets.spreadsheet(spreadSheetId);

    var sheet = ss.worksheetByTitle('Página1');
    sheet ??= await ss.addWorksheet('Página');
    print("aaaaaa");

    // length -> colunas
    // count -> linhas
    var cells = await sheet.cells
        .allRows(fromColumn: 2, length: 5, fromRow: 4, count: 109);

    print(cells);
  }
}
