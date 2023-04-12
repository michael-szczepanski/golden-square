require './lib/password_checker.rb'

RSpec.describe PasswordChecker do
  it 'throws "Invalid password, must be 8+ characters." error if entered "pass"' do
    password_checker = PasswordChecker.new
    expect { password_checker.check("pass") }.to raise_error "Invalid password, must be 8+ characters."
  end

  it 'returns true if entered "password"' do
    password_checker = PasswordChecker.new
    result = password_checker.check("password")
    expect(result).to eq true
  end
end