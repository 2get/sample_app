module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def rss_for(user)
    feed_icon_img_path = asset_path('feed-icon-14x14.png')
    image_tag_options = { :border => '0', :alt => 'RSS' }
    link_to(image_tag(feed_icon_img_path, image_tag_options), "#{root_path}users/#{user.id}.rss")
  end
end
