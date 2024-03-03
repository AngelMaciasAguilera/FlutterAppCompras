class Bolso {
  String nombre;
  String rutaImagen;

  Bolso({
    required this.nombre,
    required this.rutaImagen,
  });
}

List<Bolso> listaDeBolsos() {
  return [
    Bolso(nombre: "Artsy", rutaImagen: "bag1.png"),
    Bolso(nombre: "Berkely", rutaImagen: "bag2.png"),
    Bolso(nombre: "Capucinus", rutaImagen: "bag3.png"),
    Bolso(nombre: "Monogram", rutaImagen: "bag4.png"),
  ];
}
