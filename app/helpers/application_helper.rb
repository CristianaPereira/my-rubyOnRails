module ApplicationHelper
  # By default, helpers are automatically included in corresponding views. For example, methods defined in PostsHelper will be available in views related to the PostsController
  # You can also include helpers in specific controllers or views by using the helper method or include directive 
  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address) # 'c.pereira@runtime-revolution.com'
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username)
  end

end
