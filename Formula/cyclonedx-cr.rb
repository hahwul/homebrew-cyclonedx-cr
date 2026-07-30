# typed: strict
# frozen_string_literal: true

# This file is rendered by cyclonedx-cr's release pipeline (.github/workflows/publish-homebrew-tap.yml).
# DO NOT EDIT by hand.
class CyclonedxCr < Formula
  desc "CycloneDX SBOM generator for Crystal projects (shard.yml/shard.lock)"
  homepage "https://github.com/hahwul/cyclonedx-cr"
  version "1.4.0"
  license "MIT"

  # cyclonedx-cr ships prebuilt binaries: Linux is statically linked (musl) and
  # macOS links only system libraries (system libxml2) plus statically linked
  # Crystal runtime libs and libyaml, so the formula declares no dependencies.
  # An otool guard in release-binary.yml enforces that no Homebrew dylib leaks in.
  on_macos do
    on_arm do
      url "https://github.com/hahwul/cyclonedx-cr/releases/download/v1.4.0/cyclonedx-cr-v1.4.0-osx-arm64"
      sha256 "c30d49c092c6124e72d4ac3c28dd233a3945ff631a8ad328644fd476c35b692f"
    end
    on_intel do
      url "https://github.com/hahwul/cyclonedx-cr/releases/download/v1.4.0/cyclonedx-cr-v1.4.0-osx-x86_64"
      sha256 "52455930c8dff75f6eb06cb2b233691316959f1111079f9a0dec8e6e8cb39ee5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hahwul/cyclonedx-cr/releases/download/v1.4.0/cyclonedx-cr-v1.4.0-linux-arm64"
      sha256 "5a36f30c02fb9c06c08d97dbd4c661a9a87fcf46afbccee6ff5c989d82669117"
    end
    on_intel do
      url "https://github.com/hahwul/cyclonedx-cr/releases/download/v1.4.0/cyclonedx-cr-v1.4.0-linux-x86_64"
      sha256 "a0b5b42e7d6883047754fdc97d8c2654808f8a22215c9a88abb2e69afdb59ffe"
    end
  end

  def install
    bin.install Dir["cyclonedx-cr-v1.4.0-*"].first => "cyclonedx-cr"
  end

  test do
    system "#{bin}/cyclonedx-cr", "-h"
  end
end
