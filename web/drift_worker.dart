import 'package:drift/wasm.dart';

// The browser runs SQLite work in a worker so the app stays responsive.
void main() => WasmDatabase.workerMainForOpen();
