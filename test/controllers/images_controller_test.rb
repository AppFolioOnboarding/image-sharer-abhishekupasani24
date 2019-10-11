require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'index shows newest images' do
    Image.destroy_all

    Image.create!(url: 'https://i.pinimg.com/originals/28/4d/01/284d014be8091c2ac52fa9708163bfd6.jpg')
    Image.create!(url: 'https://i.pinimg.com/originals/28/4d/01/284d014be8091c2ac52fa9708163bfd1.png')
    image = Image.create!(url: 'https://i.pinimg.com/originals/28/4d/01/284d014be8091c2ac52fa9708163bfd2.jpg')

    get images_path

    assert_response :success
    assert_select 'h1', 'My Images'
    assert_select 'img', src: image.url
  end

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
      post images_path, params: { image: { url: 'https://3bfd6.jpg', tag_list: 'Beautiful, Green' } }
    end

    assert_equal %w[Beautiful Green], Image.last.tag_list, 'Should have Beautiful and Green'
    assert_redirected_to Image.last
  end

  test 'create with fails validation' do
    Image.destroy_all

    post images_path, params: { image: { url: '' } }

    assert_response :ok
    assert_select 'h1', 'New Image'
  end
end
