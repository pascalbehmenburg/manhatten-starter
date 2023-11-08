FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN echo "Updating Ubuntu"
RUN apt-get update && apt-get upgrade -y

RUN echo "Installing dependencies..."
RUN apt install -y \
			ccache \
			clang \
			clang-format \
			clang-tidy \
			curl \
			doxygen \
			gcc \
			git \
			graphviz \
			make \
			ninja-build \
			python3 \
			python3-pip \
			tar \
			unzip \
			vim

# Install specific cmake version 3.15
RUN echo "Installing cmake v3.15 from source to have consistent versioning..."
RUN apt install -y wget tar build-essential libssl-dev && \
			wget https://github.com/Kitware/CMake/releases/download/v3.15.0/cmake-3.15.0.tar.gz && \
			tar -zxvf cmake-3.15.0.tar.gz && \
			cd cmake-3.15.0 && \
			./bootstrap && \
			make && \
			make install

# We are using 1.60.1
RUN echo "Installing conan v1.60.1 package manager via pip3..."

RUN pip3 install conan==1.60.1