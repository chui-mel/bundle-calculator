# frozen_string_literal: true

namespace :quality do
  begin
    require 'cane'
    require 'cane/rake_task'
  rescue LoadError
    warn 'cane not available, cane task not provided.'
  else
    desc 'Run cane to check quality metrics'
    Cane::RakeTask.new(:cane) do |cane|
      cane.abc_max       = 25
      cane.no_doc        = true
      cane.style_glob    = './{app,lib}/**/*.rb'
      cane.style_measure = 140

      cane.abc_exclude   = []
    end
  end
end
