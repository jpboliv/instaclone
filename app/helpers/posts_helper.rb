module PostsHelper
  def display_likes(post)
    votes = post.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 3
    count_likers(votes)
  end

  def liked_post(post)
    if current_user.voted_for? post
      link_to '', unlike_post_path(post), remote: true, id: "like_#{post.id}",
                                          class: 'glyphicon glyphicon-heart'
    else
      link_to '', like_post_path(post), remote: true, id: "like_#{post.id}",
                                        class: 'glyphicon glyphicon-heart-empty'
    end
  end

  private

  def list_likers(votes)
    unless votes.blank?
      usernames = votes.map do |vote| 
        link_to(vote.voter.user_name, profile_path(vote.voter.user_name), class: 'user-name')  
      end
      if (votes.size > 1)
        usernames.to_sentence.html_safe + "like this"
      else
        usernames.to_sentence.html_safe + "likes this"
      end
    end
  end

  def count_likers(votes)
    "#{votes.size} likes"
  end
end
