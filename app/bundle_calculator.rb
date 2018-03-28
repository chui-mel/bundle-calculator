# frozen_string_literal: true

require_relative '../lib/boot'

class BundleCalculator
  def initialize
    initialize_bundles
    @calculator = Algorithm::MininumBundles.new
    @order_parser = OrderParser.new
    @order_filler = OrderFiller.new(@calculator, @bundles)
  end

  def parse(lines)
    @order_parser.parse(lines)
  end

  def calculate(order)
    @order_filler.fill_order(order)
  end

  private

  def initialize_bundles
    @bundles = {}
    Constants::MEDIA_FORMAT.each do |key, value|
      @bundles[value] = MediaBundles.new(key)
    end

    Constants::BUNDLE_LIST.each do |key, value|
      value.each { |attrs| @bundles[key].add_bundle(SubmissionBundle.new(*attrs)) }
    end
  end
end

if $PROGRAM_NAME == __FILE__
  calculator = BundleCalculator.new
  order_file = ARGV[0]

  if order_file.nil?
    puts 'Please give a correct order file you want to fill.'
    exit(0)
  end

  order = calculator.parse(File.readlines(order_file))
  filled_order = calculator.calculate(order)
  puts filled_order
end
