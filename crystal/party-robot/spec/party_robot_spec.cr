require "spec"
require "../src/*"

describe "PartyRobot" do
  describe "welcome" do
    it "Greet Chihiro with a welcoming message" do
      PartyRobot.welcome("Chihiro").should eq "Welcome to my party, Chihiro!"
    end

    it "Greet Xuân Jing with a welcoming message" do
      PartyRobot.welcome("Xuân Jing").should eq "Welcome to my party, Xuân Jing!"
    end
  end

  describe "happy_birthday" do
    it "Wish Chihiro Happy Birthday with name and age" do
      PartyRobot.happy_birthday("Chihiro", 61).should eq "Happy birthday Chihiro! You are now 61 years old!"
    end

    it "Wish Xuân Jing Happy Birthday with name and age" do
      PartyRobot.happy_birthday("Xuân Jing", 17).should eq "Happy birthday Xuân Jing! You are now 17 years old!"
    end
  end

  describe "assign_table" do
    it "Greet Chihiro and give them directions to their seat" do
      PartyRobot.assign_table("Chihiro", "straight ahead", 22, 9.2394381, "Akachi Chikondi").should eq "Welcome to my party, Chihiro!\nYou have been assigned to table 22. Your table is straight ahead, exactly 9.2 meters from here.\nYou will be sitting next to Ai."
    end

    it "Greet Xuân Jing and give them directions to their seat" do
      PartyRobot.assign_table("Xuân Jing", "by the façade", 4, 23.470103, "Renée").should eq "Welcome to my party, Xuân Jing!\nYou have been assigned to table 4. Your table is by the façade, exactly 23.5 meters from here.\nYou will be sitting next to Re."
    end

    it "Greet Paula and give them directions to their seat" do
      PartyRobot.assign_table("Paula", "on the right", 101, 100.0, "Chioma").should eq "Welcome to my party, Paula!\nYou have been assigned to table 101. Your table is on the right, exactly 100.0 meters from here.\nYou will be sitting next to Ca."
    end
  end
end
