# Manhatten Cpp Template

## Features

* Modern **CMake** configuration and project, which, to the best of my
knowledge, uses the best practices.

* An example of a **Clang-Format** config, inspired from the base *Google* model,
with minor tweaks.

* **Static analyzer** integration, with *Clang-Tidy*.

* **Doxygen** support.

* **Unit testing** support, through *GoogleTest* (with an option to enable
*GoogleMock*) or *Catch2* (currently GoogleTest is enabled).

* **Code coverage**, enabled by using the `ENABLE_CODE_COVERAGE` option, through
*Codecov* CI integration.

* **Package manager support**, with *Conan* (though *Vcpkg* could be toggled if needed).

* **CI workflows for Windows, Linux and MacOS** using *GitHub Actions*, making
use of the caching features, to ensure minimum run time.

* **.md templates** for: *README*, *Contributing Guideliness*, *Issues* and *Pull Requests*.

* **Ccache** integration, for speeding up rebuild times.

## Getting Started

These instructions will get you a copy of the project up and running on your local
machine for development and testing purposes.

### Prerequisites

* **CMake v3.15+** - found at [https://cmake.org/](https://cmake.org/)
* **C++ Compiler** - needs to support at least the **C++17** standard and we use *Clang*.
* **Other dependencies** - are found in the Dockerfile which is strongly recommended to use instead of installing them manually

> ***Note:*** *You also need to be able to provide ***CMake*** a supported
[generator](https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html).*

### Setup VSCode

* Clone the repository.
* Open it in vscode.
* Setup Docker.
* Install [Devcontainers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension then using the command palette of vscode run "Devcontainers: Build dev container" or smth. like that.
Afterwards you should be set up and ready to execute the following commands inside your dev-container in vscode's terminal:

```
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/absolute/path/to/custom/install/directory
cmake --build . --target install
```

This should've build and installed the application.

### Installing

It is fairly easy to install the project, all you have to do is clone the project.

To install an already built project, you need to run the `install` target with CMake.
For example:

```bash
cmake --build build --target install --config Release

# a more general syntax for that command is:
cmake --build <build_directory> --target install --config <desired_config>
```

## Building the project

To build the project, all you need to do, ***after correctly
[installing the project](README.md#Installing)***, is run a similar **CMake** routine
to the the one below:

```bash
mkdir build/ && cd build/
cmake .. -DCMAKE_INSTALL_PREFIX=/absolute/path/to/custom/install/directory
cmake --build . --target install
```

> ***Note:*** *The custom ``CMAKE_INSTALL_PREFIX`` can be omitted if you wish to
install in [the default install location](https://cmake.org/cmake/help/latest/module/GNUInstallDirs.html).*

## Generating the documentation

In order to generate documentation for the project, you need to configure the build
to use Doxygen. This is easily done, by modifying the workflow shown above as follows:

```bash
mkdir build/ && cd build/
cmake .. -D<project_name>_ENABLE_DOXYGEN=1 -DCMAKE_INSTALL_PREFIX=/absolute/path/to/custom/install/directory
cmake --build . --target doxygen-docs
```

> ***Note:*** *This will generate a `docs/` directory in the **project's root directory**.*

## Running the tests

By default, the template uses [Google Test](https://github.com/google/googletest/)
for unit testing. Unit testing can be disabled in the options, by setting the
`ENABLE_UNIT_TESTING` (from
[cmake/StandardSettings.cmake](cmake/StandardSettings.cmake)) to be false. To run
the tests, simply use CTest, from the build directory, passing the desire
configuration for which to run tests for. An example of this procedure is:

```bash
cd build          # if not in the build directory already
ctest -C Release  # or `ctest -C Debug` or any other configuration you wish to test

# you can also run tests with the `-VV` flag for a more verbose output (i.e.
#GoogleTest output as well)
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our how you can
become a contributor and the process for submitting pull requests to us.

## Authors

* **Pascal Behmenburg**

## License

This project is licensed under the [MIT](https://opensource.org/license/mit/) - see the
[LICENSE](LICENSE) file for details
