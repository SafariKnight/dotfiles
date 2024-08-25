function mk --wraps=mkdir --description="Make Directory then CD into it"
  mkdir $argv
  cd $argv
end
