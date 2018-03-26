# frozen_string_literal: true

desc 'Run cane quality checks'
task quality: %w[quality:cane quality:rubocop]
