require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'valid image' do
    image = Image.new(url: 'https://i.pinimg.com/originals/28/4d/01/284d014be8091c2ac52fa9708163bfd6.jpg')
    assert_predicate image, :valid?
  end

  test 'image invalid when no url' do
    image = Image.new
    refute_predicate image, :valid?
  end

  test 'image invalid when incorrect format' do
    image = Image.new(url: '~123fdsaasd(')
    refute_predicate image, :valid?
  end
end
