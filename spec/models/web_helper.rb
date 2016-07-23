require 'fileutils'

def remove_uploaded_file
  FileUtils.rm_rf(Rails.root + "public/system")
end