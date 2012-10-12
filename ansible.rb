require 'formula'

class Ansible < Formula
  homepage 'http://ansible.github.com/'
  head 'https://github.com/ansible/ansible.git', :using => :git

#  depends_on 'asciidoc'
#  depends_on 'python'
#  depends_on 'distutils2' => :python
  depends_on 'paramiko' => :python
#  depends_on 'pyyaml' => :python
  depends_on 'jinja2' => :python

  def install
    inreplace 'lib/ansible/constants.py' do |s| 
      s.gsub! /\/usr\/share\/ansible\//, '/usr/local/Cellar/ansible/'
    end
    system "/usr/local/bin/python setup.py install --prefix='#{prefix}' --exec-prefix='#{prefix}'"
  end
end