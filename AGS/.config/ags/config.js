const entry = App.configDir + "/main.ts";
const main = "/tmp/ags/main.js";

try {
  await Utils.execAsync([
    'bun', 'build', entry,
    '--outfile', main,
    '--external', 'resource://*',
    '--external', 'gi://*',
    '--external', 'file://*',
  ]);
  import(`file://${main}`);
} catch (error) {
  console.error(error);
}

export { };
