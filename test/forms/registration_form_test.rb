require "test_helper"

class RegistrationFormTest < Minitest::Test
  def user_params(params = {})
    { "email"                 => "",
      "password"              => "",
      "password_confirmation" => "" }.merge(params)
  end

  def build_form
    RegistrationForm.new(User.new)
  end

  def include_error?(form, field)
    form.errors.messages.include? field
  end

  def test_properties
    form = build_form

    assert_respond_to form, :email
    assert_respond_to form, :password
    assert_respond_to form, :password_confirmation
  end

  def test_validation_rules
    form = build_form

    refute form.validate(user_params)

    assert include_error?(form, :email),                 "Email should be required"
    assert include_error?(form, :password),              "Password should be required"
    assert include_error?(form, :password_confirmation), "Password confirmation should be required"

    form = build_form

    refute form.validate(user_params("email"                 => "test",
                                     "password"              => "zxc",
                                     "password_confirmation" => "qwe"))

    assert include_error?(form, :email),    "Invalid Email"
    assert include_error?(form, :password), "Password should be confirmed properly"

    form = build_form

    assert form.validate(user_params("email"                 => "tester@example.com",
                                     "password"              => "zxc",
                                     "password_confirmation" => "zxc"))

    refute include_error?(form, :email),    "Invalid Email"
    refute include_error?(form, :password), "Password should be confirmed properly"
  end
end
