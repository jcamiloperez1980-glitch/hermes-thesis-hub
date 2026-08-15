// Hermes Thesis Hub — Hook de activación
// Se ejecuta cuando se carga el plugin en Hermes

module.exports = {
  name: "hermes-thesis-hub",
  version: "1.0.0",

  onActivate: async (ctx) => {
    ctx.log.info("🎓 Hermes Thesis Hub activado");
    ctx.log.info("Skills: Ponytail, Humanizer, Find-Skills, PowerPoint, OpenAlex");
    ctx.log.info("Tip: Di 'busca papers' o 'crea una presentación'");
  },

  onDeactivate: async (ctx) => {
    ctx.log.info("Hermes Thesis Hub desactivado");
  },
};