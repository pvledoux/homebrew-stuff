require 'formula'

class Ansible < Formula
  homepage 'http://ansible.github.com/'
  head 'https://github.com/ansible/ansible.git', :using => :git
  url 'https://github.com/ansible/ansible/archive/v1.2.tar.gz'
  sha1 '73bdf1c007f546004d7ceed6c74a6c090fe1c1d0'

  depends_on 'python'
  depends_on 'paramiko' => :python
  depends_on 'jinja2' => :python
#  depends_on 'pyyaml' => :python

  def install
    inreplace 'lib/ansible/constants.py' do |s|
      s.gsub! '/usr/share/ansible', '/usr/local/share/ansible/'
    end

    system "/usr/local/bin/python", "setup.py", "build"

    bin.install Dir['build/scripts-2.7/*']
    (lib+'python2.7/site-packages/ansible').mkpath
    (lib+'python2.7/site-packages/ansible').install Dir['build/lib/ansible/*']

    (share+'ansible').mkpath
    (share+'ansible').install Dir['library/*']
  end
end
