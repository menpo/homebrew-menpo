require 'formula'

class Cyassimp < Formula
  homepage 'https://github.com/menpo/cyassimp'
  url 'https://pypi.python.org/packages/source/c/cyassimp/cyassimp-0.1.3.tar.gz'
  sha1 'c95da26d4c956c82725a18472f77d0ff3f3190a1'
  head 'https://github.com/menpo/cyassimp.git'

  depends_on :python
  depends_on 'assimp'
  depends_on 'homebrew/python/numpy'

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}", "--single-version-externally-managed", "--record=installed.txt"
  end

  test do
    system "python", "-c", "import cyassimp"
  end

end
