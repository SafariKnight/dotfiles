This configuration requires you to install the [zap plugin manager](https://github.com/zap-zsh/zap)
It's also recommended to add this line to `/etc/zsh/zshenv`
```bash
ZDOTDIR=$XDG_CONFIG_HOME/zsh
```
This will move the zsh configuration files into your .config directory (Or wherever you set `$XDG_CONFIG_HOME`)
