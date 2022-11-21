class Tarea {
  String _nombre;
  String _descripcion;
  late bool _completada;

  Tarea(this._nombre, this._descripcion){
    _completada = false;
  }

  String get nombre => _nombre;

  String get descripcion => _descripcion;

  set descripcion(String value) {
    _descripcion = value;
  }

  set nombre(String value) {
    _nombre = value;
  }

  bool get completada => _completada;

  set completada(bool value) {
    _completada = value;
  }
}