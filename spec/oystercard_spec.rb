require 'oystercard'

describe Oystercard do

it { is_expected.to be_an_instance_of Oystercard }

it "can show a balance" do
  expect(subject).to respond_to(:balance)
end


end
