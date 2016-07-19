require 'rails_helper'

RSpec.describe Song, type: :model do
  
  it {should have_valid(:title).when('a', "aaaaaa", 'aaavvbcc d')}
end
