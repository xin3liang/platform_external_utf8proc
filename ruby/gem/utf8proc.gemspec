require 'rubygems'
SPEC = Gem::Specification.new do |s|
  s.name = 'utf8proc'
  s.version = '1.1.2'
  s.author = 'Jan Behrens'
  s.email = 'jan.behrens.n4272.expires-2008-06@flexiguided.de'
  s.homepage = 'http://www.flexiguided.de/publications.utf8proc.en.html'
  s.summary = 'UTF-8 Unicode string processing'
  s.files = ['LICENSE', 'lib/utf8proc.rb', 'ext/utf8proc_native.c']
  s.require_path = 'lib/'
  s.extensions = ['ext/extconf.rb']
  s.has_rdoc = false
end
