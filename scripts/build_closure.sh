OPTS=(
  "--language_in=ES6_STRICT"
  "--language_out=ES5"
  "--compilation_level=ADVANCED_OPTIMIZATIONS"
  "--js_output_file=dist/aot-closure/bundle.js"
  "--create_source_map=%outname%.map"
  "--variable_renaming_report=tmp/variable_renaming_report"
  "--property_renaming_report=tmp/property_renaming_report"
  "--warning_level=QUIET"

  # Don't include ES6 polyfills
  "--rewrite_polyfills=false"

  # List of path prefixes to be removed from ES6 & CommonJS modules.
  "--js_module_root=node_modules"
  "--js_module_root=lib/vendor"

  # Uncomment for easier debugging
  #"--formatting=PRETTY_PRINT"
  #"--debug"

  # Include zone.js as externs rather than the source code.
  # Allows us to use --dependency_mode=STRICT below.
  # Otherwise the zone.js file is not imported anywhere and gets dropped.
  # See index.html
  #node_modules/zone.js/dist/zone.js
  "lib/vendor/zone_externs.js"

  $(find lib/vendor/rxjs -name '*.js')
  node_modules/@angular/{core,common,compiler,forms,http,platform-browser,router}/index.js
  $(find node_modules/@angular/{core,common,compiler,forms,http,platform-browser,router}/src -name '*.js')
  $(find node_modules/@ng-bootstrap/ng-bootstrap -name '*.js')
  $(find tmp/es6 -name '*.js')

  # Trim files not imported (transitively) from bootstrap.js
  "--entry_point=./tmp/es6/app/main.aot"
  "--dependency_mode=STRICT"
  "--output_manifest=tmp/manifest.MF"
)

JVM_ARGS=""
# To attach a remote debugger:
#JVM_ARGS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"

set -ex
java $JVM_ARGS -jar node_modules/google-closure-compiler/compiler.jar $(echo ${OPTS[*]})
