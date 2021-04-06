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

it "does not allow more than £90 to be topped up" do
  max_balance = Oystercard::MAX_BALANCE
  subject.top_up(max_balance)
  expect { subject.top_up(1) }.to raise_error "max balance #{max_balance} reached"
end

end
