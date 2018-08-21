
# Get the ghost-cli version.
#
# If the user declares an "engines.ghost_cli" section in the package.json 
# we use that#value otherwise we use "latest".
package_get_cli_version() {
  
  local path=$1
  local version=$(package_get "$path" | $JQ -e '.engines."ghost-cli"')

  case "$version" in
    "") echo $version ;;
    *) echo 'latest'  ;;
  esac

}

# is_theme checks the "keywords" array for the required "ghost-theme" keyword.
package_is_theme() {

  local file=$1

  $(package_get "$file" | $JQ -e '.keywords | contains(["ghost-theme"])')

  return $?

}

# package_get produces the package.json contents.
#
# Exits with an error if the file path is not found.
package_get() {

  local path=$1

  if [[ -f $path ]]; then

    cat "$path"

  else

    puts_error "The path $path is not a file!"
    exit 1

  fi

}
