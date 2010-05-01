# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bhm-admin}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Darcy Laycock"]
  s.date = %q{2010-05-02}
  s.description = %q{Provides a reasonably dynamic and simple to use admin area for Rails 3 application. Built on a bunch of open source libraries.}
  s.email = %q{sutto@sutto.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "app/controllers/admin/base_controller.rb",
     "app/controllers/admin_controller.rb",
     "app/views/admin/shared/_edit_base.html.haml",
     "app/views/admin/shared/_footer.html.haml",
     "app/views/admin/shared/_header.html.haml",
     "app/views/admin/shared/_new_base.html.haml",
     "app/views/admin/shared/_sections.html.haml",
     "app/views/admin/shared/_sidebar.html.haml",
     "app/views/layouts/admin.html.haml",
     "bhm-admin.gemspec",
     "compass/stylesheets/bhm/admin/_base.sass",
     "compass/stylesheets/bhm/admin/_content.sass",
     "compass/stylesheets/bhm/admin/_flash.sass",
     "compass/stylesheets/bhm/admin/_footer.sass",
     "compass/stylesheets/bhm/admin/_forms.sass",
     "compass/stylesheets/bhm/admin/_formtastic.sass",
     "compass/stylesheets/bhm/admin/_general.sass",
     "compass/stylesheets/bhm/admin/_grid.sass",
     "compass/stylesheets/bhm/admin/_header.sass",
     "compass/stylesheets/bhm/admin/_listing.sass",
     "compass/stylesheets/bhm/admin/_sidebar.sass",
     "compass/stylesheets/bhm/admin/_util.sass",
     "compass/templates/project/admin.sass",
     "compass/templates/project/manifest.rb",
     "config/locales/en.yml",
     "lib/bhm-admin.rb",
     "lib/bhm/admin.rb",
     "lib/bhm/admin/attr_accessible_scoping.rb",
     "lib/bhm/admin/compass_framework.rb",
     "lib/bhm/admin/engine.rb",
     "lib/bhm/admin/nested_form_helper.rb",
     "lib/bhm/admin/presentation_helper.rb",
     "lib/bhm/admin/sidebar_helper.rb",
     "lib/generators/bhm_admin/resource/resource_generator.rb",
     "lib/generators/bhm_admin/resource/templates/_form.html.haml",
     "lib/generators/bhm_admin/resource/templates/controller.rb",
     "lib/generators/bhm_admin/resource/templates/edit.html.haml",
     "lib/generators/bhm_admin/resource/templates/index.html.haml",
     "lib/generators/bhm_admin/resource/templates/new.html.haml",
     "lib/generators/bhm_admin/resource/templates/show.html.haml",
     "test/helper.rb",
     "test/test_bhm_admin.rb"
  ]
  s.homepage = %q{http://github.com/Sutto/bhm_admin}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Simple, Rails 3 + Compass admin area.}
  s.test_files = [
    "test/helper.rb",
     "test/test_bhm_admin.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<will_paginate>, [">= 0"])
      s.add_runtime_dependency(%q<inherited_resources>, [">= 0"])
      s.add_runtime_dependency(%q<show_for>, [">= 0"])
      s.add_runtime_dependency(%q<compass>, [">= 0.10.0.rc4"])
      s.add_runtime_dependency(%q<fancy-buttons>, [">= 0"])
      s.add_runtime_dependency(%q<compass-960-plugin>, [">= 0"])
      s.add_runtime_dependency(%q<compass-colors>, [">= 0"])
      s.add_runtime_dependency(%q<jammit>, [">= 0"])
      s.add_runtime_dependency(%q<will_paginate>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
    else
      s.add_dependency(%q<will_paginate>, [">= 0"])
      s.add_dependency(%q<inherited_resources>, [">= 0"])
      s.add_dependency(%q<show_for>, [">= 0"])
      s.add_dependency(%q<compass>, [">= 0.10.0.rc4"])
      s.add_dependency(%q<fancy-buttons>, [">= 0"])
      s.add_dependency(%q<compass-960-plugin>, [">= 0"])
      s.add_dependency(%q<compass-colors>, [">= 0"])
      s.add_dependency(%q<jammit>, [">= 0"])
      s.add_dependency(%q<will_paginate>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<will_paginate>, [">= 0"])
    s.add_dependency(%q<inherited_resources>, [">= 0"])
    s.add_dependency(%q<show_for>, [">= 0"])
    s.add_dependency(%q<compass>, [">= 0.10.0.rc4"])
    s.add_dependency(%q<fancy-buttons>, [">= 0"])
    s.add_dependency(%q<compass-960-plugin>, [">= 0"])
    s.add_dependency(%q<compass-colors>, [">= 0"])
    s.add_dependency(%q<jammit>, [">= 0"])
    s.add_dependency(%q<will_paginate>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
  end
end

