{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation ({

  pname = "nonicons";
  version = "0.0.18";

  src = fetchFromGitHub {
    owner = "yamatsum";
    repo = "nonicons";
    rev = "8454b3b6c3ceeee18b386b7882c5a071dcf0f3af";
    hash = "sha256-c2UUef5/l5ugKwWV8R3gijD6aorw9H4ca+mGjy+VyYE=";
  };

  installPhase = ''
    mkdir -p "$out/share/fonts/truetype/nonicons"
    cp "./dist/nonicons.ttf" "$out/share/fonts/truetype/nonicons/nonicons.ttf"
  '';
})

