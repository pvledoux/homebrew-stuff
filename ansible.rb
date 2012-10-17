require 'formula'

class Ansible < Formula
  homepage 'http://ansible.github.com/'
  head 'https://github.com/ansible/ansible.git', :using => :git
  url 'https://github.com/downloads/ansible/ansible/ansible-0.7.1.tar.gz'
  sha1 'b3128b13728b0041fdac848a29e9387d89f10c41'

  depends_on 'python'
  depends_on 'paramiko' => :python
  depends_on 'jinja2' => :python
#  depends_on 'pyyaml' => :python

  def install
    inreplace 'lib/ansible/constants.py' do |s| 
      s.gsub! '/usr/share/ansible/', '/usr/local/share/ansible/'
    end
    
    system "/usr/local/bin/python setup.py install --prefix='#{prefix}' --exec-prefix='#{prefix}'"
    
    (share+'ansible').install Dir['library/*']
  end
end