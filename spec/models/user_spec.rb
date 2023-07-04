require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "is valid with email, first_name, last_name, and password fields" do
      @user = User.new(
        {first_name: "Lindsay", 
        last_name: "Ward", 
        email: "lward2391@gmail.com",
        password: "password",
        password_confirmation: "password"
        }
      )
      expect(@user).to be_valid
    end

    it "is not valid without a first_name" do
      @user = User.new(
        {first_name: nil, 
        last_name: "Ward", 
        email: "lward2391@gmail.com",
        password: "password",
        password_confirmation: "password"
        }
      )
      expect(@user).to_not be_valid
    end

    it "is not valid without a last_name" do
      @user = User.new(
        {first_name: "Lindsay", 
        last_name: nil, 
        email: "lward2391@gmail.com",
        password: "password",
        password_confirmation: "password"
        }
      )
      expect(@user).to_not be_valid
    end

    describe '#email' do
      it "is not valid without an email" do
        @user = User.new(
          {first_name: "Lindsay", 
          last_name: "Ward", 
          email: nil,
          password: "password",
          password_confirmation: "password"
          }
        )
        expect(@user).to_not be_valid
      end

      it "is not valid without a unique email" do
        @user1 = User.new(
          {first_name: "Lindsay", 
          last_name: "Ward", 
          email: "lward2391@gmail.com",
          password: "password",
          password_confirmation: "password"
          }
        )
        @user1.save
        @user2 = User.new(
          {first_name: "Steven",
          last_name: "Ward",
          email: "lward2391@gmail.com",
          password: "password",
          password_confirmation: "password"
          }
        )
        expect(@user2).to_not be_valid
      end
    end

    describe '#password' do
      it "is not valid without a password" do
        @user = User.new(
          {first_name: "Lindsay", 
          last_name: "Ward", 
          email: "lward2391@gmail.com",
          password: nil,
          password_confirmation: nil
          }
        )
        expect(@user).to_not be_valid
      end

      it "is not valid without a password confirmation" do
        @user = User.new(
          {first_name: "Lindsay", 
          last_name: "Ward", 
          email: "lward2391@gmail.com",
          password: "password",
          password_confirmation: nil
          }
        )
        expect(@user).to_not be_valid
      end

      it "is not valid with mis-matching password fields" do
        @user = User.new(
          {first_name: "Lindsay", 
          last_name: "Ward", 
          email: "lward2391@gmail.com",
          password: "password",
          password_confirmation: "password1"
          }
        )
        expect(@user).to_not be_valid
      end
      
      it "has a password with a minimum length of 8 characters" do
        @user = User.new(
          {first_name: "Lindsay", 
          last_name: "Ward", 
          email: "lward2391@gmail.com",
          password: "passwor",
          password_confirmation: "passwor"
          }
        )
        expect(@user).to_not be_valid
      end
    end
  end

  describe '.authenticate_with_credentials' do
    it "is nil if given incorrect password" do
      user = User.new(
        {first_name: "Lindsay", 
        last_name: "Ward", 
        email: "lward2391@gmail.com",
        password: "password",
        password_confirmation: "password"
        }
      )
      result = User.authenticate_with_credentials('lward2391@gmail.com', 'password1')
      expect(result).to eq(nil)
    end

    it "is still valid if given spaces around email" do
      user = User.create(
        {first_name: "Lindsay", 
        last_name: "Ward", 
        email: "lward2391@gmail.com",
        password: "password",
        password_confirmation: "password"
        }
      )
      result = User.authenticate_with_credentials('  lward2391@gmail.com   ', 'password')
      expect(result).to eq(user)
    end

    it "is still valid if given wrong cases for email" do
      user = User.create(
        {first_name: "Lindsay", 
        last_name: "Ward", 
        email: "lward2391@gmail.com",
        password: "password",
        password_confirmation: "password"
        }
      )
      result = User.authenticate_with_credentials('  lwaRD2391@gmaIl.com   ', 'password')
      expect(result).to eq(user)
    end
  end
end