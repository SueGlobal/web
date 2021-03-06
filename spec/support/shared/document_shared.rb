shared_examples 'a document' do |model|

  let(:model_name) { model }
  let(:klazz) { model_name.to_s.camelize.constantize }

  describe 'attributes' do
    subject { build model_name }

    it { should allow_mass_assignment_of(:description) }
    it { should allow_mass_assignment_of(:title) }
    it { should allow_mass_assignment_of(:published) }
    it { should allow_mass_assignment_of(:file) }
    it { should_not allow_mass_assignment_of(:type) }
    it { should_not allow_mass_assignment_of(:slug) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  describe '.published' do
    let(:published) { create model_name, :published }
    let(:draft) { create model_name, :draft }

    it "returns only published documents" do
      published
      draft
      expect(klazz.published.all).to eql([published])
    end
  end
end
