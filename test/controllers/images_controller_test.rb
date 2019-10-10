require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'show' do
    Image.destroy_all

    @image = Image.create!(url: 'https://i.pinimg.com/originals/28/4d/01/284d014be8091c2ac52fa9708163bfd6.jpg')

    get image_path(@image)

    assert_response :success
    assert_select 'img', src: @image.url
  end

  test 'new' do
    get new_image_path

    assert_response :success
    assert_select 'h1', 'New Image'
    assert_select 'a', href: images_path
    assert_select 'form'
  end

  test 'create with success' do
    Image.destroy_all

    assert_difference 'Image.count', 1 do
      post images_path, params: { image: { url: 'https://3bfd6.jpg' } }
    end

    assert_redirected_to Image.last
  end

  test 'create with fails validation' do
    Image.destroy_all

    post images_path, params: { image: { url: '' } }

    assert_response :ok
    assert_select 'h1', 'New Image'
  end
end
