require 'spec_helper'

describe Guard::Ragel do
  subject { Guard::Ragel.new }

  before { subject.options[:output] = 'spec/assets' }
  
  describe "initialize" do
    it "should set default output format" do
      subject.options[:output_format].should == :ruby
    end
  end
  
  describe "run all" do
    it "should rebuild all files being watched" do
      Guard::Ragel.stub(:run_on_change).with([]).and_return([])
      Guard.stub(:guards).and_return([subject])
      subject.run_all
    end
  end
  
  describe "building rl to rb" do

    it "should convert rl to rb" do
      file = "spec/assets/hello_world.rl"
      outfile = "spec/assets/hello_world.rb"

      begin
        subject.build_ragel(file).should == outfile
      ensure
        File.unlink outfile
      end
    end

    it "should notify other guards upon completion" do
      other_guard = mock('guard')
      other_guard.should_receive(:watchers).and_return([])
      Guard.stub(:guards).and_return([subject, other_guard])
      subject.notify([])
    end
  end
  
end
