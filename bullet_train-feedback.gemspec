require_relative "lib/bullet_train/feedback/version"

Gem::Specification.new do |spec|
  spec.name = "bullet_train-feedback"
  spec.version = BulletTrain::Feedback::VERSION
  spec.authors = ["Zack Gilbert"]
  spec.email = ["zackgilbert@gmail.com"]
  spec.homepage = "https://github.com/zackgilbert/bullet_train-feedback"
  spec.summary = "Bullet Train Feedback Widget"
  spec.description = spec.summary
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", ".bt-link"]
  end

  spec.add_development_dependency "standard"

  spec.add_dependency "rails", ">= 6.0.0"
  spec.add_dependency "bullet_train"
  spec.add_dependency "bullet_train-themes-light"
end
