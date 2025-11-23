require "rake/testtask"

namespace :test do
  # task :prepare_saas => :environment do
  #   require "rails/test_help"
  #
  #   $LOAD_PATH.unshift Fizzy::Saas::Engine.root.join("test").to_s
  #   require Fizzy::Saas::Engine.root.join("test/test_helper")
  # end

  desc "Run tests for fizzy-saas gem"
  Rake::TestTask.new(:saas => :environment) do |t|
    t.libs << "test"
    t.test_files = FileList[Fizzy::Saas::Engine.root.join("test/**/*_test.rb")]
    t.warning = false
  end
end

namespace :saas do
  SAAS_FILE_PATH = "tmp/saas.txt"

  desc "Enable SaaS mode"
  task :enable => :environment do
    file_path = Rails.root.join(SAAS_FILE_PATH)
    FileUtils.mkdir_p(File.dirname(file_path))
    FileUtils.touch(file_path)
    puts "SaaS mode enabled (#{file_path} created)"
  end

  desc "Disable SaaS mode"
  task :disable => :environment do
    file_path = Rails.root.join(SAAS_FILE_PATH)
    FileUtils.rm_f(file_path)
    puts "SaaS mode disabled (#{file_path} removed)"
  end
end
