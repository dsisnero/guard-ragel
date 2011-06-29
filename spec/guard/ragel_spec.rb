require 'spec_helper'

describe Guard::Ragel do
  subject { Guard::Ragel.new }

  before { subject.options[:output] = 'spec/assets' }
  
  describe "initialize" do
    it 'sets default output format' do
      subject.options[:output_format].should be_nil
    end

    it 'sets default notification to on' do
      subject.options[:notification].should be_true
    end

    it 'sets default ragel options to blank' do
      subject.options[:options].should == ''
    end
  end
  
  describe "run all" do
    it "should rebuild all files being watched" do
      Guard::Ragel.stub(:run_on_change).with([]).and_return([])
      Guard.stub(:guards).and_return([subject])
      subject.run_all
    end
  end
  
  describe "building from rl" do
    before { subject.options[:output_format] = :ruby }

    it "should convert rl to rb" do
      file = "spec/assets/hello_world_ruby.rl"
      outfile = "spec/assets/hello_world_ruby.rb"

      begin
        subject.build_ragel(file).should == outfile
      ensure
        File.unlink outfile
      end
    end

    it 'allows overriding of the output extension' do
      subject.options[:extension] = 'xxx'
      file = "spec/assets/hello_world_ruby.rl"
      outfile = "spec/assets/hello_world_ruby.xxx"

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

  context 'csharp format' do
    before { subject.options[:output_format] = :csharp }

    it "should convert rl to cs" do
      file = "spec/assets/hello_world_csharp.rl"
      outfile = "spec/assets/hello_world_csharp.cs"

      begin
        subject.build_ragel(file).should == outfile
      ensure
        File.unlink outfile
      end
    end
  end

  context 'implicit output format' do
    it "should convert .rb.rl to rb" do
      file = "spec/assets/hello_world.rb.rl"
      outfile = "spec/assets/hello_world.rb"

      begin
        subject.build_ragel(file).should == outfile
      ensure
        File.unlink outfile
      end
    end
  end

  context 'unsupported format' do
    before { subject.options[:output_format] = :unsupported_format }

    it 'raises an argument error' do
      expect do
        subject.build_ragel('spec/assets/hello_world_ruby.rl')
      end.to raise_error(ArgumentError)
    end
  end
  
end
