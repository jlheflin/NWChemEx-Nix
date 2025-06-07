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
}:

stdenv.mkDerivation rec {
  pname = "ParallelZone";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "NWChemEx";
    repo = "ParallelZone";
    rev = "master";
    sha256 = "sha256-r5XOtULOPn+K4m6rOobeeXs7qTgQLZmOHR0pZcROuWw=";
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
    sha256 = "sha256-vPa4KdfJV5hJOx3PpJ6uMPMWnyatKwe4Z5LmNOLwqNo=";
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
  ];

  buildInputs = [
    spdlog
    cereal
    gcc
    mpi
    boost.dev
  ];

  cmakeFlags = [
    "-DCMAKE_PREFIX_PATH=${cereal}/include"
    "-DBUILD_SHARED_LIBS=TRUE"
    "-DFETCHCONTENT_SOURCE_DIR_NWX_CMAKE=${nwx_cmake}"
    "-DFETCHCONTENT_SOURCE_DIR_CMAIZE=${cmaize}"
    "-DFETCHCONTENT_SOURCE_DIR_CMAKEPP_LANG=${cmakepplang}"
    "-DFETCHCONTENT_SOURCE_DIR_PYBIND11=${pybind}"
    "-DNWX_MODULE_DIRECTORY=./lib/python3.12/site-packages"
  ];

  meta = {
    description = "A CMake project with Python dependencies from GitHub";
    maintainers = [ lib.maintainers.yourName ];
    license = lib.licenses.mit; # Replace with the actual license
    platforms = lib.platforms.linux;
    homepage = "https://github.com/NWChemEx/FriendZone"; # Optional
  };
  
}
