Gem::Specification.new do |s|
  s.name = %q{flickrget}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Denis Barushev"]
  s.autorequire = %q{flickrget}
  s.date = %q{2008-10-08}
  s.default_executable = %q{flickrget}
  s.description = %q{A gem that provides a simple command line tool for downloading photos from Flickr}
  s.email = %q{barushev@gmail.com}
  s.executables = ["flickrget"]
  s.extra_rdoc_files = ["README.rdoc", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.rdoc", "Rakefile", "TODO", "bin/flickrget", "lib/flickrget.rb", "spec/spec_helper.rb", "spec/flickrget_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/denis/flickrget}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{A gem that provides a simple command line tool for downloading photos from Flickr}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
