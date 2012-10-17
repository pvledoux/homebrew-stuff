require 'formula'

class Ansible < Formula
  homepage 'http://ansible.github.com/'
  head 'https://github.com/ansible/ansible.git', :using => :git

  depends_on 'paramiko' => :python
#  depends_on 'pyyaml' => :python
  depends_on 'jinja2' => :python

  def install
    inreplace 'lib/ansible/constants.py' do |s| 
      s.gsub! /\/usr\/share\/ansible\//, '/usr/local/share/ansible/'
    end
    
    system "/usr/local/bin/python setup.py install --prefix='#{prefix}' --exec-prefix='#{prefix}'"
    
    (share+'ansible').install Dir['library/*']
  end
end