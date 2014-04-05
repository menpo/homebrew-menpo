require 'formula'

class Cyrasterize < Formula
  homepage 'https://github.com/menpo'
  url 'https://pypi.python.org/packages/source/c/cyrasterize/cyrasterize-0.1.4.tar.gz'
  sha1 'e3f8fb783b69c22c616947f7cdf50f49ae007f61'
  head 'https://github.com/menpo/cyrasterize.git'

  depends_on :python
  depends_on 'glfw3'
  depends_on 'glew'
  depends_on 'numpy'

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}", "--single-version-externally-managed", "--record=installed.txt"
  end

  test do
    system "python", "-c", "import cyrasterize"
  end

end
