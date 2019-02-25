
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "zendesk_search/version"

Gem::Specification.new do |spec|
  spec.name          = "zendesk_search"
  spec.version       = ZendeskSearch::VERSION
  spec.authors       = ["Stephen Huang"]
  spec.email         = ["huangjun604@gmail.com"]

  spec.summary       = "Zendesk search app"
  spec.description   = "Zendesk search app"
  spec.homepage      = ""
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "factory_bot", "~> 5.0"
  spec.add_development_dependency "byebug", "~> 11.0"
  spec.add_development_dependency "highline", "~> 2.0"
  spec.add_development_dependency "terminal-table", "~> 1.8"
end
