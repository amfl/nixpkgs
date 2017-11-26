{ stdenv, fetchurl, cmake, qtbase, karchive, qtsvg, qtmultimedia,
kdnssd, giflib # This line is client deps
}:

stdenv.mkDerivation rec {
  name = "drawpile";
  version = "2.0.5";

  src = fetchurl {
    url = "https://github.com/drawpile/Drawpile/archive/${version}.tar.gz";
    sha256 = "097ypxwdmxm4fdc9ca29ccy1maiamxr8d55z0prp9n7nvzzx298v";
  };

  # make: *** No rule to make target 'check'.  Stop.
  doCheck = false;

  nativeBuildInputs = [ cmake ];
  buildInputs = [ qtbase karchive qtsvg qtmultimedia kdnssd giflib ];

  cmakeFlags = [
    "-DCLIENT=ON"
    "-DSERVER=ON"
    "-DSERVERGUI=ON"
  ];

  meta = {
    description = "A collaborative drawing program";
    longDescription = ''
      Drawpile is a drawing program that lets you share the canvas with other
      users in real time.
    '';
    homepage = http://drawpile.net/;
    license = stdenv.lib.licenses.gpl3Plus;
    # maintainers = [ stdenv.lib.maintainers.eelco ];
    platforms = stdenv.lib.platforms.all;
  };
}
