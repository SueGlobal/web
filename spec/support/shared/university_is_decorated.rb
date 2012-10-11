shared_examples "university is decorated" do

  it "assigns proper university" do
    expect(assigns(:university)).to eq(university)
  end

  it "decorates the university" do
    expect(assigns(:university)).to be_a_kind_of(Draper::Base)
  end
end
