ver = "22.02"

cask "oclint" do
  arch arm: "arm64", intel: "x86_64"

  version "22.02.1"
  sha256 arm: "b18196a459f1b30bb4b6849b5952327458671ff9f65b30c9766e8a430de23c35",
         intel: "6f102a568af3a4344f9658b5f4bdf3d599a851456287bf7a1fae447891f7368c"

  url "https://github.com/oclint/oclint/releases/download/v#{ver}/oclint-#{ver}-llvm-13.0.1-#{arch}-darwin-macos-12.2-xcode-13.2.tar.gz",
      verified: "github.com/oclint/oclint/"
  name "OCLint"
  desc "Static source code analysis tool"
  homepage "https://oclint.org/"

  on_arm do
    binary "oclint-#{ver}/bin/oclint-json-compilation-database"
    binary "oclint-#{ver}/bin/oclint-xcodebuild"
    binary "oclint-#{ver}/bin/oclint"
    binary "oclint-#{ver}/lib/clang", target: "#{HOMEBREW_PREFIX}/lib/clang"
    binary "oclint-#{ver}/lib/oclint", target: "#{HOMEBREW_PREFIX}/lib/oclint"
  end

  on_intel do
    binary "oclint-#{ver}/bin/oclint-json-compilation-database"
    binary "oclint-#{ver}/bin/oclint-xcodebuild"
    binary "oclint-#{ver}/bin/oclint"
    binary "oclint-#{ver}/include/c++/v1", target: "#{HOMEBREW_PREFIX}/include/c++/v1"
    binary "oclint-#{ver}/lib/clang", target: "#{HOMEBREW_PREFIX}/lib/clang"
    binary "oclint-#{ver}/lib/oclint", target: "#{HOMEBREW_PREFIX}/lib/oclint"
  end
end
