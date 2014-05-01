require 'formula'


class Menpo < Formula
  homepage 'https://github.com/menpo/menpo'
  url 'https://pypi.python.org/packages/source/m/menpo/menpo-0.2.2.tar.gz'
  sha1 '96cd2ef60ae598a0f4a6dc9e709ec57ce3f5c898'
  head 'https://github.com/menpo/menpo.git'

  depends_on :python
  depends_on 'cyassimp'
  depends_on 'cyrasterize'
  depends_on 'homebrew/python/numpy'
  depends_on 'homebrew/python/scipy'
  depends_on 'homebrew/python/matplotlib'
  depends_on 'homebrew/python/pillow'

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
