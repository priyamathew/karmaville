require 'spec_helper'

describe User do
  it { should have_many(:karma_points) }

  describe '#valid?' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it { should validate_presence_of(:username) }
    it { should ensure_length_of(:username).is_at_least(2).is_at_most(32) }

    it { should validate_presence_of(:email) }

    context 'when a user already exists' do
      before { create(:user) }

      it { should validate_uniqueness_of(:username).case_insensitive }
      it { should validate_uniqueness_of(:email).case_insensitive }
    end
  end

  describe '.by_karma' do
    it 'returns users in order of highest-to-lowest karma' do
      user_med   = create(:user_with_karma, :total => 500, :points => 2)
      user_low   = create(:user_with_karma, :total => 200, :points => 2)
      user_high  = create(:user_with_karma, :total => 800, :points => 2)

      User.by_karma.should eq [user_high, user_med, user_low]
    end
  end

  describe '#total_karma' do
    let(:user) { create(:user_with_karma, :total => 500, :points => 2) }

    it 'returns the total karma for the user' do
      user.total_karma.should eq 500
    end
  end

  describe '#full_name' do
    let(:user) { build(:user) }

    it 'returns both the first and last names in a single string' do
      user.first_name = 'John'
      user.last_name  = 'Doe'

      user.full_name.should eq 'John Doe'
    end
  end

  describe '#page' do
    # before(:each) do
    #   100.times do
    #     FactoryGirl.create(:user_with_karma)
    #   end
    # end

    # it "should have some other things and stuffs" do
    #   # built_users = FactoryGirl.create_list(:user, 100)
    #   first_karma_shit = User.by_karma.page(2).first.total_karma_points
    #   dat_second_karma_ish = User.by_karma.page(1).first.total_karma_points
    #   # expect { User.by_karma.page(2).first.total_karma_points }.to be < User.by_karma_page(1).last.total_karma_points
    #   expect(first_karma_shit).to be < dat_second_karma_ish
    # end
  end

end
