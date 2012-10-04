require 'spec_helper'

describe UniversityDecorator do

  let(:university) { UniversityDecorator.decorate create(:university) }
  before :each do
    Timecop.travel Time.local(2012,9,1,10,5,0)
  end

  after :each do
    Timecop.return
  end

  before :each do
    @years = [2005, 2007, 2008, 2010, 2011, 2012]
    @years.each { |y| create :general_frame, year: y, university: university }
  end

  describe ".general_frame_years" do
    subject { university.general_frame_years }

    it { should eq(@years) }
  end

  describe ".miss_general_frame_years" do
   subject { university.miss_general_frame_years }

   it { should eq([2000, 2001, 2002, 2003, 2004, 2006, 2009]) }
  end

  describe ".to_academic_course" do
    it "works for 2000" do
      university.to_academic_course(2000).should eql("2000/1")
    end

    it "works for 2006" do
      university.to_academic_course(2006).should eql("2006/7")
    end

    it "works for 2009" do
      university.to_academic_course(2009).should eql("2009/10")
    end

    it "works for 2011" do
      university.to_academic_course(2011).should eql("2011/12")
    end
  end

  describe ".general_frame_academic_years" do
    before :each do
      @years = [2000, 2005, 2010]
      university.should_receive(:general_frame_years).and_return @years
      @years.each do |y|
        university.should_receive(:to_academic_course).with(y).and_return y.to_s
      end
    end

    subject { university.general_frame_academic_years }

    it { should eql(@years.map(&:to_s))}
  end

  describe ".miss_general_frame_academic_years" do
    before :each do
      @years = [2000, 2005, 2010]
      university.should_receive(:miss_general_frame_years).at_least(:once).and_return @years
      @years.each do |y|
        university.should_receive(:to_academic_course).with(y).and_return y.to_s
      end
    end

    subject { university.miss_general_frame_academic_years }

    it { should eql(@years.map(&:to_s))}
  end

  describe ".miss_general_frame_academic_years_for_select" do
    before :each do
      @years = [2000, 2005, 2010]
      university.should_receive(:miss_general_frame_years).at_least(:once).and_return @years
      @years.each do |y|
        university.should_receive(:to_academic_course).with(y).and_return y.to_s
      end
    end

    subject { university.miss_general_frame_academic_years_for_select }

    it { should eql(@years.map(&:to_s).zip(@years))}
  end
end
