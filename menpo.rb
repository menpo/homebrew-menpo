require 'formula'


class Menpo < Formula
  homepage 'https://github.com/menpo/menpo'
  url 'https://pypi.python.org/packages/source/m/menpo/menpo-0.2.1.tar.gz'
  sha1 '50844704fffa6ba5ce964967255878b4c5090867'
  head 'https://github.com/menpo/menpo.git'

  depends_on :python
  depends_on 'cyassimp'
  depends_on 'cyrasterize'
  depends_on 'numpy'
  depends_on 'scipy'
  depends_on 'matplotlib'
  depends_on 'pillow'

  # we want menpo-PyVRML97 to get uninstalled with menpo
  resource 'menpo-PyVRML97' do
    url 'https://pypi.python.org/packages/source/m/menpo-PyVRML97/menpo-PyVRML97-2.3.0a4.tar.gz'
    sha1 '6024aa5933ae9aa64bded22cfd5975fdb9779aca'
  end

  def install
    # install our general dependences like a nice Python citizen
    system 'pip', 'install', 'scikit-image>=0.8.2', 'scikit-learn>=0.14.1',
           'Cython>=0.20.1', 'ipython[notebook]', 'nose'
    resource('menpo-PyVRML97').stage do
      system 'python', 'setup.py', 'install', "--prefix=#{prefix}",
             '--single-version-externally-managed', '--record=installed.txt'
    end
    system 'python', 'setup.py', 'install', "--prefix=#{prefix}",
           '--single-version-externally-managed', '--record=installed.txt'
  end

end
