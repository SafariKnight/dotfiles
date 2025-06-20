_: prev: {
  discord-with-vencord = prev.discord.override {
    withOpenASAR = true;
    withVencord = true;
  };
}
