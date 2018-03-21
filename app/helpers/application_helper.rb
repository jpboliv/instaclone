module ApplicationHelper
    def flash_class(level)
        case level
            when 'notice' then "alert alert-info"
            when 'success' then "alert alert-success"
            when 'error' then "alert alert-warning"
            when 'danger' then "alert alert-danger"
        end
    end

    def has_image(post)
        if(post.image.exists?)
            #display current post image
            return image_tag @post.image.url(:medium), id: 'image-preview', class: 'img-responsive'
        else
            #display placeholder
            return image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
        end
    end

    def profile_avatar_select(user)
      return image_tag user.avatar.url(:medium),
                       id: 'image-preview',
                       class: 'img-responsive img-circle profile-image' if user.avatar.exists?
      image_tag 'default-avatar.jpg', id: 'image-preview',
                                      class: 'img-responsive img-circle profile-image'
    end
    
end
