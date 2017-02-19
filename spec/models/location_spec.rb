require 'rails_helper'

describe Location do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of (:name) }
  it { is_expected.to validate_presence_of(:area) }
end
