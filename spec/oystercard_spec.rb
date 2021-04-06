require 'oystercard'

describe Oystercard do

it { is_expected.to be_an_instance_of Oystercard }

it "can show a balance" do
  expect(subject).to respond_to(:balance)
end

it { expect(subject).to respond_to(:top_up).with(1).argument }

it "enables you to top up by 5 pounds" do
  subject.top_up(5)
  expect(subject.balance).to eq(5)
end  


end
