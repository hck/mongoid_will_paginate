# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongoid_will_paginate/version"

Gem::Specification.new do |s|
  s.name        = "mongoid_will_paginate"
  s.version     = MongoidWillPaginate::VERSION
  s.authors     = ["Hck"]
  s.homepage    = ""
  s.summary     = %q{Simple native pagination extension for will_paginate}
  s.description = %q{Simple native pagination extension for will_paginate using mongoid skip and limit methods}

  s.rubyforge_project = "mongoid_will_paginate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rails"
  
  s.add_runtime_dependency "mongoid", [">= 2.1.0"]
  s.add_runtime_dependency "will_paginate", [">= 3.0.0"]
end
