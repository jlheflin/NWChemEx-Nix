{ stdenv
, lib
, pythonEnv
, fetchFromGitHub
, cmake
, spdlog
, gcc
, mpi
, boost
, cereal
, tree
, fd
, findutils
, autoPatchelfHook
}:
let
  outdir = "${placeholder "out"}";
in
stdenv.mkDerivation rec {
  pname = "ParallelZone";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "NWChemEx";
    repo = "ParallelZone";
    rev = "master";
    sha256 = "sha256-uyI57xCDver9xKy3Tti1jaoEbUWRbz6VfHv5CZ6YiYQ=";
  };

  cmaize = fetchFromGitHub {
    owner = "CMakePP";
    repo = "CMaize";
    rev = "master";
    sha256 = "sha256-7sbeSsfvn0aI4ig+oAvlqjftSKWohLnZn83F6fa8NmA=";
  };

  cmakepplang = fetchFromGitHub {
    owner = "CMakePP";
    repo = "CMakePPLang";
    rev = "master";
    sha256 = "sha256-PLjezhsazVS+8F1CPDNRWvmvGOTdzcSd/znU3Bz53jo=";
  };

  pybind = fetchFromGitHub {
    owner = "pybind";
    repo = "pybind11";
    rev = "master";
    sha256 = "sha256-zMr1mmD8wVZpjsUONNg12PQ5LSKvekVGUYh1nLBL1Ls=";
  };

  nwx_cmake = fetchFromGitHub {
    owner = "NWChemEx";
    repo = "NWXCMake";
    rev = "master";
    sha256 = "sha256-LQ9WJcOQS9Bl88QUmNiVjI+2rXtllIu9v+DSlw7Uefw=";
  };

  nativeBuildInputs = [
    pythonEnv
    cmake
    fd
    findutils
    autoPatchelfHook
  ];

  buildInputs = [
    spdlog
    cereal
    gcc
    mpi
    boost.dev
    tree
  ];

  # preBuild = ''
  # mkdir -p $out/lib
  # '';

  cmakeFlags = [
    "-DCMAKE_PREFIX_PATH=${cereal}/include"
    "-DBUILD_SHARED_LIBS=TRUE"
    "-DFETCHCONTENT_SOURCE_DIR_NWX_CMAKE=${nwx_cmake}"
    "-DFETCHCONTENT_SOURCE_DIR_CMAIZE=${cmaize}"
    "-DFETCHCONTENT_SOURCE_DIR_CMAKEPP_LANG=${cmakepplang}"
    "-DFETCHCONTENT_SOURCE_DIR_PYBIND11=${pybind}"
    "-DNWX_MODULE_DIRECTORY=$out"
    (lib.cmakeFeature "CMAKE_INSTALL_PREFIX" "")
    # "-DBUILD_PYBIND11_PYBINDINGS=OFF"
  ];

  installPhase = ''
    mkdir -p $out/lib
    mkdir -p $out/include
    echo "Running include copy"
    cp -r $src/include/parallelzone $out/include/
    echo "Running libparallelzone copy"
    find "." -maxdepth 1 -type f -name 'libparallelzone.*' -exec cp {} "$out/lib/" \;
    ln -s "$out/lib/libparallelzone.so.0.1.0" "$out/lib/libparallelzone.so.0"
    echo "Running _deps copy"
    find "./_deps" -maxdepth 1 -type f -name 'lib*.*' -exec cp {} "$out/lib/" \;
    echo "Running parallelzone.so copy"
    cp ./parallelzone.so $out/
    patchelf --set-rpath "$out/lib" "$out/parallelzone.so"
    echo "Files in $out:"
    tree $out || true
  '';

  meta = {
    description = "A CMake project with Python dependencies from GitHub";
    maintainers = [ lib.maintainers.yourName ];
    license = lib.licenses.mit; # Replace with the actual license
    platforms = lib.platforms.linux;
    homepage = "https://github.com/NWChemEx/FriendZone"; # Optional
  };
  
}
