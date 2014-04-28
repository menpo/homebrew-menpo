require 'formula'

class Cyrasterize < Formula
  homepage 'https://github.com/menpo/cyrasterize'
  url 'https://pypi.python.org/packages/source/c/cyrasterize/cyrasterize-0.1.5.tar.gz'
  sha1 '5496e16ea711549c4473b9c9180f97048166b651'
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
