
  friendzone = fetchFromGitHub {
    owner = "NWChemEx";
    repo = "FriendZone";
    rev = "master";
    sha256 = "sha256-LXsS3qAqKMghqUfRvj+td2EKfh1N+RzQ7OcFWB7gkYo=";
  };

  nwx_cmake = fetchFromGitHub {
    owner = "NWChemEx";
    repo = "NWXCMake";
    rev = "master";
    sha256 = "sha256-LQ9WJcOQS9Bl88QUmNiVjI+2rXtllIu9v+DSlw7Uefw=";
  };

  pluginplay = fetchFromGitHub {
    owner = "NWChemEx";
    repo = "PluginPlay";
    rev = "master";
    sha256 = "sha256-JXb7vWHPO6zmRBCpbBkybJKj2KqlVEVTc1Wkc4QXVng=";
  };

  libfort = fetchFromGitHub {
    owner = "seleznevae";
    repo = "libfort";
    rev = "develop";
    sha256 = "sha256-ykvc0AmPZw2lN0Nhm32Vh6Q6RuJwJSh+dKduu0fuRyc=";
  };

  cereal = fetchFromGitLab {
    owner = "palisade";
    repo = "cereal";
    rev = "master";
    sha256 = "sha256-pGeb0e3dFcS6pdhvqWyBgGCtSwOEe/S+v+W9N0BGebI=";
  };

  eigen = fetchFromGitLab {
    owner = "libeigen";
    repo = "eigen";
    rev = "master";
    sha256 = "sha256-nh04Ogrzi0DEPeOHINx8tUDPaHrtPvLy0RerkNWtAKM=";
  };

  tensorwrapper = fetchFromGitHub {
    owner = "NWChemEx";
    repo = "TensorWrapper";
    rev = "master";
    sha256 = "sha256-cEf3aGO2rOvr8qyojOiQK5rLXdJmxghetUD5JsebXxo=";
  };

  chemist = fetchFromGitHub {
    owner = "NWChemEx";
    repo = "Chemist";
    rev = "master";
    sha256 = "sha256-+aWdqZPrZk9YewxQnp4cxj7IXZWwMwAOJiyVKA97jGw=";
  };

  utilities = fetchFromGitHub {
    owner = "NWChemEx";
    repo = "Utilities";
    rev = "master";
    sha256 = "sha256-36ku2oPoJt9p5OuyamwIg938L6Jgqe8mAjgbqRUIdP4=";
  };
