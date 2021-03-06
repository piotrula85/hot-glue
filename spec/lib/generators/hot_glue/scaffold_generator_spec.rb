require 'rails_helper'

describe HotGlue::ScaffoldGenerator do


  describe "bad responses" do
    it "with no auth an no current user should give me error" do

      begin
        response = Rails::Generators.invoke("hot_glue:scaffold", ["Thing"])
      rescue StandardError => e
        expect(e.class).to eq(HotGlue::Error)
        expect(e.message).to eq("*** Oops: It looks like there is no object for Thing. Please define the object + database table first.")
      end
    end

    it "with no auth no current user and no auth identifier" do

    end

    it "with xxx" do

    end
  end

  describe "GOOD RESPONSES" do
    # test good builds here
  end
end
