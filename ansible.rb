require 'formula'

class Ansible < Formula
  homepage 'http://ansible.github.com/'
  head 'https://github.com/ansible/ansible.git', :using => :git

  depends_on 'asciidoc'
  depends_on 'distutils2' => :python
  depends_on 'paramiko' => :python
  depends_on 'PyYAML' => :python
  depends_on 'Jinja2' => :python

  def install
    system "PREFIX=#{prefix} make install"
  end
end