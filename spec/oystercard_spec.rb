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
    subject.top_up(Oystercard::MAX_BALANCE)
    expect { subject.top_up(1) }.to raise_error "max balance #{Oystercard::MAX_BALANCE} reached"
  end

  it "does not allow a intial value over £90 to be topped up" do
    expect { subject.top_up(91) }.to raise_error "top up value can not be over #{Oystercard::MAX_BALANCE}"
  end

  it { is_expected.to respond_to(:touch_in) }

  it "returns a true value when card touches in" do
    subject.top_up(Oystercard::MAX_BALANCE)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it { is_expected.to respond_to(:touch_out) }

  it "returns a true value when card touches out" do
    subject.top_up(Oystercard::MAX_BALANCE)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "returns a fail message if balance is less than £1" do
    expect { subject.touch_in }.to raise_error "Balance is less than £1"
  end

  it "deducts £1 from the balance once card touches out" do
    subject.top_up(1)
    subject.touch_in
    expect { subject.touch_out }.to change{subject.balance}.by(-Oystercard::MIN_VALUE)
  end

end
