require "spec"
require "../src/*"

describe "HighSchoolSweetheart" do
  describe "clean_up_name" do
    it "should remove `-` when inside a name" do
      HighSchoolSweetheart.clean_up_name("John-Doe").should eq "John Doe"
    end

    it "should remove `-` when at the start and the end of a name" do
      HighSchoolSweetheart.clean_up_name("-John-Doe-").should eq "John Doe"
    end
  end

  describe "first_letter" do
    it "gets the first letter" do
      HighSchoolSweetheart.first_letter("Marry").to_s.should eq "M"
    end

    it "doesn't change the letter's case" do
      HighSchoolSweetheart.first_letter("john").to_s.should eq "j"
    end

    it "strips extra characters" do
      HighSchoolSweetheart.first_letter("\n\t   -Sarah-   ").to_s.should eq "S"
    end
  end

  describe "initial" do
    it "gets the first letter and appends a dot" do
      HighSchoolSweetheart.initial("Betty").should eq "B."
    end

    it "uppercases the first letter" do
      HighSchoolSweetheart.initial("james").should eq "J."
    end
  end

  describe "pair" do
    it "prints the pair's initials inside a heart" do
      expected = "❤ A.  +  C. ❤"
      HighSchoolSweetheart.pair("Avery", "Charlie").should eq expected
    end
  end
end
