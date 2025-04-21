{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation ({

  pname = "nonicons";
  version = "0.0.18";

  src = fetchFromGitHub {
    owner = "ya2s";
    repo = "nonicons";
    rev = "5f56cf09167d2dcf5520bc0399f7019a7fea65d3";
    hash = "sha256-U8NilXnr5HNZdmYB2xpMak5B8BQ/9ZnA8VktJsngB4M=";
  };

  installPhase = ''
    mkdir -p "$out/share/fonts/truetype/nonicons"
    cp "./dist/nonicons.ttf" "$out/share/fonts/truetype/nonicons/nonicons.ttf"
  '';
})

