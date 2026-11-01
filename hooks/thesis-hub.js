// Kit de tesis doctoral — Hook de activación del plugin en Hermes

module.exports = {
  name: "kit-tesis-doctoral",
  version: "2.0.0",

  onActivate: async (ctx) => {
    ctx.log.info("🎓 Kit de tesis doctoral activado");
    ctx.log.info("Flujo: buscar literatura → leer y anotar → organizar → escribir → presentar");
    ctx.log.info("Prueba: 'Busca en OpenAlex 10 artículos recientes sobre [tu tema]'");
  },

  onDeactivate: async (ctx) => {
    ctx.log.info("Kit de tesis doctoral desactivado");
  },
};
