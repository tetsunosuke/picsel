module Public::PhotosHelper
        def render_with_hashtags(hashbody)
          hashbody.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー2]+/) { |word| link_to word, "/public/hashtag?hashname_cont=#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
        end
end
