class Oclint < Formula
  arch arm: "arm64", intel: "x86_64"

  desc "OCLint static code analysis tool for C, C++, and Objective-C"
  homepage "https://oclint.org/"

  version "22.02"
  sha256 "6f102a568af3a4344f9658b5f4bdf3d599a851456287bf7a1fae447891f7368c"

  url "https://github.com/oclint/oclint/releases/download/v#{version}/oclint-#{version}-llvm-13.0.1-#{arch}-darwin-macos-12.2-xcode-13.2.tar.gz",
      verified: "github.com/oclint/oclint/"
  head "https://github.com/oclint/oclint.git"

  def install
    clang_version = '11.0.0'

    include.install Dir['include/c++'] unless File.directory? "#{include}/c++"
    "#{include}/c++".install Dir['include/c++/v1'] unless File.directory? "#{include}/c++/v1"
    lib.install Dir['lib/clang'] unless File.directory? "#{lib}/clang"
    "#{lib}/clang".install Dir['lib/clang/#{clang_version}'] unless File.directory? "#{lib}/clang/#{clang_version}"
    lib.install Dir['lib/oclint']
    bin.install Dir['bin/*']
  end

  test do
    system "#{bin}/oclint", "-version"
  end
end
