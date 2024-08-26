# maybe someday
function fish_prompt

  # interactive user name @ host name, date/time in YYYY-mm-dd format and path

  echo (whoami)@(hostname) (date '+%Y-%m-%d %H:%M:%S') (pwd)

  echo "\$ "

end
