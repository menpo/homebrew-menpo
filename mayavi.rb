require 'formula'


class Mayavi < Formula
  homepage 'http://code.enthought.com/projects/mayavi/'
  url 'https://pypi.python.org/packages/source/m/mayavi/mayavi-4.3.1.tar.gz'
  sha1 '7037490c9387747c36757c584437dff4df4dc45b'
  head 'https://github.com/enthought/mayavi'

  depends_on :python
  depends_on 'numpy'
  depends_on 'pyqt'
  depends_on 'homebrew/versions/vtk5' => 'with-qt'

  def install

  end

end
