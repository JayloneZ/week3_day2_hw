require 'pry'
require_relative 'bounty.rb'

bounty_1 = Bounty.new({
  'name' => 'grrrr',
  'species' => 'tiger',
  'bounty_value' => '300',
  'danger_level' => '3'
})

bounty_2 = Bounty.new({
  'name' => 'woof',
  'species' => 'wolf',
  'bounty_value' => '150',
  'danger_level' => '2'
})

bounty_3 = Bounty.new({
  'name' => "Miguel",
  'species' => 'human',
  'bounty_value' => '5',
  'danger_level' => '1'
})

binding.pry

nil
