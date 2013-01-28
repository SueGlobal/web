require 'rubygems'
require 'virtus'
require 'active_model/naming'
require 'active_model/conversion'
require File.join(File.dirname(__FILE__), '..', '..', 'app', 'models', 'roles.rb')
describe Roles do
  class FakeUser

  end

  before :each do
    @user = FakeUser.new
    @user.stub(:simple?).and_return is_simple
    @user.stub(:admin?).and_return is_admin
    @user.stub(:god?).and_return is_god
    @roles = Roles.from_user @user, params
  end

  describe "roles_array" do
    let(:is_simple) { true }
    let(:is_admin) { false }
    let(:is_god) { false }
    let(:params) do
      {simple: true, admin: true, god: false}
    end

    subject { @roles.roles_array }

    it { should eql([:simple, :admin]) }
  end

  describe "persisted?" do
    let(:is_simple) { true }
    let(:is_admin) { false }
    let(:is_god) { false }
    let(:params) do
      {simple: true, admin: true, god: false}
    end

    subject { @roles }

    it { should_not be_persisted }
  end

  describe "save!" do

    let(:is_simple) { true }
    let(:is_admin) { false }
    let(:is_god) { false }
    let(:params) do
      {simple: true, admin: true, god: false}
    end

    before :each do
      @roles_array = [:simple, :admin]
      @user.should_receive(:roles=).with(@roles_array)
      @user.should_receive(:save!).and_return true
      @roles.should_receive(:roles_array).and_return @roles_array
    end

    it "sets the roles in user" do
      @roles.save
    end

  end
end
